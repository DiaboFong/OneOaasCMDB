package main

import (
	"github.com/astaxie/beego/migration"
)

// DO NOT MODIFY
type AssertsColor_20161223_164256 struct {
	migration.Migration
}

// DO NOT MODIFY
func init() {
	m := &AssertsColor_20161223_164256{}
	m.Created = "20161223_164256"
	migration.Register("AssertsColor_20161223_164256", m)
}

// Run the migrations
func (m *AssertsColor_20161223_164256) Up() {
	// use m.SQL("CREATE TABLE ...") to make schema update
	//datacenter
	sql := "UPDATE  asserts  SET icon='icon-dc' WHERE id=1;"
	m.SQL(sql)

	//ipam
	sql = "UPDATE  asserts  SET icon='icon-ip' WHERE id=2;"
	m.SQL(sql)

	//business
	sql = "UPDATE  asserts  SET icon='icon-bs-rs' WHERE id=3;"
	m.SQL(sql)

	//virtualization
	sql = "UPDATE  asserts  SET icon='icon-vcenter' WHERE id=4;"
	m.SQL(sql)

	//cloud
	sql = "UPDATE  asserts  SET icon='icon-cloud' WHERE id=5;"
	m.SQL(sql)

	//supplier
	sql = "UPDATE  asserts  SET icon='icon-supplier' WHERE id=6;"
	m.SQL(sql)


}

// Reverse the migrations
func (m *AssertsColor_20161223_164256) Down() {
	// use m.SQL("DROP TABLE ...") to reverse schema update

}
