package controllers

import (
	"github.com/astaxie/beego"
	m "oneoaas.com/cmdb/models"
	"oneoaas.com/cmdb/util"
	"strings"
	"net/http"
)

// @Title networkbandwidth
// @Description 查询带宽
// @Success 200 {map} map[string]interface{}
// @Param   enable      	  query   string  false  "数据是否有效 0/1"
// @Param   format     		  query   string  false  "json:返回带有总记录条数"
// @Param   order     		  query   string  false  "排序方式asc/desc"
// @Param   sort     		  query   string  false  "排序字段"
// @Param   limit     		  query   int     false  "每页的数据量"
// @Param   name     		  query   string  false  "按名称筛选"
// @Param   state     		  query   string  false  "按状态筛选"
// @Param   isp     		  query   string  false  "按制造商筛选"
// @Param   start_time   	  query   string  false  "筛选起始时间"
// @Param   end_time    	  query   string  false  "筛选结束时间"
// @Param   Authorization     header  string  true   "认证信息"
// @Param   timestamp         query   string  true   "时间戳"
// @Failure 400 查询带宽失败
// @router / [get]
func (this *NetworkbandwidthController) GetNetworkbandwidth() {
	var sort string
	var order string
	var query = make(map[string]string, 0) //存储条件
	var networkbandwidthList = make([]interface{}, 0) //存储返回数据
	var limit int64 = 10
	var offset int64 = 0
	var name string
	var state string
	var isp string
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

	if v := this.GetString("state"); v != "" {
		state = v
	}

	if v := this.GetString("name"); v != "" {
		name = v
	}

	if v := this.GetString("isp"); v != "" {
		isp = v
	}

	if v := this.GetString("start_time"); v != "" {
		start_time = v
	}

	if v := this.GetString("end_time"); v != "" {
		end_time = v
	}

	networkbandwidthList, total := m.GetNetworkbandwidth(query, sort, order, offset, limit, name, state, isp, start_time, end_time)
	if networkbandwidthList == nil {
		networkbandwidthList = make([]interface{}, 0)
		total = 0
	}
	if v := this.GetString("format"); v == "json" {
		this.TotalRowsPageJSON(total, networkbandwidthList)
	} else {
		this.DataJSON(networkbandwidthList)
	}
	this.ServeJSON()
}

// @Title networkbandwidth
// @Description 添加带宽
// @Success 200 {map} map[string]interface{}
// @Param   name      		   query   string true   "带宽名称"
// @Param   state      		   query   int64  true   "带宽状态"
// @Param   room      		   query   int64  true   "所属机房"
// @Param   rack      		   query   int64  true   "所属机柜"
// @Param   isp      		   query   int64  true   "网络服务提供商"
// @Param   maxBandwidth  	   query   int64  false  "采购最大带宽(百兆)"
// @Param   minBandwidth       query   int64  false  "保底带宽(百兆)"
// @Param   minCost            query   int64  false  "保底费用(元)"
// @Param   unitCost  		   query   int64  false  "单位成本(元/百兆)"
// @Param   comment      	   query   string false  "备注"
// @Param   Authorization      header  string true   "认证信息"
// @Param   timestamp          query   string true   "时间戳"
// @Failure 400 添加带宽失败
// @router / [post]
func (this *NetworkbandwidthController) AddNetworkbandwidth() {

	this.DbLog("NetworkBandwidth", "带宽", "添加")

	var networkbandwidth m.NetworkBandwidth
	networkbandwidth.Name = this.GetString("name")

	bandWidthStateId, err := this.GetInt64("state", 0)
	if bandWidthStateId != 0 {
		if err != nil {
			beego.Debug("[添加带宽,获取带宽状态ID错误", err.Error(), "]")
			this.ResponseErrorJSON(http.StatusOK, err.Error())
		}
		bandWithStateObj, err := m.GetNetworkBandwidthStateById(bandWidthStateId)
		if err != nil {
			beego.Debug("[添加带宽,获取带宽状态对象错误", err.Error(), "]")
			this.ResponseErrorJSON(http.StatusOK, err.Error())
		} else {
			networkbandwidth.State = bandWithStateObj
		}
	}

	ispId, err := this.GetInt64("isp", 0)
	if ispId != 0 {
		if err != nil {
			beego.Debug("[添加带宽,网络服务提供商ID错误", err.Error(), "]")
			this.ResponseErrorJSON(http.StatusOK, err.Error())
		}
		IspObj, err := m.GetInternetServiceProviderById(ispId)
		if err != nil {
			beego.Debug("[添加带宽,网络服务提供商对象错误", err.Error(), "]")
			this.ResponseErrorJSON(http.StatusOK, err.Error())
		}
		networkbandwidth.Isp = IspObj
	}

	networkbandwidth.MaxBandwidth, _ = this.GetFloat("maxBandwidth")
	networkbandwidth.MinBandwidth, _ = this.GetFloat("minBandwidth")
	networkbandwidth.MinCost, _ = this.GetFloat("minCost")
	networkbandwidth.UnitCost, _ = this.GetFloat("unitCost")
	networkbandwidth.Comment = this.GetString("comment")

	roomId, _ := this.GetInt64("room", 0)
	if roomId != 0 {
		roomObj, err := m.GetRoomById(roomId)
		if err != nil {
			beego.Debug("[添加带宽,获取机房对象错误", err.Error(), "]")
			this.ResponseErrorJSON(http.StatusOK, err.Error())
		}
		networkbandwidth.Room = roomObj
	}

	rackId, _ := this.GetInt64("rack", 0)
	if rackId != 0 {
		rackObj, err := m.RackGetById(rackId)
		if err != nil {
			beego.Debug("[添加带宽,获取机柜对象错误", err.Error(), "]")
			this.ResponseErrorJSON(http.StatusOK, err.Error())
		}
		networkbandwidth.Rack = rackObj
	}

	enable, _ := this.GetBool("enable",false)
	if enable {
		networkbandwidth.Enable = enable
	}

	id, err := m.AddNetworkbandwidth(networkbandwidth)
	if err != nil {
		beego.Debug("[添加带宽失败", err.Error(), "]")
		this.ResponseErrorJSON(http.StatusOK, err.Error())
	} else {
		this.Data["json"] = this.ResponseSuccessJSON(true, "添加带宽成功", id)
	}
	this.ServeJSON()
}

// @Title networkbandwidth
// @Description 通过id删除带宽
// @Success 200 {map}
// @Param   Id        	      query    string true      "带宽ID"
// @Param   Authorization     header   string true      "认证信息"
// @Param   timestamp         query    string true      "时间戳"
// @Failure 400 删除带宽失败
// @router / [delete]
func (this *NetworkbandwidthController) DelNetworkbandwidth() {

	this.DbLog("NetworkBandwidth", "带宽", "删除")

	var err error
	v := this.GetString("Id")
	hardDelete,err := this.GetBool("hardDelete",false)
	if len(v) > 0 {
		for _, id := range strings.Split(v, ",") {
			networkbandwidthid, _ := util.StrToInt64(id)
			if(hardDelete){
				err = m.HardDelNetworkbandwidth(networkbandwidthid);
			}else{
				err = m.DelNetworkbandwidth(networkbandwidthid)
			}
		}
		if err != nil {
			this.ResponseErrorJSON(http.StatusOK, err.Error())
		} else {
			this.Data["json"] = this.ResponseSuccessJSON(true, "删除带宽成功", 1)
		}
	} else {
		this.Data["json"] = this.ResponseSuccessJSON(false, "删除带宽失败", -1)
	}

	this.ServeJSON()
}

// @Title networkbandwidth
// @Description 更新带宽
// @Success 200 {map} map[string]interface{}
// @Param   Id        		   query   int  true   "带宽ID"
// @Param   name      		   query   string true   "带宽名称"
// @Param   state      		   query   int64  true   "带宽状态"
// @Param   room      		   query   int64  true   "所属机房"
// @Param   rack      		   query   int64  true   "所属机柜"
// @Param   isp      		   query   int64  true   "网络服务提供商"
// @Param   maxBandwidth  	   query   int64  false  "采购最大带宽(百兆)"
// @Param   minBandwidth       query   int64  false  "保底带宽(百兆)"
// @Param   minCost            query   int64  false  "保底费用(元)"
// @Param   unitCost  		   query   int64  false  "单位成本(元/百兆)"
// @Param   comment      	   query   string false  "备注"
// @Param   Authorization      header  string true   "认证信息"
// @Param   timestamp          query   string true   "时间戳"
// @Failure 400 更新带宽失败
// @router / [put]
func (this *NetworkbandwidthController) PutNetworkbandwidth() {

	this.DbLog("NetworkBandwidth", "带宽", "更新")

	networkBandwidthId, _ := this.GetInt64("Id", 0)
	networkbandwidth, err := m.BandwidthGetById(networkBandwidthId)
	if err != nil {
		beego.Debug("[更新带宽,获取带宽对象错误", err.Error(), "]")
		this.ResponseErrorJSON(http.StatusOK, err.Error())
	}
	networkbandwidth.Name = this.GetString("name")

	if bandWidthStateId, _ := this.GetInt64("state", 0); bandWidthStateId != 0 {
		networkbandwidth.State , _ = m.GetNetworkBandwidthStateById(bandWidthStateId)
	}

	if ispId, _ := this.GetInt64("isp", 0); ispId != 0 {
		networkbandwidth.Isp , _ = m.GetInternetServiceProviderById(ispId)
	}

	if maxBandwidth, _ := this.GetFloat("maxBandwidth", 0); maxBandwidth != 0 {
		networkbandwidth.MaxBandwidth = maxBandwidth
	}

	if minBandwidth, _ := this.GetFloat("minBandwidth", 0); minBandwidth != 0 {
		networkbandwidth.MinBandwidth = minBandwidth
	}

	if minCost, _ := this.GetFloat("minCost", 0); minCost != 0 {
		networkbandwidth.MinCost = minCost
	}

	if unitCost, _ := this.GetFloat("unitCost", 0); unitCost != 0 {
		networkbandwidth.UnitCost = unitCost
	}

	if comment := this.GetString("comment", ""); comment != "" {
		networkbandwidth.Comment = comment
	}

	if roomId, _ := this.GetInt64("room", 0); roomId != 0 {
		networkbandwidth.Room , _ = m.GetRoomById(roomId)
	}

	if rackId, _ := this.GetInt64("rack", 0); rackId != 0 {
		networkbandwidth.Rack , _ = m.RackGetById(rackId)
	}

	enable, _ := this.GetBool("enable",false)
	if enable {
		networkbandwidth.Enable = enable
	}

	if err := m.PutBandwidth(networkbandwidth); err == nil {
		this.Data["json"] = this.ResponseSuccessJSON(true, "操作成功", 1)
	} else {
		this.Data["json"] = this.ResponseSuccessJSON(false, "操作失败", -1)
	}
	this.ServeJSON()
}

func (this *NetworkbandwidthController) Fnish() {

}
