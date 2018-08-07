package controllers

import (
	"oneoaas.com/cmdb/models"
	m "oneoaas.com/cmdb/models"
	"oneoaas.com/cmdb/util"
	"strings"
	"net/http"
)

// @Title aliyun
// @Description 查询Aliyun
// @Success 200 {map} map[string]interface{}
// @Param   enable            query   	string   false   "数据是否有效 0/1"
// @Param   format     	      query   	string   false   "json:返回带有总记录条数"
// @Param   order     	      query   	string   false   "排序方式asc/desc"
// @Param   sort     	      query   	string   false   "排序字段"
// @Param   limit     	      query   	int      false   "每页的数据量"
// @Param   name     		  query     string   false   "按名称筛选"
// @Param   start_time   	  query     string   false   "筛选起始时间"
// @Param   end_time    	  query     string   false   "筛选结束时间"
// @Param   Authorization     header    string   true    "认证信息"
// @Param   timestamp         query     string   true    "时间戳"
// @Failure 400 查询Aliyun失败
// @router / [get]
func (this *AliyunController) GetVM() {
	vm := new(models.VmAliyun)
	var sort string
	var order string
	var query = make(map[string]string, 0)
	var limit int64 = 10
	var offset int64 = 0
	var name string
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

	if v := this.GetString("name"); v != "" {
		name = v
	}

	if v := this.GetString("start_time"); v != "" {
		start_time = v
	}

	if v := this.GetString("end_time"); v != "" {
		end_time = v
	}

	vms,total := vm.GetAliyunVm(query, sort, order, offset, limit, name, start_time, end_time)
	if vms == nil{
		vms = make([]interface{}, 0)
	}
	if v := this.GetString("format","") ; v == "json" {
		this.TotalRowsPageJSON(total,vms)
	} else {
		this.DataJSON(vms)
	}
}

// @Title aliyun
// @Description 添加Aliyun
// @Success 200 {map} map[string]interface{}
// @Param   instancename      query   string true    "实例名称"
// @Param   instanceid        query   string false   "实例ID"
// @Param   cpu               query   int    false   "CPU"
// @Param   memory            query   int    false   "内存"
// @Param   ip                query   string false   "IP"
// @Param   hostname          query   string false   "主机名"
// @Param   image  		      query   string false   "镜像"
// @Param   description       query   string false   "描述"
// @Param   zoneid            query   string false   "ZoneId"
// @Param   creationtime      query   string false   "创建时间"
// @Param   expiredtime       query   string false   "过期时间"
// @Param   Authorization     header  string false   "认证信息"
// @Param   timestamp         query   string true    "时间戳"
// @Failure 400 添加Aliyun失败
// @router / [post]
func (this *AliyunController) AddAliyun() {

	this.DbLog("Aliyun", "Aliyun", "添加")

	aliyun := new(m.VmAliyun)

	aliyun.InstanceName = this.GetString("instancename", "")
	aliyun.InstanceId = this.GetString("instanceid", "")
	aliyun.CPU, _ = this.GetInt("cpu", 0)
	aliyun.Memory, _ = this.GetInt("memory", 0)
	aliyun.IpAddress = this.GetString("ip", "")
	aliyun.HostName = this.GetString("hostname", "")
	aliyun.ImageId = this.GetString("image", "")
	aliyun.Description = this.GetString("description", "")
	aliyun.ZoneId = this.GetString("zoneid", "")
	aliyun.Enable = true;
	creationtime := this.GetString("creationtime", "")
	CreationTime := util.TimeBuild(creationtime)
	aliyun.CreationTime = CreationTime

	expiredtime := this.GetString("expiredtime", "")
	ExpiredTime := util.TimeBuild(expiredtime)
	aliyun.ExpiredTime = ExpiredTime

	id, err := m.AddAliyun(aliyun)
	if err != nil {
		this.ResponseErrorJSON(http.StatusOK, err.Error())
	} else {
		this.Data["json"] = this.ResponseSuccessJSON(true, "添加Aliyun成功", id)
	}
	this.ServeJSON()
}

// @Title aliyun
// @Description 通过id删除Aliyun
// @Success 200 {map}
// @Param   aliyunid          query    string true      "AliyunID"
// @Param   Authorization     header   string true      "认证信息"
// @Param   timestamp         query    string true      "时间戳"
// @Failure 400 删除Aliyun失败
// @router / [delete]
func (this *AliyunController) DelAliyun() {

	this.DbLog("Aliyun", "Aliyun", "删除")

	var err error
	v := this.GetString("aliyunid")
	hardDelete,err := this.GetBool("hardDelete")
	if len(v) > 0 {
		for _, id := range strings.Split(v, ",") {
			aliyunid, _ := util.StrToInt64(id)
			if(hardDelete){
				err = m.HardDelAliyun(aliyunid)
			}else{
				err = m.DelAliyun(aliyunid)
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

// @Title aliyun
// @Description 更新Aliyun
// @Success 200 {map} map[string]interface{}
// @Param   editAliyunId          query   int    true    "AliyunID"
// @Param   editinstancename      query   string false   "实例名称"
// @Param   editinstanceid        query   string false   "实例ID"
// @Param   editcpu               query   int    false   "CPU"
// @Param   editmemory            query   int    false   "内存"
// @Param   editip                query   string false   "IP"
// @Param   edithostname          query   string false   "主机名"
// @Param   editimage  		      query   string false   "镜像"
// @Param   editdescription       query   string false   "描述"
// @Param   editzoneid            query   string false   "ZoneId"
// @Param   editcreationtime      query   string false   "创建时间"
// @Param   editexpiredtime       query   string false   "过期时间"
// @Param   Authorization         header  string true    "认证信息"
// @Param   timestamp             query   string true    "时间戳"
// @Failure 400 更新Aliyun失败
// @router / [put]
func (this *AliyunController) PutAliyun() {

	this.DbLog("Aliyun", "Aliyun", "更新")

	aliyunId, _ := this.GetInt64("editAliyunId", 0)
	aliyun, err := m.AliyunGetById(aliyunId)
	if err != nil {
		this.ResponseErrorJSON(http.StatusOK, err.Error())
	}

	if editinstancename := this.GetString("editinstancename", ""); editinstancename != "" {
		aliyun.InstanceName = editinstancename
	}

	if editinstanceid := this.GetString("editinstanceid", ""); editinstanceid != "" {
		aliyun.InstanceId = editinstanceid
	}

	if editcpu, _ := this.GetInt("editcpu", 0); editcpu != 0 {
		aliyun.CPU = editcpu
	}

	if editmemory, _ := this.GetInt("editmemory", 0); editmemory != 0 {
		aliyun.Memory = editmemory
	}

	editcreationtime := this.GetString("editcreationtime", "")
	if editcreationtime != "" {
		CreationTime := util.TimeBuild(editcreationtime)
		aliyun.CreationTime = CreationTime
	}

	if editip := this.GetString("editip", ""); editip != "" {
		aliyun.IpAddress = editip
	}

	editexpiredtime := this.GetString("editexpiredtime", "")
	if editexpiredtime != "" {
		ExpiredTime := util.TimeBuild(editexpiredtime)
		aliyun.ExpiredTime = ExpiredTime
	}

	if edithostname := this.GetString("edithostname", ""); edithostname != "" {
		aliyun.HostName = edithostname
	}

	if editimage := this.GetString("editimage", ""); editimage != "" {
		aliyun.ImageId = editimage
	}

	if editdescription := this.GetString("editdescription", ""); editdescription != "" {
		aliyun.Description = editdescription
	}

	if editzoneid := this.GetString("editzoneid", ""); editzoneid != "" {
		aliyun.ZoneId = editzoneid
	}

	enable, _ := this.GetBool("enable",false)
	if enable {
		aliyun.Enable = enable
	}

	if err := m.PutAliyun(aliyun); err == nil {
		this.Data["json"] = this.ResponseSuccessJSON(true, "操作成功", 1)
	} else {
		this.Data["json"] = this.ResponseSuccessJSON(false, "操作失败", -1)
	}
	this.ServeJSON()
}

func (this *AliyunController) Fnish() {

}