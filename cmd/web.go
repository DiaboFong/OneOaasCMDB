// Copyright 2014 The Gogs Authors. All rights reserved.
// Use of this source code is governed by a MIT-style
// license that can be found in the LICENSE file.

package cmd

import (
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/plugins/cors"
	_"github.com/astaxie/beego/session/mysql"
	"github.com/astaxie/beego/utils"
	_ "oneoaas.com/cmdb/routers"
	"os"
	"github.com/urfave/cli"
	"oneoaas.com/cmdb/task/job"
	"oneoaas.com/cmdb/util"
)

var CmdWeb = cli.Command{
	Name:  "web",
	Usage: "开启oneoaas-cmdb web服务器",
	Description: `oneoaas-cmdb web server `,
	Action: runWeb,
	Flags: []cli.Flag{
		stringFlag("port, p", "8080", "设定web启动服务器端口"),
		boolFlag("zabbix", "设置是否同步zabbix host到cmdb"),
		boolFlag("aliyun", "设置是否同步aliyun 云主机到cmdb"),
		boolFlag("aws", "设置是否同步aws 云主机到cmdb"),
		boolFlag("vcenter", "设置是否同步vcenter 虚拟机到cmdb"),
	},
}

func checkLisence()  {
	if !util.VerificationX509Cert() {
		os.Exit(1)
	}
}

func runWeb(ctx *cli.Context) error {

	if ctx.IsSet("port"){
		beego.BConfig.Listen.HTTPPort = ctx.Int("port")
	}

	beego.InsertFilter("*", beego.BeforeRouter, cors.Allow(&cors.Options{
		AllowAllOrigins:  true,
		AllowOrigins:     []string{"*"},
		AllowMethods:     []string{"GET", "POST", "PUT", "DELETE", "OPTIONS"},
		AllowHeaders:     []string{"Origin", "Content-Type", "Authorization", "Access-Control-Allow-Origin"},
		ExposeHeaders:    []string{"Content-Length"},
		AllowCredentials: false,
	}))

	beego.SetLogFuncCall(true)
	if !utils.FileExists("logs") {
		os.Mkdir("logs", os.FileMode(0777))
		os.Create("logs/cmdb.log")
	}
	beego.SetLevel(beego.LevelDebug)
	beego.SetLogger("file", `{"filename":"logs/cmdb.log"}`)
	jobRun()

	beego.BConfig.WebConfig.DirectoryIndex = true
	beego.BConfig.WebConfig.StaticDir["/swagger"] = "swagger"
	beego.Run()

	return nil
}

func jobRun()  {
	zbxOn, _ := beego.AppConfig.Bool("ZbxOn")
	if zbxOn {
		go job.SyncZabbix()
	}
	vmOn, _ := beego.AppConfig.Bool("VmOn")
	if vmOn {
		go job.SyncVmware()
	}

	aliyunOn, _ := beego.AppConfig.Bool("AliyunOn")
	if aliyunOn {
		go job.SyncAliyun()
	}

	awsOn, _ := beego.AppConfig.Bool("AwsOn")
	if awsOn {
		go job.SyncAWS()
	}

}