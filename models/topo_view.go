package models

import (
	"time"
	"github.com/astaxie/beego"
)

type TopoView struct {
	Id         int64        `json:"id" orm:"pk;auto"`
	Name       string          `json:"name" orm:"size(45);null"`
	TopoNode   []*TopoNode   `json:"nodes" orm:"reverse(many)"`
	TopoLine   []*TopoLine   `json:"edges" orm:"reverse(many)"`
	Enable     bool         `json:"-" orm:"column(enable);size(1);null"`
	CreateTime time.Time    `json:"-" orm:"column(createtime);auto_now_add;type(datetime)"`
	CreateBy   string       `json:"-" orm:"column(createby);size(100);null"`
	UpdateBy   string       `json:"-" orm:"column(updateby);size(100);null"`
	UpdateTime time.Time    `json:"-" orm:"column(updatetime);auto_now;type(datetime)"`
}

func (this *TopoView) TableEngine() string {
	return "INNODB"
}

func (this *TopoView) GetTopoViewById() TopoView {
	var myview TopoView
	err := Orm.QueryTable("topo_view").Filter("id", this.Id).One(&myview)
	_, err = Orm.LoadRelated(&myview, "TopoNode")
	_, err = Orm.LoadRelated(&myview, "TopoLine")
	if err != nil {
		beego.Error(err)
	}
	return myview
}

func loadRelationModel(view TopoView) TopoView {
	_, err := Orm.LoadRelated(&view, "TopoNode")
	if err != nil {
		beego.Error(err)
	}
	_, err = Orm.LoadRelated(&view, "TopoLine")
	if err != nil {
		beego.Error(err)
	}

	return view

}
func (this *TopoView) QueryTopoView() []TopoView {
	var myviews []TopoView
	if this.Id == -1 {
		var queryViews []TopoView
		queryRet, err := Orm.QueryTable("topo_view").RelatedSel().All(&queryViews)
		if err != nil {
			beego.Error(err)
		}
		beego.Debug("queryRet", queryRet)
		for _, view := range queryViews {
			myviews = append(myviews, loadRelationModel(view))
		}
	} else {
		var myview TopoView
		err := Orm.QueryTable("topo_view").Filter("id", this.Id).One(&myview)
		if err != nil {
			beego.Error(err)
		}
		myviews = append(myviews, loadRelationModel(myview))
	}
	return myviews
}

func (this *TopoView) AddTopoView() *TopoView {
	_, err := Orm.Insert(this)
	if err != nil {
		beego.Error(err)
	}
	return this
}