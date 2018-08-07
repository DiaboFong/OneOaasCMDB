package controllers

import (
	"oneoaas.com/cmdb/models"
	m "oneoaas.com/cmdb/models"
	"oneoaas.com/cmdb/util"
	"strings"
	"net/http"
)

// @Title vcenter
// @Description 查询Vcenter
// @Success 200 {map} map[string]interface{}
// @Param   enable            query   	string   false   "数据是否有效 0/1"
// @Param   format     	      query   	string   false   "json:返回带有总记录条数"
// @Param   order     	      query   	string   false   "排序方式asc/desc"
// @Param   sort     	      query   	string   false   "排序字段"
// @Param   limit     	      query   	int      false   "每页的数据量"
// @Param   name    		  query     string   false   "按名称筛选"
// @Param   guest_fullname	  query     string   false   "按操作系统全称筛选"
// @Param   start_time   	  query     string   false   "筛选起始时间"
// @Param   end_time    	  query     string   false   "筛选结束时间"
// @Param   Authorization     header    string   true    "认证信息"
// @Param   timestamp         query     string   true    "时间戳"
// @Failure 400 查询Vcenter失败
// @router / [get]
func (this *VcenterController) GetVM() {
	vm := new(models.VmVmware)
	var sort string
	var order string
	var query = make(map[string]string, 0) //存储条件
	var limit int64 = 10
	var offset int64 = 0
	var name string
	var guest_fullname string
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

	if v := this.GetString("guest_fullname"); v != "" {
		guest_fullname = v
	}

	if v := this.GetString("start_time"); v != "" {
		start_time = v
	}

	if v := this.GetString("end_time"); v != "" {
		end_time = v
	}

	vms,total := vm.GetVmwareVm(query, sort, order, offset, limit, name, guest_fullname, start_time, end_time)
	if vms == nil{
		vms = make([]interface{}, 0)
	}
	if v :=this.GetString("format",""); v == "json" {
		this.TotalRowsPageJSON(total,vms)
	} else {
		this.DataJSON(vms)
	}

}

// @Title vcenter
// @Description 添加Vcenter
// @Success 200 {map} map[string]interface{}
// @Param   instancename      query   string true    "实例名称"
// @Param   istemplate        query   string false   "是否为模板"
// @Param   vmpath            query   string false   "虚拟机路径"
// @Param   memory            query   int    false   "内存大小"
// @Param   cpu               query   int    false   "CPU个数"
// @Param   ethernetcards     query   int    false   "网卡个数"
// @Param   virtualdisks  	  query   int    false   "虚拟机磁盘个数"
// @Param   guestfullname     query   string false   "操作系统全称"
// @Param   Authorization     header  string true    "认证信息"
// @Param   timestamp         query   string true    "时间戳"
// @Failure 400 添加Vcenter失败
// @router / [post]
func (this *VcenterController) AddVcenter() {

	this.DbLog("Vcenter", "Vcenter", "添加")

	vcenter := new(m.VmVmware)

	vcenter.Name = this.GetString("instancename", "")
	if this.GetString("istemplate", "") == "1" {
		vcenter.Template = true
	}else{
		vcenter.Template = false
	}
	vcenter.VmPathName = this.GetString("vmpath", "")
	vcenter.MemorySize, _ = this.GetInt32("memory", 0)
	vcenter.NumCpu, _ = this.GetInt32("cpu", 0)
	vcenter.NumEthernetCards, _ = this.GetInt32("ethernetcards", 0)
	vcenter.NumVirtualDisks, _ = this.GetInt32("virtualdisks", 0)
	vcenter.InstanceUuid = this.GetString("instanceuuid", "")
	vcenter.GuestId = this.GetString("guestid", "")
	vcenter.GuestFullname = this.GetString("guestfullname", "")
	vcenter.Enable=true

	id, err := m.AddVcenter(vcenter)
	if err != nil {
		this.ResponseErrorJSON(http.StatusOK,err.Error())
	} else {
		this.Data["json"] = this.ResponseSuccessJSON(true, "添加Vcenter成功", id)
	}
	this.ServeJSON()
}

// @Title vcenter
// @Description 通过id删除Vcenter
// @Success 200 {map}
// @Param   vcenterid         query    string true      "VcenterID"
// @Param   Authorization     header   string true      "认证信息"
// @Param   timestamp         query    string true      "时间戳"
// @Failure 400 删除Vcenter失败
// @router / [delete]
func (this *VcenterController) DelVcenter() {

	this.DbLog("Vcenter", "Vcenter", "删除")

	var err error
	v := this.GetString("vcenterid")
	hardDelete,err := this.GetBool("hardDelete")
	if len(v) > 0 {
		for _, id := range strings.Split(v, ",") {
			vcenterid, _ := util.StrToInt64(id)
			if(hardDelete){
				err = m.HardDelVcenter(vcenterid)
			}else{
				err = m.DelVcenter(vcenterid)
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

// @Title vcenter
// @Description 更新Vcenter
// @Success 200 {map} map[string]interface{}
// @Param   editVcenterId         query   int    true    "VcenterID"
// @Param   editinstancename      query   string true    "实例名称"
// @Param   editistemplate        query   string false   "是否为模板"
// @Param   editvmpath            query   string false   "虚拟机路径"
// @Param   editmemory            query   int    false   "内存大小"
// @Param   editcpu               query   int    false   "CPU个数"
// @Param   editethernetcards     query   int    false   "网卡个数"
// @Param   editvirtualdisks  	  query   int    false   "虚拟机磁盘个数"
// @Param   editguestfullname     query   string false   "操作系统全称"
// @Param   Authorization         header  string true    "认证信息"
// @Param   timestamp             query   string true    "时间戳"
// @Failure 400 更新Vcenter失败
// @router / [put]
func (this *VcenterController) PutVcenter() {

	this.DbLog("Vcenter", "Vcenter", "更新")

	vcenterId, _ := this.GetInt64("editVcenterId", 0)
	vcenter, err := m.VcenterGetById(vcenterId)
	if err != nil {
		this.ResponseErrorJSON(http.StatusOK, err.Error())
	}

	if editinstancename := this.GetString("editinstancename", ""); editinstancename != "" {
		vcenter.Name = editinstancename
	}

	if this.GetString("editistemplate", "") == "1" {
		vcenter.Template = true
	}else{
		vcenter.Template = false
	}

	if editvmpath := this.GetString("editvmpath", ""); editvmpath != "" {
		vcenter.VmPathName = editvmpath
	}

	if editmemory, _ := this.GetInt32("editmemory", 0); editmemory != 0 {
		vcenter.MemorySize = editmemory
	}

	if editcpu, _ := this.GetInt32("editcpu", 0); editcpu != 0 {
		vcenter.NumCpu = editcpu
	}

	if editethernetcards, _ := this.GetInt32("editethernetcards", 0); editethernetcards != 0 {
		vcenter.NumEthernetCards = editethernetcards
	}

	if editvirtualdisks, _ := this.GetInt32("editvirtualdisks", 0); editvirtualdisks != 0 {
		vcenter.NumVirtualDisks = editvirtualdisks
	}

	if editinstanceuuid := this.GetString("editinstanceuuid", ""); editinstanceuuid != "" {
		vcenter.InstanceUuid = editinstanceuuid
	}

	if editguestid := this.GetString("editguestid", ""); editguestid != "" {
		vcenter.GuestId = editguestid
	}

	if editguestfullname := this.GetString("editguestfullname", ""); editguestfullname != "" {
		vcenter.GuestFullname = editguestfullname
	}
	enable, _ := this.GetBool("enable",false)
	if enable {
		vcenter.Enable = enable
	}
	if err := m.PutVcenter(vcenter); err == nil {
		this.Data["json"] = this.ResponseSuccessJSON(true, "操作成功", 1)
	} else {
		this.Data["json"] = this.ResponseSuccessJSON(false, "操作失败", -1)
	}
	this.ServeJSON()
}

func (this *VcenterController) Fnish() {

}