package controllers

import (
	"oneoaas.com/cmdb/models"
	"oneoaas.com/cmdb/util"
	"strconv"
	"time"
)

// @Title dashboard 统计资源
// @Description 统计资源总数
// @Success 200 {map} map[string]interface{}
// @Param   Authorization     header  string   true    "认证信息"
// @Param   timestamp         query   string   true    "时间戳"
// @Failure 400 统计资源总数失败
// @router /count [get]
func (this *DashboardController) CountAssets() {
	var query map[string]string
	datacenter, _ := models.CountDatacenter(query)
	room, _ := models.CountRoom(query)
	rack, _ := models.CountRack(query)
	hardware, _ := models.CountHardware(query)
	server, _ := models.CountServer(query)
	domain, _ := models.CountDnspoddomain(query)
	supplier, _ := models.CountSupplier(query)
	agreement, _ := models.CountAgreement(query)
	ip, _ := models.CountIpSubnet(query)
	app, _ := models.CountApp(query)
	bandwidth, _ := models.CountNetworkbandwidth(query)
	vcenter := models.VmVmware{}
	aliyun := models.VmAliyun{}
	aws := models.VmAws{}
	vcenterNum, _ := vcenter.CountVmwareVm(query)
	aliyunNum, _ := aliyun.CountAliyunVm(query)
	awsNum, _ := aws.CountAwsVm(query)
	cloudhostNum :=  aliyunNum + awsNum
	response := map[string]interface{}{
		"datacenter": datacenter,
		"room":       room,
		"rack":       rack,
		"bandwidth":  bandwidth,
		"hardware":   hardware,
		"server":     server,
		"ip":         ip,
		"domain":     domain,
		"supplier":   supplier,
		"agreement":  agreement,
		"app":        app,
		"vcenter":    vcenterNum,  //vcenter
		"cloud":      cloudhostNum,//云主机
	}
	this.Data["json"] = response
	this.ServeJSON()
}

type DashbordData struct {
	DatacenterOfU []util.Rate
	Server        []util.Rate
	CloudHost     []util.Rate
	NetworkDevice []util.Rate
	Ipam          []util.Rate
}

// @Title dashboard 统计利用率
// @Description 统计资源利用率
// @Success 200 {map} map[string]interface{}
// @Param   Authorization     header  string   true    "认证信息"
// @Param   timestamp         query   string   true    "时间戳"
// @Failure 400 统计资源利用率失败
// @router /usage [get]
func (this *DashboardController) GetUsageRate() {
	var dashData DashbordData
	var datacenterOfU  []util.Rate
	var server  []util.Rate
	var cloudHost  []util.Rate
	var networkDevice  []util.Rate
	var ipam  []util.Rate

	datacenterOfU = models.GetDatacenterReport("day")
	server = models.GetServerReport("day")
	cloudHost = models.GetDatacenterReport("day")
	networkDevice = models.GetDatacenterReport("day")
	ipam = models.GetDatacenterReport("day")

	dashData.DatacenterOfU = datacenterOfU
	dashData.CloudHost = cloudHost
	dashData.Ipam = ipam
	dashData.NetworkDevice = networkDevice
	dashData.Server = server

	this.Data["json"] = dashData
	this.ServeJSON()
}


type Uposition struct {
	Name  string 	`json:"name"`
	Value string 	`json:"value"`
}

type RackUposition struct {
	Legend []string `json:"legend"`
	Series []Uposition `json:"series"`
}
// @Title dashboard
// @Description 统计U位利用率
// @Success 200 {map} map[string]interface{}
// @Param   Authorization     header  string   true    "认证信息"
// @Param   timestamp         query   string   true    "时间戳"
// @Failure 400 统计U位利用率失败
// @router /uposition [get]
func (this *DashboardController) GetUsageRateByRackU() {
	var query map[string]string

	rackUNum, _ := models.CountRackUNum(query)
	rackUAvaNum, _ := models.CountRackUAvaNum(query)

	var intRackUNum ,intRackUAvaNum int64
	if rackUNum != nil{
		intRackUNum, _ = strconv.ParseInt(rackUNum.(string), 10, 64)
	}else{
		rackUNum = "0"
	}

	if rackUAvaNum != nil{
		intRackUAvaNum, _ = strconv.ParseInt(rackUAvaNum.(string), 10, 64)
	}else{
		rackUAvaNum = "0"
	}

	intRackUUnuserdNum := intRackUNum - intRackUAvaNum
	rackUUnuserdNum := strconv.FormatInt(intRackUUnuserdNum,10)

	uposition1 := Uposition{
		Name:"U位总数",
		Value:rackUNum.(string),
	}
	uposition2 := Uposition{
		Name:"U位剩余数",
		Value:rackUAvaNum.(string),
	}
	uposition3 := Uposition{
		Name:"U位已使用",
		Value:rackUUnuserdNum,
	}
	rackUposition := RackUposition{
		Legend:[]string{uposition1.Name,uposition2.Name,uposition3.Name},
		Series:[]Uposition{uposition1,uposition2,uposition3},
	}
	this.Data["json"] = rackUposition
	this.ServeJSON()
}


type DeviceNumber struct {
	Name  string 	`json:"name"`
	Value string 	`json:"value"`
}

type Device struct {
	Legend []string `json:"legend"`
	Series []DeviceNumber `json:"series"`
}

// @Title dashboard 统计设备
// @Description 统计设备数量环形对比
// @Success 200 {map} map[string]interface{}
// @Param   Authorization     header  string   true    "认证信息"
// @Param   timestamp         query   string   true    "时间戳"
// @Failure 400 设备数量环形对比失败
// @router /device [get]
func (this *DashboardController) CountDevice() {
	var query map[string]string
	vcenter := models.VmVmware{}
	aliyun := models.VmAliyun{}
	aws := models.VmAws{}

	serverNum, _ := models.CountServer(query)
	vcenterNum, _ := vcenter.CountVmwareVm(query)
	aliyunNum, _ := aliyun.CountAliyunVm(query)
	awsNum, _ := aws.CountAwsVm(query)
	cloudhostNum :=  aliyunNum + awsNum

	serverNumber:=strconv.FormatInt(serverNum,10)
	vcenterNumber:=strconv.FormatInt(vcenterNum,10)
	cloudhostNumber:=strconv.FormatInt(cloudhostNum,10)

	device1 := DeviceNumber{
		Name:"服务器",
		Value:serverNumber,
	}

	device2 := DeviceNumber{
		Name:"虚拟机",
		Value:vcenterNumber,
	}

	device3 := DeviceNumber{
		Name:"云主机",
		Value:cloudhostNumber,
	}

	devices := Device{
		Legend:[]string{device1.Name,device2.Name,device3.Name},
		Series:[]DeviceNumber{device1,device2,device3},
	}

	this.Data["json"] = devices
	this.ServeJSON()
}

type AssetsMonth struct {
	Name string `json:"name"`
	Type string `json:"type"`
	BarWidth int64 `json:"barWidth"`
	Data [6]int64 `json:"data"`
}

type AssetsMonthGraph struct {
	Legend []string `json:"legend"`
	XAxis  []string 	`json:"xAxis"`
	Series []AssetsMonth `json:"series"`
}

// @Title dashboard 按月统计资源
// @Description 按月统计资源
// @Success 200 {map} map[string]interface{}
// @Param   Authorization     header  string   true    "认证信息"
// @Param   timestamp         query   string   true    "时间戳"
// @Failure 400 按月统计资源失败
// @router /countByMonth [get]
func (this *DashboardController) CountAssetsByMonth() {
	var query map[string]string
	var serverNums = [6]int64{}
	var vmNums = [6]int64{}
	var aliyunNums = [6]int64{}
	var awsNums = [6]int64{}
	server := models.Server{}
	vcenter := models.VmVmware{}
	aliyun := models.VmAliyun{}
	aws := models.VmAws{}

	ServerNumByMonthList, _ := server.CountServerByMonth(query)
	if ServerNumByMonthList == nil {
		ServerNumByMonthList = make([]interface{}, 0)
	}
	for index,serverNum := range ServerNumByMonthList{
		serverNums[index], _ = strconv.ParseInt(serverNum.(string), 10, 64)
	}

	VmwareNumByMonthList, _ := vcenter.CountVmwareByMonth(query)
	if VmwareNumByMonthList == nil {
		VmwareNumByMonthList = make([]interface{}, 0)
	}
	for index,vmNum := range VmwareNumByMonthList{
		vmNums[index], _ = strconv.ParseInt(vmNum.(string), 10, 64)
	}

	CountVmAliyunByMonth, _ := aliyun.CountVmAliyunByMonth(query)
	if CountVmAliyunByMonth == nil {
		CountVmAliyunByMonth = make([]interface{}, 0)
	}
	for index,aliyunNum := range CountVmAliyunByMonth{
		aliyunNums[index], _ = strconv.ParseInt(aliyunNum.(string), 10, 64)
	}

	VmAwsNumByMonthList, _ := aws.CountVmAwsByMonth(query)
	if VmAwsNumByMonthList == nil {
		VmAwsNumByMonthList = make([]interface{}, 0)
	}
	for index,awsNum := range VmAwsNumByMonthList{
		awsNums[index], _ = strconv.ParseInt(awsNum.(string), 10, 64)
	}

	//'服务器','虚拟机','阿里云','亚马逊'
	assetsMonth1 := AssetsMonth{
		Name:"服务器",
		Type:"bar",
		BarWidth:10,
		Data:serverNums,
	}

	assetsMonth2 := AssetsMonth{
		Name:"虚拟机",
		Type:"bar",
		BarWidth:10,
		Data:vmNums,
	}

	assetsMonth3 := AssetsMonth{
		Name:"阿里云",
		Type:"bar",
		BarWidth:10,
		Data:aliyunNums,
	}

	assetsMonth4 := AssetsMonth{
		Name:"亚马逊",
		Type:"bar",
		BarWidth:10,
		Data:awsNums,
	}

	now := time.Now()
	lastMonth1 := now.Format("2006-01")
	lastMonth2 := now.AddDate(0, -1, 0).Format("2006-01")
	lastMonth3 := now.AddDate(0, -2, 0).Format("2006-01")
	lastMonth4 := now.AddDate(0, -3, 0).Format("2006-01")
	lastMonth5 := now.AddDate(0, -4, 0).Format("2006-01")
	lastMonth6 := now.AddDate(0, -5, 0).Format("2006-01")

	assetsMonthGraph := AssetsMonthGraph{
		Legend:[]string{assetsMonth1.Name,assetsMonth2.Name,assetsMonth3.Name,assetsMonth4.Name},
		XAxis:[]string{lastMonth1,lastMonth2,lastMonth3,lastMonth4,lastMonth5,lastMonth6},
		Series:[]AssetsMonth{assetsMonth1,assetsMonth2,assetsMonth3,assetsMonth4},
	}
	this.Data["json"] = assetsMonthGraph
	this.ServeJSON()
}
