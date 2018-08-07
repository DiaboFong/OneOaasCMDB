package controllers

import (
	"github.com/astaxie/beego"
	"oneoaas.com/cmdb/models"
	m "oneoaas.com/cmdb/models"
	"oneoaas.com/cmdb/util"
	"strings"
	"net/http"
)

func (this *NetworkBandwidthStateController) GetAll() {
	var ml []interface{}
	regionArray := models.GetAllNetworkBandwidthState()
	for _, v := range regionArray {
		//类型向上转
		ml = append(ml, v)
	}
	this.DataJSON(ml)
}

// @Title networkbandwidth state
// @Description 查询带宽状态
// @Success 200 {map} map[string]interface{}
// @Param   enable      	  query     string    false    "数据是否有效 0/1"
// @Param   format     		  query   	string 	  false    "json:返回带有总记录条数"
// @Param   order     		  query   	string 	  false    "排序方式asc/desc"
// @Param   sort     		  query   	string 	  false    "排序字段"
// @Param   limit     		  query   	int    	  false    "每页的数据量"
// @Param   Authorization     header    string 	  true     "认证信息"
// @Param   timestamp         query     string 	  true     "时间戳"
// @Failure 400 查询带宽状态失败
// @router /networkbandwidth [get]
func (this *NetworkBandwidthStateController) GetBandwidthState() {
	var sort []string
	var order []string
	var query = make(map[string]string, 0)          //存储条件
	var bandwidthStateList = make([]interface{}, 0) //存储返回数据
	var limit int64 = 10
	var offset int64 = 0

	// limit: 10 (default is 10)
	if v, err := this.GetInt64("limit"); err == nil {
		limit = v
	}else{
		limit = 0
	}

	// offset: 0 (default is 0)
	if v, err := this.GetInt64("offset"); err == nil {
		offset = v
	}

	// sort: col1,col2
	if v := this.GetString("sort"); v != "" {
		sort = strings.Split(v, ",")
	}

	// order: desc,asc
	if v := this.GetString("order"); v != "" {
		order = strings.Split(v, ",")
	}

	//搜索查询,默认按带宽状态查询
	if v := this.GetString("search"); v != "" {
		query["state__icontains"] = v
		//WHERE state LIKE '% %'

	}

	beego.Info("查询带宽状态条件",
		"offset=", offset,
		"limit=", limit,
		"sort=", sort,
		"order=", order,
		"query=", query,
	)

	bandwidthStateList, err := m.GetBandwidthState(query, sort, order, offset, limit)
	if err != nil {
		beego.Debug("[查询带宽状态发生错误", err.Error(), "]")
	}
	if bandwidthStateList == nil {
		bandwidthStateList = make([]interface{}, 0)
	}
	if v := this.GetString("format"); v != "" {
		if v == "total" {
			countNum, _ := m.CountBandwidthState(query)
			this.TotalRowsPageJSON(countNum, bandwidthStateList)
		}
	} else {
		this.DataJSON(bandwidthStateList)
	}
	this.ServeJSON()
}

// @Title networkbandwidth state
// @Description 添加带宽状态
// @Success 200 {map} map[string]interface{}
// @Param   bandwidthState     query   string  true  "带宽状态"
// @Param   color     		   query   string  false "颜色"
// @Param   Authorization      header  string  true  "认证信息"
// @Param   timestamp          query   string  true  "时间戳"
// @Failure 400 添加带宽状态失败
// @router /networkbandwidth [post]
func (this *NetworkBandwidthStateController) AddBandwidthState() {

	this.DbLog("NetworkBandwidthState", "带宽状态", "添加")

	var bandwidthState m.NetworkBandwidthState
	if State := this.GetString("bandwidthState", ""); State != "" {
		bandwidthState.State = State
	}
	color := this.GetString("color", "")
	bandwidthState.Color=color
	bandwidthState.CreateBy = this.GetString("createBy", "")

	if bandwidthState.State != "" {
		id, err := m.AddBandwidthState(bandwidthState)
		if err != nil {
			beego.Debug("[保存带宽状态错误", err.Error(), "]")
			this.ResponseErrorJSON(http.StatusOK, err.Error())
		} else {
			beego.Debug("[保存带宽状态成功,id是", id, "]")
			this.Data["json"] = this.ResponseSuccessJSON(true, "添加带宽状态成功", id)
		}
	}else{
		this.Data["json"] = this.ResponseSuccessJSON(false, "带宽状态不能为空", -1)
	}

	this.ServeJSON()
}

// @Title networkbandwidth state
// @Description 通过id删除带宽状态
// @Success 200 {map}
// @Param   bandwidthStateId     query    string  true  "带宽状态ID"
// @Param   Authorization        header   string  true  "认证信息"
// @Param   timestamp            query    string  true  "时间戳"
// @Failure 400 删除带宽状态失败
// @router /networkbandwidth [delete]
func (this *NetworkBandwidthStateController) DelBandwidthState() {

	this.DbLog("NetworkBandwidthState", "带宽状态", "删除")

	var err error
	v := this.GetStrings("bandwidthStateId")
	if len(v) > 0 {
		for index, value := range v {
			for _, id := range strings.Split(value, ",") {
				beego.Info("索引ID是:", index)
				beego.Info("值是:", id)
				bandwidthStateId, _ := util.StrToInt64(id)
				beego.Debug("[删除的带宽状态,ID是", bandwidthStateId, "]")
				err = m.DelBandwidthState(bandwidthStateId)
			}
		}
		if err != nil {
			this.ResponseErrorJSON(http.StatusOK, err.Error())
		} else {
			this.Data["json"] = this.ResponseSuccessJSON(true, "删除带宽状态成功", 1)
		}
	} else {
		this.Data["json"] = this.ResponseSuccessJSON(false, "删除带宽状态失败", -1)
	}
	this.ServeJSON()
}

// @Title networkbandwidth state
// @Description 更新带宽状态
// @Success 200 {map} map[string]interface{}
// @Param   bandwidthStateId  query    int64   true    "带宽状态ID"
// @Param   bandwidthState    query    string  true    "带宽状态"
// @Param   color             query    string  false   "颜色"
// @Param   Authorization     header   string  true    "认证信息"
// @Param   timestamp         query    string  true    "时间戳"
// @Failure 400 更新带宽状态失败
// @router /networkbandwidth [put]
func (this *NetworkBandwidthStateController) PutBandwidthState() {

	this.DbLog("NetworkBandwidthState", "带宽状态", "更新")

	bandwidthStateId, _ := this.GetInt64("bandwidthStateId", 0)
	color := this.GetString("color", "")

	bandwidthState, err := m.GetNetworkBandwidthStateById(bandwidthStateId)
	if err != nil {
		this.ResponseErrorJSON(http.StatusOK, err.Error())
	}
	bandwidthState.Color=color

	bandwidthState.State = strings.TrimSpace(this.GetString("bandwidthState", ""))
	beego.Info("[带宽状态Id是", bandwidthState.Id, "带宽状态是", bandwidthState.State, "]")

	if updateBy := this.GetString("updateBy", ""); updateBy != "" {
		bandwidthState.UpdateBy = updateBy
	}

	if err := m.PutBandwidthState(bandwidthState); err == nil {
		this.Data["json"] = this.ResponseSuccessJSON(true, "更新带宽状态成功", 1)
	} else {
		this.Data["json"] = this.ResponseSuccessJSON(false, "更新带宽状态失败", -1)
	}
	this.ServeJSON()
}
