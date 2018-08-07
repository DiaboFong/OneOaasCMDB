package controllers

import (
	m "oneoaas.com/cmdb/models"
)

// @Title systemcolor
// @Description 查询系统颜色
// @Success 200 {map} map[string]interface{}
// @Param   Authorization     header    string true     "认证信息"
// @Param   timestamp         query     string true     "时间戳"
// @Failure 400 查询系统颜色失败
// @router / [get]
func (this *StateColorController) GetColor() {
	var modelList []interface{}
	colorArray := m.GetColor()
	for _, v := range colorArray {
		//级别向上转
		modelList = append(modelList, v)
	}
	this.DataJSON(modelList)
}