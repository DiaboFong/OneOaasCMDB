package models

import (
	"errors"
	//"fmt"
	"log"
	"strings"

	"github.com/astaxie/beego"
	"github.com/astaxie/beego/validation"
	"time"
)

/*
ID        自增
Number    VLAN
Name      名称
Comment   备注
IpVlanDomain 所属VLAN Domain
*/

type IpVlan struct {
	Id             int64           `orm:"column(id);auto"`
	Number         int64           `orm:"column(number);size(11),unique;null"`
	Name           string          `orm:"column(name);size(128);null"`
	Comment        string          `orm:"column(comment);size(512);null"`
	IpVlanDomain   *IpVlanDomain   `orm:"rel(fk)"`

	Enable         bool         `orm:"column(enable);size(1);null"`
	CreateTime     time.Time    `orm:"column(createtime);auto_now_add;type(datetime)"`
	CreateBy       string       `orm:"column(createby);size(100);null"`
	UpdateBy       string       `orm:"column(updateby);size(100);null"`
	UpdateTime     time.Time    `orm:"column(updatetime);auto_now;type(datetime)"`
}

// 设置引擎为 INNODB
func (u *IpVlan) TableEngine() string {
	return "INNODB"
}


func checkIpVlan(a IpVlan) error {
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

func AddIpVlan(a IpVlan) (int64, error) {
	if err := checkIpVlan(a); err != nil {
		return 0, err
	}

	exist := Orm.QueryTable("ip_vlan").Filter("number", a.Number).Exist()
	if exist {
		return 0, errors.New("VLAN已存在")
	}

	id, err := Orm.Insert(&a)
	if err != nil {
		_, errorCode := dbErrorParse(err.Error())
		if errorCode == 1062 {
			return 0, errors.New("VLAN已存在")
		} else {
			return 0, errors.New("添加VLAN出现异常")
		}
	}
	return id, err
}

func DelIpVlan(id int64) error {
	rows, err := Orm.QueryTable("ip_vlan").Filter("Number", id).Delete()
	if err != nil {
		return err
	}
	if rows == 0 {
		return errors.New("ERROR_NOT_FOUND")
	}
	return nil
}

func GetIpVlan(query map[string]string, sort []string, order []string,
	offset int64, limit int64) (ml []interface{}, err error) {
	//定义存储对象
	var VlanArray = make([]IpVlan, 0) //存储返回数据

	//查询IP表
	qs := Orm.QueryTable("ip_vlan")

	//构造排序字段,默认升序,降序加-号
	var sortFields []string
	if len(sort) >= 0 {
		for _, v := range sort {
			var orderby string
			if order[0] == "desc" {
				orderby = "-" + v
			} else if order[0] == "asc" {
				orderby = v
			}
			beego.Debug("排序字段是", orderby)
			sortFields = append(sortFields, orderby)
		}
		qs = qs.OrderBy(sortFields...)
	}

	//执行过滤排序
	for k, v := range query {
		qs = qs.Filter(k, v)
	}

	//构造返回数据
	if _, err := qs.Limit(limit, offset).All(&VlanArray); err == nil {
		for _, v := range VlanArray {
			IpVlandomain, _ := GetIpVlanDomainById(v.IpVlanDomain.Id)
			v.IpVlanDomain = IpVlandomain
			ml = append(ml, v)
		}
		return ml, nil
	}

	return nil, err
}

func CountIpVlan(query map[string]string) (total int64, err error) {
	qs := Orm.QueryTable("ip_vlan")
	// query k=v
	for k, v := range query {
		k = strings.Replace(k, ".", "__", -1)
		beego.Info("查询机柜当前key", k, "值是", v)
		qs = qs.Filter(k, v)
	}

	return qs.Count()
}

func GetIpVlanById(id int64) (*IpVlan, error) {
	obj := &IpVlan{
		Id: id,
	}
	err := Orm.Read(obj)
	if err != nil {
		return nil, err
	}
	return obj, nil
}

func PutIpVlan(m *IpVlan) (err error) {
	_, err = Orm.Update(m)
	if err != nil {
		return err
	} else {
		return nil
	}
}
