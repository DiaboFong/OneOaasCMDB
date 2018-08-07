package models

import (
	"time"
	"fmt"
)

type ZabbixHost struct {
	Id       	int64  `orm:"auto"`
	HostName        string `orm:"size(255);null"`
	HostId          string `orm:"size(255),unique;null"`
	Enable       bool         `orm:"column(enable);size(1);null"`
	CreateTime   time.Time    `orm:"column(createtime);auto_now_add;type(datetime)"`
	CreateBy     string       `orm:"column(createby);size(100);null"`
	UpdateBy     string       `orm:"column(updateby);size(100);null"`
	UpdateTime   time.Time    `orm:"column(updatetime);auto_now;type(datetime)"`
}

func (this *ZabbixHost) TableEngine() string {
	return "INNODB"
}

func (this *ZabbixHost) BeforeInsert() {
	this.CreateTime = time.Now()
	this.UpdateTime = this.CreateTime
	this.Enable = true
}

func (this *ZabbixHost) BeforeUpdate() {
	this.UpdateTime = time.Now()
}

func (this *ZabbixHost) IsExist() bool{
	return Orm.QueryTable("ZabbixHost").Filter("HostId",this.HostId).Exist()
}

func (this *ZabbixHost) Add() (int64, error){
	this.BeforeInsert()
	if !this.IsExist(){
		return Orm.Insert(this)
	}else{
		return -1,fmt.Errorf("%s","已经存在")
	}
}