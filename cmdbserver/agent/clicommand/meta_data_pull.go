
package clicommand

import (
	"github.com/codegangsta/cli"
	"os"
	"github.com/olekukonko/tablewriter"
	agent "oneoaas.com/cmdb/cmdbserver/agent/agent"
	"oneoaas.com/cmdb/cmdbserver/agent/logger"
	"io/ioutil"
	"encoding/json"
)

type PullServerResponse struct {
	ServerTable [][]string `json:"server_table"`
}

var MetaDataPullHelpDescription = `Usage:
   cmdb-agent meta-data pull <server>
Description:
   从cmdb拉取资源的简单数据，目前仅支持拉取server数据
   []表示可选参数
Example:
   $ cmdb-agent meta-data pull server
   `

var MetaDataPullCommand = cli.Command{
	Name:        "pull",
	Usage:       "从cmdb拉取资源的简单数据",
	Description: MetaDataPullHelpDescription,
	Flags: []cli.Flag{
		cli.StringFlag{
			Name:   "server",
			Value:  "",
			Usage:  "获取当前oneoaas cmdb的服务器列表",
		},
	},
	Action: func(c *cli.Context) {

		if len(c.Args()) < 1 {
			logger.Error("%s","命令格式错误")
			os.Exit(0)
		}

		if len(c.Args()) >=2 {
			logger.Error("%s","命令格式错误")
			os.Exit(0)
		}

		oneoaas_cmdb_endpoint := os.Getenv("ONEOAAS_CMDB_ENDPOINT")
		if len(oneoaas_cmdb_endpoint)==0{
			logger.Error("%s","没有设置ONEOAAS_CMDB_ENDPOINT系统环境变量")
			os.Exit(0)
		}
		oneoaas_cmdb_token := os.Getenv("ONEOAAS_CMDB_TOKEN")
		if len(oneoaas_cmdb_token)==0{
			logger.Error("%s","没有设置ONEOAAS_CMDB_TOKEN系统环境变量")
			os.Exit(0)
		}

		client := agent.APIClient{
			Endpoint: oneoaas_cmdb_endpoint,
			Token:    oneoaas_cmdb_token,
		}.Create()

		if c.Args().Get(0) == "server"{

			//指定server uuid 获取server信息
			//if len(c.Args()) == 2{
			//	//指定获取信息
			//	inputUuid := uuid.Parse(c.Args().Get(1))
			//	if inputUuid == nil{
			//		logger.Error("%s","输入uuid格式错误")
			//		os.Exit(0)
			//	}
			//}

			//获取服务器列表
			resp, err := client.MetaData.PullServer()
			if err != nil {
				logger.Error("%s", err)
				os.Exit(0)
			}

			if resp == nil {
				logger.Error("%s", "拉取服务器请求发生错误")
				os.Exit(0)
			}
			defer resp.Body.Close()

			byteResp, err  := ioutil.ReadAll(resp.Body)
			if err != nil{
				logger.Error("%s", err)
				os.Exit(0)
			}

			pullServerResponse := new(PullServerResponse)
			json.Unmarshal(byteResp,pullServerResponse)
			table := tablewriter.NewWriter(os.Stdout)
			table.SetHeader([]string{"Name", "UUID","State","IpAddress"})
			for _, v := range pullServerResponse.ServerTable {
				table.Append(v)
			}
			table.Render() // Send output
		}else{
			logger.Error("%s","当前暂不支持此命令")
			os.Exit(0)
		}
	},
}