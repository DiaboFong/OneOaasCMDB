package models

import (
	"errors"
	"log"
	"strings"

	"fmt"
	"time"

	"github.com/astaxie/beego"
	"github.com/astaxie/beego/orm"
	"github.com/astaxie/beego/validation"
)

type ResourcePlatformAccount struct {
	Id            int64     `orm:"pk;auto"`
	CloudName     string    `orm:"size(255),unique"`
	CloudPlatform string    `orm:"size(32)"`
	CloudState    string    `orm:"size(32)"`
	CloudHostNum  int64     `orm:"size(32)"`
	SyncState     string    `orm:"size(32)"`
	AccountIp     string    `orm:"size(32)"`
	AccountId     string    `orm:"size(32)"`
	AccountSecret string    `orm:"size(32)"`
	CreateTime    time.Time `orm:"column(createtime);auto_now_add;type(datetime); null"`
	UpdateTime    time.Time `orm:"column(updatetime);auto_now;type(datetime); null"`
	Comment       string    `orm:"size(512); null"`
	Enable        bool      `orm:"column(enable);size(1);null"`
}

// 设置引擎为 INNODB
func (u *ResourcePlatformAccount) TableEngine() string {
	return "INNODB"
}

func (this *ResourcePlatformAccount) TableName() string {
	return "resource_platform_account"
}

func GetVcenterAccountDetail(id int64) string {
	o := orm.NewOrm()
	var rpa []ResourcePlatformAccount
	o.QueryTable("resource_platform_account").Filter("id", id).RelatedSel().All(&rpa)
	ResourcePlatformAccount := rpa[0]
	AccountIp := ResourcePlatformAccount.AccountIp
	AccountName := ResourcePlatformAccount.AccountId
	AccountSecret := ResourcePlatformAccount.AccountSecret
	AccountSecret = strings.Replace(AccountSecret, "#", "%23", -1)
	AccountSecret = strings.Replace(AccountSecret, ":", "%3A", -1)
	VmUrl := fmt.Sprintf("https://%s:%s@%s/sdk", AccountName, AccountSecret, AccountIp)
	return VmUrl
}

func GetAccountDetail(id int64) (string, string) {
	o := orm.NewOrm()
	var rpa []ResourcePlatformAccount
	o.QueryTable("resource_platform_account").Filter("id", id).RelatedSel().All(&rpa)
	ResourcePlatformAccount := rpa[0]
	AccountName := ResourcePlatformAccount.AccountId
	AccountSecret := ResourcePlatformAccount.AccountSecret

	return AccountName, AccountSecret
}

func checkcloud(a *ResourcePlatformAccount) error {
	valid := validation.Validation{}
	b, _ := valid.Valid(a)
	if !b {
		for _, err := range valid.Errors {
			log.Println(err.Key, err.Message)
			return errors.New(err.Message)
		}
	}
	return nil
}

func AddCloud(a *ResourcePlatformAccount) (int64, error) {
	if err := checkcloud(a); err != nil {
		return 0, err
	}

	exist := Orm.QueryTable("resource_platform_account").Filter("cloud_name", a.CloudName).Exist()
	if exist {
		return 0, errors.New(a.CloudName + "云帐号已存在")
	}

	id, err := Orm.Insert(a)
	if err != nil {
		_, errorCode := dbErrorParse(err.Error())
		if errorCode == 1062 {
			return 0, errors.New("Cloud已存在")
		} else {
			return 0, errors.New("添加Cloud出现异常")
		}
	}
	return id, err
}

func DelCloud(id int64) error {
	_, err := Orm.QueryTable("resource_platform_account").Filter("id", id).Update(orm.Params{
		"enable": false,
	})
	if err != nil {
		return err
	}
	return nil
}

func HardDelCloud(id int64) error {
	_, err := Orm.QueryTable("resource_platform_account").Filter("id", id).Delete()
	if err != nil {
		return err
	}
	return nil
}

func GetCloud(query map[string]string, sort string, order string, offset int64, limit int64, cloudName string, cloudPlat string, cloudState string, startTime string, endTime string) (entityArray []interface{}, total int64) {
	var cloudArray = make([]ResourcePlatformAccount, 0) //存储返回数据
	var totalArray = make([]ResourcePlatformAccount, 0)

	querySql := fmt.Sprintf(" select cn.* from resource_platform_account AS cn")
	totalSql := fmt.Sprintf(" select cn.* from resource_platform_account AS cn")

	v := query["enable"]
	if v != "" {
		querySql = fmt.Sprintf(" %s where cn.enable=%s ", querySql, v)
		totalSql = fmt.Sprintf(" %s where cn.enable=%s ", totalSql, v)
	} else {
		querySql = fmt.Sprintf(" %s where 1=1 ", querySql)
		totalSql = fmt.Sprintf(" %s where 1=1 ", totalSql)
	}

	v = query["search"]
	if v != "" {
		querySql = fmt.Sprintf(" %s and cn.cloud_name like '%%%s%%' ", querySql, v)
		querySql = fmt.Sprintf(" %s or ", querySql)

		totalSql = fmt.Sprintf(" %s and cn.cloud_name like '%%%s%%' ", totalSql, v)
		totalSql = fmt.Sprintf(" %s or ", totalSql)
	}

	if cloudName != "" {
		querySql = fmt.Sprintf(" %s and cloud_name = '%s' ", querySql, cloudName)
		totalSql = fmt.Sprintf(" %s and cloud_name = '%s' ", totalSql, cloudName)
	}

	if cloudPlat != "" {
		querySql = fmt.Sprintf(" %s and cloud_type in ('%s') ", querySql, cloudPlat)
		totalSql = fmt.Sprintf(" %s and cloud_type in ('%s') ", totalSql, cloudPlat)
	}

	if cloudState != "" {
		querySql = fmt.Sprintf(" %s and cloud_state in ('%s') ", querySql, cloudState)
		totalSql = fmt.Sprintf(" %s and cloud_state in ('%s') ", totalSql, cloudState)
	}

	if startTime != "" && endTime != "" {
		querySql = fmt.Sprintf(" %s and createtime >= '%s' and createtime <= '%s' ", querySql, startTime, endTime)
		totalSql = fmt.Sprintf(" %s and createtime >= '%s' and createtime <= '%s' ", totalSql, startTime, endTime)
	}

	if sort != "" {
		querySql = fmt.Sprintf(" %s order by %s ", querySql, sort)
		if order != "" {
			querySql = fmt.Sprintf(" %s %s", querySql, order)
		}
	}

	_, err := Orm.Raw(totalSql).QueryRows(&totalArray)
	if err == nil {
		totalSize := len(totalArray)
		total = int64(totalSize)
	}

	//使用前端分页时,不需要加limit
	//querySql = fmt.Sprintf(" %s limit %d offset %d ",querySql,limit,offset)
	_, err = Orm.Raw(querySql).QueryRows(&cloudArray)
	if err == nil {
		for _, v := range cloudArray {
			entityArray = append(entityArray, v)
		}
	}
	return entityArray, total
}

func CountCloud(query map[string]string) (total int64, err error) {
	qs := Orm.QueryTable("resource_platform_account")
	// query k=v
	for k, v := range query {
		k = strings.Replace(k, ".", "__", -1)
		beego.Info("查询云帐号当前key", k, "值是", v)
		qs = qs.Filter(k, v)
	}
	return qs.Count()
}

func CloudGetById(id int64) (*ResourcePlatformAccount, error) {
	obj := &ResourcePlatformAccount{
		Id: id,
	}
	err := Orm.Read(obj)
	if err != nil {
		return nil, err
	}
	return obj, nil
}

func PutCloud(m *ResourcePlatformAccount) (err error) {
	_, err = Orm.Update(m)
	if err != nil {
		return err
	} else {
		return nil
	}
}
