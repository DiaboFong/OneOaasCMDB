package models

import (
	"time"
	"github.com/astaxie/beego"
)

//状态颜色模型,用于系统资源状态定义
type SystemColor struct {
	Id 			int64  		`orm:"column(id);pk;auto"`
	Color 		string  	`orm:"column(color);size(100);unique"`//不允许为空
	Description string  	`orm:"column(description);size(100);null"`//允许为空
	Type		string  	`orm:"column(type);size(100);null"`//允许为空

	Enable     	bool        `orm:"column(enable);size(1)"`
	CreateTime 	time.Time   `orm:"column(createtime);auto_now_add;type(datetime)"`
	CreateBy   	string      `orm:"column(createby);size(100);null"`
	UpdateBy   	string      `orm:"column(updateby);size(100);null"`
	UpdateTime 	time.Time   `orm:"column(updatetime);auto_now;type(datetime)"`
}

// 设置引擎为 INNODB
func (this *SystemColor) TableEngine() string {
	return "INNODB"
}

func (this *SystemColor) TableName() string {
	return "system_color"
}

func GetColor() []*SystemColor {
	var color []*SystemColor
	num, err := Orm.QueryTable("system_color").All(&color)
	if err != nil {
		beego.Debug("【查询系统颜色错误", err.Error(), "]")
	}
	beego.Debug("【查询系统颜色的记录数据是", num, "]条")
	return color
}
