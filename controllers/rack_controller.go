package controllers

import (
	"github.com/astaxie/beego"
	m "oneoaas.com/cmdb/models"
	"oneoaas.com/cmdb/util"
	"strings"
	"net/http"
)

// @Title rack
// @Description 查询机柜
// @Success 200 {map} map[string]interface{}
// @Param   enable      	  query   	string  false   "数据是否有效 0/1"
// @Param   format     		  query   	string  false   "json:返回带有总记录条数"
// @Param   order     		  query   	string  false   "排序方式asc/desc"
// @Param   sort     		  query   	string  false   "排序字段"
// @Param   limit     		  query   	int     false   "每页的数据量"
// @Param   rackname   		  query     string  false   "按名称筛选"
// @Param   state     		  query     string  false   "按状态筛选"
// @Param   room     		  query     string  false   "按所属机房筛选"
// @Param   isups     		  query     int     false   "按是否有UPS筛选"
// @Param   isab     		  query     int     false   "按是否有A/B供电筛选"
// @Param   start_time   	  query     string  false   "筛选起始时间"
// @Param   end_time    	  query     string  false   "筛选结束时间"
// @Param   Authorization     header    string  true    "认证信息"
// @Param   timestamp         query     string  true    "时间戳"
// @Failure 400 查询机柜失败
// @router / [get]
func (c *RackController) GetRack() {
	var sort string
	var order string
	var query = make(map[string]string, 0) //存储条件
	var rackList = make([]interface{}, 0)  //存储返回数据
	var limit int64 = 10
	var offset int64 = 0
	var rackname string
	var state string
	var room string
	var isups int64
	var isab int64
	var start_time string
	var end_time string

	if v, err := c.GetInt64("limit"); err == nil {
		limit = v
	}
	if v, err := c.GetInt64("offset"); err == nil {
		offset = v
	}
	if v := c.GetString("sort"); v != "" {
		sort = v
	}
	if v := c.GetString("order"); v != "" {
		order = v
	}

	if v := c.GetString("search"); v != "" {
		query["search"] = v
	}

	if v := c.GetString("enable"); v != "" {
		query["enable"] = v
	}

	if v := c.GetString("rackname"); v!= "" {
		rackname = v
	}

	if v := c.GetString("state"); v!= "" {
		state = v
	}

	if v := c.GetString("room"); v!= "" {
		room = v
	}

	if v, err := c.GetInt64("isups"); err == nil {
		isab = v
	}

	if v, err := c.GetInt64("isab"); err == nil {
		isab = v
	}

	if v := c.GetString("start_time"); v != "" {
		start_time = v
	}

	if v := c.GetString("end_time"); v != "" {
		end_time = v
	}

	rackList, total := m.GetRack(query, sort, order, offset, limit, rackname, state, room, isups, isab, start_time, end_time)
	if rackList == nil {
		rackList = make([]interface{}, 0)
		total = 0
	}

	if v := c.GetString("format"); v == "json" {
		c.TotalRowsPageJSON(total, rackList)
	} else {
		c.DataJSON(rackList)
	}
	c.ServeJSON()
}

// @Title rack
// @Description 添加机柜
// @Success 200 {map} map[string]interface{}
// @Param   rackName      		   query   string true   "机柜名字"
// @Param   status      		   query   int64  true   "机柜状态"
// @Param   room      			   query   int64  true   "所属机房"
// @Param   standardNum  		   query   int64  false  "机柜标准U数"
// @Param   topNotAvailableNum     query   int64  false  "顶部不可用U数"
// @Param   bottomNotAvailableNum  query   int64  false  "底部不可用U数"
// @Param   avaliableNum  		   query   int64  false  "机柜可用U数"
// @Param   taryNum    			   query   int64  false  "托盘数"
// @Param   rackNetflow  		   query   int64  false  "带宽流量(兆)"
// @Param   isUps   			   query   int64  false  "是否有UPS"
// @Param   isAb  				   query   int64  false  "是否A/B路供电"
// @Param   power  				   query   int64  false  "机柜功率(千瓦)"
// @Param   comment     		   query   string false  "备注"
// @Param   Authorization          header  string true   "认证信息"
// @Param   timestamp              query   string true   "时间戳"
// @Failure 400 添加机柜失败
// @router / [post]
func (this *RackController) AddRack() {

	this.DbLog("Rack", "机柜", "添加")

	rack := new(m.Rack)

	rack.RackName = this.GetString("rackName", "")
	rack.StandardNum, _ = this.GetInt64("standardNum", 0)
	rack.TopNotAvailableNum, _ = this.GetInt64("topNotAvailableNum", 0)
	rack.BottomNotAvailableNum, _ = this.GetInt64("bottomNotAvailableNum", 0)
	rack.AvaliableNum, _ = this.GetInt64("avaliableNum", 0)
	rack.TaryNum, _ = this.GetInt64("taryNum", 0)
	rackNetflow, _ := this.GetFloat("rackNetflow", 0)
	beego.Debug("[带宽流量大小是", rackNetflow, "]")
	rack.RackNetflow = rackNetflow
	rack.IsUps, _ = this.GetInt64("isUps", 0)
	rack.IsAb, _ = this.GetInt64("isAb", 0)
	rack.Power, _ = this.GetInt64("power", 0)
	rack.Comment = this.GetString("comment", "")

	enable, _ := this.GetBool("enable",false)
	if enable {
		rack.Enable = enable
	}

	state, _ := this.GetInt64("status", 0)
	if state != 0 {
		rackStateObj, err := m.GetRackStateById(state)
		if err != nil {
			beego.Debug("[获取机柜状态错误", err.Error(), "]")
			this.ResponseErrorJSON(http.StatusOK, err.Error())
		}
		rack.State = rackStateObj
	}

	roomId, _ := this.GetInt64("room", 0)
	if roomId != 0 {
		roomObj, err := m.GetRoomById(roomId)
		if err != nil {
			beego.Debug("[添加机柜,获取机房对象错误", err.Error(), "]")
			this.ResponseErrorJSON(http.StatusOK, err.Error())
		}
		rack.Room = roomObj
	}

	id, err := m.AddRack(rack)
	if err != nil {
		this.ResponseErrorJSON(http.StatusOK, err.Error())
	} else {
		this.Data["json"] = this.ResponseSuccessJSON(true, "添加机柜成功", id)
	}
	this.ServeJSON()
}

// @Title rack
// @Description 通过id删除机柜
// @Success 200 {map}
// @Param   rackid        	  query    string true      "机柜ID"
// @Param   Authorization     header   string true      "认证信息"
// @Param   timestamp         query    string true      "时间戳"
// @Failure 400 删除机柜失败
// @router / [delete]
func (this *RackController) DelRack() {

	this.DbLog("Rack", "机柜", "删除")

	var err error
	v := this.GetString("rackid")
	hardDelete,err := this.GetBool("hardDelete",false)
	if len(v) > 0 {
		for _, id := range strings.Split(v, ",") {
			rackid, _ := util.StrToInt64(id)
			if(hardDelete){
				err = m.HardDelRack(rackid);
			}else{
				err = m.DelRack(rackid)
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

// @Title rack
// @Description 更新机柜
// @Success 200 {map} map[string]interface{}
// @Param   rackid        		   query   int64  true   "机柜ID"
// @Param   rackName      		   query   string true   "机柜名字"
// @Param   status      		   query   int64  true   "机柜状态"
// @Param   room      			   query   int64  true   "所属机房"
// @Param   standardNum  		   query   int64  false  "机柜标准U数"
// @Param   topNotAvailableNum     query   int64  false  "顶部不可用U数"
// @Param   bottomNotAvailableNum  query   int64  false  "底部不可用U数"
// @Param   avaliableNum  		   query   int64  false  "机柜可用U数"
// @Param   taryNum    			   query   int64  false  "托盘数"
// @Param   rackNetflow  		   query   int64  false  "带宽流量(兆)"
// @Param   isUps   			   query   int64  false  "是否有UPS"
// @Param   isAb  				   query   int64  false  "是否A/B路供电"
// @Param   power  				   query   int64  false  "机柜功率(千瓦)"
// @Param   comment     		   query   string false  "备注"
// @Param   Authorization          header  string true   "认证信息"
// @Param   timestamp              query   string true   "时间戳"
// @Failure 400 更新机柜失败
// @router / [put]
func (this *RackController) PutRack() {

	this.DbLog("Rack", "机柜", "更新")

	rackId, _ := this.GetInt64("rackid", 0)
	rack, err := m.RackGetById(rackId)
	if err != nil || rack == nil {
		beego.Debug("[更新机柜错误", err.Error(), "]")
		this.ResponseErrorJSON(http.StatusOK, "更新失败")
	}

	if rackName := this.GetString("rackName", ""); rackName != "" {
		rack.RackName = rackName
	}
	if standardNum, _ := this.GetInt64("standardNum", 0); standardNum != 0 {
		rack.StandardNum = standardNum
	}

	if topNotAvailableNum, _ := this.GetInt64("topNotAvailableNum", 0); topNotAvailableNum != 0 {
		rack.TopNotAvailableNum = topNotAvailableNum
	}

	if bottomNotAvailableNum, _ := this.GetInt64("bottomNotAvailableNum", 0); bottomNotAvailableNum != 0 {
		rack.BottomNotAvailableNum = bottomNotAvailableNum
	}

	if avaliableNum, _ := this.GetInt64("avaliableNum", 0); avaliableNum != 0 {
		rack.AvaliableNum = avaliableNum
	}

	if taryNum, _ := this.GetInt64("taryNum", 0); taryNum != 0 {
		rack.TaryNum = taryNum
	}

	if rackNetflow, _ := this.GetFloat("rackNetflow", 0); rackNetflow != 0 {
		rack.RackNetflow = rackNetflow
	}

	if isups, _ := this.GetInt64("isUps", 0); isups != -1 {
		rack.IsUps = isups
	}

	if isab, _ := this.GetInt64("isAb", 0); isab != -1 {
		rack.IsAb = isab
	}

	if power, _ := this.GetInt64("power", 0); power != 0 {
		rack.Power = power
	}

	if comment := this.GetString("comment", ""); comment != "" {
		rack.Comment = comment
	}

	if state, _ := this.GetInt64("status", 0); state != 0 {
		rack.State , _ = m.GetRackStateById(state)
	}

	if room, _ := this.GetInt64("room", 0); room != 0 {
		rack.Room , _ = m.GetRoomById(room)
	}

	enable, _ := this.GetBool("enable",false)
	if enable {
		rack.Enable = enable
	}

	beego.Info("[更新机柜,机柜Id是", rack.RackId, "机柜名称是", rack.RackName, "]")
	if err := m.PutRack(rack); err == nil {
		this.Data["json"] = this.ResponseSuccessJSON(true, "操作成功", 1)
	} else {
		this.Data["json"] = this.ResponseSuccessJSON(false, "操作失败", -1)
	}
	this.ServeJSON()
}

func (this *RackController) Fnish() {

}
