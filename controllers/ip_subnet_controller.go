//IP 子网处理模块
package controllers

import (
	"net"
	"github.com/astaxie/beego"
	"net/http"
	"oneoaas.com/cmdb/models"
	"time"
	"fmt"
	"strings"
	"strconv"
)

// @Title IP子网
// @Description 查询IP子网
// @Success 200 {map} map[string]interface{} "
// @Param   Authorization     header   string   true   "认证信息"
// @Param   timestamp         query    string   true   "时间戳"
// @Failure 400 查询IP子网失败
// @router / [get]
func (this *IpSubNetController) GetIpSubNet() {
	beego.Debug("[查询IP子网]")
	queryMap := make(map[string]string)
	sortColumnMap := make(map[string]string)
	queryParam := models.QueryParam{
		Query:queryMap,
		SortColumn:sortColumnMap,
		Limit:-1,
		Offset:-1,
	}

	subnet_address := this.GetString("subnet_address","")
	if subnet_address != ""{
		queryMap["subnet_address"]=subnet_address
	}

	vlan := this.GetString("vlan","")
	if vlan != ""{
		queryMap["vlan"]=vlan
	}

	if limit, err := this.GetInt64("limit"); err == nil {
		queryParam.Limit = limit
	}

	if offset, err := this.GetInt64("offset"); err == nil {
		queryParam.Offset = offset
	}

	ipSubnetlist,ipSubnetTotal,err := models.GetIpSubnet(queryParam)
	if err != nil{
		this.ResponseErrorJSON(http.StatusOK,err.Error())
	}

	if v := this.GetString("format"); v == "json" {
		response := map[string]interface{}{
			"total": ipSubnetTotal,
			"rows":  ipSubnetlist,
		}
		this.Data["json"] = response
	} else {
		this.Data["json"] = ipSubnetlist
	}

	this.ServeJSON()
}

// @Title IP子网
// @Description 添加IP子网
// @Success 200 {map} map[string]interface{}
// @Param   subnetAddress       query   string 	  true    "IP子网地址"
// @Param   subnetDescription   query   string    true    "IP子网描述"
// @Param   vlan              	query   string    true    "vlan名称"
// @Param   allowAllocation     query   string    true    "是否允许分配"
// @Param   checkIpState  	query   string 	  false   "检查IP状态"
// @Param   Authorization       header  string 	  true    "认证信息"
// @Param   timestamp           query   string 	  true    "时间戳"
// @Failure 400 添加IP失败
// @router / [post]
func (this *IpSubNetController) AddIpSubNet() {

	this.DbLog("IP子网", "IP子网", "添加")

	//获取输入参数
	subnetAddress := this.GetString("subnetAddress", "")
	subnetDescription := this.GetString("subnetDescription", "")
	vlan := this.GetString("vlan", "")
	allowAllocation,err := this.GetInt("allowAllocation",-1)
	checkIpState,err := this.GetInt("checkIpState", -1)

	//解析Ip子网
	_, ipnet, err := net.ParseCIDR(subnetAddress)
	if err != nil {
		beego.Error(err.Error())
		this.ResponseErrorJSON(http.StatusOK,"IP子网格式错误")
	}

	_,mask := ipnet.Mask.Size()
	ipSubnet := models.IpSubnet{
		SubnetAddress:subnetAddress,
		SubnetDescription:subnetDescription,
		Mask:fmt.Sprintf("%d",mask),
		Vlan:vlan,
		AllowAllocation:allowAllocation,
		CheckIpState:checkIpState,
		Enable:true,
		CreateTime:time.Now(),
		CreateBy:"",
		UpdateBy:"",
		UpdateTime:time.Now(),
	}


	self := new(models.IpSubnet)
	err = self.Add(ipSubnet)
	if err != nil{
		this.ResponseErrorJSON(http.StatusOK,err.Error())
	}
	//如果是指针，则直接返回指正类型
	this.Data["json"] = this.ResponseSuccessJSON(true,"添加成功",self.Id)
	this.ServeJSON()
}

// @Title IP子网删除
// @Description 通过id删除IP子网
// @Success 200 {map}
// @Param   subnetId          query    string true      "subnetId"
// @Param   Authorization     header   string true      "认证信息"
// @Param   timestamp         query    string true      "时间戳"
// @Failure 400 删除IP子网失败
// @router / [delete]
func (this *IpSubNetController) DelIpSubNet() {

	this.DbLog("IP子网", "IP子网", "删除")
	ids := this.GetString("id", "")

	if len(ids) == 0{
		this.ResponseErrorJSON(http.StatusOK,"请选择删除数据")
	}

	idArray := strings.Split(ids,",")
	if len(idArray) == 0{
		this.ResponseErrorJSON(http.StatusOK,"数据格式错误")
	}

	//删除标签
	var deleteTag int64
	for _,value := range idArray{
		i64Id,err := strconv.ParseInt(value,10,64)
		if err != nil{
			continue
		}
		err = models.DelIpSubnet(i64Id)
		if err != nil{
			beego.Error(err)
			continue
		}
		deleteTag++
	}

	if deleteTag == int64(len(idArray)){
		this.Data["json"] = this.ResponseSuccessJSON(true,"删除成功",deleteTag)
	}else  if deleteTag < int64(len(idArray)){
		//todo 删除失败的需要记录
		this.Data["json"] = this.ResponseSuccessJSON(true,"部分删除成功",deleteTag)
	}
	this.ServeJSON()

}

// @Title IP子网
// @Description 更新IP子网
// @Success 200 {map} map[string]interface{}
// @Param   id       		query   string 	  true    "IP子网id"
// @Param   subnetDescription   query   string    true    "IP子网描述"
// @Param   vlan              	query   string    true    "vlan名称"
// @Param   allowAllocation     query   string    true    "是否允许分配"
// @Param   checkIpState  	query   string 	  false   "检查IP状态"
// @Param   Authorization       header  string 	  true    "认证信息"
// @Param   timestamp           query   string 	  true    "时间戳"
// @Failure 400 添加IP失败
// @router / [put]
func (this *IpSubNetController) UpdateIpSubNet() {

	this.DbLog("IP子网", "IP子网", "更新")

	//获取输入参数
	subnetId,err := this.GetInt64("id",-1)
	if subnetId == -1{
		this.ResponseErrorJSON(http.StatusOK,"更新参数错误")
	}

	self,err := models.GetIpSubnetById(subnetId)
	if err != nil{
		this.ResponseErrorJSON(http.StatusOK,err.Error())
	}
	subnetDescription := this.GetString("subnetDescription", "")
	if subnetDescription != ""{
		self.SubnetDescription = subnetDescription
	}
	vlan := this.GetString("vlan", "")
	if vlan != ""{
		self.Vlan = vlan
	}
	allowAllocation,err := this.GetInt("allowAllocation",-1)
	if allowAllocation != -1{
		self.AllowAllocation = allowAllocation
	}
	checkIpState,err := this.GetInt("checkIpState", -1)
	if checkIpState != -1{
		self.CheckIpState = checkIpState
		//todo 如果设置为检测，则需要启动协程，去ping
	}

	err = self.PutIpSubnet()
	if err != nil{
		this.ResponseErrorJSON(http.StatusOK,err.Error())
	}
	//如果是指针，则直接返回指正类型
	this.Data["json"] = this.ResponseSuccessJSON(true,"更新成功",self.Id)
	this.ServeJSON()
}