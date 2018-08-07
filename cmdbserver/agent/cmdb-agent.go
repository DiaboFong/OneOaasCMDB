//author: bin.liu@oneoaas.com
//description: cmdb-agent
package main

import (
	"github.com/shirou/gopsutil/cpu"
	"github.com/shirou/gopsutil/load"
	"github.com/shirou/gopsutil/mem"
	"github.com/shirou/gopsutil/disk"
	"github.com/shirou/gopsutil/host"
	"github.com/shirou/gopsutil/net"
	"os"
	"github.com/codegangsta/cli"
	"oneoaas.com/cmdb/cmdbserver/agent/clicommand"
	"fmt"
)

type Infodata struct {
	//CPU
	CpuNum   string                 `json:"cpunum"`
	Cpuinfo  []cpu.InfoStat         `json:"cpuinfo"`
	CpuLoad  *load.AvgStat          `json:"cpuload"`
	CpuUsage map[string]interface{} `json:"cpuusage"`
	//Memory
	Memory *mem.VirtualMemoryStat `json:"memory"`
	Swap   *mem.SwapMemoryStat    `json:"swap"`
	//Disk
	Diskpartitions []disk.PartitionStat `json:"diskpartitions"`
	//Network interface
	Interfaces []net.InterfaceStat `json:"interfaces"`
	//Host infomation
	HostInfo *host.InfoStat `json:"hostinfo"`
}
type ResultData struct {
	Data Infodata `json:"data"`
}

const (
	APP_NAME  = "cmdb-agent"
	APP_VERSION  = "0.1.0"
	APP_AUTHOR = "LiuBin"
	APP_EMAIL = "bin.liu@oneoaas.com"
)

var AppHelpTemplate = `Usage:
  {{.Name}} <command> [arguments...]
Available commands are:
  {{range .Commands}}{{.Name}}{{with .ShortName}}, {{.}}{{end}}{{ "\t" }}{{.Usage}}
  {{end}}
Use "{{.Name}} <command> --help" for more information about a command.
`

var SubcommandHelpTemplate = `Usage:
  {{.Name}} {{if .Flags}}<command>{{end}} [arguments...]
Available commands are:
   {{range .Commands}}{{.Name}}{{with .ShortName}}, {{.}}{{end}}{{ "\t" }}{{.Usage}}
   {{end}}{{if .Flags}}
Options:
   {{range .Flags}}{{.}}
   {{end}}{{end}}
`

var CommandHelpTemplate = `{{.Description}}
Options:
   {{range .Flags}}{{.}}
   {{end}}
`

func printVersion(c *cli.Context) {
	fmt.Printf("%v version %v, build %v\n", c.App.Name, c.App.Version, APP_VERSION)
}

func main() {

	cli.AppHelpTemplate = AppHelpTemplate
	cli.CommandHelpTemplate = CommandHelpTemplate
	cli.SubcommandHelpTemplate = SubcommandHelpTemplate
	cli.VersionPrinter = printVersion

	app := cli.NewApp()
	app.Name= APP_NAME
	app.Version = APP_VERSION
	app.Author = APP_AUTHOR
	app.Email = APP_EMAIL

	app.Commands = []cli.Command{
		//clicommand.AgentStartCommand,
		{
			Name:  "meta-data",
			Usage: "操作oneoaas cmdb中的数据",
			Subcommands: []cli.Command{
				clicommand.MetaDataPushCommand,
				clicommand.MetaDataPullCommand,
			},
		},
	}

	//没有输入自命令时，直接输出帮助信息
	app.Action = func(c *cli.Context) {
		cli.ShowAppHelp(c)
		os.Exit(1)
	}

	//当子命令没有找到时，直接输出帮助信息
	app.CommandNotFound = func(c *cli.Context, command string) {
		cli.ShowAppHelp(c)
		os.Exit(1)
	}
	app.Run(os.Args)
}