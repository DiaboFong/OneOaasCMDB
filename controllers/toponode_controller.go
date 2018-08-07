package controllers

import (
	"fmt"
	"oneoaas.com/cmdb/models"
	"github.com/astaxie/beego"
)

func (this *TopoNodeController)  Get() {
	id, err := this.GetInt64("id", -1)
	node := new(models.TopoNode)
	if err != nil {
		beego.Error(err)
	}
	if id == -1 {
		this.Data["json"] = node.GetTopoNode()
	} else {
		node.Id = id
		this.Data["json"] = node.GetTopoNodeById()
	}
	this.ServeJSON()
}

func (this *TopoNodeController)  Add() {
	viewid, _ := this.GetInt64("viewid", -1)
	fmt.Println("viewId", viewid)
	if viewid == -1 {
		this.Data["json"] = `{}`
		this.ServeJSON()
	}

	label := this.GetString("label")
	title := this.GetString("title")
	shape := this.GetString("shape")
	image := this.GetString("image")
	x, _ := this.GetInt64("x", 0)
	y, _ := this.GetInt64("y", 0)

	view := models.TopoView{}
	view.Id = viewid
	view = view.GetTopoViewById()

	node := new(models.TopoNode)
	node.Label = label
	node.Title = title
	node.Shape = shape
	node.Image = image
	node.X = x
	node.Y = y
	node.TopoView = &view

	this.Data["json"] = node.AddTopoNode()
	this.ServeJSON()
}

func (this *TopoNodeController)  Delete() {
	id, err := this.GetInt64("id")
	if err != nil {
		beego.Error(err)
	}
	node := new(models.TopoNode)
	node.Id = id
	deleteRet := node.DeleteTopoNode()
	fmt.Printf("%v\n", deleteRet)
	this.Data["json"] = deleteRet
	this.ServeJSON()
}

func (this *TopoNodeController)  Update() {

	id, err := this.GetInt64("id")

	node := new(models.TopoNode)
	node.Id = id
	updateNode := node.GetTopoNodeById()
	label := this.GetString("label", "")
	if label != "" {
		updateNode.Label = label
	}
	title := this.GetString("title", "")
	if title != "" {
		updateNode.Title = title
	}
	shape := this.GetString("shape", "")
	if shape != "" {
		updateNode.Shape = shape
	}
	image := this.GetString("image", "")
	if shape != "" {
		updateNode.Image = image
	}
	x, _ := this.GetInt64("x", 0)
	if x != 0 {
		updateNode.X = x
	}
	y, _ := this.GetInt64("y", 0)
	if y != 0 {
		updateNode.Y = y
	}

	if err != nil {
		beego.Error(err)
	}

	fmt.Printf("%#v\n", updateNode)
	updateRet := updateNode.UpdateTopoNode()
	fmt.Println("update:", updateRet)
	this.Data["json"] = updateRet
	this.ServeJSON()
}