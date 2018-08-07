package controllers

import (
	"github.com/astaxie/beego"
	"oneoaas.com/cmdb/models"
	m "oneoaas.com/cmdb/models"
	"oneoaas.com/cmdb/util"
	"strings"
	"net/http"
)

func (this *DnspoddomainStateController) GetAll() {
	var modelList []interface{}
	stateArray := models.GetAllDnspoddomainState()
	for _, v := range stateArray {
		//类型向上转
		modelList = append(modelList, v)
	}
	this.DataJSON(modelList)
}

// @Title dnspoddomain state
// @Description 查询域名状态
// @Success 200 {map} map[string]interface{}
// @Param   enable      	  query     string    false    "数据是否有效 0/1"
// @Param   format     		  query   	string 	  false    "json:返回带有总记录条数"
// @Param   order     		  query   	string 	  false    "排序方式asc/desc"
// @Param   sort     		  query   	string 	  false    "排序字段"
// @Param   limit     		  query   	int    	  false    "每页的数据量"
// @Param   Authorization     header    string 	  true     "认证信息"
// @Param   timestamp         query     string 	  true     "时间戳"
// @Failure 400 查询域名状态失败
// @router /dnspoddomain [get]
func (this *DnspoddomainStateController) GetDnspoddomainState() {
	var sort []string
	var order []string
	var query = make(map[string]string, 0)             //存储条件
	var dnspoddomainStateList = make([]interface{}, 0) //存储返回数据
	var limit int64 = 10
	var offset int64 = 0

	// limit: 10 (default is 10)
	if v, err := this.GetInt64("limit"); err == nil {
		limit = v
	}else{
		limit = 0
	}

	// offset: 0 (default is 0)
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

	//搜索查询,默认按域名状态查询
	if v := this.GetString("search"); v != "" {
		query["state__icontains"] = v
		//WHERE state LIKE '% %'

	}

	beego.Info("查询域名状态条件",
		"offset=", offset,
		"limit=", limit,
		"sort=", sort,
		"order=", order,
		"query=", query,
	)

	dnspoddomainStateList, err := m.GetDnspoddomainState(query, sort, order, offset, limit)
	if err != nil {
		beego.Debug("[查询域名状态发生错误", err.Error(), "]")
	}
	if dnspoddomainStateList == nil {
		dnspoddomainStateList = make([]interface{}, 0)
	}
	if v := this.GetString("format"); v != "" {
		if v == "total" {
			countNum, _ := m.CountDnspoddomainState(query)
			this.TotalRowsPageJSON(countNum, dnspoddomainStateList)
		}
	} else {
		this.DataJSON(dnspoddomainStateList)
	}
	this.ServeJSON()
}

// @Title dnspoddomain state
// @Description 添加域名状态
// @Success 200 {map} map[string]interface{}
// @Param   dnspoddomainState  query   string  true  "域名状态"
// @Param   color     		   query   string  false "颜色"
// @Param   Authorization      header  string  true  "认证信息"
// @Param   timestamp          query   string  true  "时间戳"
// @Failure 400 添加域名状态失败
// @router /dnspoddomain [post]
func (this *DnspoddomainStateController) AddDnspoddomainState() {

	this.DbLog("DnspoddomainState", "域名状态", "添加")

	var dnspoddomainState m.DnspoddomainState
	if State := this.GetString("dnspoddomainState", ""); State != "" {
		dnspoddomainState.State = State
	}
	color := this.GetString("color", "")
	dnspoddomainState.Color=color
	dnspoddomainState.CreateBy = this.GetString("createBy", "")

	if dnspoddomainState.State != "" {
		id, err := m.AddDnspoddomainState(dnspoddomainState)
		if err != nil {
			beego.Debug("[保存域名状态错误", err.Error(), "]")
			this.ResponseErrorJSON(http.StatusOK, err.Error())
		} else {
			beego.Debug("[保存域名状态成功,id是", id, "]")
			this.Data["json"] = this.ResponseSuccessJSON(true, "添加域名状态成功", id)
		}
	}else{
		this.Data["json"] = this.ResponseSuccessJSON(false, "域名状态不能为空", -1)
	}

	this.ServeJSON()
}

// @Title dnspoddomain state
// @Description 通过id删除域名状态
// @Success 200 {map}
// @Param   dnspoddomainStateId  query    string  true  "域名状态ID"
// @Param   Authorization        header   string  true  "认证信息"
// @Param   timestamp            query    string  true  "时间戳"
// @Failure 400 删除域名状态失败
// @router /dnspoddomain [delete]
func (this *DnspoddomainStateController) DelDnspoddomainState() {

	this.DbLog("DnspoddomainState", "域名状态", "删除")

	var err error
	v := this.GetStrings("dnspoddomainStateId")
	if len(v) > 0 {
		for index, value := range v {
			for _, id := range strings.Split(value, ",") {
				beego.Info("索引ID是:", index)
				beego.Info("值是:", id)
				dnspoddomainStateId, _ := util.StrToInt64(id)
				beego.Debug("[删除的域名状态,ID是", dnspoddomainStateId, "]")
				err = m.DelDnspoddomainState(dnspoddomainStateId)
			}
		}
		if err != nil {
			this.ResponseErrorJSON(http.StatusOK, err.Error())
		} else {
			this.Data["json"] = this.ResponseSuccessJSON(true, "删除域名状态成功", 1)
		}
	} else {
		this.Data["json"] = this.ResponseSuccessJSON(false, "删除域名状态失败", -1)
	}
	this.ServeJSON()
}

// @Title dnspoddomain state
// @Description 更新域名状态
// @Success 200 {map} map[string]interface{}
// @Param   dnspoddomainStateId query    int64   true    "域名状态ID"
// @Param   dnspoddomainState   query    string  true    "域名状态"
// @Param   color               query    string  false   "颜色"
// @Param   Authorization       header   string  true    "认证信息"
// @Param   timestamp           query    string  true    "时间戳"
// @Failure 400 更新域名状态失败
// @router /dnspoddomain [put]
func (this *DnspoddomainStateController) PutDnspoddomainState() {

	this.DbLog("DnspoddomainState", "域名状态", "更新")

	dnspoddomainStateId, _ := this.GetInt64("dnspoddomainStateId", 0)
	color := this.GetString("color", "")

	dnspoddomainState, err := m.GetDnspoddomainStateById(dnspoddomainStateId)
	if err != nil {
		this.ResponseErrorJSON(http.StatusOK, err.Error())
	}
	dnspoddomainState.Color=color

	dnspoddomainState.State = strings.TrimSpace(this.GetString("dnspoddomainState", ""))
	beego.Info("[域名状态Id是", dnspoddomainState.Id, "域名状态是", dnspoddomainState.State, "]")

	if updateBy := this.GetString("updateBy", ""); updateBy != "" {
		dnspoddomainState.UpdateBy = updateBy
	}

	if err := m.PutDnspoddomainState(dnspoddomainState); err == nil {
		this.Data["json"] = this.ResponseSuccessJSON(true, "更新域名状态成功", 1)
	} else {
		this.Data["json"] = this.ResponseSuccessJSON(false, "更新域名状态失败", -1)
	}
	this.ServeJSON()
}
