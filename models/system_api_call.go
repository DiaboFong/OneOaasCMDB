package models

import (
	"time"
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/orm"
)


type SystemApiCall struct {
	Id                  int64      `orm:"pk;auto"`
	UserId              int64      `orm:"null"`
	UserName            string     `orm:"null;size(20);"`
	ApiName             string     `orm:"size(100);"`
	ApiCallType         string     `orm:"size(20);"`
	ApiCreateDate       time.Time  `orm:"null;type(date)"`
	ApiCreateTime 	    string     `orm:"null;size(10)"`
}

func (this *SystemApiCall) TableEngine() string {
	return "INNODB"
}

func (this *SystemApiCall) Add() bool{
	cond := orm.NewCondition()
	//设置条件
	queryCond := cond.And("api_name",this.ApiName).And("api_create_time",this.ApiCreateTime)
	recordNum ,_ := Orm.QueryTable((*SystemApiCall)(nil)).SetCond(queryCond).Count()
	if recordNum != 1  {
		_, err := Orm.Insert(this)
		if err != nil {
			beego.Error("记录AIP调用错误", err.Error())
			return false
		}
	}
	return true
}
