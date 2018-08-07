package models

import (
	"github.com/astaxie/beego"
	"time"
	"errors"
)

type Harddisk struct {
	Id         int64     	`orm:"column(id);pk;auto"`

	Device     string 	`orm:"column(device);size(64)" 	json:"device"`
	Mountpoint string 	`orm:"column(mountpoint);size(64)" json:"mountpoint"`
	Fstype     string 	`orm:"column(fstype);size(64)" json:"fstype"`
	Opts       string 	`orm:"column(opts);size(64)" json:"opts"`

	Enable     bool      `orm:"column(enable);size(1);null" json:"-"`
	CreateTime time.Time `orm:"column(createtime);auto_now_add;type(datetime);null" json:"-"`
	CreateBy   string    `orm:"column(createby);size(100);null" json:"-"`
	UpdateBy   string    `orm:"column(updateby);size(100);null" json:"-"`
	UpdateTime time.Time `orm:"column(updatetime);auto_now;type(datetime);null" json:"-"`
	Server     *Server   `orm:"rel(fk);null" json:"-"`
}

func (this *Harddisk) TableEngine() string {
	return "INNODB"
}

func (this *Harddisk) Update() error {
	_,err := Orm.Update(this)
	if err != nil{
		beego.Debug("更新Disk对象错误",err.Error())
		return errors.New("更新Disk对象错误")
	}
	return nil
}

func (this *Harddisk) UpdateOrCreate()  error{
	serverDisk := Harddisk{}
	err := Orm.QueryTable("harddisk").
		Filter("server_id",this.Server.ServerId).
		Filter("device",this.Device).
		One(&serverDisk)
	if err == nil {
		//更新内存信息
		this.Id = serverDisk.Id
		this.Update()
	}else{
		_,err := Orm.Insert(this)
		if err != nil{
			beego.Debug("创建服务器磁盘信息，保持磁盘错误",err.Error())
			return err
		}
	}
	return nil
}


func AddHarddisk(this *Harddisk) (int64, error) {
	id, err := Orm.Insert(&this)
	/*if err != nil {
		return nil, err
	}

	state := &Harddisk{
		Id: id,
	}
	err = Orm.Read(state)
	if err != nil {
		return nil, err
	}*/

	return id, err
}

func GetAllHarddisk() []*Harddisk {
	var disks []*Harddisk
	num, err := Orm.QueryTable("harddisk").All(&disks)
	if err != nil {
		beego.Debug("【查询硬盘错误", err.Error(), "]")
	}
	beego.Debug("【查询硬盘的记录数据是", num, "]条")
	return disks
}

func GetHarddiskById(id int64) (*Harddisk, error) {
	obj := &Harddisk{
		Id: id,
	}
	err := Orm.Read(obj)
	if err != nil {
		return nil, err
	}
	return obj, nil
}

func GetHardDiskByServerId(serverId string) ([]*Harddisk) {
	var harddisks []*Harddisk
	num, err := Orm.QueryTable("harddisk").Filter("server_id",serverId).All(&harddisks)
	if err != nil {
		beego.Debug("【查询硬盘错误", err.Error(), "]")
		return nil
	}
	beego.Debug("【查询硬盘的记录数据是", num, "]条")
	return harddisks
}
