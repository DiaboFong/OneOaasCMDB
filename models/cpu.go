package models

import (
	"github.com/astaxie/beego"
	"time"
)

type Cpu struct {
	Id         int64     	`orm:"column(id);pk;auto" json:"-"`
	Cpu        int32    	`orm:"null" json:"cpu"`
	VendorId   string   	`orm:"null" json:"vendorId"`
	Family     string   	`orm:"null" json:"family"`
	Model      string   	`orm:"null" json:"model"`
	Stepping   int32    	`orm:"null" json:"stepping"`
	PhysicalId string   	`orm:"null" json:"physicalId"`
	CoreId     string   	`orm:"null" json:"coreId"`
	Cores      int32    	`orm:"null" json:"cores"`
	ModelName  string   	`orm:"null" json:"modelName"`
	Mhz        float64  	`orm:"null" json:"mhz"`
	CacheSize  int32    	`orm:"null" json:"cacheSize"`
	Flags      string 	`orm:"null" json:"-"`
	Enable     bool      	`orm:"column(enable);size(1);null" json:"-"`
	CreateTime time.Time 	`orm:"column(createtime);auto_now_add;type(datetime);null" json:"-"`
	CreateBy   string    	`orm:"column(createby);size(100);null" json:"-"`
	UpdateBy   string    	`orm:"column(updateby);size(100);null" json:"-"`
	UpdateTime time.Time 	`orm:"column(updatetime);auto_now;type(datetime);null" json:"-"`
	Server     *Server   	`orm:"rel(fk);null" json:"-"`
}

func (u *Cpu) TableEngine() string {
	return "INNODB"
}

func AddCpu(this Cpu) (int64, error) {
	id, err := Orm.Insert(&this)
	return id, err
}

func SetCpu(this Cpu) (int64, error) {

	_,err := Orm.QueryTable("cpu").Filter("server_id",this.Server.ServerId).Delete()
	if err != nil{
		beego.Error("删除当前服务器，现有CPU资源")
		return -1,err
	}
	id, err := Orm.Insert(&this)
	return id, err
}

func GetAllCpu() []*Cpu {
	var cpus []*Cpu
	num, err := Orm.QueryTable("cpu").All(&cpus)
	if err != nil {
		beego.Debug("【查询CPU错误", err.Error(), "]")
	}
	beego.Debug("【查询CPU的记录数据是", num, "]条")
	return cpus
}

func GetCpuById(id int64) (*Cpu, error) {
	obj := &Cpu{
		Id: id,
	}
	err := Orm.Read(obj)
	if err != nil {
		return nil, err
	}
	return obj, nil
}

func GetCpuByServerId(serverId string) ([]*Cpu) {
	var cpus []*Cpu
	num, err := Orm.QueryTable("cpu").Filter("server_id",serverId).All(&cpus)
	if err != nil {
		beego.Debug("【查询CPU错误", err.Error(), "]")
		return nil
	}
	beego.Debug("【查询CPU的记录数据是", num, "]条")
	return cpus
}
