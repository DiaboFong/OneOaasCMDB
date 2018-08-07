package controllers

import (
	"github.com/astaxie/beego"
)

type PdfViewController struct {
	beego.Controller
}

func (c *PdfViewController) Get() {
	c.TplName = "viewer.tpl"
}


