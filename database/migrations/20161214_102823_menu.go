package main

import (
	"github.com/astaxie/beego/migration"
)

// DO NOT MODIFY
type Menu_20161214_102823 struct {
	migration.Migration
}

// DO NOT MODIFY
func init() {
	m := &Menu_20161214_102823{}
	m.Created = "20161214_102823"
	migration.Register("Menu_20161214_102823", m)
}

// Run the migrations
func (m *Menu_20161214_102823) Up() {
	// use m.SQL("CREATE TABLE ...") to make schema update
	sql := "INSERT INTO menu VALUES (36,'root.system.roles','角色列表','/roles',33,1,NULL,'','',NULL,0,NULL,NULL,NULL);"
	m.SQL(sql)
}

// Reverse the migrations
func (m *Menu_20161214_102823) Down() {
	// use m.SQL("DROP TABLE ...") to reverse schema update
	sql := "DELETE FROM menu WHERE menuId = 36;"
	m.SQL(sql)
}
