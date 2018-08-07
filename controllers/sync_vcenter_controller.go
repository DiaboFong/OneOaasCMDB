package controllers

import (
	"github.com/astaxie/beego"
	"github.com/vmware/govmomi/vim25/mo"
	"github.com/vmware/govmomi"
	"github.com/vmware/govmomi/find"
	"github.com/vmware/govmomi/property"
	"sort"
	"github.com/vmware/govmomi/vim25/types"
	"golang.org/x/net/context"
	"oneoaas.com/cmdb/models"
	"net/http"
	"net/url"
	"github.com/vmware/govmomi/object"
)

type ByName []mo.VirtualMachine

func (n ByName) Len() int {
	return len(n)
}
func (n ByName) Swap(i, j int) {
	n[i], n[j] = n[j], n[i]
}
func (n ByName) Less(i, j int) bool {
	return n[i].Name < n[j].Name
}

// @Title syncvcenter
// @Description 同步远程vmware信息
// @Success 200 {map} map[string]interface{}
// @Param   id              query   int64   true  "云帐号ID"
// @Param   Authorization   header  string  true  "认证信息"
// @Param   timestamp       query   string  true  "时间戳"
// @Failure 400 同步远程vmware信息
// @router / [post]
func (this *SyncVcenterController)SyncVcenterRemoteToLocal() {
	var ctx context.Context
	var vmwareClient *govmomi.Client
	var vmwareFinder *find.Finder

	var id, _ = this.GetInt64("id", 0)
	var VmUrl = models.GetVcenterAccountDetail(id)

	//初始化
	ctx, _ = context.WithCancel(context.Background())
	u, err := url.Parse(VmUrl)

	if err != nil {
		beego.Error("解析URL发生错误", err.Error())
		this.ResponseErrorJSON(http.StatusOK, "解析URL发生错误")
	}

	vmwareClient, err = govmomi.NewClient(ctx, u, true)
	if err != nil {
		beego.Error("构建客户端错误", err.Error())
		this.ResponseErrorJSON(http.StatusOK, "构建客户端错误")
	}

	vmwareFinder = find.NewFinder(vmwareClient.Client, true)

	dc, err := vmwareFinder.DefaultDatacenter(ctx)
	if err != nil {
		beego.Error("查找默认数据中心错误", err.Error())
		this.ResponseErrorJSON(http.StatusOK, "查找默认数据中心错误")
	}

	vmwareFinder.SetDatacenter(dc)
	datacenters,_ := vmwareFinder.DatacenterList(ctx,"*")

	vms, err := vmwareFinder.VirtualMachineList(ctx,"*")
	if err != nil {
		beego.Error("查找虚拟机列表错误", err.Error())
		this.ResponseErrorJSON(http.StatusOK, "查找虚拟机列表错误2")
	}

	pc := property.DefaultCollector(vmwareClient.Client)
	var refs []types.ManagedObjectReference
	for _, datacenter := range datacenters {
		datacenterFolders,_ := datacenter.Folders(ctx)
		references,_ := datacenterFolders.VmFolder.Children(ctx)

		for _, ref := range references{
			if ref.Reference().Type == "Folder"{
				folder := object.NewFolder(vmwareClient.Client,ref.Reference())
				childRefs , _ := folder.Children(ctx)
				for _, child := range childRefs {
					refs = append(refs, child.Reference())
				}
			}
		}
	}
	for _, vm := range vms {
		refs = append(refs, vm.Reference())
	}

	var vmt []mo.VirtualMachine
	err = pc.Retrieve(ctx, refs, []string{"capability", "config", "layout", "layoutEx", "storage",
		"environmentBrowser", "resourcePool", "parentVApp", "resourceConfig",
		"runtime", "guest", "summary", "datastore", "network", "snapshot",
		"rootSnapshot", "guestHeartbeatStatus"}, &vmt)

	if err != nil {
		beego.Error("查找虚拟机列表错误", err.Error())
		this.ResponseErrorJSON(http.StatusOK, "查找虚拟机列表错误")
	}
	sort.Sort(ByName(vmt))

	var vmCount int64
	for _, vmObj := range vmt {
		if vmObj.Config == nil {
			continue
		}
		vm := models.VmVmware{
			Name:              vmObj.Summary.Config.Name,
			Template:          vmObj.Summary.Config.Template,
			VmPathName:        vmObj.Summary.Config.VmPathName,
			MemorySize:        vmObj.Summary.Config.MemorySizeMB,
			CpuReservation:    vmObj.Summary.Config.CpuReservation,
			MemoryReservation: vmObj.Summary.Config.MemoryReservation,
			NumCpu:            vmObj.Summary.Config.NumCpu,
			NumEthernetCards:  vmObj.Summary.Config.NumEthernetCards,
			NumVirtualDisks:   vmObj.Summary.Config.NumVirtualDisks,
			Uuid:              vmObj.Config.Uuid,
			InstanceUuid:      vmObj.Config.InstanceUuid,
			GuestId:           vmObj.Config.GuestId,
			GuestFullname:     vmObj.Config.GuestFullName,
			Annotation:        vmObj.Config.Annotation,
			Enable:			   true,
		}

		_,err = vm.AddVmVmware(vm)
		if err != nil{
			beego.Error("添加vcenter虚拟机错误",err.Error())
		}
		vmCount++
	}

	if err != nil {
		this.Data["json"] = this.ResponseSuccessJSON(false, "同步失败", -1)
	} else {
		this.Data["json"] = this.ResponseSuccessJSON(true, "同步成功", 100)
	}
	this.ServeJSON()
}