package controllers

import (
	m "oneoaas.com/cmdb/models"
	"strings"

	"github.com/astaxie/beego"
	"oneoaas.com/cmdb/util"
	"net/http"
)

// @Title cloud
// @Description 查询云帐号
// @Success 200 {map} map[string]interface{}
// @Param   enable      	  query    string   false  "数据是否有效 0/1"
// @Param   format     		  query    string   false  "json:返回带有总记录条数"
// @Param   order     		  query    string   false  "排序方式asc/desc"
// @Param   sort     		  query    string   false  "排序字段"
// @Param   limit     		  query    int      false  "每页的数据量"
// @Param   name	 		  query    string   false  "筛选名称"
// @Param   cloudName         query    string   false  "筛选云帐号名称"
// @Param   cloudPlat         query    string   false  "筛选云帐号平台类型"
// @Param   cloudState        query    string   false  "筛选云帐号状态"
// @Param   start_time   	  query    string   false  "筛选起始时间"
// @Param   end_time    	  query    string   false  "筛选结束时间"
// @Param   Authorization     header   string   true   "认证信息"
// @Param   timestamp         query    string   true   "时间戳"
// @Failure 400 查询云帐号失败
// @router / [get]
func (c *ResourcePlatformAccountController) GetCloud() {
	var sort string
	var order string
	var query = make(map[string]string, 0)    //存储条件
	var cloudList = make([]interface{}, 0) //存储返回数据
	var limit int64 = 10
	var offset int64 = 0
	var cloudName string
	var cloudPlat string
	var cloudState string
	var startTime string
	var endTime string

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

	if v := c.GetString("cloudName"); v != "" {
		cloudName = v
	}

	if v := c.GetString("cloudPlat"); v != "" {
		cloudPlat = v
	}

	if v := c.GetString("cloudState"); v != "" {
		cloudState = v
	}

	if v := c.GetString("startTime"); v != "" {
		startTime = v
	}

	if v := c.GetString("endTime"); v != "" {
		endTime = v
	}

	cloudList, total := m.GetCloud(query, sort, order, offset, limit, cloudName, cloudPlat, cloudState, startTime, endTime)

	if cloudList == nil {
		cloudList = make([]interface{}, 0)
	}
	if v := c.GetString("format"); v == "json" {
		c.TotalRowsPageJSON(total, cloudList)
	} else {
		c.DataJSON(cloudList)
	}
	c.ServeJSON()
}

// @Title cloud
// @Description 添加云帐号
// @Success 200 {map} map[string]interface{}
// @Param   cloudName       query   string true    "云帐号名称"
// @Param   cloudPlat       query   string false   "云帐号类型"
// @Param   cloudState      query   string true    "云帐号状态"
// @Param   cloudHostNum    query   int    false   "云主机数量"
// @Param   syncState       query   string false   "同步状态"
// @Param   comment  	    query   string false   "备注"
// @Param   Authorization   header  string true    "认证信息"
// @Param   timestamp       query   string true    "时间戳"
// @Failure 400 添加云帐号失败
// @router / [post]
func (this *ResourcePlatformAccountController) AddCloud() {

	this.DbLog("Cloud", "云帐号", "添加")

	cloud := new(m.ResourcePlatformAccount)
	cloud.CloudName = this.GetString("cloudName", "")
	cloud.CloudPlatform = this.GetString("cloudPlat", "")
	cloud.CloudState = this.GetString("cloudState", "")
	cloud.CloudHostNum, _ = this.GetInt64("cloudHostNum", 0)
	cloud.SyncState = this.GetString("syncState", "")
	cloud.AccountIp = this.GetString("accountIp", "")
	cloud.AccountId = this.GetString("accountId", "")
	cloud.AccountSecret = this.GetString("accountSecret", "")
	cloud.Comment = this.GetString("comment", "")
	cloud.Enable=true

	id, err := m.AddCloud(cloud)
	if err != nil {
		beego.Debug("[保存云帐号错误", err.Error(), "]")
		this.ResponseErrorJSON(http.StatusOK, err.Error())
	} else {
		beego.Debug("[保存云帐号成功,id是", id, "]")
		this.Data["json"] = this.ResponseSuccessJSON(true, "添加云帐号成功", id)
	}
	this.ServeJSON()
}

// @Title cloud
// @Description 通过id删除云帐号
// @Success 200 {map}
// @Param   id                query  string true "云帐号ID"
// @Param   Authorization     header string true "认证信息"
// @Param   timestamp         query  string true "时间戳"
// @Failure 400 删除云帐号失败
// @router / [delete]
func (this *ResourcePlatformAccountController) DelCloud() {

	this.DbLog("Cloud", "云帐号", "删除")

	var err error
	v := this.GetString("cloudId")
	hardDelete,err := this.GetBool("hardDelete")
	if len(v) > 0 {
		for _, id := range strings.Split(v, ",") {
			cloudid, _ := util.StrToInt64(id)
			if(hardDelete){
				err = m.HardDelCloud(cloudid)
			}else{
				err = m.DelCloud(cloudid)
			}
		}
		if err != nil {
			this.ResponseErrorJSON(http.StatusOK, err.Error())
		} else {
			this.Data["json"] = this.ResponseSuccessJSON(true, "操作成功", 1)
		}
	} else {
		this.Data["json"] = this.ResponseSuccessJSON(false, "操作失败", -1)
	}
	this.ServeJSON()
}

// @Title cloud
// @Description 更新云帐号
// @Success 200 {map} map[string]interface{}
// @Param   cloudid         query   int    true    "云帐号ID"
// @Param   cloudName       query   string true    "云帐号名称"
// @Param   cloudPlat       query   string false   "云帐号类型"
// @Param   cloudState      query   string true    "云帐号状态"
// @Param   cloudHostNum    query   int    false   "云主机数量"
// @Param   syncState       query   string false   "同步状态"
// @Param   comment  	    query   string false   "备注"
// @Param   Authorization   header  string true    "认证信息"
// @Param   timestamp       query   string true    "时间戳"
// @Failure 400 更新云帐号失败
// @router / [put]
func (this *ResourcePlatformAccountController) PutCloud() {

	this.DbLog("Cloud", "云帐号", "更新")

	cloudId, _ := this.GetInt64("cloudId", 0)
	cloud, err := m.CloudGetById(cloudId)
	if err != nil {
		this.ResponseErrorJSON(http.StatusOK, err.Error())
	}

	if v:=this.GetString("cloudName", "") ; v!=""{
		cloud.CloudName = v
	}

	if v:=this.GetString("cloudPlat", ""); v!=""{
		cloud.CloudPlatform = v
	}

	if v:=this.GetString("accountIp", ""); v!=""{
		cloud.AccountIp = v
	}

	if v:=this.GetString("accountId", ""); v!=""{
		cloud.AccountId = v
	}

	if v:=this.GetString("accountSecret", ""); v!=""{
		cloud.AccountSecret = v
	}

	if v:=this.GetString("cloudState", ""); v!=""{
		cloud.CloudState = v
	}

	var query map[string]string
	if cloud.CloudPlatform == util.VCenter{
		if cloudHostNum, _ := this.GetInt64("cloudHostNum", -1); cloudHostNum != -1 {
			vcenter := m.VmVmware{}
			cloud.CloudHostNum , _ = vcenter.CountVmwareVm(query)
		}
	}else if(cloud.CloudPlatform == util.Aliyun) {
		if cloudHostNum, _ := this.GetInt64("cloudHostNum", -1); cloudHostNum != -1 {
			aliyun := m.VmAliyun{}
			cloud.CloudHostNum , _ = aliyun.CountAliyunVm(query)
		}
	}else if(cloud.CloudPlatform == util.Aws) {
		if cloudHostNum, _ := this.GetInt64("cloudHostNum", -1); cloudHostNum != -1 {
			aliyun := m.VmAws{}
			cloud.CloudHostNum , _ = aliyun.CountAwsVm(query)
		}
	}

	if v:=this.GetString("syncState", ""); v!=""{
		cloud.SyncState = v
	}

	if v:=this.GetString("comment", ""); v!=""{
		cloud.Comment = v
	}

	enable, _ := this.GetBool("enable",false)
	if enable {
		cloud.Enable = enable
	}

	if err := m.PutCloud(cloud); err == nil {
		this.Data["json"] = this.ResponseSuccessJSON(true, "更新云帐号成功", 1)
	} else {
		this.Data["json"] = this.ResponseSuccessJSON(false, "更新云帐号失败", -1)
	}
	this.ServeJSON()
}

func (this *ResourcePlatformAccountController) Fnish() {

}
