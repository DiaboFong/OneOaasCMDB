package routers

import (
	"github.com/astaxie/beego"
)

func init() {

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:AliyunController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:AliyunController"],
		beego.ControllerComments{
			Method: "GetVM",
			Router: `/`,
			AllowHTTPMethods: []string{"get"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:AliyunController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:AliyunController"],
		beego.ControllerComments{
			Method: "AddAliyun",
			Router: `/`,
			AllowHTTPMethods: []string{"post"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:AliyunController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:AliyunController"],
		beego.ControllerComments{
			Method: "DelAliyun",
			Router: `/`,
			AllowHTTPMethods: []string{"delete"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:AliyunController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:AliyunController"],
		beego.ControllerComments{
			Method: "PutAliyun",
			Router: `/`,
			AllowHTTPMethods: []string{"put"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:ApiCallController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:ApiCallController"],
		beego.ControllerComments{
			Method: "GetApiCallRecord",
			Router: `/`,
			AllowHTTPMethods: []string{"get"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:AppController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:AppController"],
		beego.ControllerComments{
			Method: "GetApp",
			Router: `/`,
			AllowHTTPMethods: []string{"get"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:AppController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:AppController"],
		beego.ControllerComments{
			Method: "AddApp",
			Router: `/`,
			AllowHTTPMethods: []string{"post"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:AppController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:AppController"],
		beego.ControllerComments{
			Method: "DelApp",
			Router: `/`,
			AllowHTTPMethods: []string{"delete"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:AppController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:AppController"],
		beego.ControllerComments{
			Method: "PutApp",
			Router: `/`,
			AllowHTTPMethods: []string{"put"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:AppLevelController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:AppLevelController"],
		beego.ControllerComments{
			Method: "GetAppLevel",
			Router: `/level`,
			AllowHTTPMethods: []string{"get"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:AppLevelController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:AppLevelController"],
		beego.ControllerComments{
			Method: "AddAppLevel",
			Router: `/level`,
			AllowHTTPMethods: []string{"post"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:AppLevelController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:AppLevelController"],
		beego.ControllerComments{
			Method: "DelAppLevel",
			Router: `/level`,
			AllowHTTPMethods: []string{"delete"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:AppLevelController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:AppLevelController"],
		beego.ControllerComments{
			Method: "PutAppLevel",
			Router: `/level`,
			AllowHTTPMethods: []string{"put"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:AssertsInstanceController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:AssertsInstanceController"],
		beego.ControllerComments{
			Method: "GetAssetsInstance",
			Router: `/`,
			AllowHTTPMethods: []string{"get"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:AssetsController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:AssetsController"],
		beego.ControllerComments{
			Method: "GetAssets",
			Router: `/`,
			AllowHTTPMethods: []string{"get"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:AssetsController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:AssetsController"],
		beego.ControllerComments{
			Method: "GetAssetsById",
			Router: `/:id`,
			AllowHTTPMethods: []string{"get"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:AssetsController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:AssetsController"],
		beego.ControllerComments{
			Method: "AddAssets",
			Router: `/`,
			AllowHTTPMethods: []string{"post"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:AwsController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:AwsController"],
		beego.ControllerComments{
			Method: "GetVM",
			Router: `/`,
			AllowHTTPMethods: []string{"get"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:AwsController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:AwsController"],
		beego.ControllerComments{
			Method: "AddAws",
			Router: `/`,
			AllowHTTPMethods: []string{"post"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:AwsController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:AwsController"],
		beego.ControllerComments{
			Method: "DelAws",
			Router: `/`,
			AllowHTTPMethods: []string{"delete"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:AwsController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:AwsController"],
		beego.ControllerComments{
			Method: "PutAws",
			Router: `/`,
			AllowHTTPMethods: []string{"put"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:ChangeController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:ChangeController"],
		beego.ControllerComments{
			Method: "GetAddChangeRecord",
			Router: `/`,
			AllowHTTPMethods: []string{"get"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:CpuController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:CpuController"],
		beego.ControllerComments{
			Method: "GetAll",
			Router: `/`,
			AllowHTTPMethods: []string{"get"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:CpuController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:CpuController"],
		beego.ControllerComments{
			Method: "GetCpuByServerId",
			Router: `/query`,
			AllowHTTPMethods: []string{"get"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:CpuController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:CpuController"],
		beego.ControllerComments{
			Method: "AddCpu",
			Router: `/`,
			AllowHTTPMethods: []string{"post"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:CpuController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:CpuController"],
		beego.ControllerComments{
			Method: "CountCpu",
			Router: `/count`,
			AllowHTTPMethods: []string{"get"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:DashboardController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:DashboardController"],
		beego.ControllerComments{
			Method: "CountAssets",
			Router: `/count`,
			AllowHTTPMethods: []string{"get"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:DashboardController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:DashboardController"],
		beego.ControllerComments{
			Method: "GetUsageRate",
			Router: `/usage`,
			AllowHTTPMethods: []string{"get"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:DashboardController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:DashboardController"],
		beego.ControllerComments{
			Method: "GetUsageRateByRackU",
			Router: `/uposition`,
			AllowHTTPMethods: []string{"get"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:DashboardController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:DashboardController"],
		beego.ControllerComments{
			Method: "CountDevice",
			Router: `/device`,
			AllowHTTPMethods: []string{"get"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:DashboardController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:DashboardController"],
		beego.ControllerComments{
			Method: "CountAssetsByMonth",
			Router: `/countByMonth`,
			AllowHTTPMethods: []string{"get"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:DatacenterController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:DatacenterController"],
		beego.ControllerComments{
			Method: "GetDatacenter",
			Router: `/`,
			AllowHTTPMethods: []string{"get"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:DatacenterController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:DatacenterController"],
		beego.ControllerComments{
			Method: "ValidDatacenter",
			Router: `/valid`,
			AllowHTTPMethods: []string{"get"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:DatacenterController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:DatacenterController"],
		beego.ControllerComments{
			Method: "AddDatacenter",
			Router: `/`,
			AllowHTTPMethods: []string{"post"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:DatacenterController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:DatacenterController"],
		beego.ControllerComments{
			Method: "DelDatacenter",
			Router: `/`,
			AllowHTTPMethods: []string{"delete"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:DatacenterController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:DatacenterController"],
		beego.ControllerComments{
			Method: "PutDatacenter",
			Router: `/`,
			AllowHTTPMethods: []string{"put"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:DcRegionController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:DcRegionController"],
		beego.ControllerComments{
			Method: "GetDcRegion",
			Router: `/region`,
			AllowHTTPMethods: []string{"get"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:DcRegionController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:DcRegionController"],
		beego.ControllerComments{
			Method: "AddDcRegion",
			Router: `/region`,
			AllowHTTPMethods: []string{"post"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:DcRegionController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:DcRegionController"],
		beego.ControllerComments{
			Method: "DelDcRegion",
			Router: `/region`,
			AllowHTTPMethods: []string{"delete"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:DcRegionController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:DcRegionController"],
		beego.ControllerComments{
			Method: "PutDcRegion",
			Router: `/region`,
			AllowHTTPMethods: []string{"put"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:DcStateController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:DcStateController"],
		beego.ControllerComments{
			Method: "GetDcState",
			Router: `/datacenter`,
			AllowHTTPMethods: []string{"get"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:DcStateController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:DcStateController"],
		beego.ControllerComments{
			Method: "AddDcState",
			Router: `/datacenter`,
			AllowHTTPMethods: []string{"post"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:DcStateController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:DcStateController"],
		beego.ControllerComments{
			Method: "DelDcState",
			Router: `/datacenter`,
			AllowHTTPMethods: []string{"delete"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:DcStateController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:DcStateController"],
		beego.ControllerComments{
			Method: "PutDcState",
			Router: `/datacenter`,
			AllowHTTPMethods: []string{"put"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:DevicePerformanceReportController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:DevicePerformanceReportController"],
		beego.ControllerComments{
			Method: "Post",
			Router: `/`,
			AllowHTTPMethods: []string{"post"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:DevicePerformanceReportController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:DevicePerformanceReportController"],
		beego.ControllerComments{
			Method: "GetOne",
			Router: `/:id`,
			AllowHTTPMethods: []string{"get"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:DevicePerformanceReportController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:DevicePerformanceReportController"],
		beego.ControllerComments{
			Method: "GetAll",
			Router: `/performance`,
			AllowHTTPMethods: []string{"get"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:DevicePerformanceReportController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:DevicePerformanceReportController"],
		beego.ControllerComments{
			Method: "Put",
			Router: `/:id`,
			AllowHTTPMethods: []string{"put"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:DevicePerformanceReportController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:DevicePerformanceReportController"],
		beego.ControllerComments{
			Method: "Delete",
			Router: `/:id`,
			AllowHTTPMethods: []string{"delete"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:DnspoddomainController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:DnspoddomainController"],
		beego.ControllerComments{
			Method: "GetDnspoddomain",
			Router: `/`,
			AllowHTTPMethods: []string{"get"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:DnspoddomainController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:DnspoddomainController"],
		beego.ControllerComments{
			Method: "AddDnspoddomain",
			Router: `/`,
			AllowHTTPMethods: []string{"post"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:DnspoddomainController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:DnspoddomainController"],
		beego.ControllerComments{
			Method: "DelDnspoddomain",
			Router: `/`,
			AllowHTTPMethods: []string{"delete"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:DnspoddomainController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:DnspoddomainController"],
		beego.ControllerComments{
			Method: "PutDnspoddomain",
			Router: `/`,
			AllowHTTPMethods: []string{"put"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:DnspoddomainGradeController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:DnspoddomainGradeController"],
		beego.ControllerComments{
			Method: "GetDnspoddomainGrade",
			Router: `/grade`,
			AllowHTTPMethods: []string{"get"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:DnspoddomainGradeController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:DnspoddomainGradeController"],
		beego.ControllerComments{
			Method: "AddDnspoddomainGrade",
			Router: `/grade`,
			AllowHTTPMethods: []string{"post"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:DnspoddomainGradeController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:DnspoddomainGradeController"],
		beego.ControllerComments{
			Method: "DelDnspoddomainGrade",
			Router: `/grade`,
			AllowHTTPMethods: []string{"delete"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:DnspoddomainGradeController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:DnspoddomainGradeController"],
		beego.ControllerComments{
			Method: "PutDnspoddomainGrade",
			Router: `/grade`,
			AllowHTTPMethods: []string{"put"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:DnspoddomainStateController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:DnspoddomainStateController"],
		beego.ControllerComments{
			Method: "GetDnspoddomainState",
			Router: `/dnspoddomain`,
			AllowHTTPMethods: []string{"get"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:DnspoddomainStateController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:DnspoddomainStateController"],
		beego.ControllerComments{
			Method: "AddDnspoddomainState",
			Router: `/dnspoddomain`,
			AllowHTTPMethods: []string{"post"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:DnspoddomainStateController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:DnspoddomainStateController"],
		beego.ControllerComments{
			Method: "DelDnspoddomainState",
			Router: `/dnspoddomain`,
			AllowHTTPMethods: []string{"delete"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:DnspoddomainStateController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:DnspoddomainStateController"],
		beego.ControllerComments{
			Method: "PutDnspoddomainState",
			Router: `/dnspoddomain`,
			AllowHTTPMethods: []string{"put"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:FinancialReportController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:FinancialReportController"],
		beego.ControllerComments{
			Method: "Post",
			Router: `/`,
			AllowHTTPMethods: []string{"post"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:FinancialReportController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:FinancialReportController"],
		beego.ControllerComments{
			Method: "GetOne",
			Router: `/:id`,
			AllowHTTPMethods: []string{"get"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:FinancialReportController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:FinancialReportController"],
		beego.ControllerComments{
			Method: "Detail",
			Router: `/detail`,
			AllowHTTPMethods: []string{"get"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:FinancialReportController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:FinancialReportController"],
		beego.ControllerComments{
			Method: "Trend",
			Router: `/trend`,
			AllowHTTPMethods: []string{"get"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:FinancialReportController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:FinancialReportController"],
		beego.ControllerComments{
			Method: "BusinessCostCompared",
			Router: `/bcc`,
			AllowHTTPMethods: []string{"get"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:FinancialReportController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:FinancialReportController"],
		beego.ControllerComments{
			Method: "ResourcesCostCompared",
			Router: `/rcc`,
			AllowHTTPMethods: []string{"get"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:FinancialReportController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:FinancialReportController"],
		beego.ControllerComments{
			Method: "Put",
			Router: `/:id`,
			AllowHTTPMethods: []string{"put"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:FinancialReportController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:FinancialReportController"],
		beego.ControllerComments{
			Method: "Delete",
			Router: `/:id`,
			AllowHTTPMethods: []string{"delete"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:HarddiskController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:HarddiskController"],
		beego.ControllerComments{
			Method: "AddHarddisk",
			Router: `/`,
			AllowHTTPMethods: []string{"post"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:HardwareController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:HardwareController"],
		beego.ControllerComments{
			Method: "GetHardware",
			Router: `/`,
			AllowHTTPMethods: []string{"get"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:HardwareController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:HardwareController"],
		beego.ControllerComments{
			Method: "AddHardware",
			Router: `/`,
			AllowHTTPMethods: []string{"post"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:HardwareController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:HardwareController"],
		beego.ControllerComments{
			Method: "DelHardware",
			Router: `/`,
			AllowHTTPMethods: []string{"delete"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:HardwareController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:HardwareController"],
		beego.ControllerComments{
			Method: "PutHardware",
			Router: `/`,
			AllowHTTPMethods: []string{"put"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:HardwareStateController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:HardwareStateController"],
		beego.ControllerComments{
			Method: "GetHardwareState",
			Router: `/hardware`,
			AllowHTTPMethods: []string{"get"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:HardwareStateController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:HardwareStateController"],
		beego.ControllerComments{
			Method: "AddHardwareState",
			Router: `/hardware`,
			AllowHTTPMethods: []string{"post"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:HardwareStateController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:HardwareStateController"],
		beego.ControllerComments{
			Method: "DelHardwareState",
			Router: `/hardware`,
			AllowHTTPMethods: []string{"delete"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:HardwareStateController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:HardwareStateController"],
		beego.ControllerComments{
			Method: "PutHardwareState",
			Router: `/hardware`,
			AllowHTTPMethods: []string{"put"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:HardwareTypeController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:HardwareTypeController"],
		beego.ControllerComments{
			Method: "GetHardwareType",
			Router: `/type`,
			AllowHTTPMethods: []string{"get"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:HardwareTypeController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:HardwareTypeController"],
		beego.ControllerComments{
			Method: "AddHardwareType",
			Router: `/type`,
			AllowHTTPMethods: []string{"post"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:HardwareTypeController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:HardwareTypeController"],
		beego.ControllerComments{
			Method: "DelHardwareType",
			Router: `/type`,
			AllowHTTPMethods: []string{"delete"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:HardwareTypeController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:HardwareTypeController"],
		beego.ControllerComments{
			Method: "PutHardwareType",
			Router: `/type`,
			AllowHTTPMethods: []string{"put"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:HostController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:HostController"],
		beego.ControllerComments{
			Method: "GetHost",
			Router: `/host`,
			AllowHTTPMethods: []string{"get"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:HostController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:HostController"],
		beego.ControllerComments{
			Method: "AddHost",
			Router: `/host`,
			AllowHTTPMethods: []string{"post"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:HostController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:HostController"],
		beego.ControllerComments{
			Method: "DelHost",
			Router: `/host`,
			AllowHTTPMethods: []string{"delete"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:HostController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:HostController"],
		beego.ControllerComments{
			Method: "PutHost",
			Router: `/host`,
			AllowHTTPMethods: []string{"put"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:InternetServiceProviderController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:InternetServiceProviderController"],
		beego.ControllerComments{
			Method: "GetIsp",
			Router: `/isp`,
			AllowHTTPMethods: []string{"get"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:InternetServiceProviderController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:InternetServiceProviderController"],
		beego.ControllerComments{
			Method: "AddIsp",
			Router: `/isp`,
			AllowHTTPMethods: []string{"post"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:InternetServiceProviderController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:InternetServiceProviderController"],
		beego.ControllerComments{
			Method: "DelIsp",
			Router: `/isp`,
			AllowHTTPMethods: []string{"delete"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:InternetServiceProviderController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:InternetServiceProviderController"],
		beego.ControllerComments{
			Method: "PutIsp",
			Router: `/isp`,
			AllowHTTPMethods: []string{"put"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:IpController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:IpController"],
		beego.ControllerComments{
			Method: "GetIpAddress",
			Router: `/`,
			AllowHTTPMethods: []string{"get"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:IpController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:IpController"],
		beego.ControllerComments{
			Method: "AssignIpAddress",
			Router: `/`,
			AllowHTTPMethods: []string{"put"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:IpController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:IpController"],
		beego.ControllerComments{
			Method: "DelIpAddress",
			Router: `/`,
			AllowHTTPMethods: []string{"delete"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:IpController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:IpController"],
		beego.ControllerComments{
			Method: "UpdateIpAddress",
			Router: `/update`,
			AllowHTTPMethods: []string{"put"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:IpController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:IpController"],
		beego.ControllerComments{
			Method: "MonitorIpAddress",
			Router: `/monitor`,
			AllowHTTPMethods: []string{"get"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:IpSubNetController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:IpSubNetController"],
		beego.ControllerComments{
			Method: "GetIpSubNet",
			Router: `/`,
			AllowHTTPMethods: []string{"get"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:IpSubNetController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:IpSubNetController"],
		beego.ControllerComments{
			Method: "AddIpSubNet",
			Router: `/`,
			AllowHTTPMethods: []string{"post"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:IpSubNetController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:IpSubNetController"],
		beego.ControllerComments{
			Method: "DelIpSubNet",
			Router: `/`,
			AllowHTTPMethods: []string{"delete"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:IpSubNetController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:IpSubNetController"],
		beego.ControllerComments{
			Method: "UpdateIpSubNet",
			Router: `/`,
			AllowHTTPMethods: []string{"put"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:LicenceController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:LicenceController"],
		beego.ControllerComments{
			Method: "GetLicence",
			Router: `/licence`,
			AllowHTTPMethods: []string{"get"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:LicenceController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:LicenceController"],
		beego.ControllerComments{
			Method: "DeleteLicence",
			Router: `/licence`,
			AllowHTTPMethods: []string{"delete"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:LoginController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:LoginController"],
		beego.ControllerComments{
			Method: "Login",
			Router: `/`,
			AllowHTTPMethods: []string{"post"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:ManufacturerController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:ManufacturerController"],
		beego.ControllerComments{
			Method: "GetManufacturer",
			Router: `/manufacturer`,
			AllowHTTPMethods: []string{"get"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:ManufacturerController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:ManufacturerController"],
		beego.ControllerComments{
			Method: "AddManufacturer",
			Router: `/manufacturer`,
			AllowHTTPMethods: []string{"post"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:ManufacturerController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:ManufacturerController"],
		beego.ControllerComments{
			Method: "DelManufacturer",
			Router: `/manufacturer`,
			AllowHTTPMethods: []string{"delete"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:ManufacturerController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:ManufacturerController"],
		beego.ControllerComments{
			Method: "PutManufacturer",
			Router: `/manufacturer`,
			AllowHTTPMethods: []string{"put"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:MemoryController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:MemoryController"],
		beego.ControllerComments{
			Method: "GetAll",
			Router: `/`,
			AllowHTTPMethods: []string{"get"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:MemoryController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:MemoryController"],
		beego.ControllerComments{
			Method: "GetMemoryByServerId",
			Router: `/query`,
			AllowHTTPMethods: []string{"get"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:MemoryController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:MemoryController"],
		beego.ControllerComments{
			Method: "AddMemory",
			Router: `/`,
			AllowHTTPMethods: []string{"post"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:MemoryController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:MemoryController"],
		beego.ControllerComments{
			Method: "CountMemory",
			Router: `/count`,
			AllowHTTPMethods: []string{"get"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:MemoryController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:MemoryController"],
		beego.ControllerComments{
			Method: "CountSwap",
			Router: `/query`,
			AllowHTTPMethods: []string{"get"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:MenuController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:MenuController"],
		beego.ControllerComments{
			Method: "GetMenus",
			Router: `/`,
			AllowHTTPMethods: []string{"get"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:MenuController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:MenuController"],
		beego.ControllerComments{
			Method: "GetMenusById",
			Router: `/v2`,
			AllowHTTPMethods: []string{"get"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:MenuController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:MenuController"],
		beego.ControllerComments{
			Method: "GetMenuRootObject",
			Router: `/object`,
			AllowHTTPMethods: []string{"get"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:MenuController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:MenuController"],
		beego.ControllerComments{
			Method: "AddMenu",
			Router: `/`,
			AllowHTTPMethods: []string{"put"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:MenuController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:MenuController"],
		beego.ControllerComments{
			Method: "DelMenu",
			Router: `/`,
			AllowHTTPMethods: []string{"delete"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:MenuController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:MenuController"],
		beego.ControllerComments{
			Method: "PutMenu",
			Router: `/`,
			AllowHTTPMethods: []string{"delete"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:NetworkAdapterController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:NetworkAdapterController"],
		beego.ControllerComments{
			Method: "GetNetworkAdapterByServerId",
			Router: `/query`,
			AllowHTTPMethods: []string{"get"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:NetworkAdapterController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:NetworkAdapterController"],
		beego.ControllerComments{
			Method: "AddNetworkAdapter",
			Router: `/`,
			AllowHTTPMethods: []string{"post"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:NetworkBandwidthStateController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:NetworkBandwidthStateController"],
		beego.ControllerComments{
			Method: "GetBandwidthState",
			Router: `/networkbandwidth`,
			AllowHTTPMethods: []string{"get"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:NetworkBandwidthStateController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:NetworkBandwidthStateController"],
		beego.ControllerComments{
			Method: "AddBandwidthState",
			Router: `/networkbandwidth`,
			AllowHTTPMethods: []string{"post"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:NetworkBandwidthStateController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:NetworkBandwidthStateController"],
		beego.ControllerComments{
			Method: "DelBandwidthState",
			Router: `/networkbandwidth`,
			AllowHTTPMethods: []string{"delete"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:NetworkBandwidthStateController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:NetworkBandwidthStateController"],
		beego.ControllerComments{
			Method: "PutBandwidthState",
			Router: `/networkbandwidth`,
			AllowHTTPMethods: []string{"put"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:NetworkbandwidthController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:NetworkbandwidthController"],
		beego.ControllerComments{
			Method: "GetNetworkbandwidth",
			Router: `/`,
			AllowHTTPMethods: []string{"get"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:NetworkbandwidthController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:NetworkbandwidthController"],
		beego.ControllerComments{
			Method: "AddNetworkbandwidth",
			Router: `/`,
			AllowHTTPMethods: []string{"post"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:NetworkbandwidthController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:NetworkbandwidthController"],
		beego.ControllerComments{
			Method: "DelNetworkbandwidth",
			Router: `/`,
			AllowHTTPMethods: []string{"delete"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:NetworkbandwidthController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:NetworkbandwidthController"],
		beego.ControllerComments{
			Method: "PutNetworkbandwidth",
			Router: `/`,
			AllowHTTPMethods: []string{"put"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:RackController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:RackController"],
		beego.ControllerComments{
			Method: "GetRack",
			Router: `/`,
			AllowHTTPMethods: []string{"get"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:RackController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:RackController"],
		beego.ControllerComments{
			Method: "AddRack",
			Router: `/`,
			AllowHTTPMethods: []string{"post"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:RackController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:RackController"],
		beego.ControllerComments{
			Method: "DelRack",
			Router: `/`,
			AllowHTTPMethods: []string{"delete"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:RackController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:RackController"],
		beego.ControllerComments{
			Method: "PutRack",
			Router: `/`,
			AllowHTTPMethods: []string{"put"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:RackStateController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:RackStateController"],
		beego.ControllerComments{
			Method: "GetRackState",
			Router: `/rack`,
			AllowHTTPMethods: []string{"get"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:RackStateController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:RackStateController"],
		beego.ControllerComments{
			Method: "AddRackState",
			Router: `/rack`,
			AllowHTTPMethods: []string{"post"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:RackStateController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:RackStateController"],
		beego.ControllerComments{
			Method: "DelRackState",
			Router: `/rack`,
			AllowHTTPMethods: []string{"delete"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:RackStateController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:RackStateController"],
		beego.ControllerComments{
			Method: "PutRackState",
			Router: `/rack`,
			AllowHTTPMethods: []string{"put"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:ResourcePlatformAccountController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:ResourcePlatformAccountController"],
		beego.ControllerComments{
			Method: "GetCloud",
			Router: `/`,
			AllowHTTPMethods: []string{"get"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:ResourcePlatformAccountController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:ResourcePlatformAccountController"],
		beego.ControllerComments{
			Method: "AddCloud",
			Router: `/`,
			AllowHTTPMethods: []string{"post"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:ResourcePlatformAccountController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:ResourcePlatformAccountController"],
		beego.ControllerComments{
			Method: "DelCloud",
			Router: `/`,
			AllowHTTPMethods: []string{"delete"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:ResourcePlatformAccountController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:ResourcePlatformAccountController"],
		beego.ControllerComments{
			Method: "PutCloud",
			Router: `/`,
			AllowHTTPMethods: []string{"put"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:ResourceReportController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:ResourceReportController"],
		beego.ControllerComments{
			Method: "GetStatistics",
			Router: `/statistics`,
			AllowHTTPMethods: []string{"get"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:RoomController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:RoomController"],
		beego.ControllerComments{
			Method: "Room",
			Router: `/:id`,
			AllowHTTPMethods: []string{"get"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:RoomController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:RoomController"],
		beego.ControllerComments{
			Method: "GetRoom",
			Router: `/`,
			AllowHTTPMethods: []string{"get"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:RoomController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:RoomController"],
		beego.ControllerComments{
			Method: "AddRoom",
			Router: `/`,
			AllowHTTPMethods: []string{"post"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:RoomController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:RoomController"],
		beego.ControllerComments{
			Method: "DelRoom",
			Router: `/`,
			AllowHTTPMethods: []string{"delete"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:RoomController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:RoomController"],
		beego.ControllerComments{
			Method: "PutRoom",
			Router: `/`,
			AllowHTTPMethods: []string{"put"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:RoomStateController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:RoomStateController"],
		beego.ControllerComments{
			Method: "GetRoomState",
			Router: `/room`,
			AllowHTTPMethods: []string{"get"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:RoomStateController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:RoomStateController"],
		beego.ControllerComments{
			Method: "AddRoomState",
			Router: `/room`,
			AllowHTTPMethods: []string{"post"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:RoomStateController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:RoomStateController"],
		beego.ControllerComments{
			Method: "DelRoomState",
			Router: `/room`,
			AllowHTTPMethods: []string{"delete"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:RoomStateController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:RoomStateController"],
		beego.ControllerComments{
			Method: "PutRoomState",
			Router: `/room`,
			AllowHTTPMethods: []string{"put"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:ServerController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:ServerController"],
		beego.ControllerComments{
			Method: "GetServer",
			Router: `/`,
			AllowHTTPMethods: []string{"get"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:ServerController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:ServerController"],
		beego.ControllerComments{
			Method: "AddServer",
			Router: `/`,
			AllowHTTPMethods: []string{"post"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:ServerController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:ServerController"],
		beego.ControllerComments{
			Method: "DelServer",
			Router: `/`,
			AllowHTTPMethods: []string{"delete"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:ServerController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:ServerController"],
		beego.ControllerComments{
			Method: "PutServer",
			Router: `/`,
			AllowHTTPMethods: []string{"put"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:ServerController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:ServerController"],
		beego.ControllerComments{
			Method: "PushServerCpu",
			Router: `/push/cpu/:uuid`,
			AllowHTTPMethods: []string{"post"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:ServerController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:ServerController"],
		beego.ControllerComments{
			Method: "PushServerNetwork",
			Router: `/push/network/:uuid`,
			AllowHTTPMethods: []string{"post"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:ServerController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:ServerController"],
		beego.ControllerComments{
			Method: "PushServerHarddisk",
			Router: `/push/harddisk/:uuid`,
			AllowHTTPMethods: []string{"post"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:ServerController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:ServerController"],
		beego.ControllerComments{
			Method: "PushServerMemory",
			Router: `/push/memory/:uuid`,
			AllowHTTPMethods: []string{"post"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:ServerController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:ServerController"],
		beego.ControllerComments{
			Method: "PushServerPort",
			Router: `/push/port/:uuid`,
			AllowHTTPMethods: []string{"post"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:ServerController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:ServerController"],
		beego.ControllerComments{
			Method: "PullServer",
			Router: `/pull`,
			AllowHTTPMethods: []string{"get"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:ServerController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:ServerController"],
		beego.ControllerComments{
			Method: "GetPortByServerId",
			Router: `/port`,
			AllowHTTPMethods: []string{"get"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:ServerStateController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:ServerStateController"],
		beego.ControllerComments{
			Method: "GetServerState",
			Router: `/server`,
			AllowHTTPMethods: []string{"get"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:ServerStateController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:ServerStateController"],
		beego.ControllerComments{
			Method: "AddServerState",
			Router: `/server`,
			AllowHTTPMethods: []string{"post"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:ServerStateController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:ServerStateController"],
		beego.ControllerComments{
			Method: "DelServerState",
			Router: `/server`,
			AllowHTTPMethods: []string{"delete"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:ServerStateController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:ServerStateController"],
		beego.ControllerComments{
			Method: "PutServerState",
			Router: `/server`,
			AllowHTTPMethods: []string{"put"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:StateColorController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:StateColorController"],
		beego.ControllerComments{
			Method: "GetColor",
			Router: `/`,
			AllowHTTPMethods: []string{"get"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:SupplierController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:SupplierController"],
		beego.ControllerComments{
			Method: "GetSupplier",
			Router: `/`,
			AllowHTTPMethods: []string{"get"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:SupplierController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:SupplierController"],
		beego.ControllerComments{
			Method: "AddSupplier",
			Router: `/`,
			AllowHTTPMethods: []string{"post"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:SupplierController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:SupplierController"],
		beego.ControllerComments{
			Method: "DelSupplier",
			Router: `/`,
			AllowHTTPMethods: []string{"delete"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:SupplierController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:SupplierController"],
		beego.ControllerComments{
			Method: "PutSupplier",
			Router: `/`,
			AllowHTTPMethods: []string{"put"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:SyncAliyunController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:SyncAliyunController"],
		beego.ControllerComments{
			Method: "SyncAliyunRemoteToLocal",
			Router: `/`,
			AllowHTTPMethods: []string{"post"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:SyncAwsController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:SyncAwsController"],
		beego.ControllerComments{
			Method: "SyncAwsRemoteToLocal",
			Router: `/`,
			AllowHTTPMethods: []string{"post"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:SyncVcenterController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:SyncVcenterController"],
		beego.ControllerComments{
			Method: "SyncVcenterRemoteToLocal",
			Router: `/`,
			AllowHTTPMethods: []string{"post"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:VcenterController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:VcenterController"],
		beego.ControllerComments{
			Method: "GetVM",
			Router: `/`,
			AllowHTTPMethods: []string{"get"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:VcenterController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:VcenterController"],
		beego.ControllerComments{
			Method: "AddVcenter",
			Router: `/`,
			AllowHTTPMethods: []string{"post"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:VcenterController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:VcenterController"],
		beego.ControllerComments{
			Method: "DelVcenter",
			Router: `/`,
			AllowHTTPMethods: []string{"delete"},
			Params: nil})

	beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:VcenterController"] = append(beego.GlobalControllerRouter["oneoaas.com/cmdb/controllers:VcenterController"],
		beego.ControllerComments{
			Method: "PutVcenter",
			Router: `/`,
			AllowHTTPMethods: []string{"put"},
			Params: nil})

}
