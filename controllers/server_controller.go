package controllers

import (
	m "oneoaas.com/cmdb/models"
	"strings"
	"github.com/astaxie/beego"
	"oneoaas.com/cmdb/util"
	"net/http"
	api "oneoaas.com/cmdb/cmdbserver/agent/api"
	"encoding/json"
	"time"
	"github.com/pborman/uuid"
	"github.com/shirou/gopsutil/net"
)

type ServerRequest struct {
	Name string `json:"name"`
	CreateTime string `json:"create_time"`
}

// @Title server
// @Description 查询服务器
// @Success 200 {map} map[string]interface{}
// @Param   enable           query     string   false   "记录是否有效,0无效1有效"
// @Param   format     	     query     string   false   "请求响应格式,默认为json"
// @Param   order     	     query     string   false   "公共参数,排序方式asc/desc"
// @Param   sort     	     query     string   false   "公共参数,排序字段"
// @Param   limit     	     query     int      false   "查询条数"
// @Param   offset     	     query     int      false   "开始查询记录位置"
// @Param   sn       	     query     string   false   "按SN筛选"
// @Param   state     	     query     string   false   "按状态筛选"
// @Param   manufacturer     query     string   false   "按制造商筛选"
// @Param   supplier   	     query     string   false   "按供应商筛选"
// @Param   rack     	     query     string   false   "按所属机柜筛选"
// @Param   start_time       query     string   false   "筛选起始时间"
// @Param   end_time         query     string   false   "筛选结束时间"
// @Param   Authorization    header    string   true    "公共参数,认证信息"
// @Param   timestamp        query     string   true    "公共参数,时间戳"
// @Failure 400 查询服务器失败
// @router / [get]
func (this *ServerController) GetServer() {
	var sort string
	var order string
	var query = make(map[string]string, 0)  //存储条件
	var limit int64 = -1
	var offset int64 = -1
	var sn string
	var state string
	var manufacturer string
	var supplier string
	var rack string
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

	if v:= this.GetString("sn"); v != "" {
		sn = v
	}

	if v:= this.GetString("state"); v != "" {
		state = v
	}

	if v:= this.GetString("manufacturer"); v != "" {
		state = v
	}

	if v:= this.GetString("supplier"); v != "" {
		state = v
	}

	if v:= this.GetString("rack"); v != "" {
		state = v
	}

	//开始时间
	if v := this.GetString("start_time"); v != "" {
		query["start_time"] = v
	}

	//结束时间
	if v := this.GetString("end_time"); v != "" {
		query["end_time"] = v
	}

	serverList, total := m.GetServer(query, sort, order, offset, limit, sn, state, manufacturer, supplier, rack, start_time, end_time)
	if serverList == nil {
		serverList = make([]interface{}, 0)
		total = 0
	}
	if v := this.GetString("format"); v == "json" {
		this.TotalRowsPageJSON(total, serverList)
	} else {
		this.DataJSON(serverList)
	}
	this.ServeJSON()
}

// @Title server
// @Description 添加服务器
// @Success 200 {map} map[string]interface{}
// @Param   sn  		    query   string true   "序列号"
// @Param   state      	    query   int64  true   "状态"
// @Param   app   			query   int64  true   "业务"
// @Param   host    	    query   int64  true   "操作系统"
// @Param   manufacturer    query   int64  false  "制造商"
// @Param   supplier        query   int64  false  "供应商"
// @Param   cpu  		    query   int64  false  "CPU"
// @Param   memory          query   int64  false  "内存"
// @Param   harddisk        query   int64  false  "硬盘"
// @Param   networkadapter  query   int64  false  "网卡"
// @Param   rack  		    query   int64  false  "机柜"
// @Param   rackUnumber     query   int64  false  "机柜U数"
// @Param   modle  			query   string false  "型号"
// @Param   ishypervisor    query   int64  false  "是否虚拟化"
// @Param   isserver  	    query   int64  false  "是否服务"
// @Param   ipaddress       query   string false  "Ipaddress"
// @Param   hostname        query   string false  "主机名"
// @Param   comment         query   string false  "备注"
// @Param   Authorization   header  string true   "认证信息"
// @Param   timestamp       query   string true   "时间戳"
// @Failure 400 添加服务器失败
// @router / [post]
func (this *ServerController) AddServer() {

	this.DbLog("Server", "服务器", "添加")

	var server m.Server

	state, _ := this.GetInt64("state", 0)
	serverStateObj, err := m.GetServerStateById(state)
	if err != nil {
		beego.Debug("[添加服务器获取服务器状态对象出错", err.Error(), "]")
		this.ResponseErrorJSON(http.StatusOK, err.Error())
	}
	server.State = serverStateObj

	manufacturerId, _ := this.GetInt64("manufacturer", 0)
	if manufacturerId != 0 {
		manufacturerObj, err := m.GetManufacturerById(manufacturerId)
		if err != nil {
			beego.Debug("[添加服务器获取制作商对象错误", err.Error(), "]")
			this.ResponseErrorJSON(http.StatusOK, err.Error())
		}
		server.Manufacturer = manufacturerObj
	}

	supplierId, _ := this.GetInt64("supplier", 0)
	if supplierId != 0 {
		supplierObj, err := m.SupplierGetById(supplierId)
		if err != nil {
			beego.Debug("[添加服务器获取供应商对象错误", err.Error(), "]")
			this.ResponseErrorJSON(http.StatusOK, err.Error())
		}
		server.Supplier = supplierObj
	}

	//cpuId, _ := this.GetInt64("cpu", 0)
	//if cpuId != 0 {
	//	cpuObj, err := m.GetCpuById(cpuId)
	//	if err != nil {
	//		beego.Debug("[添加服务器获取CPU对象错误", err.Error(), "]")
	//		this.ResponseErrorJSON(http.StatusOK, err.Error())
	//	}
	//	server.Cpu = cpuObj
	//}

	//memoryId, _ := this.GetInt64("memory", 0)
	//if memoryId != 0 {
	//	memoryObj, err := m.GetMemoryById(memoryId)
	//	if err != nil {
	//		beego.Debug("[添加服务器获取内存对象错误", err.Error(), "]")
	//		this.ResponseErrorJSON(http.StatusOK, err.Error())
	//	}
	//	server.Memory = memoryObj
	//}

	//harddiskId, _ := this.GetInt64("harddisk", 0)
	//if harddiskId != 0 {
	//	harddiskObj, err := m.GetHarddiskById(harddiskId)
	//	if err != nil {
	//		beego.Debug("[添加服务器获取硬盘对象错误", err.Error(), "]")
	//		this.ResponseErrorJSON(http.StatusOK, err.Error())
	//	}
	//	server.Harddisk = harddiskObj
	//}

	//networkadapterId, err := this.GetInt64("networkadapter", 0)
	//if networkadapterId != 0 {
	//	networkadapterObj, err := m.GetNetworkAdapterById(networkadapterId)
	//	if err != nil {
	//		beego.Debug("[添加服务器获取网卡对象错误", err.Error(), "]")
	//		this.ResponseErrorJSON(http.StatusOK, err.Error())
	//	}
	//	server.Adapter = networkadapterObj
	//}

	hostId, err := this.GetInt64("host", 0)
	if hostId != 0 {
		hostObj, err := m.GetHostById(hostId)
		if err != nil {
			beego.Debug("[添加服务器获取主机对象错误", err.Error(), "]")
			this.ResponseErrorJSON(http.StatusOK, err.Error())
		}
		server.Host = hostObj
	}

	rackId, err := this.GetInt64("rack", 0)
	if rackId != 0 {
		rackObj, err := m.RackGetById(rackId)
		if err != nil {
			beego.Debug("[添加服务器获取机柜对象错误", err.Error(), "]")
			this.ResponseErrorJSON(http.StatusOK, err.Error())
		}
		server.Rack = rackObj
	}

	appId, _ := this.GetInt64("app", 0)
	if appId != 0 {
		appObj, err := m.AppGetById(appId)
		if err != nil {
			beego.Debug("[添加服务器获取业务对象错误", err.Error(), "]")
			this.ResponseErrorJSON(http.StatusOK, err.Error())
		}
		server.App = appObj
	}

	enable, _ := this.GetBool("enable",false)
	if enable {
		server.Enable = enable
	}

	server.RackUNumber, _ = this.GetInt64("rackUnumber", -1)
	server.Sn = this.GetString("sn", "")
	server.Modle = this.GetString("modle", "")
	server.Ishypervisor, _ = this.GetInt64("ishypervisor", -1)
	server.IsServer, _ = this.GetInt64("isserver", -1)
	server.Ipaddress = this.GetString("ipaddress", "")
	server.Hostname = this.GetString("hostname", "")
	server.Comment = this.GetString("comment", "")

	id, err := m.AddServer(server)
	if err != nil {
		this.ResponseErrorJSON(http.StatusOK, err.Error())
	} else {
		this.Data["json"] = this.ResponseSuccessJSON(true, "添加服务器成功", id)
	}

	this.ServeJSON()
}

// @Title server
// @Description 通过id删除服务器
// @Success 200 {map}
// @Param   serverid          query    string true      "服务器ID"
// @Param   Authorization     header   string true      "认证信息"
// @Param   timestamp         query    string true      "时间戳"
// @Failure 400 删除服务器失败
// @router / [delete]
func (this *ServerController) DelServer() {

	this.DbLog("Server", "服务器", "删除")

	var err error
	v := this.GetString("serverid")
	hardDelete,err := this.GetBool("hardDelete",false)
	if len(v) > 0 {
		for _, id := range strings.Split(v, ",") {
			serverid, _ := util.StrToInt64(id)
			if(hardDelete){
				err = m.HardDelServer(serverid);
			}else{
				err = m.DelServer(serverid)
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

// @Title server
// @Description 更新服务器
// @Success 200 {map} map[string]interface{}
// @Param   serverid        query   int64  true   "服务器ID"
// @Param   sn  		    query   string ture   "序列号"
// @Param   state      	    query   int64  true   "状态"
// @Param   manufacturer    query   int64  true   "制造商"
// @Param   supplier        query   int64  true   "供应商"
// @Param   cpu  		    query   int64  true   "CPU"
// @Param   memory          query   int64  true   "内存"
// @Param   harddisk        query   int64  true   "硬盘"
// @Param   networkadapter  query   int64  true   "网卡"
// @Param   host    	    query   int64  true   "操作系统"
// @Param   rack  		    query   int64  true   "机柜"
// @Param   app   			query   int64  true   "业务"
// @Param   rackUnumber     query   int64  false  "机柜U数"
// @Param   modle  			query   string false  "型号"
// @Param   ishypervisor    query   int64  false  "是否虚拟化"
// @Param   isserver  	    query   int64  false  "是否服务"
// @Param   ipaddress       query   string false  "IP"
// @Param   hostname        query   string false  "主机名"
// @Param   comment         query   string false  "备注"
// @Param   Authorization   header  string true   "认证信息"
// @Param   timestamp       query   string true   "时间戳"
// @Failure 400 更新服务器失败
// @router / [put]
func (this *ServerController) PutServer() {

	this.DbLog("Server", "服务器", "更新")

	serverId, err := this.GetInt64("serverid", -1)
	if serverId == -1 || err != nil {
		this.ResponseSuccessJSON(false, "请求资源无效",-1)
		this.ServeJSON()
	}
	server, err := m.ServerGetById(serverId)
	if err != nil || server == nil {
		this.ResponseSuccessJSON(false, err.Error(),-1)
		this.ServeJSON()
	}

	if state, _ := this.GetInt64("state", 0); state != 0 {
		server.State , _ = m.GetServerStateById(state)
	}

	if manufacturerId, _ := this.GetInt64("manufacturer", 0); manufacturerId != 0 {
		server.Manufacturer , _ = m.GetManufacturerById(manufacturerId)
	}

	if supplierId, _ := this.GetInt64("supplier", 0); supplierId != 0 {
		server.Supplier , _ = m.SupplierGetById(supplierId)
	}

	//if cpuId, _ := this.GetInt64("cpu", 0); cpuId != 0 {
	//	server.Cpu , _ = m.GetCpuById(cpuId)
	//}
	//
	//if memoryId, _ := this.GetInt64("memory", 0); memoryId != 0 {
	//	server.Memory , _ = m.GetMemoryById(memoryId)
	//}
	//
	//if harddiskId, _ := this.GetInt64("harddisk", 0); harddiskId != 0 {
	//	server.Harddisk , _ = m.GetHarddiskById(harddiskId)
	//}
	//
	//if networkadapterId, _ := this.GetInt64("networkadapter", 0); networkadapterId != 0 {
	//	server.Adapter , _ = m.GetNetworkAdapterById(networkadapterId)
	//}

	//代表操作系统
	if hostId, _ := this.GetInt64("host", 0); hostId != 0 {
		server.Host , _ = m.GetHostById(hostId)
	}

	if rackId, _ := this.GetInt64("rack", 0); rackId != 0 {
		server.Rack , _ = m.RackGetById(rackId)
	}

	if appId, _ := this.GetInt64("app", 0); appId != 0 {
		server.App , _ = m.AppGetById(appId)
	}

	if rackUNumberr, _ := this.GetInt64("rackUnumber", -1); rackUNumberr != -1 {
		server.RackUNumber = rackUNumberr
	}

	if sn := this.GetString("sn", ""); sn != "" {
		server.Sn = sn
	}

	if modle := this.GetString("modle", ""); modle != "" {
		server.Modle = modle
	}

	if ishypervisor, _ := this.GetInt64("ishypervisor", -1); ishypervisor != -1 {
		server.Ishypervisor = ishypervisor
	}

	if isserver, _ := this.GetInt64("isserver", -1); isserver != -1 {
		server.IsServer = isserver
	}

	if ipaddress := this.GetString("ipaddress", ""); ipaddress != "" {
		server.Ipaddress = this.GetString("ipaddress", "")
	}

	if hostname := this.GetString("hostname", ""); hostname != "" {
		server.Hostname = this.GetString("hostname", "")
	}

	if comment := this.GetString("comment", ""); comment != "" {
		server.Comment = this.GetString("comment", "")
	}

	enable, _ := this.GetBool("enable",false)
	if enable {
		server.Enable = enable
	}

	if err := m.PutServer(server); err == nil {
		this.Data["json"] = this.ResponseSuccessJSON(true, "更新服务器成功", 1)
	} else {
		this.Data["json"] = this.ResponseSuccessJSON(false, "更新服务器失败", -1)
	}
	this.ServeJSON()
}

// @Title push server cpu data into cmdb
// @Description 上报服务器cpu数据
// @Success 200 {map} map[string]interface{}
// @Param   uuid            query   string  true   "服务器uuid"
// @Param   Authorization   header  string true   "认证信息"
// @Param   timestamp       query   string true   "时间戳"
// @Failure 400 上报服务器cpu数据
// @router /push/cpu/:uuid [post]
func (this *ServerController) PushServerCpu() {

	serverUuid := this.Ctx.Input.Param(":uuid")

	var metadata api.CpuMetaData
	json.Unmarshal(this.Ctx.Input.RequestBody, &metadata)
	beego.Debug("推送服务器数据到cmdb,发送的JSON数据是",metadata)

	if uuid.Parse(serverUuid) == nil{
		this.Data["json"] = this.ResponseSuccessJSON(false,"推送服务器数据的uuid格式错误",-1)
		this.ServeJSON()
		return
	}
	beego.Debug("推送服务器数据到cmdb,服务器uuid是",serverUuid)

	pServerObj ,err := m.ServerGetByuuId(serverUuid)
	if err != nil || pServerObj == nil{
		this.Data["json"] = this.ResponseSuccessJSON(false,"没有找到server uuid对应的记录",-1)
		this.ServeJSON()
		return
	}

	//push cpu
	beego.Debug("push cpu...")
	cpus := metadata.Value
	for _,cpuObj :=range cpus{
		myCpu := m.Cpu{
			Cpu:cpuObj.CPU,
			VendorId :cpuObj.VendorID,
			Family :cpuObj.Family,
			Model  :cpuObj.Model,
			Stepping   :cpuObj.Stepping,
			PhysicalId :cpuObj.PhysicalID,
			CoreId  :cpuObj.CoreID,
			Cores  :cpuObj.Cores,
			ModelName:cpuObj.ModelName,
			Mhz   :cpuObj.Mhz,
			CacheSize  :cpuObj.CacheSize,
			Flags    :strings.Join(cpuObj.Flags,","),
			Enable   :true,
			CreateTime:time.Now(),
			CreateBy :"" ,
			UpdateBy :"" ,
			UpdateTime :time.Now(),
			Server :pServerObj,
		}
		_ ,err := m.SetCpu(myCpu)
		if err != nil{
			beego.Error("push cpu 数据发生错误",err.Error())
		}
	}

	this.Data["json"] = this.ResponseSuccessJSON(true,"Push数据成功",1)
	this.ServeJSON()
}

func FormatInterfaceAddr( inters []net.InterfaceAddr) string{
	if len(inters) ==0 {
		return ""
	}
	adds := make([]string,0)
	for _,inter :=range inters{
		adds = append(adds,inter.Addr)
	}
	return strings.Join(adds,",")
}

// @Title push server network data into cmdb
// @Description 上报服务器network数据
// @Success 200 {map} map[string]interface{}
// @Param   uuid            query   string  true   "服务器uuid"
// @Param   Authorization   header  string true   "认证信息"
// @Param   timestamp       query   string true   "时间戳"
// @Failure 400 上报服务器network数据
// @router /push/network/:uuid [post]
func (this *ServerController) PushServerNetwork() {

	serverUuid := this.Ctx.Input.Param(":uuid")

	var metadata api.NetworkMetaData
	json.Unmarshal(this.Ctx.Input.RequestBody, &metadata)
	beego.Debug("推送服务器数据到cmdb,发送的JSON数据是",metadata)

	if uuid.Parse(serverUuid) == nil{
		this.Data["json"] = this.ResponseSuccessJSON(false,"推送服务器数据的uuid格式错误",-1)
		this.ServeJSON()
		return
	}
	beego.Debug("推送服务器数据到cmdb,服务器uuid是",serverUuid)

	pServerObj ,err := m.ServerGetByuuId(serverUuid)
	if err != nil || pServerObj == nil{
		this.Data["json"] = this.ResponseSuccessJSON(false,"没有找到server uuid对应的记录",-1)
		this.ServeJSON()
		return
	}

	beego.Debug("推送服务器网络信息是",metadata.Value)
	interfaceList := metadata.Value
	for _,inter :=range interfaceList{
		beego.Debug("逻辑网卡接口信息是",inter)
		networkAdapter := new(m.NetworkAdapter)
		networkAdapter.Server = pServerObj
		networkAdapter.Name = inter.Name
		networkAdapter.HardwareAddr = inter.HardwareAddr
		networkAdapter.Addrs = FormatInterfaceAddr(inter.Addrs)
		networkAdapter.Mtu = int64(inter.MTU)
		networkAdapter.Flags = strings.Join(inter.Flags,",")
		err := networkAdapter.UpdateOrCreate()

		if err == nil{
			pServerObj.Adapter = append(pServerObj.Adapter,networkAdapter)
		}
	}

	if err != nil{
		beego.Error("设置服务器网络接口信息错误",err.Error())
		this.Data["json"] = this.ResponseSuccessJSON(true,"Push网络接口数据失败",-1)
	}else{
		this.Data["json"] = this.ResponseSuccessJSON(true,"Push网络接口数据成功",1)
	}
	this.ServeJSON()
}

// @Title push server harddisk data into cmdb
// @Description 上报服务器harddisk数据
// @Success 200 {map} map[string]interface{}
// @Param   uuid            query   string  true   "服务器uuid"
// @Param   Authorization   header  string true   "认证信息"
// @Param   timestamp       query   string true   "时间戳"
// @Failure 400 上报服务器harddisk数据
// @router /push/harddisk/:uuid [post]
func (this *ServerController) PushServerHarddisk() {

	serverUuid := this.Ctx.Input.Param(":uuid")

	var metadata api.HardDiskMetaData
	json.Unmarshal(this.Ctx.Input.RequestBody, &metadata)
	beego.Debug("推送服务器数据到cmdb,发送的JSON数据是",metadata)

	if uuid.Parse(serverUuid) == nil{
		this.Data["json"] = this.ResponseSuccessJSON(false,"推送服务器数据的uuid格式错误",-1)
		this.ServeJSON()
	}
	beego.Debug("推送服务器数据到cmdb,服务器uuid是",serverUuid)

	pServerObj ,err := m.ServerGetByuuId(serverUuid)
	if err != nil || pServerObj == nil{
		this.Data["json"] = this.ResponseSuccessJSON(false,"没有找到server uuid对应的记录",-1)
		this.ServeJSON()
	}

	//push disk
	beego.Debug("推送服务器磁盘分区信息是",metadata.Value)
	diskPartList := metadata.Value
	for _, disk :=range diskPartList{
		beego.Debug("磁盘分区信息是",disk)
		serverDisk := new(m.Harddisk)
		serverDisk.Server = pServerObj
		serverDisk.Device = disk.Device
		serverDisk.Fstype = disk.Fstype
		serverDisk.Mountpoint = disk.Mountpoint
		serverDisk.Opts = disk.Opts
		err := serverDisk.UpdateOrCreate()
		if err == nil{
			pServerObj.Harddisk = append(pServerObj.Harddisk,serverDisk)
		}
	}
	if err != nil{
		beego.Error("设置服务器磁盘信息错误",err.Error())
		this.Data["json"] = this.ResponseSuccessJSON(true,"Push磁盘数据失败",-1)
	}else{
		this.Data["json"] = this.ResponseSuccessJSON(true,"Push磁盘数据成功",1)
	}

	this.ServeJSON()
}

// @Title push server Memory data into cmdb
// @Description 上报服务器Memory数据
// @Success 200 {map} map[string]interface{}
// @Param   uuid            query   string  true   "服务器uuid"
// @Param   Authorization   header  string true   "认证信息"
// @Param   timestamp       query   string true   "时间戳"
// @Failure 400 上报服务器Memory数据
// @router /push/memory/:uuid [post]
func (this *ServerController) PushServerMemory() {

	serverUuid := this.Ctx.Input.Param(":uuid")

	var metadata api.MemoryMetaData
	json.Unmarshal(this.Ctx.Input.RequestBody, &metadata)
	beego.Debug("推送服务器数据到cmdb,发送的JSON数据是",metadata)

	if uuid.Parse(serverUuid) == nil{
		this.Data["json"] = this.ResponseSuccessJSON(false,"推送服务器数据的uuid格式错误",-1)
		this.ServeJSON()
		return
	}
	beego.Debug("推送服务器数据到cmdb,服务器uuid是",serverUuid)

	pServerObj ,err := m.ServerGetByuuId(serverUuid)
	if err != nil || pServerObj == nil{
		this.Data["json"] = this.ResponseSuccessJSON(false,"没有找到server uuid对应的记录",-1)
		this.ServeJSON()
		return
	}

	systemMemory := metadata.Value
	beego.Debug("推送服务器的系统内存信息是",systemMemory)
	serverMemory := new(m.Memory)
	serverMemory.Server = pServerObj
	serverMemory.SwapUsedPercent = systemMemory.SwapUsedPercent
	serverMemory.SwapUsed = systemMemory.SwapUsed
	serverMemory.SwapFree = systemMemory.SwapFree
	serverMemory.SwapTotal = systemMemory.SwapTotal
	serverMemory.VirtualFree = systemMemory.VirtualFree
	serverMemory.VirtualUsedPercent = systemMemory.VirtualUsedPercent
	serverMemory.VirtualUsed = systemMemory.VirtualUsed
	serverMemory.VirtualAvailable = systemMemory.VirtualAvailable
	serverMemory.VirtualTotal = systemMemory.VirtualTotal
	serverMemory.UpdateOrCreate()
	pServerObj.Memory = append(pServerObj.Memory,serverMemory)
	err =pServerObj.UpdateServer()
	if err != nil{
		beego.Error("设置服务器内存信息错误",err.Error())
		this.Data["json"] = this.ResponseSuccessJSON(true,"Push内存数据失败",-1)
	}else{
		this.Data["json"] = this.ResponseSuccessJSON(true,"Push内存数据成功",1)
	}

	this.ServeJSON()
}

// @Title push server port data into cmdb
// @Description 上报服务器port数据
// @Success 200 {map} map[string]interface{}
// @Param   uuid            query   string  true   "服务器uuid"
// @Param   Authorization   header  string true   "认证信息"
// @Param   timestamp       query   string true   "时间戳"
// @Failure 400 上报服务器Port数据
// @router /push/port/:uuid [post]
func (this *ServerController) PushServerPort() {

	serverUuid := this.Ctx.Input.Param(":uuid")

	var metadata api.PortMetaData
	json.Unmarshal(this.Ctx.Input.RequestBody, &metadata)
	beego.Debug("推送服务器数据到cmdb,发送的JSON数据是",metadata)

	if uuid.Parse(serverUuid) == nil{
		this.Data["json"] = this.ResponseSuccessJSON(false,"推送服务器数据的uuid格式错误",-1)
		this.ServeJSON()
		return
	}
	beego.Debug("推送服务器数据到cmdb,服务器uuid是",serverUuid)

	pServerObj ,err := m.ServerGetByuuId(serverUuid)
	if err != nil || pServerObj == nil{
		this.Data["json"] = this.ResponseSuccessJSON(false,"没有找到server uuid对应的记录",-1)
		this.ServeJSON()
		return
	}
	systemPortList := metadata.Value
	beego.Debug("推送服务器端口信息是",systemPortList)
	for _,port := range systemPortList{
		serverPort := new(m.ServerPort)
		serverPort.Ip = port.Ip
		serverPort.Port=port.Port
		serverPort.Proccess = port.Proccess
		serverPort.Server = pServerObj
		if serverPort.ExistPort() == true{
			beego.Debug("端口信息已经存在,更新端口信息")
			if serverPort.GetServerPort() == nil {
				err := serverPort.UpdatePort()
				if err != nil{
					beego.Debug(err.Error())
				}
			}
		}else{
			_,err := serverPort.Save()
			if err != nil{
				beego.Debug("保存服务器端口信息错误",err.Error())
			}else{
				pServerObj.ServerPort = append(pServerObj.ServerPort,serverPort)
			}
		}

	}
	beego.Debug("开始设置服务器端口信息")
	err = pServerObj.UpdateServer()
	beego.Debug("结束设置服务器端口信息")
	if err != nil{
		beego.Error("设置服务器端口信息错误",err.Error())
		this.Data["json"] = this.ResponseSuccessJSON(false,"Push端口数据失败",-1)
	}else{
		this.Data["json"] = this.ResponseSuccessJSON(true,"Push端口数据成功",1)
	}
	this.ServeJSON()
}

type PullServerResponse struct {
	ServerTable [][]string `json:"server_table"`
}

// @Title pull server data into tui
// @Description 拉取服务器数据
// @Success 200 {map} map[string]interface{}
// @Param   uuid            query   string  true   "服务器uuid"
// @Param   Authorization   header  string true   "认证信息"
// @Param   timestamp       query   string true   "时间戳"
// @Failure 400 上报服务器数据
// @router /pull [get]
func (this *ServerController) PullServer() {

	//获取server uuid 与 name 方便运维通过这两个字段进行维护
	serverList,err := m.PullServer()
	if err != nil{
		beego.Error("pull数据发生错误，错误是",err.Error())
		this.Data["json"] = this.ResponseSuccessJSON(false,"Pull数据失败",1)
		return
	}else{
		//构建server tui 表格
		var serverTable [][]string
		for _,pServer :=range serverList{
			serverRow :=[]string{pServer.Hostname,pServer.ServerUuid,pServer.State.State,pServer.Ipaddress}
			serverTable = append(serverTable, serverRow)
		}
		pullServerResponse := PullServerResponse{
			ServerTable:serverTable,
		}
		this.Data["json"] = pullServerResponse
	}
	this.ServeJSON()
}

// @Title 根据server id 获取端口资源
// @Description 根据server id 获取端口资源
// @Success 200 {map} map[string]interface{}
// @Param   Authorization   header  string true   "认证信息"
// @Param   timestamp       query   string true   "时间戳"
// @Failure 400 根据server id 获取端口资源
// @router /port [get]
func (this *ServerController) GetPortByServerId() {
	serverId := this.GetString("serverid", "")
	portList := m.GetPortByServerId(serverId)
	this.Data["json"] = portList
	this.ServeJSON()
}

