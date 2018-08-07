package models

import (
	"errors"
	"log"
	"strings"

	"github.com/astaxie/beego/validation"
	"time"
	"oneoaas.com/cmdb/util"
	"encoding/json"
	"github.com/astaxie/beego"
)

// ip地址模型
type IpAddress struct {
	Id          int64        `orm:"column(id);auto" json:"id"`
	IpAddress   string       `orm:"size(20);null"   json:"ip_address"`
	IsGateway   int          `orm:"size(1);null"    json:"is_gateway"`
	DnsName     string       `orm:"size(128);null"  json:"dns_name"`
	State       int          `orm:"size(1);null"    json:"state"`
	Port        string       `orm:"size(128);null"  json:"port"`
	Owner       string       `orm:"size(128);null"  json:"owner"`
	Description  string   	 `orm:"size(512);null"  json:"description"`
	AllowModify  int         `orm:"size(1);null"    json:"allow_modify"`
	DeviceType   string      `orm:"size(128);null"  json:"device_type"`
	Location     string      `orm:"size(255);null"  json:"location"`
	Hostname     *string      `orm:"size(255);null"  json:"hostname"`	//如果不是指针，则保持为空字符串类型
	HostnamePrefix     string      `orm:"size(255);null"  json:"hostname_prefix"`


	//object
	App          *App        `orm:"rel(fk);column(app_id);null" json:"app"`
	IpSubnet     *IpSubnet   `orm:"rel(fk);column(ip_subnet);null" json:"ip_subnet"`
	Host         *Host   	 `orm:"rel(fk);column(host_id);null" json:"host"`
	Room         *Room   	 `orm:"rel(fk);column(room_id);null" json:"room"`

	Enable      bool         `orm:"column(enable);size(1);null" json:"enable"`
	CreateTime  time.Time    `orm:"column(createtime);type(datetime);null" json:"create_time"`
	CreateBy    string       `orm:"column(createby);size(100);null" json:"create_by"`
	UpdateBy    string       `orm:"column(updateby);size(100);null" json:"update_by"`
	UpdateTime  time.Time    `orm:"column(updatetime);type(datetime);null" json:"update_time"`
}

func (this *IpAddress) MarshalJSON() ([]byte, error) {
	type Alias IpAddress
	return json.Marshal(&struct {
		*Alias
		CreateTime string `json:"create_time"`
		UpdateTime string `json:"update_time"`
	}{
		Alias:    (*Alias)(this),
		CreateTime: util.FormatTime(this.CreateTime),
		UpdateTime: util.FormatTime(this.UpdateTime),
	})
}

// 设置引擎为 INNODB
func (this *IpAddress) TableEngine() string {
	return "INNODB"
}


func checkIpAddress(a IpAddress) error {
	valid := validation.Validation{}
	b, _ := valid.Valid(a)
	if !b {
		for _, err := range valid.Errors {
			log.Println(err.Key, err.Message)
			return errors.New(err.Message)
		}
	}
	return nil
}

func (this *IpAddress) Add(ipAdd IpAddress) (error) {

	this.IpAddress = ipAdd.IpAddress
	this.IsGateway = ipAdd.IsGateway
	this.DnsName = ipAdd.DnsName
	this.State = ipAdd.State
	this.Port = ipAdd.Port
	this.Owner = ipAdd.Owner
	this.Description = ipAdd.Description
	this.HostnamePrefix = ipAdd.HostnamePrefix
	this.Hostname = ipAdd.Hostname

	this.App = ipAdd.App
	this.IpSubnet = ipAdd.IpSubnet
	this.Host = ipAdd.Host
	this.Room = ipAdd.Room

	this.Enable = ipAdd.Enable
	this.CreateTime = ipAdd.CreateTime
	this.UpdateTime = ipAdd.UpdateTime
	this.CreateBy = ipAdd.CreateBy
	this.UpdateBy = ipAdd.UpdateBy

	id, err := Orm.Insert(this)
	if err != nil{
		return err
	}
	this.Id = id

	return nil
}

func DelIpAddress(id int64) error {
	pIpAddress,err := GetIpAddressById(id)
	if err != nil{
		return err
	}
	_,err = Orm.Delete(pIpAddress)
	if err != nil{
		return err
	}
	return nil
}

func GetIpAddress(queryParam QueryParam) ([]IpAddress,int64,error) {
	queryMap := queryParam.Query
	var ips []IpAddress
	var totalNum int64
	var err error

	qs := Orm.QueryTable("ip_address")
	//采用高级模式构建过滤
	if queryMap["ip_address"] != ""{
		qs = qs.Filter("ip_address__contains",queryMap["ip_address"])
	}

	if queryMap["hostname_prefix"] != ""{
		qs = qs.Filter("hostname_prefix__contains",queryMap["hostname_prefix"])
	}

	if queryMap["device_type"] != ""{
		qs = qs.Filter("device_type__contains",queryMap["device_type"])
	}

	if queryMap["port"] != ""{
		qs = qs.Filter("port__contains",queryMap["port"])
	}

	if queryMap["owner"] != ""{
		qs = qs.Filter("owner__contains",queryMap["owner"])
	}

	if queryMap["description"] != ""{
		qs = qs.Filter("description__contains",queryMap["description"])
	}

	if queryMap["allow_modify"] != ""{
		qs = qs.Filter("allow_modify__contains",queryMap["allow_modify"])
	}

	if queryMap["location"] != ""{
		qs = qs.Filter("location__contains",queryMap["location"])
	}

	if queryMap["ip_subnet"] != ""{
		qs = qs.Filter("ip_subnet",queryMap["ip_subnet"])
	}

	//后端分页
	if queryParam.Offset >= 0 && queryParam.Limit >=0 {
		qs = qs.Limit(queryParam.Limit)
		qs = qs.Offset(queryParam.Offset)
		qs = qs.RelatedSel()
		_,err := qs.All(&ips)
		if err != nil{
			beego.Error("查询所有记录出错",err.Error())
		}
		totalNum,err = qs.Count()
		if err != nil{
			beego.Error("查询总记录出错",err.Error())
		}
	}else{
		//前端分页
		qs = qs.RelatedSel()
		_,err := qs.All(&ips)
		if err != nil{
			beego.Error("查询所有记录出错",err.Error())
		}
		totalNum,err = qs.Count()
		if err != nil{
			beego.Error("查询总记录出错",err.Error())
		}
	}
	return ips,totalNum, err
}

func CountIpAddress(query map[string]string) (total int64, err error) {
	qs := Orm.QueryTable("ip_address")
	// query k=v
	for k, v := range query {
		k = strings.Replace(k, ".", "__", -1)
		qs = qs.Filter(k, v)
	}

	return qs.Count()
}

func GetIpAddressById(id int64) (*IpAddress, error) {
	obj := &IpAddress{
		Id: id,
	}
	err := Orm.Read(obj)
	if err != nil {
		return nil, err
	}
	return obj, nil
}

func GetByIpAddress(ipAddress string) (*IpAddress, error) {
	pIpAddress := new(IpAddress)
	err := Orm.QueryTable("ip_address").Filter("IpAddress",ipAddress).One(pIpAddress)
	if err != nil {
		return nil, err
	}
	return pIpAddress, nil
}

func PutIpAddress(m *IpAddress) (err error) {
	_, err = Orm.Update(m)
	if err != nil {
		return err
	} else {
		return nil
	}
}

//获取已经使用的ip
func GetUsedIpAddress(queryParam QueryParam) (int64, error) {
	queryMap := queryParam.Query
	qs := Orm.QueryTable("ip_address")
	qs = qs.Filter("hostname__isnull", false)
	if queryMap["ip_subnet"] != ""{
		qs = qs.Filter("ip_subnet",queryMap["ip_subnet"])
	}
	usedIpAddress,err := qs.Count()
	if err != nil{
		return 0,err
	}
	return usedIpAddress,nil
}

func GetUnusedIpAddress(queryParam QueryParam) (int64, error) {
	queryMap := queryParam.Query
	qs := Orm.QueryTable("ip_address")
	qs = qs.Filter("hostname__isnull", true)
	if queryMap["ip_subnet"] != ""{
		qs = qs.Filter("ip_subnet",queryMap["ip_subnet"])
	}
	unusedIpAddress,err := qs.Count()
	if err != nil{
		return 0,err
	}
	return unusedIpAddress,nil
}

func GetDisableModifyIpAddress(queryParam QueryParam) (int64, error) {
	queryMap := queryParam.Query
	qs := Orm.QueryTable("ip_address")
	qs = qs.Filter("allow_modify", 0)
	if queryMap["ip_subnet"] != ""{
		qs = qs.Filter("ip_subnet",queryMap["ip_subnet"])
	}
	disableModifyIpAddress,err := qs.Count()
	if err != nil{
		return 0,err
	}
	return disableModifyIpAddress,nil
}

func GetUseRateIpAddress(queryParam QueryParam) (float64, error) {
	queryMap := queryParam.Query
	qs := Orm.QueryTable("ip_address")
	if queryMap["ip_subnet"] != ""{
		qs = qs.Filter("ip_subnet",queryMap["ip_subnet"])
	}
	allIpAddress,err := qs.Count()
	if err != nil{
		return 0,err
	}
	usedIpAddress,err := GetUsedIpAddress(queryParam)
	if err != nil{
		return 0,err
	}

	if allIpAddress == 0 {
		return 0,errors.New("暂未IP地址")
	}
	useRateIpAddress := float64(usedIpAddress)/float64(allIpAddress)*float64(100)
	return useRateIpAddress,nil
}



