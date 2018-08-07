package main

import (
	"github.com/astaxie/beego/migration"
)

// DO NOT MODIFY
type Menu_20170121_165738 struct {
	migration.Migration
}

// DO NOT MODIFY
func init() {
	m := &Menu_20170121_165738{}
	m.Created = "20170121_165738"
	migration.Register("Menu_20170121_165738", m)
}

// Run the migrations
func (m *Menu_20170121_165738) Up() {
	// use m.SQL("CREATE TABLE ...") to make schema update
	sql := "update menu set display_name='菜单权限' where menuId=36;"
	m.SQL(sql)

	sql = "update menu set enable=0 where menuId=37;"
	m.SQL(sql)
}

// Reverse the migrations
func (m *Menu_20170121_165738) Down() {
	// use m.SQL("DROP TABLE ...") to reverse schema update
	sql := "update menu set display_name='角色列表' where menuId=36;"
	m.SQL(sql)

	sql = "update menu set enable=1 where menuId=37;"
	m.SQL(sql)
}
