package controllers

import (
	"github.com/astaxie/beego"
	"oneoaas.com/cmdb/models"
	m "oneoaas.com/cmdb/models"
	"oneoaas.com/cmdb/util"
	"strings"
	"net/http"
)

func (this *DnspoddomainGradeController) GetAll() {
	var modelList []interface{}
	gradeArray := models.GetAllDnspoddomainGrade()
	for _, v := range gradeArray {
		//类型向上转
		modelList = append(modelList, v)
	}
	this.DataJSON(modelList)
}

// @Title dnspoddomain grade
// @Description 查询域名等级
// @Success 200 {map} map[string]interface{}
// @Param   enable      	  query     string    false    "数据是否有效 0/1"
// @Param   format     		  query   	string 	  false    "json:返回带有总记录条数"
// @Param   order     		  query   	string 	  false    "排序方式asc/desc"
// @Param   sort     		  query   	string 	  false    "排序字段"
// @Param   limit     		  query   	int    	  false    "每页的数据量"
// @Param   Authorization     header    string 	  true     "认证信息"
// @Param   timestamp         query     string 	  true     "时间戳"
// @Failure 400 查询域名等级失败
// @router /grade [get]
func (this *DnspoddomainGradeController) GetDnspoddomainGrade() {
	var sort []string
	var order []string
	var query = make(map[string]string, 0)             //存储条件
	var dnspoddomainGradeList = make([]interface{}, 0) //存储返回数据
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

	//搜索查询,默认按域名等级查询
	if v := this.GetString("search"); v != "" {
		query["name__icontains"] = v
		//WHERE name LIKE '% %'

	}

	beego.Info("查询域名等级条件",
		"offset=", offset,
		"limit=", limit,
		"sort=", sort,
		"order=", order,
		"query=", query,
	)

	dnspoddomainGradeList, err := m.GetDnspoddomainGrade(query, sort, order, offset, limit)
	if err != nil {
		beego.Debug("[查询域名等级发生错误", err.Error(), "]")
	}
	if dnspoddomainGradeList == nil {
		dnspoddomainGradeList = make([]interface{}, 0)
	}
	if v := this.GetString("format"); v != "" {
		if v == "total" {
			countNum, _ := m.CountDnspoddomainGrade(query)
			this.TotalRowsPageJSON(countNum, dnspoddomainGradeList)
		}
	} else {
		this.DataJSON(dnspoddomainGradeList)
	}
	this.ServeJSON()
}

// @Title dnspoddomain grade
// @Description 添加域名等级
// @Success 200 {map} map[string]interface{}
// @Param   dnspoddomainGrade  query   string  true  "域名等级"
// @Param   Authorization      header  string  true  "认证信息"
// @Param   timestamp          query   string  true  "时间戳"
// @Failure 400 添加域名等级失败
// @router /grade [post]
func (this *DnspoddomainGradeController) AddDnspoddomainGrade() {

	this.DbLog("DnspoddomainGrade", "域名等级", "添加")

	var dnspoddomainGrade m.DnspoddomainGrade
	if Name := this.GetString("dnspoddomainGrade", ""); Name != "" {
		dnspoddomainGrade.Name = Name
	}
	dnspoddomainGrade.CreateBy = this.GetString("createBy", "")

	if dnspoddomainGrade.Name != "" {
		id, err := m.AddDnspoddomainGrade(dnspoddomainGrade)
		if err != nil {
			beego.Debug("[保存域名等级错误", err.Error(), "]")
			this.ResponseErrorJSON(http.StatusOK, err.Error())
		} else {
			beego.Debug("[保存域名等级成功,id是", id, "]")
			this.Data["json"] = this.ResponseSuccessJSON(true, "添加域名等级成功", id)
		}
	}else{
		this.Data["json"] = this.ResponseSuccessJSON(false, "域名等级不能为空", -1)
	}

	this.ServeJSON()
}

// @Title dnspoddomain grade
// @Description 通过id删除域名等级
// @Success 200 {map}
// @Param   dnspoddomainGradeId  query    string  true  "域名等级ID"
// @Param   Authorization        header   string  true  "认证信息"
// @Param   timestamp            query    string  true  "时间戳"
// @Failure 400 删除域名等级失败
// @router /grade [delete]
func (this *DnspoddomainGradeController) DelDnspoddomainGrade() {

	this.DbLog("DnspoddomainGrade", "域名等级", "删除")

	var err error
	v := this.GetStrings("dnspoddomainGradeId")
	if len(v) > 0 {
		for index, value := range v {
			for _, id := range strings.Split(value, ",") {
				beego.Info("索引ID是:", index)
				beego.Info("值是:", id)
				dnspoddomainGradeId, _ := util.StrToInt64(id)
				beego.Debug("[删除的域名等级,ID是", dnspoddomainGradeId, "]")
				err = m.DelDnspoddomainGrade(dnspoddomainGradeId)
			}
		}
		if err != nil {
			this.ResponseErrorJSON(http.StatusOK, err.Error())
		} else {
			this.Data["json"] = this.ResponseSuccessJSON(true, "删除域名等级成功", 1)
		}
	} else {
		this.Data["json"] = this.ResponseSuccessJSON(false, "删除域名等级失败", -1)
	}
	this.ServeJSON()
}

// @Title dnspoddomain grade
// @Description 更新域名等级
// @Success 200 {map} map[string]interface{}
// @Param   dnspoddomainGradeId   query    int64   true    "域名等级ID"
// @Param   dnspoddomainGrade     query    string  true    "域名等级"
// @Param   Authorization         header   string  true    "认证信息"
// @Param   timestamp             query    string  true    "时间戳"
// @Failure 400 更新域名等级失败
// @router /grade [put]
func (this *DnspoddomainGradeController) PutDnspoddomainGrade() {

	this.DbLog("DnspoddomainGrade", "域名等级", "更新")

	dnspoddomainGradeId, _ := this.GetInt64("dnspoddomainGradeId", 0)
	dnspoddomainGrade, err := m.GetDnspoddomainGradeById(dnspoddomainGradeId)
	if err != nil {
		this.ResponseErrorJSON(http.StatusOK, err.Error())
	}
	dnspoddomainGrade.Name = strings.TrimSpace(this.GetString("dnspoddomainGrade", ""))
	beego.Info("[域名等级Id是", dnspoddomainGrade.Id, "域名等级是", dnspoddomainGrade.Name, "]")

	if updateBy := this.GetString("updateBy", ""); updateBy != "" {
		dnspoddomainGrade.UpdateBy = updateBy
	}

	if err := m.PutDnspoddomainGrade(dnspoddomainGrade); err == nil {
		this.Data["json"] = this.ResponseSuccessJSON(true, "更新域名等级成功", 1)
	} else {
		this.Data["json"] = this.ResponseSuccessJSON(false, "更新域名等级失败", -1)
	}
	this.ServeJSON()
}
