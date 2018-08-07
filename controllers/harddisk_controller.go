package controllers

import(
	m "oneoaas.com/cmdb/models"
	"net/http"
	"github.com/astaxie/beego"
)

// @Title get 获取所有硬盘资源
// @Description 获取所有硬盘资源
// @Success 200 {map} map[string]interface{}
// @Param   Authorization   header  string true   "认证信息"
// @Param   timestamp       query   string true   "时间戳"
// @Failure 400 获取所有硬盘资源
// @router / [get]
func (this HarddiskController) GetAll() {
	var modelList []interface{}
	stateArray := m.GetAllHarddisk()
	for _, v := range stateArray {
		//级别向上转
		modelList = append(modelList, v)
	}
	this.DataJSON(modelList)
}

// @Title 根据server id 获取硬盘资源
// @Description 根据server id 获取硬盘资源
// @Success 200 {map} map[string]interface{}
// @Param   Authorization   header  string true   "认证信息"
// @Param   timestamp       query   string true   "时间戳"
// @Failure 400 根据server id 获取硬盘资源
// @router /query [get]
func (this HarddiskController) GetHarddiskByServerId() {
	serverId := this.GetString("serverid", "")
	harddiskList := m.GetHardDiskByServerId(serverId)
	beego.Debug("查询服务器硬盘信息",harddiskList)
	this.Data["json"] = harddiskList
	this.ServeJSON()
}

// @Title 硬盘
// @Description 添加硬盘资源
// @Success 200 {map} map[string]interface{}
// @Param   Name       	    query   string true    "硬盘名称"
// @Param   Authorization   header  string true   "认证信息"
// @Param   timestamp       query   string true   "时间戳"
// @Failure 400 添加硬盘资源
// @router / [post]
func (this *HarddiskController) AddHarddisk() {

	this.DbLog("Harddisk", "Harddisk", "添加")

	var harddisk m.Harddisk

	id, err := m.AddHarddisk(&harddisk)
	if err != nil {
		this.ResponseErrorJSON(http.StatusOK, err.Error())
	} else {
		this.Data["json"] = this.ResponseSuccessJSON(true, "添加Harddisk成功", id)
	}

	this.ServeJSON()
}