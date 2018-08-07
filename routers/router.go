// @APIVersion 1.3.2
// @Title oneoaas-cmdb api
// @Description oneoaas-cmdb open api docs
// @Contact bin.liu@oneoaas.com
// @TermsOfServiceUrl http://oneoaas.com
// @License Apache 2.0
// @LicenseUrl http://www.apache.org/licenses/LICENSE-2.0.html
package routers

import (
	"github.com/astaxie/beego"
	"oneoaas.com/cmdb/controllers"
)

func init() {

	beego.Router("/*", &controllers.MainController{})
	beego.Router("/pdfview", &controllers.PdfViewController{})
	beego.Router("/api/endpoint", &controllers.MainController{}, "get:Endpoint")
	beego.Router("/api/logout", &controllers.LogoutController{}, "get:Get")
	beego.Router("/api/user", &controllers.UserController{}, "get:GetUser;post:AddUser;put:PutUser;delete:DelUser")
	beego.Router("/api/systememail", &controllers.SystemEmailController{}, "post:AddEmail")
	beego.Router("/api/systemlog", &controllers.SystemLogController{}, "get:GetLog;delete:DelLog")

	beego.Router("/api/SyncZabbix", &controllers.SyncZabbixController{}, "post:SyncZabbixRemoteToLocal")

	beego.Router("/api/role", &controllers.RoleController{}, "get:GetRole;post:AddRole;put:PutRole;delete:DelRole")
	beego.Router("/api/editrolemenus", &controllers.UserController{}, "get:GetEditRoleMenus")

	//导入导出功能
	beego.Router("/api/import", &controllers.ImportController{}, "post:Import")
	beego.Router("/api/export", &controllers.ExportController{}, "get:Export")
	beego.Router("/api/importphoto", &controllers.ImportPhotoController{}, "post:ImportPhoto")
	beego.Router("/api/download", &controllers.DownloadController{}, "post:Download")
	beego.Router("/api/uploadagreement", &controllers.UploadController{}, "get:ReadAgreement;post:UploadAgreement")

	beego.Router("/api/dnspodrecord", &controllers.DnspodrecordController{}, "get:GetDnspodrecord;post:AddDnspodrecord;delete:DelDnspodrecord")
	beego.Router("/api/dnspodtoken", &controllers.DnspodtokenController{}, "get:GetDnspodtoken;post:AddDnspodtoken;put:PutDnspodtoken;delete:DelDnspodtoken")

	beego.Router("/api/software", &controllers.SoftwareController{}, "get:GetSoftware;post:AddSoftware;put:PutSoftware;delete:DelSoftware")
	beego.Router("/api/accesskey", &controllers.AccessKeyController{}, "get:GetAccessKey;post:AddAccessKey;put:UpdateAccessKey;delete:DelAccessKey")
	beego.Router("/api/ci", &controllers.CiController{}, "get:GetCi;post:AddCi;put:UpdateCi;delete:DelCi")

	beego.Router("/licence", &controllers.LicenceController{}, "get:GetLicence")
	//api重构
	ns := beego.NewNamespace("/api",
		beego.NSNamespace("/datacenter",
			beego.NSInclude(
				&controllers.DatacenterController{},
				&controllers.DcRegionController{},
			),
		),
		beego.NSNamespace("/state",
			beego.NSInclude(
				&controllers.DcStateController{},
				&controllers.RoomStateController{},
				&controllers.RackStateController{},
				&controllers.NetworkBandwidthStateController{},
				&controllers.HardwareStateController{},
				&controllers.ServerStateController{},
				&controllers.DnspoddomainStateController{},
			),
		),
		beego.NSNamespace("/room",
			beego.NSInclude(
				&controllers.RoomController{},
			),
		),
		beego.NSNamespace("/rack",
			beego.NSInclude(
				&controllers.RackController{},
			),
		),
		beego.NSNamespace("/networkbandwidth",
			beego.NSInclude(
				&controllers.NetworkbandwidthController{},
				&controllers.InternetServiceProviderController{},
			),
		),
		beego.NSNamespace("/hardware",
			beego.NSInclude(
				&controllers.HardwareController{},
				&controllers.HardwareTypeController{},
			),
		),
		beego.NSNamespace("/server",
			beego.NSInclude(
				&controllers.ServerController{},
				&controllers.ManufacturerController{},
				&controllers.HostController{},
			),
		),
		beego.NSNamespace("/cpu",
			beego.NSInclude(
				&controllers.CpuController{},
			),
		),
		beego.NSNamespace("/memory",
			beego.NSInclude(
				&controllers.MemoryController{},
			),
		),
		beego.NSNamespace("/harddisk",
			beego.NSInclude(
				&controllers.HarddiskController{},
			),
		),
		beego.NSNamespace("/networkadapter",
			beego.NSInclude(
				&controllers.NetworkAdapterController{},
			),
		),
		beego.NSNamespace("/ip",
			beego.NSInclude(
				&controllers.IpController{},
			),
		),
		beego.NSNamespace("/subnet",
			beego.NSInclude(
				&controllers.IpSubNetController{},
			),
		),
		beego.NSNamespace("/dnspoddomain",
			beego.NSInclude(
				&controllers.DnspoddomainController{},
				&controllers.DnspoddomainGradeController{},
			),
		),
		beego.NSNamespace("/supplier",
			beego.NSInclude(
				&controllers.SupplierController{},
			),
		),
		beego.NSNamespace("/app",
			beego.NSInclude(
				&controllers.AppController{},
				&controllers.AppLevelController{},
			),
		),
		beego.NSNamespace("/ResourcePlatformAccount",
			beego.NSInclude(
				&controllers.ResourcePlatformAccountController{},
			),
		),
		beego.NSNamespace("/SyncVcenter",
			beego.NSInclude(
				&controllers.SyncVcenterController{},
			),
		),
		beego.NSNamespace("/SyncAliyun",
			beego.NSInclude(
				&controllers.SyncAliyunController{},
			),
		),
		beego.NSNamespace("/SyncAws",
			beego.NSInclude(
				&controllers.SyncAwsController{},
			),
		),
		beego.NSNamespace("/vcenter",
			beego.NSInclude(
				&controllers.VcenterController{},
			),
		),
		beego.NSNamespace("/aliyun",
			beego.NSInclude(
				&controllers.AliyunController{},
			),
		),
		beego.NSNamespace("/aws",
			beego.NSInclude(
				&controllers.AwsController{},
			),
		),
		beego.NSNamespace("/menus",
			beego.NSInclude(
				&controllers.MenuController{},
			),
		),
		beego.NSNamespace("/assets",
			beego.NSInclude(
				&controllers.AssetsController{},
			),
			//beego.NSRouter("/:id", &controllers.AssetsController{},"get:GetAssetsById"),
			beego.NSNamespace("/instance",
				beego.NSInclude(
					&controllers.AssertsInstanceController{},
				),
			),
		),
		beego.NSNamespace("/login",
			beego.NSInclude(
				&controllers.LoginController{},
			),
		),
		beego.NSNamespace("/topo",
			beego.NSRouter("/node", &controllers.TopoNodeController{}, "get:Get;post:Add;put:Update;delete:Delete"),
			beego.NSRouter("/line", &controllers.TopoLineController{}, "get:Get;post:Add;put:Update;delete:Delete"),
			beego.NSRouter("/view", &controllers.TopoViewController{}, "get:Get;post:Add;put:Update;delete:Delete"),
		),
		beego.NSNamespace("/v2",
			beego.NSRouter("/datacenter", &controllers.DatacenterController{}, "get:QueryDatacenter"),
			beego.NSRouter("/dashboard", &controllers.DashboardController{}, "get:GetUsageRate"),
		),
		beego.NSNamespace("/statecolor",
			beego.NSInclude(
				&controllers.StateColorController{},
			),
		),
		beego.NSNamespace("/report",
			beego.NSNamespace("/resource",
				beego.NSInclude(
					&controllers.ResourceReportController{},
				),
			),
			beego.NSNamespace("/device",
				beego.NSInclude(
					&controllers.DevicePerformanceReportController{},
				),
			),
			beego.NSNamespace("/financial",
				beego.NSInclude(
					&controllers.DevicePerformanceReportController{},
				),
			),
		),
		beego.NSNamespace("/system",
			beego.NSInclude(
				&controllers.LicenceController{},
			),
		),
		beego.NSNamespace("/change",
			beego.NSInclude(
				&controllers.ChangeController{},
			),
		),
		beego.NSNamespace("/apicall",
			beego.NSInclude(
				&controllers.ApiCallController{},
			),
		),
		beego.NSNamespace("/dashboard",
			beego.NSInclude(
				&controllers.DashboardController{},
			),
		),
	)
	beego.AddNamespace(ns)

}
