package models

import (
	"github.com/astaxie/beego"
	"time"
	"errors"
)

//这里的内存模型是指操作系统级别的内存，而非内存条
type Memory struct {
	Id         int64       	      `orm:"column(id);pk;auto"`
	//系统总内存
	VirtualTotal uint64           `orm:"size(32)" json:"virtual_total"`
	//系统可用内存
	VirtualAvailable uint64       `orm:"size(32)" json:"virtual_available"`
	//系统已使用内存
	VirtualUsed uint64            `orm:"size(32)" json:"virtual_used"`
	//系统内存使用率
	VirtualUsedPercent float64    `orm:"size(32)" json:"virtual_used_percent"`
	//系统空闲内存
	VirtualFree uint64            `orm:"size(32)" json:"virtual_free"`

	SwapTotal uint64              `orm:"size(32)" json:"swap_total"`
	//系统已使用内存
	SwapUsed uint64               `orm:"size(32)" json:"swap_used"`
	//系统内存使用率
	SwapUsedPercent float64       `orm:"size(32)" json:"swap_used_percent"`
	//系统空闲内存
	SwapFree uint64               `orm:"size(32)" json:"swap_free"`

	Enable     bool        `orm:"column(enable);size(1);null" json:"-"`
	CreateTime time.Time   `orm:"column(createtime);auto_now_add;type(datetime);null" json:"-"`
	CreateBy   string      `orm:"column(createby);size(100);null" json:"-"`
	UpdateBy   string      `orm:"column(updateby);size(100);null" json:"-"`
	UpdateTime time.Time   `orm:"column(updatetime);auto_now;type(datetime);null" json:"-"`
	Server     *Server     `orm:"rel(fk);null" json:"-"`
}

func (u *Memory) TableEngine() string {
	return "INNODB"
}

func (this *Memory) UpdateOrCreate() {
	serverMemory := Memory{}
	err := Orm.QueryTable("memory").Filter("server_id",this.Server.ServerId).One(&serverMemory)
	if err == nil {
		//更新内存信息
		this.Id = serverMemory.Id
		this.Update()
	}else{
		_,err := Orm.Insert(this)
		if err != nil{
			beego.Debug("创建服务器内存信息，保持内存错误",err.Error())
		}
	}

}

func (this *Memory) Update() error {
	_,err := Orm.Update(this)
	if err != nil{
		beego.Debug("更新内存对象错误",err.Error())
		return errors.New("更新内存对象错误")
	}
	return nil
}

func AddMemory(this Memory) (int64, error) {
	id, err := Orm.Insert(&this)
	return id, err
}

func GetAllMemory() []*Memory {
	var memorys []*Memory
	num, err := Orm.QueryTable("memory").All(&memorys)
	if err != nil {
		beego.Debug("【查询Memory错误", err.Error(), "]")
	}
	beego.Debug("【查询Memory的记录数据是", num, "]条")
	return memorys
}

func GetMemoryById(id int64) (*Memory, error) {
	obj := &Memory{
		Id: id,
	}
	err := Orm.Read(obj)
	if err != nil {
		return nil, err
	}
	return obj, nil
}

func GetMemoryByServerId(serverId string) ([]*Memory) {
	var memorys []*Memory
	num, err := Orm.QueryTable("memory").Filter("server_id",serverId).All(&memorys)
	if err != nil {
		beego.Debug("【查询memory错误", err.Error(), "]")
		return nil
	}
	beego.Debug("【查询memory的记录数据是", num, "]条")
	return memorys
}

