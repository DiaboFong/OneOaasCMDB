package controllers

import "github.com/astaxie/beego"

func (this *StatisticalController) SelectStatistical() {
	userinfo := this.GetSession("userinfo")
	beego.Info("session信息", userinfo)
	if userinfo == nil {
		//如果session信息为空，那么重定向到登录页
		this.GoRedirect("/")
	}
	this.Display("statistical/statistical_select")
}

func (this *StatisticalController) ManageStatistical() {
	userinfo := this.GetSession("userinfo")
	beego.Info("session信息", userinfo)
	if userinfo == nil {
		//如果session信息为空，那么重定向到登录页
		this.GoRedirect("/")
	}
	this.Display("statistical/statistical_manage")
}
