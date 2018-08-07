package main

import (
	"github.com/astaxie/beego/migration"
)

// DO NOT MODIFY
type DevicePerformanceReport_20161230_145934 struct {
	migration.Migration
}

// DO NOT MODIFY
func init() {
	m := &DevicePerformanceReport_20161230_145934{}
	m.Created = "20161230_145934"
	migration.Register("DevicePerformanceReport_20161230_145934", m)
}

// Run the migrations
func (m *DevicePerformanceReport_20161230_145934) Up() {
	// use m.SQL("CREATE TABLE ...") to make schema update
	sql := "INSERT INTO device_performance_report(device,cpu,memory,disk_usage,nic_usage) VALUES ('192.168.4.2',30,40,50,60);"
	m.SQL(sql)

	sql = "INSERT INTO device_performance_report(device,cpu,memory,disk_usage,nic_usage) VALUES ('192.168.4.2',31,41,51,61);"
	m.SQL(sql)

}

// Reverse the migrations
func (m *DevicePerformanceReport_20161230_145934) Down() {
	// use m.SQL("DROP TABLE ...") to reverse schema update

}
