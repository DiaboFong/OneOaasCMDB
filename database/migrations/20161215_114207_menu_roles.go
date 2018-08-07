package main

import (
	"github.com/astaxie/beego/migration"
)

// DO NOT MODIFY
type MenuRoles_20161215_114207 struct {
	migration.Migration
}

// DO NOT MODIFY
func init() {
	m := &MenuRoles_20161215_114207{}
	m.Created = "20161215_114207"
	migration.Register("MenuRoles_20161215_114207", m)
}

// Run the migrations
func (m *MenuRoles_20161215_114207) Up() {
	// use m.SQL("CREATE TABLE ...") to make schema update
	sql := "INSERT INTO menu_roles(menu_id,role_id) VALUES (60,8);"
	m.SQL(sql)
	sql = "INSERT INTO menu_roles(menu_id,role_id) VALUES (61,8);"
	m.SQL(sql)
	sql = "INSERT INTO menu_roles(menu_id,role_id) VALUES (62,8);"
	m.SQL(sql)

	sql = "INSERT INTO menu_roles(menu_id,role_id) VALUES (63,8);"
	m.SQL(sql)
	sql = "INSERT INTO menu_roles(menu_id,role_id) VALUES (64,8);"
	m.SQL(sql)
	sql = "INSERT INTO menu_roles(menu_id,role_id) VALUES (65,8);"
	m.SQL(sql)
}

// Reverse the migrations
func (m *MenuRoles_20161215_114207) Down() {
	// use m.SQL("DROP TABLE ...") to reverse schema update
	sql := "DELETE FROM menu_roles WHERE menu_id=60 AND role_id=8;"
	m.SQL(sql)
	sql = "DELETE FROM menu_roles WHERE menu_id=61 AND role_id=8;"
	m.SQL(sql)
	sql = "DELETE FROM menu_roles WHERE menu_id=62 AND role_id=8;"
	m.SQL(sql)

	sql = "DELETE FROM menu_roles WHERE menu_id=63 AND role_id=8;"
	m.SQL(sql)
	sql = "DELETE FROM menu_roles WHERE menu_id=64 AND role_id=8;"
	m.SQL(sql)
	sql = "DELETE FROM menu_roles WHERE menu_id=65 AND role_id=8;"
	m.SQL(sql)
}
