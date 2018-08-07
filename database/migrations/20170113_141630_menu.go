package main

import (
	"github.com/astaxie/beego/migration"
)

// DO NOT MODIFY
type Menu_20170113_141630 struct {
	migration.Migration
}

// DO NOT MODIFY
func init() {
	m := &Menu_20170113_141630{}
	m.Created = "20170113_141630"
	migration.Register("Menu_20170113_141630", m)
}

// Run the migrations
func (m *Menu_20170113_141630) Up() {
	// use m.SQL("CREATE TABLE ...") to make schema update
	sql := "update menu set enable=1 where menuId=50;"
	m.SQL(sql)

}

// Reverse the migrations
func (m *Menu_20170113_141630) Down() {
	// use m.SQL("DROP TABLE ...") to reverse schema update
	sql := "update menu set enable=0 where menuId=50;"
	m.SQL(sql)
}
