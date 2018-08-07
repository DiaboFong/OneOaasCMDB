package models

import (
	"errors"
	"log"
	"strings"

	"github.com/astaxie/beego"
	"github.com/astaxie/beego/validation"
	"time"
	"fmt"
	"github.com/astaxie/beego/orm"
)

type Supplier struct {
	Id                    int64         `orm:"pk;auto"`
	Supplier              string        `orm:"size(255),unique;null"`
	BusinessContact       string        `orm:"size(32); null"`
	BusinessTelPhone      string        `orm:"size(32); null"`
	BusinessMobilePhone   string        `orm:"size(32); null"`
	BusinessEmail         string        `orm:"size(32); null"`
	TechnologyContact     string        `orm:"size(32); null"`
	TechnologyTelphone    string        `orm:"size(32); null"`
	TechnologyMobilePhone string        `orm:"size(32); null"`
	TechnologyEmail       string        `orm:"size(32); null"`
	OfficeAddress         string        `orm:"size(32); null"`
	Comment               string        `orm:"size(512); null"`
	Datacenter            []*Datacenter `orm:"reverse(many)"` // fk 的反向关系,一个供应商可以有多个数据中心
	Agreement             []*Agreement  `orm:"reverse(many)"` // fk 的反向关系,一个供应商可以有多个合同
	Server                []*Server     `orm:"reverse(many)"`

	Enable                bool         `orm:"column(enable);size(1);null"`
	CreateTime            time.Time    `orm:"column(createtime);auto_now_add;type(datetime)"`
	CreateBy              string       `orm:"column(createby);size(100);null"`
	UpdateBy              string       `orm:"column(updateby);size(100);null"`
	UpdateTime            time.Time    `orm:"column(updatetime);auto_now;type(datetime)"`
}

// 设置引擎为 INNODB
func (u *Supplier) TableEngine() string {
	return "INNODB"
}

func (this *Supplier) TableName() string {
	return "supplier"
}

func checksupplier(a *Supplier) error {
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

func AddSupplier(a *Supplier) (int64, error) {
	if err := checksupplier(a); err != nil {
		return 0, err
	}

	exist := Orm.QueryTable("supplier").Filter("Supplier", a.Supplier).Exist()
	if exist {
		return 0, errors.New(a.Supplier + "供应商已存在")
	}

	id, err := Orm.Insert(a)
	if err != nil {
		_, errorCode := dbErrorParse(err.Error())
		if errorCode == 1062 {
			return 0, errors.New("Supplier已存在")
		} else {
			return 0, errors.New("添加Supplier出现异常")
		}
	}
	return id, err
}

func DelSupplier(id int64) error {
	/*supplierObj,err := SupplierGetById(id)
	if len(supplierObj.Datacenter)>0{
		return errors.New("该供应商数据正被数据中心关联使用")
	}
	if err != nil{
		return err
	}*/
	exist_supplier := Orm.QueryTable("datacenter").Filter("supplier_id", id).Exist()
	if exist_supplier {
		return errors.New("该供应商正在使用中")
	}
	exist_server := Orm.QueryTable("server").Filter("supplier_id", id).Exist()
	if exist_server {
		return errors.New("该供应商正在使用中")
	}

	_, err := Orm.QueryTable("Supplier").Filter("Id", id).Update(orm.Params{
		"enable": false,
	})
	if err != nil {
		return err
	}
	return nil
}

func HardDelSupplier(id int64) error {
	supplierObj,err := SupplierGetById(id)
	if len(supplierObj.Datacenter)>0{
		return errors.New("该供应商数据正被数据中心关联使用")
	}
	if err != nil{
		return err
	}
	_, err = Orm.QueryTable("Supplier").Filter("Id", id).Delete()
	if err != nil {
		return err
	}
	return nil
}

func GetSupplier(query map[string]string, sort string, order string, offset int64, limit int64, name string, businesscontact string, technologycontact string, start_time string, end_time string) (entityArray []interface{}, total int64) {
	var supplierArray = make([]Supplier, 0) //存储返回数据
	var totalArray = make([]Supplier, 0)

	querySql := fmt.Sprintf(" select sr.* from supplier AS sr")
	totalSql := fmt.Sprintf(" select sr.* from supplier AS sr")

	v := query["enable"]
	if v !=""{
		querySql = fmt.Sprintf(" %s where sr.enable=%s ",querySql,v)
		totalSql = fmt.Sprintf(" %s where sr.enable=%s ",totalSql,v)
	}else{
		querySql = fmt.Sprintf(" %s where 1=1 ",querySql)
		totalSql = fmt.Sprintf(" %s where 1=1 ",totalSql)
	}

	v = query["search"]
	if v != "" {
		querySql = fmt.Sprintf(" %s and sr.supplier like '%%%s%%' ",querySql,v)
		querySql = fmt.Sprintf(" %s or ",querySql)
		querySql = fmt.Sprintf(" %s sr.business_contact like '%%%s%%' ",querySql,v)

		totalSql = fmt.Sprintf(" %s and sr.supplier like '%%%s%%' ",totalSql,v)
		totalSql = fmt.Sprintf(" %s or ",totalSql)
		totalSql = fmt.Sprintf(" %s sr.business_contact like '%%%s%%' ",totalSql,v)
	}

	if name != "" {
		querySql = fmt.Sprintf(" %s and supplier = '%s' ",querySql,name)
		totalSql = fmt.Sprintf(" %s and supplier = '%s' ",totalSql,name)
	}

	if businesscontact != "" {
		querySql = fmt.Sprintf(" %s and business_contact in ('%s') ",querySql,businesscontact)
		totalSql = fmt.Sprintf(" %s and business_contact in ('%s') ",totalSql,businesscontact)
	}

	if technologycontact != "" {
		querySql = fmt.Sprintf(" %s and technology_contact in ('%s') ",querySql,technologycontact)
		totalSql = fmt.Sprintf(" %s and technology_contact in ('%s') ",totalSql,technologycontact)
	}

	if start_time != "" && end_time != ""{
		querySql = fmt.Sprintf(" %s and createtime >= '%s' and createtime <= '%s' ",querySql,start_time,end_time)
		totalSql = fmt.Sprintf(" %s and createtime >= '%s' and createtime <= '%s' ",totalSql,start_time,end_time)
	}

	if sort != "" {
		querySql = fmt.Sprintf(" %s order by %s ", querySql, sort)
		if order != "" {
			querySql = fmt.Sprintf(" %s %s", querySql, order)
		}
	}

	_,err := Orm.Raw(totalSql).QueryRows(&totalArray)
	if err == nil{
		totalSize := len(totalArray)
		total = int64(totalSize)
	}

	//使用前端分页时,不需要加limit
	//querySql = fmt.Sprintf(" %s limit %d offset %d ",querySql,limit,offset)
	_,err = Orm.Raw(querySql).QueryRows(&supplierArray)
	if err == nil{
		for _, v := range supplierArray {
			entityArray = append(entityArray, v)
		}
	}
	return entityArray, total
}

func CountSupplier(query map[string]string) (total int64, err error) {
	qs := Orm.QueryTable("supplier")
	// query k=v
	for k, v := range query {
		k = strings.Replace(k, ".", "__", -1)
		beego.Info("查询供应商当前key", k, "值是", v)
		qs = qs.Filter(k, v)
	}
	return qs.Count()
}

func SupplierGetById(id int64) (*Supplier, error) {
	obj := &Supplier{
		Id: id,
	}
	err := Orm.Read(obj)
	if err != nil {
		return nil, err
	}
	return obj, nil
}

func PutSupplier(m *Supplier) (err error) {
	_, err = Orm.Update(m)
	if err != nil {
		return err
	} else {
		return nil
	}
}
