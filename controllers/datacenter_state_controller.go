package controllers

import (
	"github.com/astaxie/beego"
	"oneoaas.com/cmdb/models"
	m "oneoaas.com/cmdb/models"
	"oneoaas.com/cmdb/util"
	"strings"
	"net/http"
)

func (this *DcStateController) GetAll() {
	var modelList []interface{}
	stateArray := models.GetAllDatacenterState()
	for _, v := range stateArray {
		//类型向上转
		modelList = append(modelList, v)
	}
	this.DataJSON(modelList)
}

// @Title datacenter state
// @Description 查询数据中心状态
// @Success 200 {map} map[string]interface{}
// @Param   enable      	  query     string    false    "数据是否有效 0/1"
// @Param   format     		  query   	string 	  false    "json:返回带有总记录条数"
// @Param   order     		  query   	string 	  false    "排序方式asc/desc"
// @Param   sort     		  query   	string 	  false    "排序字段"
// @Param   limit     		  query   	int    	  false    "每页的数据量"
// @Param   Authorization     header    string 	  true     "认证信息"
// @Param   timestamp         query     string 	  true     "时间戳"
// @Failure 400 查询数据中心状态失败
// @router /datacenter [get]
func (this *DcStateController) GetDcState() {
	var sort []string
	var order []string
	var query = make(map[string]string, 0)   //存储条件
	var dcStateList = make([]interface{}, 0) //存储返回数据
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

	//搜索查询,默认按数据中心状态查询
	if v := this.GetString("search"); v != "" {
		query["state__icontains"] = v
		//WHERE state LIKE '% %'

	}

	dcStateList, err := m.GetDcState(query, sort, order, offset, limit)
	if err != nil {
		beego.Debug("[查询数据中心状态发生错误")
	}
	if dcStateList == nil {
		dcStateList = make([]interface{}, 0)
	}
	if v := this.GetString("format"); v != "" {
		if v == "total" {
			countNum, _ := m.CountDcState(query)
			this.TotalRowsPageJSON(countNum, dcStateList)
		}
	} else {
		this.DataJSON(dcStateList)
	}
	this.ServeJSON()
}

// @Title datacenter state
// @Description 添加数据中心状态
// @Success 200 {map} map[string]interface{}
// @Param   dcState     	  query   string  true  "数据中心状态"
// @Param   color             query   string  false "颜色"
// @Param   Authorization     header  string  true  "认证信息"
// @Param   timestamp         query   string  true  "时间戳"
// @Failure 400 添加数据中心状态失败
// @router /datacenter [post]
func (this *DcStateController) AddDcState() {

	this.DbLog("DatacenterState", "数据中心状态", "添加")

	var dcState m.DatacenterState
	if State := this.GetString("dcState", ""); State != "" {
		dcState.State = State
	}
	color := this.GetString("color", "")
	dcState.Color=color
	dcState.CreateBy = this.GetString("createBy", "")

	if dcState.State != "" {
		id, err := m.AddDcState(dcState)
		if err != nil {
			beego.Debug("[保存数据中心状态错误", err.Error(), "]")
			this.ResponseErrorJSON(http.StatusOK, err.Error())
		} else {
			beego.Debug("[保存数据中心状态成功,id是", id, "]")
			this.Data["json"] = this.ResponseSuccessJSON(true, "添加数据中心状态成功", id)
		}
	}else{
		this.Data["json"] = this.ResponseSuccessJSON(false, "数据中心状态不能为空", -1)
	}

	this.ServeJSON()
}

// @Title datacenter state
// @Description 通过id删除数据中心状态
// @Success 200 {map}
// @Param   dcStateId         query    string  true  "数据中心状态ID"
// @Param   Authorization     header   string  true  "认证信息"
// @Param   timestamp         query    string  true  "时间戳"
// @Failure 400 删除数据中心状态失败
// @router /datacenter [delete]
func (this *DcStateController) DelDcState() {

	this.DbLog("DatacenterState", "数据中心状态", "删除")

	var err error
	v := this.GetStrings("dcStateId")
	if len(v) > 0 {
		for _, value := range v {
			for _, id := range strings.Split(value, ",") {
				dcStateId, _ := util.StrToInt64(id)
				beego.Debug("[删除的数据中心状态,ID是", dcStateId, "]")
				err = m.DelDcState(dcStateId)
			}
		}
		if err != nil {
			this.ResponseErrorJSON(http.StatusOK, err.Error())
		} else {
			this.Data["json"] = this.ResponseSuccessJSON(true, "删除数据中心状态成功", 1)
		}
	} else {
		this.Data["json"] = this.ResponseSuccessJSON(false, "删除数据中心状态失败", -1)
	}
	this.ServeJSON()
}

// @Title datacenter state
// @Description 更新数据中心状态
// @Success 200 {map} map[string]interface{}
// @Param   dcStateId         query    int64   true    "数据中心状态ID"
// @Param   dcState           query    string  true    "数据中心状态"
// @Param   color             query    string  false   "颜色"
// @Param   Authorization     header   string  true    "认证信息"
// @Param   timestamp         query    string  true    "时间戳"
// @Failure 400 更新数据中心状态失败
// @router /datacenter [put]
func (this *DcStateController) PutDcState() {

	this.DbLog("DatacenterState", "数据中心状态", "更新")

	dcStateId, _ := this.GetInt64("dcStateId", 0)
	color := this.GetString("color", "")

	dcState, err := m.GetDatacenterStateById(dcStateId)
	dcState.State = strings.TrimSpace(this.GetString("dcState", ""))

	if err != nil {
		this.ResponseErrorJSON(http.StatusOK, err.Error())
	}
	dcState.Color=color
	if updateBy := this.GetString("updateBy", ""); updateBy != "" {
		dcState.UpdateBy = updateBy
	}

	if err := m.PutDcState(dcState); err == nil {
		this.Data["json"] = this.ResponseSuccessJSON(true, "更新数据中心状态成功", 1)
	} else {
		this.Data["json"] = this.ResponseSuccessJSON(false, "更新数据中心状态失败", -1)
	}
	this.ServeJSON()
}
