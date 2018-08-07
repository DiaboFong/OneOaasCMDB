package main

import (
	"github.com/astaxie/beego/migration"
)

// DO NOT MODIFY
type Menu_20161214_110710 struct {
	migration.Migration
}

// DO NOT MODIFY
func init() {
	m := &Menu_20161214_110710{}
	m.Created = "20161214_110710"
	migration.Register("Menu_20161214_110710", m)
}

// Run the migrations
func (m *Menu_20161214_110710) Up() {
	// use m.SQL("CREATE TABLE ...") to make schema update
	sql := "INSERT INTO menu VALUES (39,'root.system.email','邮件设置','/email',34,1,NULL,'','',NULL,3,NULL,NULL,NULL);"
	m.SQL(sql)
}

// Reverse the migrations
func (m *Menu_20161214_110710) Down() {
	// use m.SQL("DROP TABLE ...") to reverse schema update
	sql := "DELETE FROM menu WHERE menuId = 39;"
	m.SQL(sql)
}
