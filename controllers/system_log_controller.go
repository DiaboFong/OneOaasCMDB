package controllers

import (
	"github.com/astaxie/beego"
	m "oneoaas.com/cmdb/models"
	"oneoaas.com/cmdb/util"
	"strings"
)

//查询日志
func (this *SystemLogController) GetLog() {
	var sort []string
	var order []string
	var query = make(map[string]string, 0) //存储条件
	var limit int64 = -1
	var offset int64 = -1

	if v, err := this.GetInt64("limit"); err == nil {
		limit = v
	}

	if v, err := this.GetInt64("offset"); err == nil {
		offset = v
	}
	// sort: col1,col2
	if v := this.GetString("sort"); v != "" {
		sort = strings.Split(v, ",")
	}
	// order: desc,asc
	if v := this.GetString("order"); v != "" {
		order = strings.Split(v, ",")
	}

	//搜索查询,默认按模块名称查询
	if v := this.GetString("search"); v != "" {
		query["module_name__icontains"] = v
		//WHERE module_name LIKE '% %'
	}

	logList, err := m.GetLog(query, sort, order, offset, limit)
	if err != nil {
		beego.Debug("[查询日志发生错误", err.Error(), "]")
	}
	if logList == nil {
		logList = make([]interface{}, 0)
	}
	if v := this.GetString("format"); v != "" {
		if v == "total" {
			countNum, _ := m.CountLog(query)
			this.TotalRowsPageJSON(countNum, logList)
		}
	} else {
		this.DataJSON(logList)
	}
	this.ServeJSON()
}

//删除日志
func (this *SystemLogController) DelLog() {

	this.DbLog("SystemLog", "日志", "删除")
	var err error
	v := this.GetStrings("logId")
	if len(v) > 0 {
		for _, value := range v {
			for _, id := range strings.Split(value, ",") {
				logid, _ := util.StrToInt64(id)
				err = m.DelLog(logid)
			}
		}
		if err != nil {
			this.ResponseErrorJSON(400, err.Error())
		} else {
			this.Data["json"] = this.ResponseSuccessJSON(true, "删除成功", 1)
		}
	} else {
		this.Data["json"] = this.ResponseSuccessJSON(false, "删除失败", -1)
	}

	this.ServeJSON()
}
