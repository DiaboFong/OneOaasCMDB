
package clicommand

import (
	"github.com/codegangsta/cli"
	"os"
	agent "oneoaas.com/cmdb/cmdbserver/agent/agent"
	"oneoaas.com/cmdb/cmdbserver/agent/api"
	"oneoaas.com/cmdb/cmdbserver/agent/logger"
	"io/ioutil"
	"net/http"
	"errors"
	"encoding/json"
)

var MetaDataSetHelpDescription = `Usage:
   cmdb-agent meta-data push <server-uuid> <cpu|memory|network|harddisk|port> <number>
Description:
   通过命令推送系统信息到CMDB,可以推送的系统信息类型有：
   cpu[系统CPU状态信息]
   memory[系统内存信息]
   network[系统网卡信息]
   harddisk[系统逻辑磁盘信息]
   port[系统端口信息]
Example:
   $ cmdb-agent meta-data push <server-uuid> <cpu> <number>
   `
//命令格式错误提示描述
var CmdErrorDescription = `cmdb-agent meta-data push <server-uuid> <cpu|memory|network|harddisk|port> <number>`

var MetaDataPushCommand = cli.Command{
	Name:        "push",
	Usage:       "推送系统数据到cmdb",
	Description: MetaDataSetHelpDescription,
	Flags: []cli.Flag{
		cli.StringFlag{
			Name:   "cpu",
			Value:  "",
			Usage:  "变更当前服务器的CPU信息",
		},
		cli.StringFlag{
			Name:   "memory",
			Value:  "",
			Usage:  "变更当前服务器的内存信息",
		},
		cli.StringFlag{
			Name:   "network",
			Value:  "",
			Usage:  "变更当前服务器的网卡信息",
		},
		cli.StringFlag{
			Name:   "harddisk",
			Value:  "",
			Usage:  "变更当前服务器的硬盘信息",
		},
		cli.StringFlag{
			Name:   "port",
			Value:  "",
			Usage:  "变更当前服务器的端口信息",
		},
	},
	Action: func(c *cli.Context) {
		logger.Debug("%s","开始推动数据到cmdb")
		if len(c.Args()) < 2 {
			logger.Error("命令格式错误，请使用[%s]格式",CmdErrorDescription)
			os.Exit(0)
		}
		oneoaas_cmdb_endpoint := os.Getenv("ONEOAAS_CMDB_ENDPOINT")
		if len(oneoaas_cmdb_endpoint)==0{
			logger.Error("环境设置错误，请设置[%s]","ONEOAAS_CMDB_ENDPOINT系统环境变量")
			os.Exit(0)
		}
		oneoaas_cmdb_token := os.Getenv("ONEOAAS_CMDB_TOKEN")
		if len(oneoaas_cmdb_token)==0{
			logger.Error("环境设置错误，请设置[%s]","没有设置ONEOAAS_CMDB_TOKEN系统环境变量")
			os.Exit(0)
		}
		logger.Info("%s","推动数据到CMDB，环境检查通过")
		client := agent.APIClient{
			Endpoint: oneoaas_cmdb_endpoint,
			Token:    oneoaas_cmdb_token,
		}.Create()

		if c.Args().Get(0) == api.PUSH_CPU{
			resp, err := client.MetaData.PushCpu(c.Args().Get(1))
			defer resp.Body.Close()
			if err != nil{
				logger.Error("%s", err.Error())
				os.Exit(0)
			}
			if resp.StatusCode != http.StatusOK{
				logger.Error("%s",errors.New("推送数据请求失败"))
				os.Exit(0)
			}else{
				byteResp, err  := ioutil.ReadAll(resp.Body)
				if err != nil{
					logger.Error("%s", err)
					os.Exit(0)
				}

				pushResp := map[string]interface{}{}
				json.Unmarshal(byteResp,&pushResp)

				if pushResp["result"].(bool) {
					logger.Info("%s","推送系统CPU信息到cmdb，请求成功")
				}else{
					logger.Info("%s,%s","推送系统CPU信息到cmdb",pushResp["msg"])
				}
			}
		}else if c.Args().Get(0) == api.PUSH_MEMORY{
			resp, err := client.MetaData.PushMemory(c.Args().Get(1))
			defer resp.Body.Close()
			if err != nil{
				logger.Error("%s", err.Error())
				os.Exit(0)
			}
			if resp.StatusCode != http.StatusOK{
				logger.Error("%s",errors.New("推送数据请求失败"))
				os.Exit(0)
			}else{
				byteResp, err  := ioutil.ReadAll(resp.Body)
				if err != nil{
					logger.Error("%s", err)
					os.Exit(0)
				}

				pushResp := map[string]interface{}{}
				json.Unmarshal(byteResp,&pushResp)

				if pushResp["result"].(bool) {
					logger.Info("%s","推送系统内存信息到cmdb，请求成功")
				}else{
					logger.Info("%s,%s","推送系统内存信息到cmdb",pushResp["msg"])
				}
			}
		}else if c.Args().Get(0) == api.PUSH_HARDDISK{
			resp, err := client.MetaData.PushDisk(c.Args().Get(1))
			defer resp.Body.Close()
			if err != nil{
				logger.Error("%s", err.Error())
				os.Exit(0)
			}
			if resp.StatusCode != http.StatusOK{
				logger.Error("%s",errors.New("推送数据请求失败"))
				os.Exit(0)
			}else{
				byteResp, err  := ioutil.ReadAll(resp.Body)
				if err != nil{
					logger.Error("%s", err)
					os.Exit(0)
				}

				pushResp := map[string]interface{}{}
				json.Unmarshal(byteResp,&pushResp)

				if pushResp["result"].(bool) {
					logger.Info("%s","推送系统磁盘信息到cmdb，请求成功")
				}else{
					logger.Info("%s,%s","推送系统磁盘信息到cmdb",pushResp["msg"])
				}
			}
		}else if c.Args().Get(0) == api.PUSH_NETWORK{
			resp, err := client.MetaData.PushNetwork(c.Args().Get(1))
			defer resp.Body.Close()
			if err != nil{
				logger.Error("%s", err.Error())
				os.Exit(0)
			}
			if resp.StatusCode != http.StatusOK{
				logger.Error("%s",errors.New("推送数据请求失败"))
				os.Exit(0)
			}else{
				byteResp, err  := ioutil.ReadAll(resp.Body)
				if err != nil{
					logger.Error("%s", err)
					os.Exit(0)
				}

				pushResp := map[string]interface{}{}
				json.Unmarshal(byteResp,&pushResp)

				if pushResp["result"].(bool) {
					logger.Info("%s","推送系统网卡信息到cmdb，请求成功")
				}else{
					logger.Info("%s,%s","推送系统网卡信息到cmdb",pushResp["msg"])
				}
			}
		}else if c.Args().Get(0) == api.PUSH_PORT{
			resp, err := client.MetaData.PushPort(c.Args().Get(1))
			defer resp.Body.Close()
			if err != nil{
				logger.Error("%s", err.Error())
				os.Exit(0)
			}
			if resp.StatusCode != http.StatusOK{
				logger.Error("%s",errors.New("推送数据请求失败"))
				os.Exit(0)
			}else{
				byteResp, err  := ioutil.ReadAll(resp.Body)
				if err != nil{
					logger.Error("%s", err)
					os.Exit(0)
				}

				pushResp := map[string]interface{}{}
				json.Unmarshal(byteResp,&pushResp)

				if pushResp["result"].(bool) {
					logger.Info("%s","推送系统端口信息到cmdb，请求成功")
				}else{
					logger.Info("%s,%s","推送系统端口信息到cmdb",pushResp["msg"])
				}
			}

		}else {
			logger.Info("%s", "请检查命令参数，当前不支持此命令")
			os.Exit(0)
		}
	},
}