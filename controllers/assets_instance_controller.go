package controllers

import (
	"oneoaas.com/cmdb/models"
)



// @Title 资产实例类型
// @Description 获取基础资产实例类型
// @Success 200 {array} []models.AssertsInstance
// @Param   Authorization     header   string true       "认证信息"
// @Param   timestamp         query   string true       "时间戳"
// @Failure 400 获取资产实例类型错误
// @router / [get]
func (this *AssertsInstanceController) GetAssetsInstance() {
	resourceId,_:= this.GetInt64("resourceId")
	assertsInstance := new(models.AssertsInstance)
	assertsInstance.Id = resourceId
	instance := assertsInstance.GetAssertsInstance();
	this.Data["json"] = instance
	this.ServeJSON()
}

