package controllers

import (
	m "oneoaas.com/cmdb/models"
	"strings"

	"github.com/astaxie/beego"
	"oneoaas.com/cmdb/util"
	"net/http"
)

// @Title hardware
// @Description 查询硬件
// @Success 200 {map} map[string]interface{}
// @Param   enable          query    string   false  "数据是否有效 0/1"
// @Param   format     	    query    string   false  "json:返回带有总记录条数"
// @Param   order     	    query    string   false  "排序方式asc/desc"
// @Param   sort      	    query    string   false  "排序字段"
// @Param   limit     	    query    int      false  "每页的数据量"
// @Param   name     		query    string   false  "按名称筛选"
// @Param   state     		query    string   false  "按状态筛选"
// @Param   hardwaretype    query    string   false  "按类型筛选"
// @Param   online          query    int      false  "按是否在线筛选"
// @Param   start_time   	query    string   false  "筛选起始时间"
// @Param   end_time    	query    string   false  "筛选结束时间"
// @Param   Authorization   header   string   true   "认证信息"
// @Param   timestamp       query    string   true   "时间戳"
// @Failure 400 查询硬件失败
// @router / [get]
func (this *HardwareController) GetHardware() {
	var sort string
	var order string
	var query = make(map[string]string, 0)    //存储条件
	var hardwareList = make([]interface{}, 0) //存储返回数据
	var limit int64 = 10
	var offset int64 = 0
	var name string
	var state string
	var hardwaretype string
	var online int64
	var start_time string
	var end_time string

	if v, err := this.GetInt64("limit"); err == nil {
		limit = v
	}
	if v, err := this.GetInt64("offset"); err == nil {
		offset = v
	}
	if v := this.GetString("sort"); v != "" {
		sort = v
	}
	if v := this.GetString("order"); v != "" {
		order = v
	}

	if v := this.GetString("search"); v != "" {
		query["search"] = v
	}

	if v := this.GetString("enable"); v != "" {
		query["enable"] = v
	}

	if v := this.GetString("name"); v != "" {
		name = v
	}

	if v := this.GetString("state"); v != "" {
		state = v
	}

	if v := this.GetString("hardwaretype"); v != "" {
		hardwaretype = v
	}

	if v, err := this.GetInt64("online"); err == nil{
		online = v
	}

	if v := this.GetString("start_time"); v != "" {
		start_time = v
	}

	if v := this.GetString("end_time"); v != "" {
		end_time = v
	}

	hardwareList, total := m.GetHardware(query, sort, order, offset, limit, name, state, hardwaretype, online, start_time, end_time)
	if hardwareList == nil {
		hardwareList = make([]interface{}, 0)
		total = 0
	}
	if v := this.GetString("format"); v == "json" {
		this.TotalRowsPageJSON(total, hardwareList)
	} else {
		this.DataJSON(hardwareList)
	}

	this.ServeJSON()
}

// @Title hardware
// @Description 添加硬件
// @Success 200 {map} map[string]interface{}
// @Param   hardwareName       query   string true   "硬件名称"
// @Param   state      		   query   int64  true   "硬件类型"
// @Param   hardwareType       query   int64  true   "硬件状态"
// @Param   rack      		   query   int64  true   "所属机柜"
// @Param   online  		   query   int64  false  "是否在线"
// @Param   hardwareSn         query   string  false "序列号"
// @Param   manageIp           query   string  false "管理IP"
// @Param   comment     	   query   string false  "备注"
// @Param   Authorization      header  string true   "认证信息"
// @Param   timestamp          query   string true   "时间戳"
// @Failure 400 添加硬件失败
// @router / [post]
func (this *HardwareController) AddHardware() {

	this.DbLog("Hardware", "硬件", "添加")

	var hardware m.Hardware
	hardware.HardwareName = this.GetString("hardwareName", "")
	hardware.Online, _ = this.GetInt64("online", -1)
	hardware.HardwareSn = this.GetString("hardwareSn")
	hardware.ManageIp = this.GetString("manageIp", "")
	hardware.Comment = this.GetString("comment", "")

	rackId, _ := this.GetInt64("rack", 0)
	if rackId != 0 {
		rackObj, err := m.RackGetById(rackId)
		if err != nil {
			beego.Debug("[添加硬件,获取机柜对象错误", err.Error(), "]")
			this.ResponseErrorJSON(http.StatusOK, err.Error())
		}
		hardware.Rack = rackObj
	}

	stateId, _ := this.GetInt64("state", 0)
	if stateId != 0 {
		beego.Debug("硬件状态ID", stateId)
		hardwareStateObj, err := m.GetHardwareStateById(stateId)
		if err != nil {
			beego.Debug("[添加硬件,获取硬件状态对象错误", err.Error(), "]")
			this.ResponseErrorJSON(http.StatusOK, err.Error())
		}
		hardware.State = hardwareStateObj
	}

	hardwareTypeId, _ := this.GetInt64("hardwareType", 0)
	if hardwareTypeId != 0 {
		hardwareTypeObj, err := m.GetHardwareTypeById(hardwareTypeId)
		if err != nil {
			beego.Debug("[添加硬件,获取硬件类型对象错误", err.Error(), "]")
			this.ResponseErrorJSON(http.StatusOK, err.Error())
		}
		hardware.Type = hardwareTypeObj
	}

	enable, _ := this.GetBool("enable",false)
	if enable {
		hardware.Enable = enable
	}

	id, err := m.AddHardware(hardware)
	if err != nil {
		beego.Debug("[保存硬件错误", err.Error(), "]")
		this.ResponseErrorJSON(http.StatusOK, err.Error())
	} else {
		beego.Debug("[保存硬件成功,id是", id, "]")
		this.Data["json"] = this.ResponseSuccessJSON(true, "添加硬件成功", id)
	}
	this.ServeJSON()
}

// @Title hardware
// @Description 通过id删除硬件
// @Success 200 {map}
// @Param   Id         	      query    string true      "硬件ID"
// @Param   Authorization     header   string true      "认证信息"
// @Param   timestamp         query    string true      "时间戳"
// @Failure 400 删除硬件失败
// @router / [delete]
func (this *HardwareController) DelHardware() {

	this.DbLog("Hardware", "硬件", "删除")

	var err error
	v := this.GetString("Id")
	hardDelete,err := this.GetBool("hardDelete",false)
	if len(v) > 0 {
		for _, id := range strings.Split(v, ",") {
			hardwareid, _ := util.StrToInt64(id)
			if(hardDelete){
				err = m.HardDelHardware(hardwareid);
			}else{
				err = m.DelHardware(hardwareid)
			}
		}
		if err != nil {
			this.ResponseErrorJSON(http.StatusOK, err.Error())
		} else {
			this.Data["json"] = this.ResponseSuccessJSON(true, "删除成功", 1)
		}
	} else {
		this.Data["json"] = this.ResponseSuccessJSON(false, "删除失败", -1)
	}

	this.ServeJSON()
}

// @Title hardware
// @Description 更新硬件
// @Success 200 {map} map[string]interface{}
// @Param   Id        		   query   int64  true   "硬件ID"
// @Param   hardwareName       query   string true   "硬件名称"
// @Param   stateId            query   int64  true   "硬件类型"
// @Param   hardwareType       query   int64  true   "硬件状态"
// @Param   rack      		   query   int64  true   "所属机柜"
// @Param   online  		   query   int64  false  "是否在线"
// @Param   hardwareSn         query   string false "序列号"
// @Param   manageIp           query   string false "管理IP"
// @Param   comment     	   query   string false  "备注"
// @Param   Authorization      header  string true   "认证信息"
// @Param   timestamp          query   string true   "时间戳"
// @Failure 400 更新硬件失败
// @router / [put]
func (this *HardwareController) PutHardware() {

	this.DbLog("Hardware", "硬件", "更新")

	hardwareId, _ := this.GetInt64("Id", 0)
	hardware, err := m.HardwareGetById(hardwareId)
	if err != nil {
		beego.Debug("[更新硬件失败", err.Error(), "]")
		this.ResponseErrorJSON(http.StatusOK, err.Error())
	}

	if hardwareName := this.GetString("hardwareName", ""); hardwareName != "" {
		hardware.HardwareName = hardwareName
	}

	if online, _ := this.GetInt64("online", -1); online != -1 {
		hardware.Online = online
	}

	if hardwareSn := this.GetString("hardwareSn", ""); hardwareSn != "" {
		hardware.HardwareSn = hardwareSn
	}

	if manageIp := this.GetString("manageIp", ""); manageIp != "" {
		hardware.ManageIp = manageIp
	}

	if comment := this.GetString("comment", ""); comment != "" {
		hardware.Comment = comment
	}

	enable, _ := this.GetBool("enable",false)
	if enable {
		hardware.Enable = enable
	}

	if hardwareTypeId, _ := this.GetInt64("hardwareType", 0); hardwareTypeId != 0 {
		hardware.Type , _ = m.GetHardwareTypeById(hardwareTypeId)
	}

	if stateId, _ := this.GetInt64("state", 0); stateId != 0 {
		hardware.State , _ = m.GetHardwareStateById(stateId)
	}

	if rackId, _ := this.GetInt64("rack", 0); rackId != 0 {
		hardware.Rack , _ = m.RackGetById(rackId)
	}

	if err := m.PutHardware(hardware); err == nil {
		this.Data["json"] = this.ResponseSuccessJSON(true, "更新硬件成功", 1)
	} else {
		this.Data["json"] = this.ResponseSuccessJSON(false, "更新硬件失败", -1)
	}
	this.ServeJSON()
}

func (this *HardwareController) Fnish() {

}
