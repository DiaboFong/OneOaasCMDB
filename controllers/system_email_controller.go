package controllers

import (
	"github.com/astaxie/beego"
	m "oneoaas.com/cmdb/models"
)

func (this *SystemEmailController) AddEmail() {

	this.DbLog("SystemEmail", "邮件", "添加")

	systemEmail := new(m.SystemEmail)
	systemEmail.Server = this.GetString("server", "")
	systemEmail.Account = this.GetString("account", "")
	systemEmail.Port = this.GetString("port", "")
	systemEmail.Password = this.GetString("password", "")

	id, err := m.AddEmail(systemEmail)
	if err != nil {
		beego.Debug("[保存邮件错误", err.Error(), "]")
		this.ResponseErrorJSON(400, errorFormat(ErrorBadRequest_400, err.Error()))
	} else {
		beego.Debug("[保存邮件成功,id是", id, "]")
		this.Data["json"] = this.ResponseSuccessJSON(true, "添加邮件成功", id)
	}
	this.ServeJSON()
}
