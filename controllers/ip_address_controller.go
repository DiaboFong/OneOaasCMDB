//IP 子网处理模块
package controllers

import (
	"github.com/astaxie/beego"
	"net/http"
	"oneoaas.com/cmdb/models"
	"time"
	"fmt"
	"strconv"
	"strings"
)

// @Title IP地址
// @Description 查询IP
// @Success 200 {map} map[string]interface{}
// @Param   Authorization     header   string   true   "认证信息"
// @Param   timestamp         query    string   true   "时间戳"
// @Failure 400 查询IP失败
// @router / [get]
func (this *IpController) GetIpAddress() {
	beego.Debug("[根据IP子网Id，查询子网下的IP]")
	queryMap := make(map[string]string)
	sortColumnMap := make(map[string]string)
	queryParam := models.QueryParam{
		Query:queryMap,
		SortColumn:sortColumnMap,
		Limit:-1,
		Offset:-1,
	}

	ip_address := this.GetString("ipAdress","")
	if ip_address != ""{
		queryMap["ip_address"]=ip_address
	}

	hostnamePrefix := this.GetString("hostnamePrefix","")
	if hostnamePrefix != ""{
		queryMap["hostname_prefix"]=hostnamePrefix
	}

	deviceType := this.GetString("deviceType","")
	if deviceType != ""{
		queryMap["device_type"]=deviceType
	}

	port := this.GetString("port","")
	if port != ""{
		queryMap["port"]=port
	}

	owner := this.GetString("owner","")
	if owner != ""{
		queryMap["owner"]=owner
	}

	description := this.GetString("description","")
	if description != ""{
		queryMap["description"]=description
	}

	allow_modify := this.GetString("allowModify","")
	if allow_modify != ""{
		queryMap["allow_modify"]=allow_modify
	}

	location := this.GetString("location","")
	if location != ""{
		queryMap["location"]=location
	}

	ip_subnet := this.GetString("ip_subnet","")
	if ip_subnet != ""{
		queryMap["ip_subnet"]=ip_subnet
	}

	if limit, err := this.GetInt64("limit"); err == nil {
		queryParam.Limit = limit
	}

	if offset, err := this.GetInt64("offset"); err == nil {
		queryParam.Offset = offset
	}

	iplist,ipTotal,err := models.GetIpAddress(queryParam)
	if err != nil{
		this.ResponseErrorJSON(http.StatusOK,err.Error())
	}

	if v := this.GetString("format"); v == "json" {
		response := map[string]interface{}{
			"total": ipTotal,
			"rows":  iplist,
		}
		this.Data["json"] = response
	} else {
		this.Data["json"] = iplist
	}

	this.ServeJSON()
}

// @Title IP分配设置
// @Description Ip分配
// @Success 200 {map} map[string]interface{}
// @Param   Authorization       header  string 	  true    "认证信息"
// @Param   timestamp           query   string 	  true    "时间戳"
// @Failure 400 分配IP地址
// @router / [put]
func (this *IpController) AssignIpAddress() {

	this.DbLog("IP分配", "IP分配", "IP地址分配")

	ipSubnetPrefix := this.GetString("ipSubnetPrefix", "")
	ipSubnetMiddle,err := this.GetInt("ipSubnetMiddle", -1)
	if err != nil{
		beego.Error(err.Error())
	}
	ipSubnetLast,err := this.GetInt("ipSubnetLast", -1)
	if err != nil{
		beego.Error("err:",err.Error())
	}

	if ipSubnetMiddle > ipSubnetLast || ipSubnetMiddle == ipSubnetLast{
		this.ResponseErrorJSON(http.StatusOK,"IP分配范围错误")
		return
	}

	batchSetHostname,err := this.GetBool("batchSetHostname")
	if err != nil{
		beego.Error("err:",err.Error())
	}
	hostnamePrefix := this.GetString("hostnamePrefix", "")


	//处理ip地址
	deviceType := this.GetString("deviceType", "")
	port := this.GetString("port", "")
	owner := this.GetString("owner", "")
	description := this.GetString("description", "")
	allowModify,err := this.GetInt("allowModify", -1)
	location := this.GetString("location", "")

	var IpIndex  = 0
	for IpIndex = ipSubnetMiddle ; IpIndex <=ipSubnetLast; IpIndex++{
		ipAddressStr := fmt.Sprintf("%s%d",ipSubnetPrefix,IpIndex)
		ipAddressObject, err := models.GetByIpAddress(ipAddressStr)
		if err != nil || ipAddressObject == nil{
			beego.Error(err)
			continue
		}

		if ipAddressObject != nil {
			ipAddressObject.Port = port
			ipAddressObject.Owner = owner
			ipAddressObject.Description = description
			ipAddressObject.AllowModify = allowModify
			ipAddressObject.DeviceType = deviceType
			ipAddressObject.Location = location
			ipAddressObject.HostnamePrefix = hostnamePrefix
			ipAddressObject.UpdateTime = time.Now()
			//如果批量设置主机名
			if batchSetHostname {
				hostname := fmt.Sprintf("%s-%d",hostnamePrefix,IpIndex)
				ipAddressObject.Hostname = &hostname
			}
			err = models.PutIpAddress(ipAddressObject)
			if err != nil{
				beego.Error("更新错误",err)
			}

		}

	}
	//如果是指针，则直接返回指正类型
	this.Data["json"] = this.ResponseSuccessJSON(true,"分配IP成功",1)
	this.ServeJSON()
}

// @Title 删除IP
// @Description 通过id删除IP
// @Success 200 {map}
// @Param   id                query    string true      	"id"
// @Param   Authorization     header   string true      	"认证信息"
// @Param   timestamp         query    string true      	"时间戳"
// @Failure 400 删除IP地址失败
// @router / [delete]
func (this *IpController) DelIpAddress() {

	this.DbLog("IP", "IP", "删除IP")
	ids := this.GetString("id", "")

	if len(ids) == 0{
		this.ResponseErrorJSON(http.StatusOK,"请选择删除数据")
	}

	idArray := strings.Split(ids,",")
	if len(idArray) == 0{
		this.ResponseErrorJSON(http.StatusOK,"数据格式错误")
	}

	//删除标签,判断是否都成功删除
	var deleteTag int64
	for _,value := range idArray{
		i64Id,err := strconv.ParseInt(value,10,64)
		if err != nil{
			continue
		}
		err = models.DelIpAddress(i64Id)
		if err != nil{
			beego.Error(err)
			continue
		}
		deleteTag++
	}

	this.Data["json"] = this.ResponseSuccessJSON(true,"删除成功",deleteTag)
	this.ServeJSON()
}


// @Title IP
// @Description 更新IP
// @Success 200 {map} map[string]interface{}
// @Param   Authorization       header  string 	  true    "认证信息"
// @Param   timestamp           query   string 	  true    "时间戳"
// @Failure 400 分配IP地址
// @router /update [put]
func (this *IpController) UpdateIpAddress() {

	this.DbLog("IP分配", "IP分配", "IP更新")

	ipId,err := this.GetInt64("id", -1)
	if ipId == -1{
		this.ResponseErrorJSON(http.StatusOK,"更新参数错误")
	}

	ipAddressObject, err := models.GetIpAddressById(ipId)
	if err != nil{
		this.ResponseErrorJSON(http.StatusOK,err.Error())
	}

	deviceType := this.GetString("deviceType", "")
	if deviceType != ""{
		ipAddressObject.DeviceType = deviceType
	}

	port := this.GetString("port", "")
	if port != ""{
		ipAddressObject.Port = port
	}
	owner := this.GetString("owner", "")
	if owner != ""{
		ipAddressObject.Owner = owner
	}
	description := this.GetString("description", "")
	if description != ""{
		ipAddressObject.Description = description
	}
	allowModify,err := this.GetInt("allowModify", -1)
	if allowModify != -1{{
		ipAddressObject.AllowModify = allowModify
	}}
	location := this.GetString("location", "")
	if location != ""{
		ipAddressObject.Location = location
	}

	hostname := this.GetString("hostname", "")
	if hostname != ""{
		ipAddressObject.Hostname = &hostname
	}

	ipAddressObject.UpdateTime = time.Now()

	err = models.PutIpAddress(ipAddressObject)
	if err != nil{
		this.ResponseErrorJSON(http.StatusOK,err.Error())
	}

	//如果是指针，则直接返回指正类型
	this.Data["json"] = this.ResponseSuccessJSON(true,"更新IP成功",ipAddressObject.Id)
	this.ServeJSON()
}

type IpAddressMonitor struct {
	UsedIpAddress int64 `json:"used_ip_address"`
	UnusedIpAddress int64 `json:"unused_ip_address"`
	DisableModifyIpAddress int64 `json:"disable_modify_ip_address"`
	UseRateIpAddress string  `json:"use_rate_ip_address"`
}
// @Title IP监控
// @Description 监控Ip地址
// @Success 200 {map} map[string]interface{}
// @Param   Authorization       header  string 	  true    "认证信息"
// @Param   timestamp           query   string 	  true    "时间戳"
// @Failure 400 ip地址监控
// @router /monitor [get]
func (this *IpController) MonitorIpAddress() {

	queryMap := make(map[string]string)
	sortColumnMap := make(map[string]string)
	queryParam := models.QueryParam{
		Query:queryMap,
		SortColumn:sortColumnMap,
		Limit:-1,
		Offset:-1,
	}


	ip_subnet := this.GetString("ip_subnet","")
	if ip_subnet != ""{
		queryMap["ip_subnet"]=ip_subnet
	}

	ipAddressMonitor := IpAddressMonitor{}
	usedIpAddress,err := models.GetUsedIpAddress(queryParam)
	if err != nil{
		this.ResponseErrorJSON(http.StatusOK,err.Error())
	}
	ipAddressMonitor.UsedIpAddress = usedIpAddress

	unusedIpAddress,err := models.GetUnusedIpAddress(queryParam)
	if err != nil{
		this.ResponseErrorJSON(http.StatusOK,err.Error())
	}
	ipAddressMonitor.UnusedIpAddress = unusedIpAddress

	disableModifyIpAddress,err := models.GetDisableModifyIpAddress(queryParam)
	if err != nil{
		this.ResponseErrorJSON(http.StatusOK,err.Error())
	}
	ipAddressMonitor.DisableModifyIpAddress = disableModifyIpAddress

	useRateIpAddress,err := models.GetUseRateIpAddress(queryParam)
	if err != nil{
		this.ResponseErrorJSON(http.StatusOK,err.Error())
	}
	ipAddressMonitor.UseRateIpAddress = fmt.Sprintf("%.2f", useRateIpAddress)

	this.Data["json"] = ipAddressMonitor
	this.ServeJSON()
}