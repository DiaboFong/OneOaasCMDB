package controllers

import "github.com/astaxie/beego"

type ApiCallLine struct {
	Name string `json:"name"`
	Type string `json:"type"`
	Data []int64 `json:"data"`
}

type ApiCallLineGraph struct {
	XAxis []int64 `json:"xaxis"`
	Series []ApiCallLine `json:"series"`
	//图例数据
	Legend []string `json:"legend"`
}

// @Title change record
// @Description 查询API调用次数
// @Success 200 {map} map[string]interface{}
// @Param   Authorization     header    string 	  true     "认证信息"
// @Param   timestamp         query     string 	  true     "时间戳"
// @Failure 400 查询API调用次数失败
//@router / [get]
func (this *ApiCallController) GetApiCallRecord() {
	apiCallTime := this.GetString("time")

	beego.Debug("api当前调用时间是",apiCallTime)
	apiCallSelfLine := ApiCallLine{
		Name:"API内部调用",
		Type:"line",
		Data:[]int64{11,112,112,12,6,7},
	}

	apiCallOtherLine := ApiCallLine{
		Name:"API第三方调用",
		Type:"line",
		Data:[]int64{11,112,112,12,6,7},
	}

	apiCallLineGraph := ApiCallLineGraph{
		XAxis:[]int64{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
		Series:[]ApiCallLine{apiCallSelfLine,apiCallOtherLine},
		Legend:[]string{apiCallSelfLine.Name,apiCallOtherLine.Name},
	}
	this.Data["json"] = apiCallLineGraph
	this.ServeJSON()
}

