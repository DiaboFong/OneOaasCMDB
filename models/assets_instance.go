package models

import (
	"time"
	"github.com/astaxie/beego"
)

type AssertsInstance struct {
	Id          int64        `orm:"pk;auto"`
	Name        string       `orm:"size(60)"`
	Description string       `orm:"size(60)"`
	Inherits    bool	 `orm:"default(true)"`	//继承
	Superclass  bool         `orm:"default(false)"` //是否为超类
	Active      bool	 `orm:"default(true)"` 	//是否激活
	Asserts     *Asserts	 `orm:"rel(fk)"`
	Icon 	    string 	 `orm:"size(60)"`
	Number      int64   				//资源实例个数
	Enable      bool         `orm:"column(enable);size(1);null"`
	CreateTime  time.Time    `orm:"column(createtime);auto_now_add;type(datetime)"`
	CreateBy    string       `orm:"column(createby);size(100);null"`
	UpdateBy    string       `orm:"column(updateby);size(100);null"`
	UpdateTime  time.Time    `orm:"column(updatetime);auto_now;type(datetime)"`
}

func (this *AssertsInstance) TableEngine() string {
	return "INNODB"
}

func (this *AssertsInstance) GetAssertsInstance() (AssertsInstance) {
	var assertsInstance AssertsInstance
	err := Orm.QueryTable("AssertsInstance").Filter("id",this.Id).RelatedSel().One(&assertsInstance)
	if err != nil {
		beego.Error(err.Error())
	}
	return assertsInstance
}

func GetAllAssertsInstance() ([]AssertsInstance) {
	var list []AssertsInstance
	_,err := Orm.QueryTable("AssertsInstance").All(&list)
	if err != nil {
		beego.Error(err.Error())
		return nil
	}
	return list
}