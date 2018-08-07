package controllers

import (
	"github.com/astaxie/beego"
)

type ChangeLine struct {
	Name string `json:"name"`
	Type string `json:"type"`
	Data []int64 `json:"data"`
}

type ChangeLineGraph struct {
	XAxis []int64 `json:"xaxis"`
	Series []ChangeLine `json:"series"`
	//图例数据
	Legend []string `json:"legend"`
}
// @Title change record
// @Description 查询变更记录
// @Success 200 {map} map[string]interface{}
// @Param   Authorization     header    string 	  true     "认证信息"
// @Param   timestamp         query     string 	  true     "时间戳"
// @Failure 400 查询添加变更记录
// @router / [get]
func (this *ChangeController) GetAddChangeRecord() {
	changeTime := this.GetString("time")

	beego.Debug("变更时间是",changeTime)

	DeleteChangeLine := ChangeLine{
		Name:"删除",
		Type:"line",
		Data:[]int64{1,2,4,5,6,7},
	}

	AddChangeLine := ChangeLine{
		Name:"添加",
		Type:"line",
		Data:[]int64{1,232,4,34,6,7},
	}

	UpdateChangeLine := ChangeLine{
		Name:"更新",
		Type:"line",
		Data:[]int64{11,112,112,12,6,7},
	}

	changeLineGraph := ChangeLineGraph{
		XAxis:[]int64{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
		Series:[]ChangeLine{DeleteChangeLine,AddChangeLine,UpdateChangeLine},
		Legend:[]string{DeleteChangeLine.Name,AddChangeLine.Name,UpdateChangeLine.Name},
	}
	this.Data["json"] = changeLineGraph
	this.ServeJSON()
}
