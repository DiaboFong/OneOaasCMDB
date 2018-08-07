//子网Ip管理模块
//json 均使用小写格式

package models

import (
	"errors"
	"log"
	"strings"
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/validation"
	"time"
	"encoding/json"
	"oneoaas.com/cmdb/util"
	"net"
	"fmt"
)

type IpSubnet struct {
	Id         	  int64     	`orm:"column(id);auto" json:"id"`
	SubnetAddress     string    	`orm:"size(255);null" json:"subnet_address"`
	SubnetDescription    string    	`orm:"size(512);null" json:"subnet_description"`
	Mask       string    	`orm:"size(3);null" json:"mask"` //存放掩码根据SubnetAddress计算得出
	Vlan       string   	`orm:"size(50);null" json:"vlan"`
	AllowAllocation   int   `orm:"size(1);null" json:"allow_allocation"` //表示是否分配0表示否，1表示允许
	CheckIpState 	int      `orm:"size(1);null" json:"check_ip_state"` //表示是否检查子网中的ip,0表示否，1表示检查
	IpAddress  []*IpAddress  `orm:"reverse(many)" json:"ip_address"`
	Enable     bool         `orm:"column(enable);size(1);null" json:"enable"`
	CreateTime time.Time    `orm:"column(createtime);type(datetime);null" json:"create_time"`
	CreateBy   string       `orm:"column(createby);size(100);null" json:"create_by"`
	UpdateBy   string       `orm:"column(updateby);size(100);null" json:"update_by"`
	UpdateTime time.Time    `orm:"column(updatetime);type(datetime);null" json:"update_time"`
}

//重新实现json接口，转义相关数据
func (this *IpSubnet) MarshalJSON() ([]byte, error) {
	type Alias IpSubnet
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
func (this *IpSubnet) TableEngine() string {
	return "INNODB"
}

func checkIpSubnet(a IpSubnet) error {
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

//解析ip
func inc(ip net.IP) {
	for j := len(ip) - 1; j >= 0; j-- {
		ip[j]++
		if ip[j] > 0 {
			break
		}
	}
}

//解析cidr
func Hosts(cidr string) ([]string, error) {
	ip, ipnet, err := net.ParseCIDR(cidr)

	if err != nil {
		return nil, err
	}
	var ips []string
	for ip := ip.Mask(ipnet.Mask); ipnet.Contains(ip); inc(ip) {
		ips = append(ips, ip.String())
	}
	// 移除网络地址和广播地址
	return ips[1 : len(ips)-1], nil
}

func (this *IpSubnet) Add(ipSubnet IpSubnet) (error) {

	beego.Debug("[插入IpSubnet数据]")
	this.AllowAllocation = ipSubnet.AllowAllocation
	this.CheckIpState = ipSubnet.CheckIpState
	this.Mask = ipSubnet.Mask
	this.SubnetAddress = ipSubnet.SubnetAddress
	this.SubnetDescription = ipSubnet.SubnetDescription
	this.Vlan = ipSubnet.Vlan

	this.Enable = ipSubnet.Enable
	this.CreateTime = ipSubnet.CreateTime
	this.UpdateTime = ipSubnet.UpdateTime
	this.CreateBy = ipSubnet.CreateBy
	this.UpdateBy = ipSubnet.UpdateBy

	id, err := Orm.Insert(this)
	this.Id = id

	if err != nil{
		return  err
	}

	//允许分配
	if this.AllowAllocation == 1 {
		//处理,IP分配
		ips,err := Hosts(this.SubnetAddress)
		if err != nil{
			//分配子网失败
			return  err
		}

		//保存分配Ip
		for index := range ips{
			oIpAddress :=IpAddress{
				IpAddress:ips[index],
				IpSubnet:this,
				Hostname:nil,
				Enable:true,
				CreateTime:time.Now(),
				CreateBy:"",
				UpdateBy:"",
				UpdateTime:time.Now(),
			}
			pIpAddress := new(IpAddress)
			err = pIpAddress.Add(oIpAddress)
			if err != nil{
				beego.Error(err)
				return err
			}
		}
	}

	return err
}


func DelIpSubnet(id int64) error {
	pIpSubnet,err := GetIpSubnetById(id)
	if err != nil{
		return err
	}
	_,err = Orm.Delete(pIpSubnet)
	if err != nil{
		return err
	}
	return nil
}

func GetIpSubnet(queryParam QueryParam) ([]IpSubnet,int64,error) {

	queryMap := queryParam.Query

	sortColumn := queryParam.SortColumn
	for column := range sortColumn {
		fmt.Println("column:",column)
	}

	var ipSubnet []IpSubnet
	var totalNum int64
	var err error

	qs := Orm.QueryTable("ip_subnet")
	//采用高级模式构建过滤
	if queryMap["subnet_address"] != ""{
		qs = qs.Filter("subnet_address__contains",queryMap["subnet_address"])
	}

	if queryMap["vlan"] != ""{
		qs = qs.Filter("vlan__contains",queryMap["vlan"])
	}

	ipSubnetList := make([]IpSubnet,0)
	//后端分页模式
	if queryParam.Offset >= 0 && queryParam.Limit >=0 {
		qs = qs.Limit(queryParam.Limit)
		qs = qs.Offset(queryParam.Offset)
		_,err := qs.All(&ipSubnet)
		if err != nil{
			beego.Error("查询所有记录出错",err.Error())
		}
		totalNum,err = qs.Count()
		if err != nil{
			beego.Error("查询总记录出错",err.Error())
		}
		for _, subnet := range ipSubnet {
			_,err := Orm.LoadRelated(&subnet, "IpAddress")
			if err == nil{
				ipSubnetList = append(ipSubnetList,subnet)
			}
		}

	}else{
	//前端分页模式
		_,err = qs.All(&ipSubnet)
		if err != nil{
			beego.Error("查询所有记录出错",err.Error())
		}
		totalNum,err = qs.Count()
		if err != nil{
			beego.Error("查询总记录出错",err.Error())
		}
		for _, subnet := range ipSubnet {
			_,err := Orm.LoadRelated(&subnet, "IpAddress")
			if err == nil{
				ipSubnetList = append(ipSubnetList,subnet)
			}
		}

	}
	return ipSubnetList,totalNum, err
}

func CountIpSubnet(query map[string]string) (total int64, err error) {
	qs := Orm.QueryTable("ip_subnet")
	// query k=v
	for k, v := range query {
		k = strings.Replace(k, ".", "__", -1)
		qs = qs.Filter(k, v)
	}

	return qs.Count()
}

func GetIpSubnetById(id int64) (*IpSubnet, error) {
	obj := &IpSubnet{
		Id: id,
	}
	err := Orm.Read(obj)
	if err != nil {
		return nil, err
	}
	return obj, nil
}

func (m *IpSubnet) PutIpSubnet() (error) {
	_, err := Orm.Update(m)
	if err != nil {
		return err
	} else {
		return nil
	}
}
