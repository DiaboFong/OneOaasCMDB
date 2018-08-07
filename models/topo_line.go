package models

import (
	"time"
	"github.com/astaxie/beego"
)

type TopoLine struct {
	Id         int64        `json:"id" orm:"pk;auto"`
	From       int64   `json:"from" size(45);null"`
	To         int64   `json:"to" size(45);null"`
	Length     int     `json:"length" size(45);null"`
	Label      string    `json:"label" size(45);null"`
	TopoView   *TopoView    `json:"-" orm:"rel(fk)"`
	Enable     bool         `json:"-" orm:"column(enable);size(1);null"`
	CreateTime time.Time    `json:"-" orm:"column(createtime);auto_now_add;type(datetime)"`
	CreateBy   string       `json:"-" orm:"column(createby);size(100);null"`
	UpdateBy   string       `json:"-" orm:"column(updateby);size(100);null"`
	UpdateTime time.Time    `json:"-" orm:"column(updatetime);auto_now;type(datetime)"`
}

func (this *TopoLine) TableEngine() string {
	return "INNODB"
}

func (this *TopoLine) AddTopoLine() *TopoLine {
	_, err := Orm.Insert(this)
	if err != nil {
		beego.Error(err)
	}
	return this
}

func (this *TopoLine) GetTopoLineById() TopoLine {
	var myline TopoLine
	err := Orm.QueryTable("topo_line").Filter("id", this.Id).RelatedSel().One(&myline)
	if err != nil {
		beego.Error(err)
	}
	return myline
}

func (this *TopoLine) UpdateTopoLine() int64 {
	id, err := Orm.Update(this)
	if err != nil {
		beego.Error(err)
	}
	return id
}

func (this *TopoLine) DeleteTopoLine() int64 {
	id, err := Orm.Delete(this)
	if err != nil {
		beego.Error(err)
	}
	return id
}