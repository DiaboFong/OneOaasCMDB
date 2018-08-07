package controllers

import (
	"github.com/astaxie/beego"
	//"oneoaas.com/cmdb/models"
	m "oneoaas.com/cmdb/models"
	"oneoaas.com/cmdb/util"
	"strings"
	"net/http"
)

/*func (this *RoomStateController) GetAll() {
	var modelList []interface{}
	stateArray := models.GetAllRoomState()
	for _, v := range stateArray {
		//类型向上转
		modelList = append(modelList, v)
	}
	this.DataJSON(modelList)
}*/

// @Title room state
// @Description 查询机房状态
// @Success 200 {map} map[string]interface{}
// @Param   enable      	  query     string    false    "数据是否有效 0/1"
// @Param   format     		  query   	string 	  false    "json:返回带有总记录条数"
// @Param   order     		  query   	string 	  false    "排序方式asc/desc"
// @Param   sort     		  query   	string 	  false    "排序字段"
// @Param   limit     		  query   	int    	  false    "每页的数据量"
// @Param   Authorization     header    string 	  true     "认证信息"
// @Param   timestamp         query     string 	  true     "时间戳"
// @Failure 400 查询机房状态失败
// @router /room [get]
func (this *RoomStateController) GetRoomState() {
	var sort []string
	var order []string
	var query = make(map[string]string, 0)     //存储条件
	var roomStateList = make([]interface{}, 0) //存储返回数据
	var limit int64 = 10
	var offset int64 = 0

	/*var modelList []interface{}
	stateArray := models.GetAllRoomState()
	for _, v := range stateArray {
		//类型向上转
		modelList = append(modelList, v)
	}
	this.DataJSON(modelList)*/

	if v, err := this.GetInt64("limit"); err == nil {
		limit = v
	}

	if v, err := this.GetInt64("offset"); err == nil {
		offset = v
	}

	if v := this.GetString("sort"); v != "" {
		sort = strings.Split(v,",")
	}

	if v := this.GetString("order"); v != "" {
		order = strings.Split(v,",")
	}

	if v := this.GetString("search"); v != "" {
		query["state__icontains"] = v
		//WHERE state LIKE '% %'
	}

	beego.Info("查询机房状态条件",
		"offset=", offset,
		"limit=", limit,
		"sort=", sort,
		"order=", order,
		"query=", query,
	)

	/*roomStateList, total := m.GetRoomState(query, sort, order, offset, limit)
	if roomStateList == nil {
		roomStateList = make([]interface{}, 0)
	}
	if v := this.GetString("format"); v == "json" {
		this.TotalRowsPageJSON(total, roomStateList)
	} else {
		this.DataJSON(roomStateList)
	}
	this.ServeJSON()*/

	roomStateList, err := m.GetRoomState(query, sort, order, offset, limit)
	if err != nil {
		beego.Debug("[查询机房状态发生错误", err.Error(), "]")
	}
	if roomStateList == nil {
		roomStateList = make([]interface{}, 0)
	}
	if v := this.GetString("format"); v != "" {
		if v == "total" {
			countNum, _ := m.CountRackState(query)
			this.TotalRowsPageJSON(countNum, roomStateList)
		}
	} else {
		this.DataJSON(roomStateList)
	}
	this.ServeJSON()
}

// @Title room state
// @Description 添加机房状态
// @Success 200 {map} map[string]interface{}
// @Param   roomState          query   string  true  "机房状态"
// @Param   color     		   query   string  false "颜色"
// @Param   Authorization      header  string  true  "认证信息"
// @Param   timestamp          query   string  true  "时间戳"
// @Failure 400 添加机房状态失败
// @router /room [post]
func (this *RoomStateController) AddRoomState() {

	this.DbLog("RoomState", "机房状态", "添加")

	var roomState m.RoomState
	if State := this.GetString("roomState", ""); State != "" {
		roomState.State = State
	}
	color := this.GetString("color", "")
	roomState.Color=color
	roomState.CreateBy = this.GetString("createBy", "")
	roomState.Enable=true

	if roomState.State != "" {
		id, err := m.AddRoomState(roomState)
		if err != nil {
			beego.Debug("[保存机房状态错误", err.Error(), "]")
			this.ResponseErrorJSON(http.StatusOK, err.Error())
		} else {
			beego.Debug("[保存机房状态成功,id是", id, "]")
			this.Data["json"] = this.ResponseSuccessJSON(true, "添加机房状态成功", id)
		}
	}else{
		this.Data["json"] = this.ResponseSuccessJSON(false, "机房状态不能为空", -1)
	}

	this.ServeJSON()
}

// @Title room state
// @Description 通过id删除机房状态
// @Success 200 {map}
// @Param   roomStateId          query    string  true  "机房状态ID"
// @Param   Authorization        header   string  true  "认证信息"
// @Param   timestamp            query    string  true  "时间戳"
// @Failure 400 删除机房状态失败
// @router /room [delete]
func (this *RoomStateController) DelRoomState() {

	this.DbLog("RoomState", "机房状态", "删除")

	var err error
	v := this.GetStrings("roomStateId")
	if len(v) > 0 {
		for index, value := range v {
			for _, id := range strings.Split(value, ",") {
				beego.Info("索引ID是:", index)
				beego.Info("值是:", id)
				roomStateId, _ := util.StrToInt64(id)
				beego.Debug("[删除的机房状态,ID是", roomStateId, "]")
				err = m.DelRoomState(roomStateId)
			}
		}
		if err != nil {
			this.ResponseErrorJSON(http.StatusOK, err.Error())
		} else {
			this.Data["json"] = this.ResponseSuccessJSON(true, "删除机房状态成功", 1)
		}
	} else {
		this.Data["json"] = this.ResponseSuccessJSON(false, "删除机房状态失败", -1)
	}
	this.ServeJSON()
}

// @Title room state
// @Description 更新机房状态
// @Success 200 {map} map[string]interface{}
// @Param   roomStateId       query    int64   true    "机房状态ID"
// @Param   roomState         query    string  true    "机房状态"
// @Param   color             query    string  false   "颜色"
// @Param   Authorization     header   string  true    "认证信息"
// @Param   timestamp         query    string  true    "时间戳"
// @Failure 400 更新机房状态失败
// @router /room [put]
func (this *RoomStateController) PutRoomState() {

	this.DbLog("RoomState", "机房状态", "更新")

	roomStateId, _ := this.GetInt64("roomStateId", 0)
	color := this.GetString("color", "")

	roomState, err := m.GetRoomStateById(roomStateId)
	if err != nil {
		this.ResponseErrorJSON(http.StatusOK, err.Error())
	}
	roomState.Color=color

	roomState.State = strings.TrimSpace(this.GetString("roomState", ""))
	beego.Info("[机房状态Id是", roomState.Id, "机房状态是", roomState.State, "]")

	if updateBy := this.GetString("updateBy", ""); updateBy != "" {
		roomState.UpdateBy = updateBy
	}

	if err := m.PutRoomState(roomState); err == nil {
		this.Data["json"] = this.ResponseSuccessJSON(true, "更新机房状态成功", 1)
	} else {
		this.Data["json"] = this.ResponseSuccessJSON(false, "更新机房状态失败", -1)
	}
	this.ServeJSON()
}
