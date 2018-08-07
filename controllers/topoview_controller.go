package controllers

import (
	"oneoaas.com/cmdb/models"
	"github.com/astaxie/beego"
)

func (this *TopoViewController)  Get() {

	id, err := this.GetInt64("id", -1)
	if err != nil {
		beego.Error(err)
	}
	view := models.TopoView{}
	view.Id = id
	this.Data["json"] = view.QueryTopoView()
	this.ServeJSON()
}

func (this *TopoViewController)  Add() {
	name := this.GetString("name", "")
	view := new(models.TopoView)
	view.Name = name
	this.Data["json"] = view.AddTopoView()
	this.ServeJSON()
}

func (this *TopoViewController)  Delete() {

}

func (this *TopoViewController)  Update() {

}
