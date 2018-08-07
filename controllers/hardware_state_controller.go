package controllers

import (
	"github.com/astaxie/beego"
	"oneoaas.com/cmdb/models"
	m "oneoaas.com/cmdb/models"
	"oneoaas.com/cmdb/util"
	"strings"
	"net/http"
)

func (this *HardwareStateController) GetAll() {
	var modelList []interface{}
	stateArray := models.GetAllHardwareState()
	for _, v := range stateArray {
		//类型向上转
		modelList = append(modelList, v)
	}
	this.DataJSON(modelList)
}

// @Title hardware state
// @Description 查询硬件状态
// @Success 200 {map} map[string]interface{}
// @Param   enable      	  query     string    false    "数据是否有效 0/1"
// @Param   format     		  query   	string 	  false    "json:返回带有总记录条数"
// @Param   order     		  query   	string 	  false    "排序方式asc/desc"
// @Param   sort     		  query   	string 	  false    "排序字段"
// @Param   limit     		  query   	int    	  false    "每页的数据量"
// @Param   Authorization     header    string 	  true     "认证信息"
// @Param   timestamp         query     string 	  true     "时间戳"
// @Failure 400 查询硬件状态失败
// @router /hardware [get]
func (this *HardwareStateController) GetHardwareState() {
	var sort []string
	var order []string
	var query = make(map[string]string, 0)         //存储条件
	var hardwareStateList = make([]interface{}, 0) //存储返回数据
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

	//搜索查询,默认按硬件状态查询
	if v := this.GetString("search"); v != "" {
		query["state__icontains"] = v
		//WHERE state LIKE '% %'

	}

	beego.Info("查询硬件状态条件",
		"offset=", offset,
		"limit=", limit,
		"sort=", sort,
		"order=", order,
		"query=", query,
	)

	hardwareStateList, err := m.GetHardwareState(query, sort, order, offset, limit)
	if err != nil {
		beego.Debug("[查询硬件状态发生错误", err.Error(), "]")
	}
	if hardwareStateList == nil {
		hardwareStateList = make([]interface{}, 0)
	}
	if v := this.GetString("format"); v != "" {
		if v == "total" {
			countNum, _ := m.CountHardwareState(query)
			this.TotalRowsPageJSON(countNum, hardwareStateList)
		}
	} else {
		this.DataJSON(hardwareStateList)
	}
	this.ServeJSON()
}

// @Title hardware state
// @Description 添加硬件状态
// @Success 200 {map} map[string]interface{}
// @Param   hardwareState      query   string  true  "硬件状态"
// @Param   color     		   query   string  false "颜色"
// @Param   Authorization      header  string  true  "认证信息"
// @Param   timestamp          query   string  true  "时间戳"
// @Failure 400 添加硬件状态失败
// @router /hardware [post]
func (this *HardwareStateController) AddHardwareState() {

	this.DbLog("HardwareState", "硬件状态", "添加")

	var hardwareState m.HardwareState
	if State := this.GetString("hardwareState", ""); State != "" {
		hardwareState.State = State
	}
	color := this.GetString("color", "")
	hardwareState.Color=color
	hardwareState.CreateBy = this.GetString("createBy", "")

	if hardwareState.State != "" {
		id, err := m.AddHardwareState(hardwareState)
		if err != nil {
			beego.Debug("[保存硬件状态错误", err.Error(), "]")
			this.ResponseErrorJSON(http.StatusOK, err.Error())
		} else {
			beego.Debug("[保存硬件状态成功,id是", id, "]")
			this.Data["json"] = this.ResponseSuccessJSON(true, "添加硬件状态成功", id)
		}
	}else{
		this.Data["json"] = this.ResponseSuccessJSON(false, "硬件状态不能为空", -1)
	}

	this.ServeJSON()
}

// @Title hardware state
// @Description 通过id删除硬件状态
// @Success 200 {map}
// @Param   hardwareStateId      query    string  true  "硬件状态ID"
// @Param   Authorization        header   string  true  "认证信息"
// @Param   timestamp            query    string  true  "时间戳"
// @Failure 400 删除硬件状态失败
// @router /hardware [delete]
func (this *HardwareStateController) DelHardwareState() {

	this.DbLog("HardwareState", "硬件状态", "删除")

	var err error
	v := this.GetStrings("hardwareStateId")
	if len(v) > 0 {
		for index, value := range v {
			for _, id := range strings.Split(value, ",") {
				beego.Info("索引ID是:", index)
				beego.Info("值是:", id)
				hardwareStateId, _ := util.StrToInt64(id)
				beego.Debug("[删除的硬件状态,ID是", hardwareStateId, "]")
				err = m.DelHardwareState(hardwareStateId)
			}
		}
		if err != nil {
			this.ResponseErrorJSON(http.StatusOK, err.Error())
		} else {
			this.Data["json"] = this.ResponseSuccessJSON(true, "删除硬件状态成功", 1)
		}
	} else {
		this.Data["json"] = this.ResponseSuccessJSON(false, "删除硬件状态失败", -1)
	}
	this.ServeJSON()
}

// @Title hardware state
// @Description 更新硬件状态
// @Success 200 {map} map[string]interface{}
// @Param   hardwareStateId   query    int64   true    "硬件状态ID"
// @Param   hardwareState     query    string  true    "硬件状态"
// @Param   color             query    string  false   "颜色"
// @Param   Authorization     header   string  true    "认证信息"
// @Param   timestamp         query    string  true    "时间戳"
// @Failure 400 更新硬件状态失败
// @router /hardware [put]
func (this *HardwareStateController) PutHardwareState() {

	this.DbLog("HardwareState", "硬件状态", "更新")

	hardwareStateId, _ := this.GetInt64("hardwareStateId", 0)
	color := this.GetString("color", "")

	hardwareState, err := m.GetHardwareStateById(hardwareStateId)
	if err != nil {
		this.ResponseErrorJSON(http.StatusOK, err.Error())
	}
	hardwareState.Color=color

	hardwareState.State = strings.TrimSpace(this.GetString("hardwareState", ""))
	beego.Info("[硬件状态Id是", hardwareState.Id, "硬件状态是", hardwareState.State, "]")

	if updateBy := this.GetString("updateBy", ""); updateBy != "" {
		hardwareState.UpdateBy = updateBy
	}

	if err := m.PutHardwareState(hardwareState); err == nil {
		this.Data["json"] = this.ResponseSuccessJSON(true, "更新硬件状态成功", 1)
	} else {
		this.Data["json"] = this.ResponseSuccessJSON(false, "更新硬件状态失败", -1)
	}
	this.ServeJSON()
}
