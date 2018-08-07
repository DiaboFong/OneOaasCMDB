package main

import (
	"os"
	"runtime"
	"github.com/astaxie/beego/plugins/cors"
	_"github.com/astaxie/beego/session/mysql"
	_ "oneoaas.com/cmdb/routers"
	"github.com/astaxie/beego"

	//"github.com/urfave/cli"
	//"time"
	//"oneoaas.com/cmdb/cmd"

	"github.com/astaxie/beego/utils"
	"github.com/jasonlvhit/gocron"
	"oneoaas.com/cmdb/models"
	util "oneoaas.com/cmdb/util"
)


const APP_VER = "1.2.0"
func init() {
	runtime.GOMAXPROCS(runtime.NumCPU())
}


//开启App监控
func startAppMonitor()  {

	sched := gocron.NewScheduler()
	//每隔一秒执行一次
	sched.Every(1).Minute().Do(models.MonitorDatacenter,"datacenter",true)
	sched.Every(1).Minute().Do(models.MonitorRoom,"room",true)
	sched.Every(1).Minute().Do(models.MonitorRack,"rack",true)
	sched.Every(1).Minute().Do(models.MonitorBandwidth,"network_bandwidth",true)
	sched.Every(1).Minute().Do(models.MonitorHardware,"hardware",true)
	sched.Every(1).Minute().Do(models.MonitorServer,"server",true)
	//sched.Every(1).Minute().Do(models.MonitorIp,"networkip",true)
	sched.Every(1).Minute().Do(models.MonitorDomain,"dnspoddomain",true)
	sched.Every(1).Minute().Do(models.MonitorApp,"app",true)
	sched.Every(1).Minute().Do(models.MonitorVcenter,"vm_vmware",true)
	sched.Every(1).Minute().Do(models.MonitorAliyun,"vm_aliyun",true)
	sched.Every(1).Minute().Do(models.MonitorAws,"vm_aws",true)
	sched.Every(1).Minute().Do(models.MonitorSupplier,"supplier",true)
	sched.Every(1).Minute().Do(models.MonitorAgreement,"agreement",true)
	sched.Start()
}

//通过配置设置日志级别
func setAppLogLevel() {
	//alert,critical,error,warning,notice,info,debug
	loglevel := beego.AppConfig.String("loglevel")
	switch loglevel {
	case "debug":
		beego.SetLevel(beego.LevelDebug)
		break
	case "info":
		beego.SetLevel(beego.LevelInformational)
		break
	case "error":
		beego.SetLevel(beego.LevelError)
		break
	case "alert":
		beego.SetLevel(beego.LevelAlert)
		break
	case "critical":
		beego.SetLevel(beego.LevelCritical)
		break
	case "warning":
		beego.SetLevel(beego.LevelWarning)
		break
	case "notice":
		beego.SetLevel(beego.LevelNotice)
		break
	default:
		beego.SetLevel(beego.LevelInformational)
	}
}

//设置App静态目录
func setAppStaticPath()  {
	//加入swagger 是否开启配置
	bSwagger,_ := beego.AppConfig.Bool("swagger")
	if bSwagger {
		beego.SetStaticPath("/swagger","swagger")
		beego.SetStaticPath("/style","swagger/css")
		beego.SetStaticPath("/fonts","swagger/fonts")
		beego.SetStaticPath("/images","swagger/images")
		beego.SetStaticPath("/lib","swagger/lib")
		beego.SetStaticPath("/lang","swagger/lang")
	}
	beego.SetStaticPath("/assets", "static/assets")
	beego.SetStaticPath("/css", "static/css")
	beego.SetStaticPath("/dest", "static/dest")
}

//设置过滤器
func setAppFilter()  {
	beego.InsertFilter("*", beego.BeforeRouter, cors.Allow(&cors.Options{
		AllowAllOrigins:  true,
		AllowOrigins:     []string{"*"},
		AllowMethods:     []string{"GET", "POST", "PUT", "DELETE"},
		AllowHeaders:     []string{"Origin", "Content-Type", "Authorization", "Access-Control-Allow-Origin"},
		ExposeHeaders:    []string{"Content-Length"},
		AllowCredentials: false,
	}))
}

//设置APP日志模式
func setAppLogPattern()  {
	beego.SetLogFuncCall(true)
	if !utils.FileExists("logs") {
		os.Mkdir("logs", os.FileMode(0777))
		os.Create("logs/cmdb.log")
	}
	beego.SetLogger("file", `{"filename":"logs/cmdb.log"}`)

}

func main() {
	//app := cli.NewApp()
	//app.Name = "oneoaas-cmdb"
	//app.Version = APP_VER
	//app.Compiled = time.Now()
	//app.Authors = []cli.Author{
	//	cli.Author{
	//		Name:  "liubin",
	//		Email: "bin.liu@oneoaas.com",
	//	},
	//}
	//app.Copyright = "(c) 2016 OneOaaS Enterprise"
	//app.Usage = "控制台命令,通过该命令能获取cmdb相关信息"
	//app.Commands = []cli.Command{
	//	cmd.CmdWeb,
	//}
	//app.Flags = []cli.Flag{}
	//app.Run(os.Args)

	//检查lisence
	if !util.VerificationLisence() {
		os.Exit(1)
	}

	//开启app监控
	startAppMonitor()

	//设置app过滤器
	setAppFilter()
	
	//设置日志级别
	setAppLogLevel()

	//设置日志模式
	setAppLogPattern()

	//设置静态目录
	setAppStaticPath()

	beego.Run()
}