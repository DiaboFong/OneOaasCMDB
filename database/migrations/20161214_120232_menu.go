package main

import (
	"github.com/astaxie/beego/migration"
)

// DO NOT MODIFY
type Menu_20161214_120232 struct {
	migration.Migration
}

// DO NOT MODIFY
func init() {
	m := &Menu_20161214_120232{}
	m.Created = "20161214_120232"
	migration.Register("Menu_20161214_120232", m)
}

// Run the migrations
func (m *Menu_20161214_120232) Up() {
	// use m.SQL("CREATE TABLE ...") to make schema update
	sql := "UPDATE  menu  SET name='root.system' WHERE menuId=3;"
	m.SQL(sql)
}

// Reverse the migrations
func (m *Menu_20161214_120232) Down() {
	// use m.SQL("DROP TABLE ...") to reverse schema update

}
