package main

import (
	"github.com/astaxie/beego/migration"
)

// DO NOT MODIFY
type Menu_20161214_094902 struct {
	migration.Migration
}

// DO NOT MODIFY
func init() {
	m := &Menu_20161214_094902{}
	m.Created = "20161214_094902"
	migration.Register("Menu_20161214_094902", m)
}

// Run the migrations
func (m *Menu_20161214_094902) Up() {
	// use m.SQL("CREATE TABLE ...") to make schema update
	sql := "INSERT INTO menu VALUES (35,'root.system.users','用户列表','/users',33,1,NULL,'','',NULL,0,NULL,NULL,NULL);"
	m.SQL(sql)
}

// Reverse the migrations
func (m *Menu_20161214_094902) Down() {
	// use m.SQL("DROP TABLE ...") to reverse schema update
	sql := "DELETE FROM menu WHERE menuId = 35;"
	m.SQL(sql)
}
