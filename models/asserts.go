package models

import (
	"github.com/astaxie/beego"
	"errors"
	"time"
)

type Asserts struct {
	Id          int64        `orm:"pk;auto"`
	Name        string       `orm:"size(60)"`
	Description string       `orm:"size(60)"`
	Inherits    bool	 `orm:"default(false)"`//继承
	Superclass  bool         `orm:"default(true)"` //是否为超类
	Active      bool	 `orm:"default(true)"` //是否激活
	AssertsInstance []*AssertsInstance `orm:"reverse(many)"`
	Icon 	    string 	 `orm:"size(60)"`
	Enable      bool         `orm:"default(true)"`
	CreateTime  time.Time    `orm:"column(createtime);auto_now_add;type(datetime)"`
	CreateBy    string       `orm:"column(createby);size(100);null"`
	UpdateBy    string       `orm:"column(updateby);size(100);null"`
	UpdateTime  time.Time    `orm:"column(updatetime);auto_now;type(datetime)"`
}

func (u *Asserts) TableEngine() string {
	return "INNODB"
}

func GetAsserts() ([]*Asserts) {
	var listAsserts []*Asserts
	num, err := Orm.QueryTable("asserts").All(&listAsserts)
	if err != nil {
		beego.Error(err.Error())
	}
	beego.Info("all asserts", num)
	return listAsserts
}

func (this *Asserts) GetAsserts() ([]*Asserts) {
	var listAsserts []*Asserts
	_, err := Orm.QueryTable("asserts").Filter("enable",0).RelatedSel().All(&listAsserts)
	if err != nil {
		beego.Error(err.Error())
	}
	for index, asserts := range listAsserts {
		Orm.LoadRelated(asserts, "AssertsInstance", true)
		listAsserts[index] = asserts
	}
	if err != nil {
		beego.Error(err.Error())
	}
	return listAsserts
}

func (this *Asserts) GetAssertsById() (Asserts) {
	var asserts Asserts
	_, err := Orm.QueryTable("asserts").Filter("id",this.Id).RelatedSel().All(&asserts)
	if err != nil {
		beego.Error(err.Error())
	}
	Orm.LoadRelated(&asserts, "AssertsInstance", true)
	if err != nil {
		beego.Error(err.Error())
	}
	return asserts
}

func (this *Asserts)AddAsserts() (int64, error) {
	exist := Orm.QueryTable("Asserts").Filter("Name", this.Name).Exist()
	if exist {
		return 0, errors.New("资产已存在")
	}
	id, err := Orm.Insert(this)
	if err != nil {
		return 0, errors.New("添加资产错误" + err.Error())
	}
	return id, err
}

func DelAssert(id int64) error {
	rows, err := Orm.QueryTable("Asserts").Filter("Id", id).Delete()
	if err != nil {
		return err
	}
	if rows == 0 {
		return errors.New("ERROR_NOT_FOUND")
	}
	return nil
}

