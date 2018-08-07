package controllers

import (
	m "oneoaas.com/cmdb/models"
	"net/http"
)

type CpuNumber struct {
	Name  string 	`json:"name"`
	Value string 	`json:"value"`
}

type CpuCount struct {
	Legend []string `json:"legend"`
	Series []CpuNumber `json:"series"`
}

// @Title get 获取所有cpu资源
// @Description 获取所有cpu资源
// @Success 200 {map} map[string]interface{}
// @Param   Authorization   header  string true   "认证信息"
// @Param   timestamp       query   string true   "时间戳"
// @Failure 400 获取所有cpu资源
// @router / [get]
func (this *CpuController) GetAll() {
	var modelList []interface{}
	stateArray := m.GetAllCpu()
	for _, v := range stateArray {
		modelList = append(modelList, v)
	}
	this.DataJSON(modelList)
}

// @Title 根据server id 获取cpu资源
// @Description 获取所有cpu资源
// @Success 200 {map} map[string]interface{}
// @Param   Authorization   header  string true   "认证信息"
// @Param   timestamp       query   string true   "时间戳"
// @Failure 400 获取所有cpu资源
// @router /query [get]
func (this *CpuController) GetCpuByServerId() {
	serverId := this.GetString("serverid", "")
	cpuList := m.GetCpuByServerId(serverId)
	this.Data["json"] = cpuList
	this.ServeJSON()
}

// @Title server
// @Description 添加cpu资源
// @Success 200 {map} map[string]interface{}
// @Param   ModelName       query   string true   "cpu ModelName"
// @Param   Authorization   header  string true   "认证信息"
// @Param   timestamp       query   string true   "时间戳"
// @Failure 400 cpu资源失败
// @router / [post]
func (this *CpuController) AddCpu() {

	this.DbLog("Cpu", "CPU", "添加")

	var cpu m.Cpu

	cpu.ModelName = this.GetString("name", "")

	id, err := m.AddCpu(cpu)
	if err != nil {
		this.ResponseErrorJSON(http.StatusOK, err.Error())
	} else {
		this.Data["json"] = this.ResponseSuccessJSON(true, "添加CPU成功", id)
	}

	this.ServeJSON()
}

// @Title server 统计CPU使用率
// @Description 统计CPU使用率
// @Success 200 {map} map[string]interface{}
// @Param   Authorization     header  string   true    "认证信息"
// @Param   timestamp         query   string   true    "时间戳"
// @Failure 400 统计CPU使用率失败
// @router /count [get]
func (this *CpuController) CountCpu() {
	device1 := CpuNumber{
		Name:"已使用",
		Value:"100",
	}

	device2 := CpuNumber{
		Name:"未使用",
		Value:"100",
	}
	devices := CpuCount{
		Series:[]CpuNumber{device1,device2},
	}

	this.Data["json"] = devices
	this.ServeJSON()
}