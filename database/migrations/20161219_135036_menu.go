package main

import (
	"github.com/astaxie/beego/migration"
)

// DO NOT MODIFY
type Menu_20161219_135036 struct {
	migration.Migration
}

// DO NOT MODIFY
func init() {
	m := &Menu_20161219_135036{}
	m.Created = "20161219_135036"
	migration.Register("Menu_20161219_135036", m)
}

// Run the migrations
func (m *Menu_20161219_135036) Up() {
	// use m.SQL("CREATE TABLE ...") to make schema update
	sql := "UPDATE  menu  SET name='root.visualization' WHERE menuId=46;"
	m.SQL(sql)

	sql = "UPDATE  menu  SET enable=0,name='root.visualization.tree' WHERE menuId=50;"
	m.SQL(sql)

	sql = "UPDATE  menu  SET name='root.visualization.topo' WHERE menuId=51;"
	m.SQL(sql)

	sql = "INSERT INTO menu VALUES (66,'root.visualization.rtop','资源拓扑图','/rtop',51,1,'2016-12-15 19:10:56','admin','admin','2016-12-15 19:10:56',0,3,NULL,NULL);"
	m.SQL(sql)

	sql = "INSERT INTO menu VALUES (67,'root.visualization.btop','业务拓扑图','/btop',51,1,'2016-12-15 19:10:56','admin','admin','2016-12-15 19:10:56',0,3,NULL,NULL);"
	m.SQL(sql)

	sql = "INSERT INTO menu VALUES (68,'root.visualization.rtree','资源树','/rtree',50,1,'2016-12-15 19:10:56','admin','admin','2016-12-15 19:10:56',0,3,NULL,NULL);"
	m.SQL(sql)
}

// Reverse the migrations
func (m *Menu_20161219_135036) Down() {
	// use m.SQL("DROP TABLE ...") to reverse schema update
	sql := "DELETE FROM menu WHERE menuId = 66;"
	m.SQL(sql)
	sql = "DELETE FROM menu WHERE menuId = 67;"
	m.SQL(sql)
	sql = "DELETE FROM menu WHERE menuId = 68;"
	m.SQL(sql)
}
