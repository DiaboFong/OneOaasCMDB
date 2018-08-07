package models

import (
	"time"
	"errors"
)

type SystemPanel struct {
	Id         int64     `orm:"pk;auto"`
	JsonId     string    `orm:"size(255);unique"`
	CreateTime time.Time `orm:"auto_now_add;type(datetime)"`
	CreateBy   string    `orm:"size(100);null"`
	UpdateBy   string    `orm:"size(100);null"`
	UpdateTime time.Time `orm:"auto_now;type(datetime)"`
}


func (u *SystemPanel) TableEngine() string {
	return "INNODB"
}

func (this *SystemPanel) AddPanel() (int64, error) {
	exist := Orm.QueryTable("system_panel").Filter("JsonId", this.JsonId).Exist()
	if exist {
		return 0, errors.New("已存在")
	}
	id, err := Orm.Insert(this)
	if err != nil {
		return 0, errors.New("添加错误" + err.Error())
	}
	return id, err
}