package controllers

import (
	"github.com/astaxie/beego"
	m "oneoaas.com/cmdb/models"
	"oneoaas.com/cmdb/util"
	"strings"
	"net/http"
)

// @Title 根据id查询机房
// @Description 根据id查询机房
// @Success 200 {map} map[string]interface{}
// @Param   id    	      query    string   false  "机房id"
// @Param   Authorization     header   string   true   "认证信息"
// @Param   timestamp         query    string   true   "时间戳"
// @Failure 400 根据id查询机房
// @router /:id [get]
func (this *RoomController) Room() {
	roomId, _ := this.GetInt64(":id", 0)
	roomObj, err := m.GetRoomById(roomId)
	if err != nil {
		beego.Debug("[根据ID获取机房错误", err.Error(), "]")
	}
	this.Data["json"] = roomObj
	this.ServeJSON()
}

// @Title room
// @Description 查询机房
// @Success 200 {map} map[string]interface{}
// @Param   enable      	  query    string   false  "数据是否有效 0/1"
// @Param   format     		  query    string   false  "json:返回带有总记录条数"
// @Param   order     		  query    string   false  "排序方式asc/desc"
// @Param   sort     		  query    string   false  "排序字段"
// @Param   limit     		  query    int      false  "每页的数据量"
// @Param   roomname   		  query    string   false  "按名称筛选"
// @Param   state     		  query    string   false  "按状态筛选"
// @Param   datacenter 		  query    string   false  "按所属数据中心筛选"
// @Param   start_time   	  query    string   false  "筛选起始时间"
// @Param   end_time    	  query    string   false  "筛选结束时间"
// @Param   Authorization     header   string   true   "认证信息"
// @Param   timestamp         query    string   true   "时间戳"
// @Failure 400 查询机房失败
// @router / [get]
func (this *RoomController) GetRoom() {
	var sort string
	var order string
	var query = make(map[string]string, 0) //存储条件
	var roomList = make([]interface{}, 0)  //存储返回数据
	var limit int64 = 10
	var offset int64 = 0
	var roomname string
	var state string
	var datacenter string
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

	if v:= this.GetString("roomname"); v != "" {
		roomname = v
	}

	if v:= this.GetString("state"); v != "" {
		state = v
	}

	if v:= this.GetString("datacenter"); v != "" {
		datacenter = v
	}

	if v := this.GetString("start_time"); v != "" {
		start_time = v
	}

	if v := this.GetString("end_time"); v != "" {
		end_time = v
	}

	roomList, total := m.GetRoom(query, sort, order, offset, limit, roomname, state, datacenter, start_time, end_time)
	if roomList == nil {
		roomList = make([]interface{}, 0)
		total = 0
	}

	if v := this.GetString("format"); v == "json" {
		this.TotalRowsPageJSON(total, roomList)
	} else {
		this.DataJSON(roomList)
	}
	this.ServeJSON()
}

// @Title room
// @Description 添加机房
// @Success 200 {map} map[string]interface{}
// @Param   roomname      query   string true    "机房名字"
// @Param   floor  		  query   string true    "楼层"
// @Param   roomno    	  query   string false   "房间号"
// @Param   stateId       query   string true    "机房状态"
// @Param   dcId  		  query   string true    "所属数据中心"
// @Param   businessContact     query   string false   "机房商务联系人"
// @Param   technicalContact  	query   string false   "机房技术联系人"
// @Param   receivingContact    query   string false   "机房收获联系人"
// @Param   maintenanceContact  query   string false   "我司运维负责人"
// @Param   comment     		query   string false   "备注"
// @Param   Authorization       header  string true    "认证信息"
// @Param   timestamp           query   string true    "时间戳"
// @Failure 400 添加机房失败
// @router / [post]
func (this *RoomController) AddRoom() {

	this.DbLog("Room", "机房", "添加")

	room := new(m.Room)

	stateId, _ := this.GetInt64("stateId",0)
	if stateId != 0 {
		stateObj, err := m.GetRoomStateById(stateId)
		if err != nil {
			panic(err)
			this.ResponseErrorJSON(http.StatusOK, err.Error())
		}
		room.State = stateObj
	}

	dcid, _ := this.GetInt64("dcId",0)
	if dcid != 0 {
		dcObj, err := m.GetDatacenterById(dcid)
		if err != nil {
			panic(err)
			this.ResponseErrorJSON(http.StatusOK, err.Error())
		}
		room.Datacenter = dcObj
	}

	room.RoomName = this.GetString("roomname", "")
	room.Floor = this.GetString("floor", "")
	room.RoomNo = this.GetString("roomno", "")
	room.Comment = this.GetString("comment", "")
	room.BusinessContact = this.GetString("businessContact", "")
	room.TechnicalContact = this.GetString("technicalContact", "")
	room.ReceivingContact = this.GetString("receivingContact", "")
	room.MaintenanceContact = this.GetString("maintenanceContact", "")
	room.Enable = true

	id, err := m.AddRoom(room)
	if err != nil {
		panic(err)
		this.ResponseErrorJSON(http.StatusOK, err.Error())
	} else {
		this.Data["json"] = this.ResponseSuccessJSON(true, "添加机房成功", id)
	}
	this.ServeJSON()
}

// @Title room
// @Description 通过id删除机房
// @Success 200 {map}
// @Param   roomid        	  query   string true       "机房ID"
// @Param   Authorization     header   string true      "认证信息"
// @Param   timestamp         query    string true      "时间戳"
// @Failure 400 删除机房失败
// @router / [delete]
func (this *RoomController) DelRoom() {

	this.DbLog("Room", "机房", "删除")

	var err error
	v := this.GetString("roomid")
	hardDelete,err := this.GetBool("hardDelete",false)
	if len(v) > 0 {
		for _, id := range strings.Split(v, ",") {
			roomid, _ := util.StrToInt64(id)
			if(hardDelete){
				err = m.HardDelRoom(roomid);
			}else{
				err = m.DelRoom(roomid)
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

// @Title room
// @Description 更新机房
// @Success 200 {map} map[string]interface{}
// @Param   roomid        query   int64  true    "机房ID"
// @Param   roomname      query   string true    "机房名字"
// @Param   floor  		  query   string true    "楼层"
// @Param   roomno    	  query   string false   "房间号"
// @Param   stateId       query   string true    "机房状态"
// @Param   dcId  		  query   string true    "所属数据中心"
// @Param   businessContact     query   string false   "机房商务联系人"
// @Param   technicalContact  	query   string false   "机房技术联系人"
// @Param   receivingContact    query   string false   "机房收获联系人"
// @Param   maintenanceContact  query   string false   "我司运维负责人"
// @Param   comment     		query   string false   "备注"
// @Param   Authorization       header  string true    "认证信息"
// @Param   timestamp         	query   string true    "时间戳"
// @Failure 400 更新机房失败
// @router / [put]
func (this *RoomController) PutRoom() {

	this.DbLog("Room", "机房", "更新")

	roomId, _ := this.GetInt64("roomId", 0)
	room, err := m.GetRoomById(roomId)
	if err != nil || room == nil {
		beego.Debug("[更新机房错误", err.Error(), "]")
		this.ResponseErrorJSON(400, "更新失败")
	}

	if roomName := strings.TrimSpace(this.GetString("roomName", "")); roomName != "" {
		room.RoomName = roomName
	}

	if floor := strings.TrimSpace(this.GetString("floor", "")); floor != "" {
		room.Floor = floor
	}

	if roomNo := strings.TrimSpace(this.GetString("roomNo", "")); roomNo != "" {
		room.RoomNo = roomNo
	}

	if comment := strings.TrimSpace(this.GetString("comment", "")); comment != "" {
		room.Comment = comment
	}

	if businessContact := strings.TrimSpace(this.GetString("businessContact", "")); businessContact != "" {
		room.BusinessContact = businessContact
	}

	if technicalContact := strings.TrimSpace(this.GetString("technicalContact", "")); technicalContact != "" {
		room.TechnicalContact = technicalContact
	}

	if receivingContact := strings.TrimSpace(this.GetString("receivingContact", "")); receivingContact != "" {
		room.ReceivingContact = receivingContact
	}

	if maintenanceContact := strings.TrimSpace(this.GetString("maintenanceContact", "")); maintenanceContact != "" {
		room.MaintenanceContact = maintenanceContact
	}

	enable, _ := this.GetBool("enable",false)
	if enable {
		room.Enable = enable
	}

	if stateId, _ := this.GetInt64("stateId", 0); stateId != 0 {
		stateObj, err := m.GetRoomStateById(stateId)
		if err != nil {
			beego.Debug("[更新机房获取机房状态出错", err.Error(), "]")
		} else {
			room.State = stateObj
		}
	}

	if dcid, _ := this.GetInt64("dcId", 0); dcid != 0 {
		dcObj, err := m.GetDatacenterById(dcid)
		if err != nil {
			beego.Debug("[更新机房获取数据中心出错", err.Error(), "]")
		} else {
			room.Datacenter = dcObj
		}
	}

	if err := m.PutRoom(room); err == nil {
		this.Data["json"] = this.ResponseSuccessJSON(true, "操作成功", 1)
	} else {
		this.Data["json"] = this.ResponseSuccessJSON(false, "操作失败", -1)
	}
	this.ServeJSON()
}

func (this *RoomController) Fnish() {

}
