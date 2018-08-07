package controllers

import (
	"oneoaas.com/cmdb/models"
	"github.com/astaxie/beego"
)

func (this *TopoLineController)  Get() {

}

func (this *TopoLineController)  Add() {

	viewid, _ := this.GetInt64("viewid", -1)
	if viewid == -1 {
		this.Data["json"] = `{}`
		this.ServeJSON()
	}

	from, _ := this.GetInt64("from")
	to, _ := this.GetInt64("to")
	label := this.GetString("label")

	view := models.TopoView{}
	view.Id = viewid
	view = view.GetTopoViewById()

	line := new(models.TopoLine)
	line.Label = label
	line.To = to
	line.From = from
	line.TopoView = &view
	this.Data["json"] = line.AddTopoLine()
	this.ServeJSON()
}

func (this *TopoLineController)  Delete() {
	id, err := this.GetInt64("id")
	if err != nil {
		beego.Error(err)
	}
	line := new(models.TopoLine)
	line.Id = id
	deleteRet := line.DeleteTopoLine()
	this.Data["json"] = deleteRet
	this.ServeJSON()
}

func (this *TopoLineController)  Update() {
	id, err := this.GetInt64("id")
	if err != nil {
		beego.Error(err)
	}

	line := new(models.TopoLine)
	line.Id = id
	updateLine := line.GetTopoLineById()
	label := this.GetString("label", "")
	if label != "" {
		updateLine.Label = label
	}

	from, _ := this.GetInt64("from", -1)
	if from > 0 {
		updateLine.From = from
	}

	to, _ := this.GetInt64("to")
	if to > 0 {
		updateLine.To = to
	}

	updateRet := updateLine.UpdateTopoLine()
	this.Data["json"] = updateRet
	this.ServeJSON()
}