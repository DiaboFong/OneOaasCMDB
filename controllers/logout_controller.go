package controllers

import "github.com/astaxie/beego"

func (this *LogoutController) Prepare() {

}

type LogoutResult struct {
	Success bool `json:"success"`
	Message string `json:"message"`
}

func (this *LogoutController) Get() {
	logoutResult := LogoutResult{}
	isExit, err := this.GetBool("exit", false)
	if (err != nil) {
		beego.Error(err)
		logoutResult.Success = false
		logoutResult.Message = "登出失败"
		this.Data["json"] = logoutResult
		this.ServeJSON()
	}
	if isExit {
		//无状态风格
		//this.DestroySession()
		this.Ctx.SetCookie("beegosessionID", "", -1, "/")
		this.Ctx.SetCookie("token", "", -1, "/")
		logoutResult.Success = true
		logoutResult.Message = "登出成功"
	} else {
		logoutResult.Success = false
		logoutResult.Message = "登出失败"
	}
	this.Data["json"] = logoutResult
	this.ServeJSON()
}
