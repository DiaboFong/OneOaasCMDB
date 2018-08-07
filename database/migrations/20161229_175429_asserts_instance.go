package main

import (
	"github.com/astaxie/beego/migration"
)

// DO NOT MODIFY
type AssertsInstance_20161229_175429 struct {
	migration.Migration
}

// DO NOT MODIFY
func init() {
	m := &AssertsInstance_20161229_175429{}
	m.Created = "20161229_175429"
	migration.Register("AssertsInstance_20161229_175429", m)
}

// Run the migrations
func (m *AssertsInstance_20161229_175429) Up() {
	// use m.SQL("CREATE TABLE ...") to make schema update
	//datacenter
	sql := "UPDATE  asserts_instance  SET icon='icon-index-dc' WHERE id=1;"
	m.SQL(sql)

	//room
	sql = "UPDATE  asserts_instance  SET icon='icon-index-room' WHERE id=2;"
	m.SQL(sql)

	//rack
	sql = "UPDATE  asserts_instance  SET icon='icon-index-rack' WHERE id=3;"
	m.SQL(sql)

	//bandwidth
	sql = "UPDATE  asserts_instance  SET icon='icon-index-bandwidth' WHERE id=4;"
	m.SQL(sql)

	//hardware
	sql = "UPDATE  asserts_instance  SET icon='icon-index-hardware' WHERE id=5;"
	m.SQL(sql)

	//server
	sql = "UPDATE  asserts_instance  SET icon='icon-index-server' WHERE id=6;"
	m.SQL(sql)

	//ip
	sql = "UPDATE  asserts_instance  SET icon='icon-index-ip' WHERE id=7;"
	m.SQL(sql)

	//domain
	sql = "UPDATE  asserts_instance  SET icon='icon-index-domain' WHERE id=8;"
	m.SQL(sql)

	//app
	sql = "UPDATE  asserts_instance  SET icon='icon-index-app' WHERE id=9;"
	m.SQL(sql)

	//vcenter
	sql = "UPDATE  asserts_instance  SET icon='icon-index-vcenter' WHERE id=10;"
	m.SQL(sql)

	//aliyun
	sql = "UPDATE  asserts_instance  SET icon='icon-index-aliyun' WHERE id=11;"
	m.SQL(sql)

	//aws
	sql = "UPDATE  asserts_instance  SET icon='icon-index-aws' WHERE id=12;"
	m.SQL(sql)

	//supplier
	sql = "UPDATE  asserts_instance  SET icon='icon-index-supplier' WHERE id=13;"
	m.SQL(sql)

	//agreement
	sql = "UPDATE  asserts_instance  SET icon='icon-supplier' WHERE id=14;"
	m.SQL(sql)

	m.SQL(sql)
}

// Reverse the migrations
func (m *AssertsInstance_20161229_175429) Down() {
	// use m.SQL("DROP TABLE ...") to reverse schema update

}
