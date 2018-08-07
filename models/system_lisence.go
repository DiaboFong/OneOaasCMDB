package models

import "time"

//系统licence授权控制
type SystemLicence struct {
	Id         int64     `orm:"pk;auto"`
	Type       int64     `orm:"null"`
	Key        string    `orm:"null"`
	Expires    int64     `orm:"null"`
	CreateTime time.Time `orm:"auto_now_add;type(datetime)"`
	CreateBy   string    `orm:"size(100);null"`
	UpdateBy   string    `orm:"size(100);null"`
	UpdateTime time.Time `orm:"auto_now;type(datetime)"`
}

func (this *SystemLicence) TableEngine() string {
	return "INNODB"
}
