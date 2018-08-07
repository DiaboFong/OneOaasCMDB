package models

import (
	"github.com/astaxie/beego"
	"time"
	"errors"
)

type NetworkAdapter struct {
	Id           int64     `orm:"column(id);pk;auto"`
	Name         string    `orm:"column(name); size(255)" json:"name"`
	Mtu          int64   `orm:"column(mtu);  size(32)"  json:"mtu"`          // maximum transmission unit
	HardwareAddr string  `orm:"column(hardwareaddr);  size(64)"  json:"hardwareaddr"` 				// IEEE MAC-48, EUI-48 and EUI-64 form
	Flags        string  `orm:"column(flags);  size(32)"  json:"flags"`        			// e.g., FlagUp, FlagLoopback, FlagMulticast
	Addrs        string  `orm:"column(addrs);  size(32)"  json:"addrs"`

	Enable     bool      `orm:"column(enable);size(1);null" json:"-"`
	CreateTime time.Time `orm:"column(createtime);auto_now_add;type(datetime);null" json:"-"`
	CreateBy   string    `orm:"column(createby);size(100);null" json:"-"`
	UpdateBy   string    `orm:"column(updateby);size(100);null" json:"-"`
	UpdateTime time.Time `orm:"column(updatetime);auto_now;type(datetime);null" json:"-"`
	Server     *Server   `orm:"rel(fk);null" json:"-"`
}

func (this *NetworkAdapter) TableEngine() string {
	return "INNODB"
}

func (this *NetworkAdapter) Update() error {
	_,err := Orm.Update(this)
	if err != nil{
		beego.Debug("更新NetworkAdapter对象错误",err.Error())
		return errors.New("更新NetworkAdapter对象错误")
	}
	return nil
}

func (this *NetworkAdapter) UpdateOrCreate() error {
	serverNetwork := NetworkAdapter{}
	err := Orm.QueryTable("network_adapter").
		Filter("server_id",this.Server.ServerId).
		Filter("name",this.Name).
		One(&serverNetwork)
	if err == nil {
		//更新内存信息
		this.Id = serverNetwork.Id
		this.Update()
	}else{
		_,err := Orm.Insert(this)
		if err != nil{
			beego.Debug("创建服务器网络信息，保持网络接口错误",err.Error())
			return err
		}
	}
	return nil
}


func AddNetworkAdapter(this *NetworkAdapter) (int64, error) {
	id, err := Orm.Insert(&this)
	/*if err != nil {
		return nil, err
	}

	adapter := &NetworkAdapter{
		Id: id,
	}
	err = Orm.Read(adapter)
	if err != nil {
		return nil, err
	}*/

	return id, err
}

func GetAllNetworkAdapter() []*NetworkAdapter {
	var networkAdapters []*NetworkAdapter
	num, err := Orm.QueryTable("network_adapter").All(&networkAdapters)
	if err != nil {
		beego.Debug("【查询网卡错误", err.Error(), "]")
	}
	beego.Debug("【查询网卡的记录数据是", num, "]条")
	return networkAdapters
}

func GetNetworkAdapterById(id int64) (*NetworkAdapter, error) {
	obj := &NetworkAdapter{
		Id: id,
	}
	err := Orm.Read(obj)
	if err != nil {
		return nil, err
	}
	return obj, nil
}

func GetNetworkAdapterByServerId(serverId string) ([]*NetworkAdapter) {
	var networkAdapters []*NetworkAdapter
	num, err := Orm.QueryTable("network_adapter").Filter("server_id",serverId).All(&networkAdapters)
	if err != nil {
		beego.Debug("【查询网络适配器错误", err.Error(), "]")
		return nil
	}
	beego.Debug("【查询网络适配器记录是", num, "]条")
	return networkAdapters
}