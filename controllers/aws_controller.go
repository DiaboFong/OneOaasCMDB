package controllers

import (
	"oneoaas.com/cmdb/models"
	m "oneoaas.com/cmdb/models"
	"oneoaas.com/cmdb/util"
	"strings"
	"net/http"
	"fmt"
	"reflect"
)

// @Title aws
// @Description 查询Aws
// @Success 200 {map} map[string]interface{}
// @Param   enable            query   	string    false   "数据是否有效 0/1"
// @Param   format     	      query   	string    false   "json:返回带有总记录条数"
// @Param   order     	      query   	string    false   "排序方式asc/desc"
// @Param   sort     	      query   	string    false   "排序字段"
// @Param   limit     	      query   	int       false   "每页的数据量"
// @Param   name     		  query     string    false   "按名称筛选"
// @Param   launch_time    	  query     string    false   "筛选启动时间"
// @Param   start_time   	  query     string    false   "筛选起始时间"
// @Param   end_time    	  query     string    false   "筛选结束时间"
// @Param   Authorization     header    string    true    "认证信息"
// @Param   timestamp         query     string    true    "时间戳"
// @Failure 400 查询Aws失败
// @router / [get]
func (this *AwsController) GetVM() {
	vm := new(models.VmAws)
	var sort string
	var order string
	var query = make(map[string]string, 0)
	var limit int64 = 10
	var offset int64 = 0
	var name string
	var launch_time string
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

	if v := this.GetString("launch_time"); v != "" {
		launch_time = v
	}

	if v := this.GetString("start_time"); v != "" {
		start_time = v
	}

	if v := this.GetString("end_time"); v != "" {
		end_time = v
	}

	vms,total := vm.GetAwsVm(query, sort, order, offset, limit, name, launch_time, start_time, end_time)
	if vms == nil{
		vms = make([]interface{}, 0)
	}
	if v := this.GetString("format"); v=="json" {
		this.TotalRowsPageJSON(total,vms)
	} else {
		this.DataJSON(vms)
	}
	this.ServeJSON()
}

// @Title aws
// @Description 添加Aws
// @Success 200 {map} map[string]interface{}
// @Param   architecture       query   string true    "架构"
// @Param   imageid            query   string false   "镜像ID"
// @Param   instanceid         query   string false   "实例ID"
// @Param   instancelifecycle  query   string false   "生命周期状态"
// @Param   instancetype       query   string false   "实例类型"
// @Param   platform           query   string false   "平台"
// @Param   privatedns  	   query   string false   "私有DNS"
// @Param   publicdns          query   string false   "公共DNS"
// @Param   publicip           query   string false   "公共IP"
// @Param   virtualizationtype query   string false   "虚拟化类型"
// @Param   launchtime         query   string false   "启动时间"
// @Param   Authorization      header  string true    "认证信息"
// @Param   timestamp          query   string true    "时间戳"
// @Failure 400 添加Aws失败
// @router / [post]
func (this *AwsController) AddAws() {

	this.DbLog("Aws", "Aws", "添加")

	aws := new(m.VmAws)

	aws.Architecture = this.GetString("architecture", "")
	aws.ImageId = this.GetString("imageid", "")
	aws.InstanceId = this.GetString("instanceid", "")
	aws.InstanceLifecycle = this.GetString("instancelifecycle", "")
	aws.InstanceType = this.GetString("instancetype", "")
	aws.Platform = this.GetString("platform", "")
	aws.PrivateDnsName = this.GetString("privatedns", "")
	aws.PublicDnsName = this.GetString("publicdns", "")
	aws.PublicIpAddress = this.GetString("publicip", "")
	aws.VirtualizationType = this.GetString("virtualizationtype", "")
	aws.Enable=true

	launchtime := this.GetString("launchtime", "")
	LaunchTime := util.TimeBuild(launchtime)
	aws.Launch = LaunchTime

	id, err := m.AddAws(aws)
	if err != nil {
		this.ResponseErrorJSON(http.StatusOK, err.Error())
	} else {
		this.Data["json"] = this.ResponseSuccessJSON(true, "添加Aws成功", id)
	}
	this.ServeJSON()
}

// @Title aws
// @Description 通过id删除Aws
// @Success 200 {map}
// @Param   awsid             query    string true      "AwsID"
// @Param   Authorization     header   string true      "认证信息"
// @Param   timestamp         query    string true      "时间戳"
// @Failure 400 删除Aws失败
// @router / [delete]
func (this *AwsController) DelAws() {

	this.DbLog("Aws", "Aws", "删除")

	var err error
	v := this.GetString("awsid")
	hardDelete,err := this.GetBool("hardDelete")
	if len(v) > 0 {
		for _, id := range strings.Split(v, ",") {
			awsid, _ := util.StrToInt64(id)
			if(hardDelete){
				err = m.HardDelAws(awsid)
			}else{
				err = m.DelAws(awsid)
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

// @Title aws
// @Description 更新Aws
// @Success 200 {map} map[string]interface{}
// @Param   editawsid              query   int    true    "AwsID"
// @Param   editarchitecture       query   string true    "架构"
// @Param   editimageid            query   string false   "镜像ID"
// @Param   editinstanceid         query   string false   "实例ID"
// @Param   editinstancelifecycle  query   string false   "生命周期状态"
// @Param   editinstancetype       query   string false   "实例类型"
// @Param   editplatform           query   string false   "平台"
// @Param   editprivatedns  	   query   string false   "私有DNS"
// @Param   editpublicdns          query   string false   "公共DNS"
// @Param   editpublicip           query   string false   "公共IP"
// @Param   editvirtualizationtype query   string false   "虚拟化类型"
// @Param   editlaunchtime         query   string false   "启动时间"
// @Param   Authorization          header  string true    "认证信息"
// @Param   timestamp              query   string true    "时间戳"
// @Failure 400 更新Aws失败
// @router / [put]
func (this *AwsController) PutAws() {

	this.DbLog("Aws", "Aws", "更新")

	awsId, _ := this.GetInt64("editawsid", 0)
	fmt.Println(reflect.TypeOf(awsId))
	aws, err := m.AwsGetById(awsId)
	fmt.Println(aws)
	if err != nil {
		this.ResponseErrorJSON(http.StatusOK, err.Error())
	}

	if editarchitecture := this.GetString("editarchitecture", ""); editarchitecture != "" {
		aws.Architecture = editarchitecture
	}

	if editimageid := this.GetString("editimageid", ""); editimageid != "" {
		aws.ImageId = editimageid
	}

	if editinstanceid := this.GetString("editinstanceid", ""); editinstanceid != "" {
		aws.InstanceId = editinstanceid
	}

	if editinstancelifecycle := this.GetString("editinstancelifecycle", ""); editinstancelifecycle != "" {
		aws.InstanceLifecycle = editinstancelifecycle
	}

	if editinstancetype := this.GetString("editinstancetype", ""); editinstancetype != "" {
		aws.InstanceType = editinstancetype
	}

	editlaunchtime := this.GetString("editlaunchtime", "")
	if editlaunchtime != "" {
		LaunchTime := util.TimeBuild(editlaunchtime)
		aws.Launch = LaunchTime
	}

	if editplatform := this.GetString("editplatform", ""); editplatform != "" {
		aws.Platform = editplatform
	}

	if editprivatedns := this.GetString("editprivatedns", ""); editprivatedns != "" {
		aws.PrivateDnsName = editprivatedns
	}

	if editpublicdns := this.GetString("editpublicdns", ""); editpublicdns != "" {
		aws.PublicDnsName = editpublicdns
	}

	if editpublicip := this.GetString("editpublicip", ""); editpublicip != "" {
		aws.PublicIpAddress = editpublicip
	}

	if editvirtualizationtype := this.GetString("editvirtualizationtype", ""); editvirtualizationtype != "" {
		aws.VirtualizationType = editvirtualizationtype
	}

	enable, _ := this.GetBool("enable",false)
	if enable {
		aws.Enable = enable
	}

	//beego.Info("[更新Aws,AwsId是", aws.Id, "Architecture是", aws.Architecture, "]")
	if err := m.PutAws(aws); err == nil {
		this.Data["json"] = this.ResponseSuccessJSON(true, "操作成功", 1)
	} else {
		this.Data["json"] = this.ResponseSuccessJSON(false, "为什么操作失败", -1)
	}
	this.ServeJSON()
}

func (this *AwsController) Fnish() {

}