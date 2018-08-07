package main

import (
	"github.com/astaxie/beego/migration"
)

// DO NOT MODIFY
type Menu_20170122_115514 struct {
	migration.Migration
}

// DO NOT MODIFY
func init() {
	m := &Menu_20170122_115514{}
	m.Created = "20170122_115514"
	migration.Register("Menu_20170122_115514", m)
}

// Run the migrations
func (m *Menu_20170122_115514) Up() {
	// use m.SQL("CREATE TABLE ...") to make schema update
	sql := "update menu set enable=0 where menuId=39;"
	m.SQL(sql)

	sql = "update menu set enable=0 where menuId=69;"
	m.SQL(sql)

	sql = "update menu set enable=0 where menuId=46;"
	m.SQL(sql)


}

// Reverse the migrations
func (m *Menu_20170122_115514) Down() {
	// use m.SQL("DROP TABLE ...") to reverse schema update
	sql := "update menu set enable=1 where menuId=39;"
	m.SQL(sql)

	sql = "update menu set enable=1 where menuId=69;"
	m.SQL(sql)

	sql = "update menu set enable=1 where menuId=46;"
	m.SQL(sql)
}
