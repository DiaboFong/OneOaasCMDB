package main

import (
	"github.com/astaxie/beego/migration"
)

// DO NOT MODIFY
type MenuRoles_20161214_111125 struct {
	migration.Migration
}

// DO NOT MODIFY
func init() {
	m := &MenuRoles_20161214_111125{}
	m.Created = "20161214_111125"
	migration.Register("MenuRoles_20161214_111125", m)
}

// Run the migrations
func (m *MenuRoles_20161214_111125) Up() {
	// use m.SQL("CREATE TABLE ...") to make schema update
	sql := "INSERT INTO menu_roles(menu_id,role_id) VALUES (48,8);"
	m.SQL(sql)
}

// Reverse the migrations
func (m *MenuRoles_20161214_111125) Down() {
	// use m.SQL("DROP TABLE ...") to reverse schema update
	sql := "DELETE FROM menu_roles WHERE menu_id=48 AND role_id=8;"
	m.SQL(sql)
}
