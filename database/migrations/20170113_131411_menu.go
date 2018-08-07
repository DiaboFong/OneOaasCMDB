package main

import (
	"github.com/astaxie/beego/migration"
)

// DO NOT MODIFY
type Menu_20170113_131411 struct {
	migration.Migration
}

// DO NOT MODIFY
func init() {
	m := &Menu_20170113_131411{}
	m.Created = "20170113_131411"
	migration.Register("Menu_20170113_131411", m)
}

// Run the migrations
func (m *Menu_20170113_131411) Up() {
	// use m.SQL("CREATE TABLE ...") to make schema update

	sql := "UPDATE  menu  SET level=3 WHERE menuId=35;"
	m.SQL(sql)

	sql = "UPDATE  menu  SET level=3 WHERE menuId=36;"
	m.SQL(sql)

	sql = "UPDATE  menu  SET level=3 WHERE menuId=37;"
	m.SQL(sql)

	sql = "UPDATE  menu  SET level=3 WHERE menuId=38;"
	m.SQL(sql)

	sql = "UPDATE  menu  SET level=3 WHERE menuId=39;"
	m.SQL(sql)

	sql = "UPDATE  menu  SET level=3 WHERE menuId=48;"
	m.SQL(sql)

	sql = "INSERT INTO menu VALUES (69,'root.system.modeling','资产建模','/modeling',34,1,'2016-12-15 19:10:56','admin','admin','2016-12-15 19:10:56',0,3,NULL,NULL);"
	m.SQL(sql)

}

// Reverse the migrations
func (m *Menu_20170113_131411) Down() {
	// use m.SQL("DROP TABLE ...") to reverse schema update
	sql := "DELETE FROM menu WHERE menuId = 69;"
	m.SQL(sql)
}
