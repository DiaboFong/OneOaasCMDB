package main

import (
	"github.com/astaxie/beego/migration"
)

// DO NOT MODIFY
type MenuRoles_20161219_141416 struct {
	migration.Migration
}

// DO NOT MODIFY
func init() {
	m := &MenuRoles_20161219_141416{}
	m.Created = "20161219_141416"
	migration.Register("MenuRoles_20161219_141416", m)
}

// Run the migrations
func (m *MenuRoles_20161219_141416) Up() {
	// use m.SQL("CREATE TABLE ...") to make schema update
	sql := "INSERT INTO menu_roles(menu_id,role_id) VALUES (66,8);"
	m.SQL(sql)

	sql = "INSERT INTO menu_roles(menu_id,role_id) VALUES (67,8);"
	m.SQL(sql)

	sql = "INSERT INTO menu_roles(menu_id,role_id) VALUES (68,8);"
	m.SQL(sql)
}

// Reverse the migrations
func (m *MenuRoles_20161219_141416) Down() {
	// use m.SQL("DROP TABLE ...") to reverse schema update
	sql := "DELETE FROM menu_roles WHERE menu_id=66 AND role_id=8;"
	m.SQL(sql)

	sql = "DELETE FROM menu_roles WHERE menu_id=67 AND role_id=8;"
	m.SQL(sql)

	sql = "DELETE FROM menu_roles WHERE menu_id=68 AND role_id=8;"
	m.SQL(sql)
}
