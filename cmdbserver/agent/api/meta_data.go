package api

import (
	"fmt"
	"oneoaas.com/cmdb/util"
	"encoding/json"
	"github.com/shirou/gopsutil/cpu"
	"github.com/shirou/gopsutil/disk"
	"github.com/shirou/gopsutil/net"
	"github.com/shirou/gopsutil/mem"
	"oneoaas.com/cmdb/cmdbserver/agent/logger"
	"net/http"
	"errors"
)

//定义push 数据的key
const (
	PUSH_MEMORY = "memory"
	PUSH_HARDDISK = "harddisk"
	PUSH_NETWORK = "network"
	PUSH_CPU = "cpu"
	PUSH_PORT = "port"
)

type SystemMemory struct {
	//系统总内存
	VirtualTotal uint64           `json:"virtual_total"`
	//系统可用内存
	VirtualAvailable uint64       `json:"virtual_available"`
	//系统已使用内存
	VirtualUsed uint64            `json:"virtual_used"`
	//系统内存使用率
	VirtualUsedPercent float64    `json:"virtual_used_percent"`
	//系统空闲内存
	VirtualFree uint64            `json:"virtual_free"`

	SwapTotal uint64              `json:"swap_total"`
	//系统已使用内存
	SwapUsed uint64               `json:"swap_used"`
	//系统内存使用率
	SwapUsedPercent float64       `json:"swap_used_percent"`
	//系统空闲内存
	SwapFree uint64               `json:"swap_free"`
}

// MetaDataService handles communication with the meta data related methods of
// the Cmdb Agent API.
type MetaDataService struct {
	client *Client
}

// MetaData represents a Cmdb Agent API MetaData
type CpuMetaData struct {
	Key   string `json:"key,omitempty"`
	Value []cpu.InfoStat `json:"value,omitempty"`
}
func (c CpuMetaData) String() string {
	s, _ := json.Marshal(c)
	return string(s)
}

type PortMetaData struct {
	Key   string `json:"key,omitempty"`
	Value []SystemPort `json:"value,omitempty"`
}

func (c PortMetaData) String() string {
	s, _ := json.Marshal(c)
	return string(s)
}

type NetworkMetaData struct {
	Key   string `json:"key,omitempty"`
	Value []net.InterfaceStat `json:"value,omitempty"`
}

func (c NetworkMetaData) String() string {
	s, _ := json.Marshal(c)
	return string(s)
}

type HardDiskMetaData struct {
	Key   string `json:"key,omitempty"`
	Value []disk.PartitionStat `json:"value,omitempty"`
}

func (c HardDiskMetaData) String() string {
	s, _ := json.Marshal(c)
	return string(s)
}

type MemoryMetaData struct {
	Key   string `json:"key,omitempty"`
	Value SystemMemory `json:"value,omitempty"`
}

func (c MemoryMetaData) String() string {
	s, _ := json.Marshal(c)
	return string(s)
}

// push cpu the meta data value
func (ps *MetaDataService) PushCpu(serverUuid string) (*Response, error) {
	u := fmt.Sprintf("server/push/cpu/%s?%s",serverUuid,fmt.Sprintf("timestamp=%d",util.MakeTimestamp))
	metadata := CpuMetaData{}
	metadata.Key = PUSH_CPU
	InfoStat, error := cpu.Info()
	if error != nil{
		logger.Error("%s",error.Error())
	}
	metadata.Value = InfoStat
	req, err := ps.client.NewRequest(http.MethodPost, u, metadata)
	if err != nil {
		return nil, err
	}

	return ps.client.Do(req, nil)
}

func (ps *MetaDataService) PushMemory(serverUuid string) (*Response, error) {
	url := fmt.Sprintf("server/push/memory/%s?%s",serverUuid,fmt.Sprintf("timestamp=%d",util.MakeTimestamp))
	metadata := MemoryMetaData{}
	metadata.Key = PUSH_MEMORY
	virtualMemoryStat, error := mem.VirtualMemory()
	if error != nil{
		logger.Error("%s",error.Error())
		return nil,errors.New("获取系统虚拟内存信息错误")
	}
	logger.Info("虚拟机内存Total:%d",virtualMemoryStat.Total)
	swapMemoryStat, error := mem.SwapMemory()
	if error != nil{
		logger.Error("%s",error.Error())
		return nil,errors.New("获取系统交换内存信息错误")
	}
	logger.Info("交换内存Total:%d",swapMemoryStat.Total)
	systemMemory := SystemMemory{
		VirtualTotal:virtualMemoryStat.Total,
		VirtualAvailable:virtualMemoryStat.Available,
		VirtualUsed:virtualMemoryStat.Used,
		VirtualUsedPercent:virtualMemoryStat.UsedPercent,
		VirtualFree:virtualMemoryStat.Free,

		SwapTotal:swapMemoryStat.Total,
		SwapUsed:swapMemoryStat.Used,
		SwapFree:swapMemoryStat.Free,
		SwapUsedPercent:swapMemoryStat.UsedPercent,
	}
	metadata.Value = systemMemory
	req, err := ps.client.NewRequest(http.MethodPost, url, metadata)
	if err != nil {
		return nil, err
	}

	return ps.client.Do(req, nil)
}

func (ps *MetaDataService) PushDisk(serverUuid string) (*Response, error) {
	url := fmt.Sprintf("server/push/harddisk/%s?%s",serverUuid,fmt.Sprintf("timestamp=%d",util.MakeTimestamp))
	metadata := HardDiskMetaData{}
	metadata.Key = PUSH_HARDDISK
	partitionStat,err := disk.Partitions(true)
	if err != nil{
		logger.Error("%s",err.Error())
		return nil,errors.New("获取系统磁盘信息错误")
	}
	metadata.Value = partitionStat
	req, err := ps.client.NewRequest(http.MethodPost, url, metadata)
	if err != nil {
		return nil, err
	}
	return ps.client.Do(req, nil)
}

func (ps *MetaDataService) PushNetwork(serverUuid string) (*Response, error) {
	url := fmt.Sprintf("server/push/network/%s?%s",serverUuid,fmt.Sprintf("timestamp=%d",util.MakeTimestamp))
	metadata := NetworkMetaData{}
	metadata.Key = PUSH_NETWORK
	interfaceStat,error := net.Interfaces()
	if error != nil{
		logger.Error("%s",error.Error())
		return nil,errors.New("获取系统网卡信息错误")
	}
	metadata.Value = interfaceStat
	req, err := ps.client.NewRequest(http.MethodPost, url, metadata)
	if err != nil {
		return nil, err
	}

	return ps.client.Do(req, nil)
}

func (ps *MetaDataService) PushPort(serverUuid string) (*Response, error) {
	//通过server uuid push 端口数据
	url := fmt.Sprintf("server/push/port/%s?%s",serverUuid,fmt.Sprintf("timestamp=%d",util.MakeTimestamp))
	logger.Debug("推送数据的请求路径是,[%s]",url)
	metadata := PortMetaData{}
	metadata.Key = PUSH_PORT
	systemPortList, error := GetSystemPort()
	if error != nil{
		logger.Error("%s",error.Error())
		return nil,errors.New("获取系统端口列表错误")
	}
	metadata.Value = systemPortList
	req, err := ps.client.NewRequest(http.MethodPost, url, metadata)
	if err != nil {
		return nil, err
	}

	return ps.client.Do(req, nil)
}


func (ps *MetaDataService) PullServer() (*Response, error) {
	url := fmt.Sprintf("server/pull?%s",fmt.Sprintf("timestamp=%d",util.MakeTimestamp))
	logger.Debug("拉取服务器数据请求路径是,[%s]",url)
	req, err := ps.client.NewRequest(http.MethodGet, url,nil)
	if err != nil {
		logger.Error("拉取服务器数据发生错误,[%s]",err.Error())
		return nil, errors.New("拉取服务器数据发生错误")
	}
	return ps.client.Do(req, nil)
}
