package main

import (
	"github.com/astaxie/beego/migration"
)

// DO NOT MODIFY
type Menu_20161215_101702 struct {
	migration.Migration
}

// DO NOT MODIFY
func init() {
	m := &Menu_20161215_101702{}
	m.Created = "20161215_101702"
	migration.Register("Menu_20161215_101702", m)
}

// Run the migrations
func (m *Menu_20161215_101702) Up() {
	// use m.SQL("CREATE TABLE ...") to make schema update
	sql := "INSERT INTO menu VALUES (4,'root.report','资源报表','',0,1,'2016-12-15 19:10:56','admin','admin','2016-12-15 19:10:56',0,1,NULL,NULL);"
	m.SQL(sql)
}

// Reverse the migrations
func (m *Menu_20161215_101702) Down() {
	// use m.SQL("DROP TABLE ...") to reverse schema update
	sql := "DELETE FROM menu WHERE menuId = 4;"
	m.SQL(sql)
}
