package controllers

import (
	//"encoding/json"
	"github.com/astaxie/beego"
	m "oneoaas.com/cmdb/models"
	"oneoaas.com/cmdb/util"
	"strings"
	"net/http"
)

// @Title app
// @Description 查询业务
// @Success 200 {map} map[string]interface{}
// @Param   enable            query   string   false  "数据是否有效 0/1"
// @Param   format     	      query   string   false  "json:返回带有总记录条数"
// @Param   order     	      query   string   false  "排序方式asc/desc"
// @Param   sort     	      query   string   false  "排序字段"
// @Param   limit     	      query   int      false  "每页的数据量"
// @Param   name        	  query   string   false  "筛选业务名称"
// @Param   level        	  query   string   false  "筛选业务等级"
// @Param   start_time   	  query   string   false  "筛选起始时间"
// @Param   end_time    	  query   string   false  "筛选结束时间"
// @Param   Authorization     header  string   true   "认证信息"
// @Param   timestamp         query   string   true   "时间戳"
// @Failure 400 查询业务失败
// @router / [get]
func (c *AppController) GetApp() {
	var sort string
	var order string
	var query = make(map[string]string, 0) //存储条件
	var appList = make([]interface{}, 0)   //存储返回数据
	var limit int64 = 10
	var offset int64 = 0
	var name string
	var level string
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

	if v := c.GetString("name"); v != "" {
		name = v
	}

	if v := c.GetString("level"); v != "" {
		level = v
	}

	if v := c.GetString("start_time"); v != "" {
		start_time = v
	}

	if v := c.GetString("end_time"); v != "" {
		end_time = v
	}

	appList, total := m.GetApp(query, sort, order, offset, limit, name, level, start_time, end_time)
	if appList == nil {
		appList = make([]interface{}, 0)
	}
	if v := c.GetString("format"); v=="json" {
		c.TotalRowsPageJSON(total, appList)
	} else {
		c.DataJSON(appList)
	}
	c.ServeJSON()
}

// @Title app
// @Description 添加业务
// @Success 200 {map} map[string]interface{}
// @Param   appName             query   string true    "业务名称"
// @Param   appLevel            query   int    true    "业务等级"
// @Param   teamOwn             query   string false   "团队负责人"
// @Param   appCode             query   string false   "业务代号"
// @Param   appOwn              query   string false   "业务负责人"
// @Param   devOwn              query   string false   "开发负责人"
// @Param   opsOwn              query   string false   "运维负责人"
// @Param   comment  		    query   string false   "备注"
// @Param   Authorization       header  string true    "认证信息"
// @Param   timestamp           query   string true    "时间戳"
// @Failure 400 添加业务失败
// @router / [post]
func (this *AppController) AddApp() {

	this.DbLog("App", "业务模块", "添加")

	var app m.App
	app.AppName = this.GetString("appName", "")
	app.TeamOwn = this.GetString("teamOwn", "")
	app.AppCode = this.GetString("appCode", "")
	app.AppOwn = this.GetString("appOwn", "")
	app.DevOwn = this.GetString("devOwn", "")
	app.OpsOwn = this.GetString("opsOwn", "")
	app.Comment = this.GetString("comment", "")
	app.Enable=true
	levelId, _ := this.GetInt64("appLevel")
	beego.Debug("[添加业务等级ID是", levelId, "]")
	levelObj, err := m.GetAppLevelById(levelId)
	if err != nil {
		beego.Debug("[添加业务获取业务等级出错", err.Error(), "]")
		this.ResponseErrorJSON(http.StatusOK, err.Error())
	}
	app.Level = levelObj

	id, err := m.AddApp(app)
	if err != nil {
		beego.Debug("[保存业务错误", err.Error(), "]")
		this.ResponseErrorJSON(http.StatusOK, err.Error())
	} else {
		beego.Debug("[保存业务成功,id是", id, "]")
		this.Data["json"] = this.ResponseSuccessJSON(true, "添加业务成功", id)
	}
	this.ServeJSON()
}

// @Title app
// @Description 通过id删除业务
// @Success 200 {map}
// @Param   appid             query    string true      "业务ID"
// @Param   Authorization     header   string true      "认证信息"
// @Param   timestamp         query    string true      "时间戳"
// @Failure 400 删除业务失败
// @router / [delete]
func (this *AppController) DelApp() {

	this.DbLog("App", "业务模块", "删除")

	var err error
	v := this.GetString("appid")
	hardDelete,err := this.GetBool("hardDelete",false)
	if len(v) > 0 {
		for _, id := range strings.Split(v, ",") {
			appid, _ := util.StrToInt64(id)
			if(hardDelete){
				err = m.HardDelApp(appid);
			}else{
				err = m.DelApp(appid)
			}
		}
		if err != nil {
			this.ResponseErrorJSON(http.StatusOK, err.Error())
		} else {
			this.Data["json"] = this.ResponseSuccessJSON(true, "删除业务成功", 1)
		}
	} else {
		this.Data["json"] = this.ResponseSuccessJSON(false, "删除业务失败", -1)
	}

	this.ServeJSON()
}

// @Title app
// @Description 更新业务
// @Success 200 {map} map[string]interface{}
// @Param   Id                  query   int    true    "业务ID"
// @Param   appName             query   string true    "业务名称"
// @Param   appLevel            query   int    true    "业务等级"
// @Param   teamOwn             query   string false   "团队负责人"
// @Param   appCode             query   string false   "业务代号"
// @Param   appOwn              query   string false   "业务负责人"
// @Param   devOwn              query   string false   "开发负责人"
// @Param   opsOwn              query   string false   "运维负责人"
// @Param   comment  		    query   string false   "备注"
// @Param   Authorization       header  string true    "认证信息"
// @Param   timestamp           query   string true    "时间戳"
// @Failure 400 更新业务失败
// @router / [put]
func (this *AppController) PutApp() {

	this.DbLog("App", "业务模块", "更新")

	appId, _ := this.GetInt64("Id", 0)
	app, err := m.AppGetById(appId)
	if err != nil || app == nil {
		beego.Debug("[业务更新失败", err.Error(), "]")
		this.ResponseErrorJSON(http.StatusOK, "更新失败")
	}

	if appName := strings.TrimSpace(this.GetString("appName", "")); appName != "" {
		app.AppName = appName
	}
	if teamOwn := strings.TrimSpace(this.GetString("teamOwn", "")); teamOwn != "" {
		app.TeamOwn = teamOwn
	}
	if appCode := strings.TrimSpace(this.GetString("appCode", "")); appCode != "" {
		app.AppCode = appCode
	}
	if appOwn := strings.TrimSpace(this.GetString("appOwn", "")); appOwn != "" {
		app.AppOwn = appOwn
	}
	if devOwn := strings.TrimSpace(this.GetString("devOwn", "")); devOwn != "" {
		app.DevOwn = devOwn
	}
	if opsOwn := strings.TrimSpace(this.GetString("opsOwn", "")); opsOwn != "" {
		app.OpsOwn = opsOwn
	}
	if comment := strings.TrimSpace(this.GetString("comment", "")); comment != "" {
		app.Comment = comment
	}

	if levelId, _ := this.GetInt64("appLevel", 0); levelId != 0 {
		app.Level , _ = m.GetAppLevelById(levelId)
	}

	enable, _ := this.GetBool("enable",false)
	if enable {
		app.Enable = enable
	}

	if err := m.PutApp(app); err == nil {
		this.Data["json"] = this.ResponseSuccessJSON(true, "操作成功", 1)
	} else {
		this.Data["json"] = this.ResponseSuccessJSON(false, "操作失败", -1)
	}
	this.ServeJSON()
}

func (this *AppController) Fnish() {

}
