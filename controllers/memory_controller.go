package controllers

import (
	m "oneoaas.com/cmdb/models"
	"net/http"
	"github.com/astaxie/beego"
)

type MemoryNumber struct {
	Name  string 	`json:"name"`
	Value string 	`json:"value"`
}

type MemoryCount struct {
	Legend []string `json:"legend"`
	Series []MemoryNumber `json:"series"`
}

type SwapNumber struct {
	Name  string 	`json:"name"`
	Value string 	`json:"value"`
}

type SwapCount struct {
	Legend []string `json:"legend"`
	Series []SwapNumber `json:"series"`
}

// @Title get 获取所有memory资源
// @Description 获取所有memory资源
// @Success 200 {map} map[string]interface{}
// @Param   Authorization   header  string true   "认证信息"
// @Param   timestamp       query   string true   "时间戳"
// @Failure 400 获取所有memory资源
// @router / [get]
func (this *MemoryController) GetAll() {
	var modelList []interface{}
	stateArray := m.GetAllMemory()
	for _, v := range stateArray {
		modelList = append(modelList, v)
	}
	this.DataJSON(modelList)
}

// @Title 根据server id 获取memory资源
// @Description 获取所有memory资源
// @Success 200 {map} map[string]interface{}
// @Param   Authorization   header  string true   "认证信息"
// @Param   timestamp       query   string true   "时间戳"
// @Failure 400 获取所有memory资源
// @router /query [get]
func (this *MemoryController) GetMemoryByServerId() {
	serverId := this.GetString("serverid", "")
	memoryList := m.GetMemoryByServerId(serverId)
	beego.Debug("查询服务器内存信息",memoryList)
	this.Data["json"] = memoryList
	this.ServeJSON()
}

// @Title 添加内存信息
// @Description 添加memory资源
// @Success 200 {map} map[string]interface{}
// @Param   Name       query   string true   	 "memory Name"
// @Param   Authorization   header  string true   "认证信息"
// @Param   timestamp       query   string true   "时间戳"
// @Failure 400 添加memory资源
// @router / [post]
func (this *MemoryController) AddMemory() {

	this.DbLog("Memory", "Memory", "添加")

	var memory m.Memory

	id, err := m.AddMemory(memory)
	if err != nil {
		this.ResponseErrorJSON(http.StatusOK, err.Error())
	} else {
		this.Data["json"] = this.ResponseSuccessJSON(true, "添加Memory成功", id)
	}

	this.ServeJSON()
}

// @Title server 统计Memory使用率
// @Description 统计Memory使用率
// @Success 200 {map} map[string]interface{}
// @Param   Authorization     header  string   true    "认证信息"
// @Param   timestamp         query   string   true    "时间戳"
// @Failure 400 统计Memory使用率失败
// @router /count [get]
func (this *MemoryController) CountMemory() {
	device1 := MemoryNumber{
		Name:"已使用",
		Value:"50",
	}

	device2 := MemoryNumber{
		Name:"未使用",
		Value:"150",
	}
	devices := MemoryCount{
		Series:[]MemoryNumber{device1,device2},
	}

	this.Data["json"] = devices
	this.ServeJSON()
}

// @Title server 统计Swap使用率
// @Description 统计Swap使用率
// @Success 200 {map} map[string]interface{}
// @Param   Authorization     header  string   true    "认证信息"
// @Param   timestamp         query   string   true    "时间戳"
// @Failure 400 统计Swap使用率失败
// @router /query [get]
func (this *MemoryController) CountSwap() {
	device1 := SwapNumber{
		Name:"已使用",
		Value:"50",
	}

	device2 := SwapNumber{
		Name:"未使用",
		Value:"100",
	}
	devices := SwapCount{
		Series:[]SwapNumber{device1,device2},
	}

	this.Data["json"] = devices
	this.ServeJSON()
}