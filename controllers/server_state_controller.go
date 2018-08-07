package controllers

import (
	"github.com/astaxie/beego"
	//"oneoaas.com/cmdb/models"
	m "oneoaas.com/cmdb/models"
	"oneoaas.com/cmdb/util"
	"strings"
	"net/http"
)

/*func (this *ServerStateController) GetAll() {
	var modelList []interface{}
	stateArray := models.GetAllServerState()
	for _, v := range stateArray {
		modelList = append(modelList, v)
	}
	this.DataJSON(modelList)
}*/

// @Title server state
// @Description 查询服务器状态
// @Success 200 {map} map[string]interface{}
// @Param   enable      	  query     string    false    "数据是否有效 0/1"
// @Param   color     		  query     string    false    "颜色"
// @Param   Authorization     header    string 	  true     "认证信息"
// @Param   timestamp         query     string 	  true     "时间戳"
// @Failure 400 查询服务器状态失败
// @router /server [get]
func (this *ServerStateController) GetServerState() {
	var sort []string
	var order []string
	var query = make(map[string]string, 0)       //存储条件
	var serverStateList = make([]interface{}, 0) //存储返回数据
	var limit int64 = 10
	var offset int64 = 0

	// limit: 10 (default is 10)
	if v, err := this.GetInt64("limit"); err == nil {
		limit = v
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

	//搜索查询,默认按服务器状态查询
	if v := this.GetString("search"); v != "" {
		query["state__icontains"] = v
		//WHERE state LIKE '% %'

	}

	beego.Info("查询服务器状态条件",
		"offset=", offset,
		"limit=", limit,
		"sort=", sort,
		"order=", order,
		"query=", query,
	)

	serverStateList, err := m.GetServerState(query, sort, order, offset, limit)
	if err != nil {
		beego.Debug("[查询服务器状态发生错误", err.Error(), "]")
	}
	if serverStateList == nil {
		serverStateList = make([]interface{}, 0)
	}
	if v := this.GetString("format"); v != "" {
		if v == "total" {
			countNum, _ := m.CountServerState(query)
			this.TotalRowsPageJSON(countNum, serverStateList)
		}
	} else {
		this.DataJSON(serverStateList)
	}
	this.ServeJSON()
}

// @Title server state
// @Description 添加服务器状态
// @Success 200 {map} map[string]interface{}
// @Param   serverState        query   string  true  "服务器状态"
// @Param   Authorization      header  string  true  "认证信息"
// @Param   timestamp          query   string  true  "时间戳"
// @Failure 400 添加服务器状态失败
// @router /server [post]
func (this *ServerStateController) AddServerState() {

	this.DbLog("ServerState", "服务器状态", "添加")

	var serverState m.ServerState
	if State := this.GetString("serverState", ""); State != "" {
		serverState.State = this.GetString("serverState", "")
	}
	color := this.GetString("color", "")
	serverState.Color=color
	serverState.CreateBy = this.GetString("createBy", "")

	if serverState.State != "" {
		id, err := m.AddServerState(serverState)
		if err != nil {
			beego.Debug("[保存服务器状态错误", err.Error(), "]")
			this.ResponseErrorJSON(http.StatusOK, err.Error())
		} else {
			beego.Debug("[保存服务器状态成功,id是", id, "]")
			this.Data["json"] = this.ResponseSuccessJSON(true, "添加服务器状态成功", id)
		}
	}else{
		this.Data["json"] = this.ResponseSuccessJSON(false, "服务器状态不能为空", -1)
	}

	this.ServeJSON()
}

// @Title server state
// @Description 通过id删除服务器状态
// @Success 200 {map}
// @Param   serverStateId        query    string  true  "服务器状态ID"
// @Param   Authorization        header   string  true  "认证信息"
// @Param   timestamp            query    string  true  "时间戳"
// @Failure 400 删除服务器状态失败
// @router /server [delete]
func (this *ServerStateController) DelServerState() {

	this.DbLog("ServerState", "服务器状态", "删除")

	var err error
	v := this.GetStrings("serverStateId")
	if len(v) > 0 {
		for index, value := range v {
			for _, id := range strings.Split(value, ",") {
				beego.Info("索引ID是:", index)
				beego.Info("值是:", id)
				serverStateId, _ := util.StrToInt64(id)
				beego.Debug("[删除的服务器状态,ID是", serverStateId, "]")
				err = m.DelServerState(serverStateId)
			}
		}
		if err != nil {
			this.ResponseErrorJSON(http.StatusOK, err.Error())
		} else {
			this.Data["json"] = this.ResponseSuccessJSON(true, "删除服务器状态成功", 1)
		}
	} else {
		this.Data["json"] = this.ResponseSuccessJSON(false, "删除服务器状态失败", -1)
	}
	this.ServeJSON()
}

// @Title server state
// @Description 更新服务器状态
// @Success 200 {map} map[string]interface{}
// @Param   serverStateId     query    int64   true    "服务器状态ID"
// @Param   serverState       query    string  true    "服务器状态"
// @Param   color             query    string  false   "颜色"
// @Param   Authorization     header   string  true    "认证信息"
// @Param   timestamp         query    string  true    "时间戳"
// @Failure 400 更新服务器状态失败
// @router /server [put]
func (this *ServerStateController) PutServerState() {

	this.DbLog("ServerState", "服务器状态", "更新")

	serverStateId, _ := this.GetInt64("serverStateId", 0)
	color := this.GetString("color", "")

	serverState, err := m.GetServerStateById(serverStateId)
	if err != nil {
		this.ResponseErrorJSON(http.StatusOK, err.Error())
	}
	serverState.Color=color

	serverState.State = strings.TrimSpace(this.GetString("serverState", ""))
	beego.Info("[服务器状态Id是", serverState.Id, "服务器状态是", serverState.State, "]")

	if updateBy := this.GetString("updateBy", ""); updateBy != "" {
		serverState.UpdateBy = updateBy
	}

	if err := m.PutServerState(serverState); err == nil {
		this.Data["json"] = this.ResponseSuccessJSON(true, "更新服务器状态成功", 1)
	} else {
		this.Data["json"] = this.ResponseSuccessJSON(false, "更新服务器状态失败", -1)
	}
	this.ServeJSON()
}
