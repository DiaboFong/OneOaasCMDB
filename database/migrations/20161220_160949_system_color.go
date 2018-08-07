package main

import (
	"github.com/astaxie/beego/migration"
)

// DO NOT MODIFY
type SystemColor_20161220_160949 struct {
	migration.Migration
}

// DO NOT MODIFY
func init() {
	m := &SystemColor_20161220_160949{}
	m.Created = "20161220_160949"
	migration.Register("SystemColor_20161220_160949", m)
}

// Run the migrations
func (m *SystemColor_20161220_160949) Up() {
	// use m.SQL("CREATE TABLE ...") to make schema update
	sql := "INSERT INTO system_color(color,description,type,enable,createtime,createby,updateby,updatetime) VALUES ('#FFC85F','橙色','state',0,'20161220160949','admin','admin','20161220160949');"
	m.SQL(sql)

	sql = "INSERT INTO system_color(color,description,type,enable,createtime,createby,updateby,updatetime) VALUES ('#FF8B51','红橙色','state',0,'20161220160949','admin','admin','20161220160949');"
	m.SQL(sql)

	sql = "INSERT INTO system_color(color,description,type,enable,createtime,createby,updateby,updatetime) VALUES ('#6BC86F','淡绿色','state',0,'20161220160949','admin','admin','20161220160949');"
	m.SQL(sql)

	sql = "INSERT INTO system_color(color,description,type,enable,createtime,createby,updateby,updatetime) VALUES ('#0DB550','深绿色','state',0,'20161220160949','admin','admin','20161220160949');"
	m.SQL(sql)

	sql = "INSERT INTO system_color(color,description,type,enable,createtime,createby,updateby,updatetime) VALUES ('#7EA2AB','灰色','state',0,'20161220160949','admin','admin','20161220160949');"
	m.SQL(sql)

	sql = "INSERT INTO system_color(color,description,type,enable,createtime,createby,updateby,updatetime) VALUES ('#317F9E','深蓝色','state',0,'20161220160949','admin','admin','20161220160949');"
	m.SQL(sql)
}

// Reverse the migrations
func (m *SystemColor_20161220_160949) Down() {
	// use m.SQL("DROP TABLE ...") to reverse schema update

}
