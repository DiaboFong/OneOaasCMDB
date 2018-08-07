package main

import (
	"github.com/astaxie/beego/migration"
)

// DO NOT MODIFY
type Menu_20161215_113049 struct {
	migration.Migration
}

// DO NOT MODIFY
func init() {
	m := &Menu_20161215_113049{}
	m.Created = "20161215_113049"
	migration.Register("Menu_20161215_113049", m)
}

// Run the migrations
func (m *Menu_20161215_113049) Up() {
	// use m.SQL("CREATE TABLE ...") to make schema update
	//sql := "INSERT INTO menu(name,display_name,url,parentId,enable,createtime,createby,updateby,updatetime,active,level,logo,class) VALUES ('root.report','资源报表','',0,0,'2016-12-15 19:10:56,'admin','admin','2016-12-15 19:10:56',0,1,NULL,NULL);"
	//sql := "INSERT INTO menu VALUES (60,'root.report.device','设备性能报表','/device',4,0,'2016-12-15 19:10:56,'admin','admin','2016-12-15 19:10:56',0,2,NULL,NULL);"
	sql := "INSERT INTO menu VALUES (60,'root.report.device','设备性能报表','/device',4,1,'2016-12-15 19:10:56','admin','admin','2016-12-15 19:10:56',0,2,NULL,NULL);"
	m.SQL(sql)
	sql = "INSERT INTO menu VALUES (61,'root.report.finance','财务报表','/finance',4,1,'2016-12-15 19:10:56','admin','admin','2016-12-15 19:10:56',0,2,NULL,NULL);"
	m.SQL(sql)
	sql = "INSERT INTO menu VALUES (62,'root.report.use','资源报表','/use',4,1,'2016-12-15 19:10:56','admin','admin','2016-12-15 19:10:56',0,2,NULL,NULL);"
	m.SQL(sql)

	sql = "INSERT INTO menu VALUES (63,'root.report.devicedetail','设备性能报表详情','/devicedetail',60,1,'2016-12-15 19:10:56','admin','admin','2016-12-15 19:10:56',0,3,NULL,NULL);"
	m.SQL(sql)
	sql = "INSERT INTO menu VALUES (64,'root.report.financedetail','财务报表详情','/financedetail',61,1,'2016-12-15 19:10:56','admin','admin','2016-12-15 19:10:56',0,3,NULL,NULL);"
	m.SQL(sql)
	sql = "INSERT INTO menu VALUES (65,'root.report.usedetail','资源报表详情','/usedetail',62,1,'2016-12-15 19:10:56','admin','admin','2016-12-15 19:10:56',0,3,NULL,NULL);"
	m.SQL(sql)
}

// Reverse the migrations
func (m *Menu_20161215_113049) Down() {
	// use m.SQL("DROP TABLE ...") to reverse schema update
	sql := "DELETE FROM menu WHERE menuId = 60;"
	m.SQL(sql)
	sql = "DELETE FROM menu WHERE menuId = 61;"
	m.SQL(sql)
	sql = "DELETE FROM menu WHERE menuId = 62;"
	m.SQL(sql)

	sql = "DELETE FROM menu WHERE menuId = 63;"
	m.SQL(sql)
	sql = "DELETE FROM menu WHERE menuId = 64;"
	m.SQL(sql)
	sql = "DELETE FROM menu WHERE menuId = 65;"
	m.SQL(sql)
}
