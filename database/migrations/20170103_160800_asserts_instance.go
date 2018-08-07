package main

import (
	"github.com/astaxie/beego/migration"
)

// DO NOT MODIFY
type AssertsInstance_20170103_160800 struct {
	migration.Migration
}

// DO NOT MODIFY
func init() {
	m := &AssertsInstance_20170103_160800{}
	m.Created = "20170103_160800"
	migration.Register("AssertsInstance_20170103_160800", m)
}

// Run the migrations
func (m *AssertsInstance_20170103_160800) Up() {
	// use m.SQL("CREATE TABLE ...") to make schema update
	//增加资源实例个数字段
	sql := "ALTER TABLE asserts_instance ADD number bigint(20);"
	m.SQL(sql)
}

// Reverse the migrations
func (m *AssertsInstance_20170103_160800) Down() {
	// use m.SQL("DROP TABLE ...") to reverse schema update
	//增加资源实例个数字段
	sql := "ALTER TABLE asserts_instance DROP number;"
	m.SQL(sql)
}
