package models

import (
	"time"
	"github.com/astaxie/beego"
)

type TopoNode struct {
	Id         int64        `json:"id" orm:"pk;auto"`
	Label      string `json:"label" orm:"size(45);null"`
	Image      string  `json:"image" orm:"size(45);null"`
	Shape      string  `json:"shape" orm:"size(45);null"`
	Title      string  `json:"title" orm:"size(45);null"`
	X          int64  `json:"x" orm:"size(45);null"`
	Y          int64  `json:"y" orm:"size(45);null"`
	ResourceId int64          `json:"-" orm:"-"`
	TopoView   *TopoView    `json:"-" orm:"rel(fk)"`
	Enable     bool         `json:"-" orm:"column(enable);size(1);null"`
	CreateTime time.Time    `json:"-" orm:"column(createtime);auto_now_add;type(datetime)"`
	CreateBy   string       `json:"-" orm:"column(createby);size(100);null"`
	UpdateBy   string       `json:"-" orm:"column(updateby);size(100);null"`
	UpdateTime time.Time    `json:"-" orm:"column(updatetime);auto_now;type(datetime)"`
}

func (this *TopoNode) TableEngine() string {
	return "INNODB"
}

func (this *TopoNode) AddTopoNode() *TopoNode {
	_, err := Orm.Insert(this)
	if err != nil {
		beego.Error(err)
	}
	return this
}

func (this *TopoNode) GetTopoNodeById() TopoNode {
	var mynode TopoNode
	err := Orm.QueryTable("topo_node").Filter("id", this.Id).RelatedSel().One(&mynode)
	if err != nil {
		beego.Error(err)
	}
	return mynode
}

func (this *TopoNode) GetTopoNode() []TopoNode {
	var mynodes []TopoNode
	err := Orm.QueryTable("topo_node").RelatedSel().One(&mynodes)
	if err != nil {
		beego.Error(err)
	}
	return mynodes
}

func (this *TopoNode) UpdateTopoNode() int64 {
	id, err := Orm.Update(this)
	if err != nil {
		beego.Error(err)
	}
	return id
}

func (this *TopoNode) DeleteTopoNode() int64 {
	id, err := Orm.Delete(this)
	if err != nil {
		beego.Error(err)
	}
	return id
}