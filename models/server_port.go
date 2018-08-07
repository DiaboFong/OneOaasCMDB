package models

import (
	"errors"
	"github.com/astaxie/beego"
)

//服务器端口信息model
type ServerPort struct {
	Id         int64     `orm:"column(id);pk;auto" json:"id"`
	Ip   	   string    `orm:"column(ip);size(64)" json:"ip"`
	Port       uint32    `orm:"column(port);size(32);" json:"port"`
	Proccess   string    `orm:"column(proccess);size(128)" json:"proccess"`
	Server     *Server   `orm:"rel(fk);null" json:"-"`
}

//默认使用INNODB 引擎
func (this *ServerPort) TableEngine() string {
	return "INNODB"
}

func (this *ServerPort) Save()  (int64,error){
	if this == nil{
		return int64(-1),errors.New("服务器对象为空")
	}

	id, err := Orm.InsertOrUpdate(this)
	if err != nil{
		return id,err
	}else{
		return id,nil
	}
}

func (this *ServerPort) ExistPort() bool{
	if this == nil{
		return false
	}
	return Orm.QueryTable("server_port").Filter("port",this.Port).Exist()
}

func (this *ServerPort) GetServerPort() error{
	if this == nil{
		return errors.New("服务器端口对象为空")
	}
	port := ServerPort{}
	err := Orm.QueryTable("server_port").Filter("port",this.Port).One(&port)
	if err != nil{
		beego.Debug("通过端口查询服务器端口信息错误",err.Error())
		return errors.New("查询服务器端口信息错误")
	}
	this.Id = port.Id
	return nil
}

func (this *ServerPort) UpdatePort() error{
	if this == nil{
		return  errors.New("更新服务器端口对象为空")
	}
	_,err := Orm.Update(this)
	if err != nil{
		beego.Debug("更新服务器端口信息错误",err.Error())
		return errors.New("更新服务器端口信息错误")
	}
	return nil
}

func GetPortByServerId(serverId string) ([]*ServerPort) {
	var serverPorts []*ServerPort
	num, err := Orm.QueryTable("server_port").Filter("server_id",serverId).All(&serverPorts)
	if err != nil {
		beego.Debug("【查询服务器端口错误", err.Error(), "]")
		return nil
	}
	beego.Debug("【查询服务器端口记录是", num, "]条")
	return serverPorts
}


