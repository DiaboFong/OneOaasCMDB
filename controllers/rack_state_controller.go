package controllers

import (
	"github.com/astaxie/beego"
	"oneoaas.com/cmdb/models"
	m "oneoaas.com/cmdb/models"
	"oneoaas.com/cmdb/util"
	"strings"
	"net/http"
)

func (this *RackStateController) GetAll() {
	var modelList []interface{}
	stateArray := models.GetAllRackState()
	for _, v := range stateArray {
		//类型向上转
		modelList = append(modelList, v)
	}
	this.DataJSON(modelList)
}

// @Title rack state
// @Description 查询机柜状态
// @Success 200 {map} map[string]interface{}
// @Param   enable      	  query     string    false    "数据是否有效 0/1"
// @Param   format     		  query   	string 	  false    "json:返回带有总记录条数"
// @Param   order     		  query   	string 	  false    "排序方式asc/desc"
// @Param   sort     		  query   	string 	  false    "排序字段"
// @Param   limit     		  query   	int    	  false    "每页的数据量"
// @Param   Authorization     header    string 	  true     "认证信息"
// @Param   timestamp         query     string 	  true     "时间戳"
// @Failure 400 查询机柜状态失败
// @router /rack [get]
func (this *RackStateController) GetRackState() {
	var sort []string
	var order []string
	var query = make(map[string]string, 0)     //存储条件
	var rackStateList = make([]interface{}, 0) //存储返回数据
	var limit int64 = 10
	var offset int64 = 0

	if v, err := this.GetInt64("limit"); err == nil {
		limit = v
	}else{
		limit = 0
	}

	if v, err := this.GetInt64("offset"); err == nil {
		offset = v
	}

	if v := this.GetString("sort"); v != "" {
		sort = strings.Split(v, ",")
	}

	if v := this.GetString("order"); v != "" {
		order = strings.Split(v, ",")
	}

	if v := this.GetString("search"); v != "" {
		query["state__icontains"] = v

	}

	beego.Info("查询机柜状态条件",
		"offset=", offset,
		"limit=", limit,
		"sort=", sort,
		"order=", order,
		"query=", query,
	)

	rackStateList, err := m.GetRackState(query, sort, order, offset, limit)
	if err != nil {
		beego.Debug("[查询机柜状态发生错误", err.Error(), "]")
	}
	if rackStateList == nil {
		rackStateList = make([]interface{}, 0)
	}
	if v := this.GetString("format"); v != "" {
		if v == "total" {
			countNum, _ := m.CountRackState(query)
			this.TotalRowsPageJSON(countNum, rackStateList)
		}
	} else {
		this.DataJSON(rackStateList)
	}
	this.ServeJSON()
}

// @Title rack state
// @Description 添加机柜状态
// @Success 200 {map} map[string]interface{}
// @Param   rackState          query   string  true  "机柜状态"
// @Param   color     		   query   string  false "颜色"
// @Param   Authorization      header  string  true  "认证信息"
// @Param   timestamp          query   string  true  "时间戳"
// @Failure 400 添加机柜状态失败
// @router /rack [post]
func (this *RackStateController) AddRackState() {

	this.DbLog("RackState", "机柜状态", "添加")

	var rackState m.RackState
	if State := this.GetString("rackState", ""); State != "" {
		rackState.State = State
	}
	color := this.GetString("color", "")
	rackState.Color=color
	rackState.CreateBy = this.GetString("createBy", "")

	if rackState.State != "" {
		id, err := m.AddRackState(rackState)
		if err != nil {
			beego.Debug("[保存机柜状态错误", err.Error(), "]")
			this.ResponseErrorJSON(http.StatusOK, err.Error())
		} else {
			beego.Debug("[保存机柜状态成功,id是", id, "]")
			this.Data["json"] = this.ResponseSuccessJSON(true, "添加机柜状态成功", id)
		}
	}else{
		this.Data["json"] = this.ResponseSuccessJSON(false, "机柜状态不能为空", -1)
	}

	this.ServeJSON()
}

// @Title rack state
// @Description 通过id删除机柜状态
// @Success 200 {map}
// @Param   rackStateId          query    string  true  "机柜状态ID"
// @Param   Authorization        header   string  true  "认证信息"
// @Param   timestamp            query    string  true  "时间戳"
// @Failure 400 删除机柜状态失败
// @router /rack [delete]
func (this *RackStateController) DelRackState() {

	this.DbLog("RackState", "机柜状态", "删除")

	var err error
	v := this.GetStrings("rackStateId")
	if len(v) > 0 {
		for index, value := range v {
			for _, id := range strings.Split(value, ",") {
				beego.Info("索引ID是:", index)
				beego.Info("值是:", id)
				rackStateId, _ := util.StrToInt64(id)
				beego.Debug("[删除的机柜状态,ID是", rackStateId, "]")
				err = m.DelRackState(rackStateId)
			}
		}
		if err != nil {
			this.ResponseErrorJSON(http.StatusOK, err.Error())
		} else {
			this.Data["json"] = this.ResponseSuccessJSON(true, "删除机柜状态成功", 1)
		}
	} else {
		this.Data["json"] = this.ResponseSuccessJSON(false, "删除机柜状态失败", -1)
	}
	this.ServeJSON()
}

// @Title rack state
// @Description 更新机柜状态
// @Success 200 {map} map[string]interface{}
// @Param   rackStateId       query    int64   true    "机柜状态ID"
// @Param   rackState         query    string  true    "机柜状态"
// @Param   color             query    string  false   "颜色"
// @Param   Authorization     header   string  true    "认证信息"
// @Param   timestamp         query    string  true    "时间戳"
// @Failure 400 更新机柜状态失败
// @router /rack [put]
func (this *RackStateController) PutRackState() {

	this.DbLog("RackState", "机柜状态", "更新")

	rackStateId, _ := this.GetInt64("rackStateId", 0)
	color := this.GetString("color", "")

	rackState, err := m.GetRackStateById(rackStateId)
	if err != nil {
		this.ResponseErrorJSON(http.StatusOK, err.Error())
	}
	rackState.Color=color

	rackState.State = strings.TrimSpace(this.GetString("rackState", ""))
	beego.Info("[机柜状态Id是", rackState.Id, "机柜状态是", rackState.State, "]")

	if updateBy := this.GetString("updateBy", ""); updateBy != "" {
		rackState.UpdateBy = updateBy
	}

	if err := m.PutRackState(rackState); err == nil {
		this.Data["json"] = this.ResponseSuccessJSON(true, "更新机柜状态成功", 1)
	} else {
		this.Data["json"] = this.ResponseSuccessJSON(false, "更新机柜状态失败", -1)
	}
	this.ServeJSON()
}
