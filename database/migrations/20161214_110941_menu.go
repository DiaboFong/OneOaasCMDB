package main

import (
	"github.com/astaxie/beego/migration"
)

// DO NOT MODIFY
type Menu_20161214_110941 struct {
	migration.Migration
}

// DO NOT MODIFY
func init() {
	m := &Menu_20161214_110941{}
	m.Created = "20161214_110941"
	migration.Register("Menu_20161214_110941", m)
}

// Run the migrations
func (m *Menu_20161214_110941) Up() {
	// use m.SQL("CREATE TABLE ...") to make schema update
	sql := "INSERT INTO menu VALUES (48,'root.system.apikey','KEY列表','/apikey',45,1,NULL,'','',NULL,3,NULL,NULL,NULL);"
	m.SQL(sql)
}

// Reverse the migrations
func (m *Menu_20161214_110941) Down() {
	// use m.SQL("DROP TABLE ...") to reverse schema update
	sql := "DELETE FROM menu WHERE menuId = 48;"
	m.SQL(sql)
}
