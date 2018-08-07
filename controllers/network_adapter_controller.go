package controllers

import (
	m "oneoaas.com/cmdb/models"
	"net/http"
)

// @Title get 获取所有网络适配器资源
// @Description 获取所有网络适配器资源
// @Success 200 {map} map[string]interface{}
// @Param   Authorization   header  string true   "认证信息"
// @Param   timestamp       query   string true   "时间戳"
// @Failure 400 获取所有网络适配器资源
// @router / [get]
func (this NetworkAdapterController) GetAll() {
	var modelList []interface{}
	stateArray := m.GetAllNetworkAdapter()
	for _, v := range stateArray {
		modelList = append(modelList, v)
	}
	this.DataJSON(modelList)
}

// @Title 根据server id 获取网络适配器资源
// @Description 根据server id 获取网络适配器资源
// @Success 200 {map} map[string]interface{}
// @Param   Authorization   header  string true   "认证信息"
// @Param   timestamp       query   string true   "时间戳"
// @Failure 400 根据server id 获取网络适配器资源
// @router /query [get]
func (this *NetworkAdapterController) GetNetworkAdapterByServerId() {
	serverId := this.GetString("serverid", "")
	networkAdapterList := m.GetNetworkAdapterByServerId(serverId)
	this.Data["json"] = networkAdapterList
	this.ServeJSON()
}

// @Title network adapter
// @Description 添加网络适配器资源
// @Success 200 {map} map[string]interface{}
// @Param   Name       	    query   string true   "网络适配器名称"
// @Param   Authorization   header  string true   "认证信息"
// @Param   timestamp       query   string true   "时间戳"
// @Failure 400 添加网络适配器资源
// @router / [post]
func (this *NetworkAdapterController) AddNetworkAdapter() {

	this.DbLog("NetworkAdapter", "NetworkAdapter", "添加")

	var networkadapter m.NetworkAdapter

	networkadapter.Name = this.GetString("name", "")

	id, err := m.AddNetworkAdapter(&networkadapter)
	if err != nil {
		this.ResponseErrorJSON(http.StatusOK, err.Error())
	} else {
		this.Data["json"] = this.ResponseSuccessJSON(true, "添加NetworkAdapter成功", id)
	}

	this.ServeJSON()
}