package controllers

import (
	"testing"
	"github.com/astaxie/beego/context"
)

func TestGetDatacenter(t *testing.T) {
	i := context.NewInput()
	i.SetParam("limit", "0")
	i.SetParam("offset", "40")
	i.SetParam("sort", "40")
	i.SetParam("order", "40")
	i.SetParam("search", "40")
	i.SetParam("enable", "40")
	i.SetParam("dcname", "40")
	i.SetParam("state", "40")
	i.SetParam("region", "40")
	i.SetParam("supplier", "40")
	i.SetParam("start_time", "40")
	i.SetParam("end_time", "40")
	i.SetParam("dcname", "40")
	i.SetParam("enable", "40")
	ctx := &context.Context{Input: i}

	ctrlr :=DatacenterController{}
	ctrlr.Ctx = ctx
	val, _ := ctrlr.GetInt64("limit")
	if val != 0 {
		t.Errorf("TestGetDatacenter expect 0,get %T,%v", val, val)
	}
}
