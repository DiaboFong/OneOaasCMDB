package job

import (
	"flag"
	"fmt"
	"github.com/astaxie/beego"
	"github.com/jasonlvhit/gocron"
	"github.com/vmware/govmomi"
	"github.com/vmware/govmomi/find"
	"github.com/vmware/govmomi/property"
	"github.com/vmware/govmomi/vim25/mo"
	"github.com/vmware/govmomi/vim25/types"
	"golang.org/x/net/context"
	"net/url"
	"oneoaas.com/cmdb/models"
	"os"
	"sort"
)

var urlDescription = fmt.Sprintf("ESX or vCenter URL")
var urlFlag = flag.String("url", beego.AppConfig.String("VmUrl"), urlDescription)
var insecureDescription = fmt.Sprintf("Don't verify the server's certificate chain")
var VmInsecure, _ = beego.AppConfig.Bool("VmInsecure")
var insecureFlag = flag.Bool("insecure", VmInsecure, insecureDescription)

func exit(err error) {
	fmt.Fprintf(os.Stderr, "Error: %s\n", err)
	os.Exit(1)
}

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

//同步vmware
func SyncVmware() {
	s := gocron.NewScheduler()
	iTimeInterval, err := beego.AppConfig.Int64("VmSyncTimeInterval")
	if err != nil || iTimeInterval <= 0 {
		iTimeInterval = int64(60)
	}
	s.Every(uint64(iTimeInterval)).Seconds().Do(syncRemoteToLocal)
	<-s.Start()
}

var ctx context.Context
var cancel context.CancelFunc
var c *govmomi.Client
var f *find.Finder

func init() {
	vmOn, _ := beego.AppConfig.Bool("VmOn")
	if vmOn {
		ctx, cancel = context.WithCancel(context.Background())
		flag.Parse()
		u, err := url.Parse(*urlFlag)
		fmt.Printf("u==>%v\n", u)
		if err != nil {
			beego.Error("解析URL发生错误", err.Error())
		}
		c, err = govmomi.NewClient(ctx, u, true)
		if err != nil {
			beego.Error("构建客户端错误", err.Error())
		}
		f = find.NewFinder(c.Client, true)
	}

}

//同步远程vmware信息
func syncRemoteToLocal() {
	dc, err := f.DefaultDatacenter(ctx)
	if err != nil {
		beego.Error("查找默认数据中心错误", err.Error())
	}

	f.SetDatacenter(dc)

	vms, err := f.VirtualMachineList(ctx, "*")
	if err != nil {
		beego.Error("查找虚拟机列表错误", err.Error())
	}

	pc := property.DefaultCollector(c.Client)
	var refs []types.ManagedObjectReference
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
	}

	sort.Sort(ByName(vmt))
	for _, vmObj := range vmt {
		if vmObj.Config == nil {
			continue
		}
		vm := models.VmVmware{
			Name:              vmObj.Name,
			Template:          true,
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
		}
		_, err := vm.AddVmVmware(vm)
		if err != nil {
			beego.Error(err.Error())
		}
	}

}
