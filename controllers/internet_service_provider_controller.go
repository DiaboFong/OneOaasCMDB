package controllers

import (
	"github.com/astaxie/beego"
	"oneoaas.com/cmdb/models"
	m "oneoaas.com/cmdb/models"
	"oneoaas.com/cmdb/util"
	"strings"
	"net/http"
)

func (this *InternetServiceProviderController) GetAll() {
	var ml []interface{}
	regionArray := models.GetAllInternetServiceProvider()
	for _, v := range regionArray {
		//类型向上转
		ml = append(ml, v)
	}
	this.DataJSON(ml)
}

// @Title networkbandwidth isp
// @Description 查询网络服务提供商
// @Success 200 {map} map[string]interface{}
// @Param   enable      	  query     string    false    "数据是否有效 0/1"
// @Param   format     		  query   	string 	  false    "json:返回带有总记录条数"
// @Param   order     		  query   	string 	  false    "排序方式asc/desc"
// @Param   sort     		  query   	string 	  false    "排序字段"
// @Param   limit     		  query   	int    	  false    "每页的数据量"
// @Param   Authorization     header    string 	  true     "认证信息"
// @Param   timestamp         query     string 	  true     "时间戳"
// @Failure 400 查询网络服务提供商失败
// @router /isp [get]
func (this *InternetServiceProviderController) GetIsp() {
	var sort []string
	var order []string
	var query = make(map[string]string, 0) //存储条件
	var ispList = make([]interface{}, 0)   //存储返回数据
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

	//搜索查询,默认按网络服务提供商查询
	if v := this.GetString("search"); v != "" {
		query["name__icontains"] = v
		//WHERE name LIKE '% %'

	}

	beego.Info("查询网络服务提供商条件",
		"offset=", offset,
		"limit=", limit,
		"sort=", sort,
		"order=", order,
		"query=", query,
	)

	ispList, err := m.GetIsp(query, sort, order, offset, limit)
	if err != nil {
		beego.Debug("[查询网络服务提供商发生错误", err.Error(), "]")
	}
	if ispList == nil {
		ispList = make([]interface{}, 0)
	}
	if v := this.GetString("format"); v != "" {
		if v == "total" {
			countNum, _ := m.CountIsp(query)
			this.TotalRowsPageJSON(countNum, ispList)
		}
	} else {
		this.DataJSON(ispList)
	}
	this.ServeJSON()
}

// @Title networkbandwidth isp
// @Description 添加网络服务提供商
// @Success 200 {map} map[string]interface{}
// @Param   isp                query   string  true  "网络服务提供商"
// @Param   Authorization      header  string  true  "认证信息"
// @Param   timestamp          query   string  true  "时间戳"
// @Failure 400 添加网络服务提供商失败
// @router /isp [post]
func (this *InternetServiceProviderController) AddIsp() {

	this.DbLog("ISP", "网络服务提供商", "添加")

	var isp m.InternetServiceProvider
	if Name := this.GetString("isp", ""); Name != "" {
		isp.Name = Name
	}
	isp.CreateBy = this.GetString("createBy", "")

	if isp.Name != "" {
		id, err := m.AddIsp(isp)
		if err != nil {
			beego.Debug("[保存网络服务提供商错误", err.Error(), "]")
			this.ResponseErrorJSON(http.StatusOK, err.Error())
		} else {
			beego.Debug("[保存网络服务提供商成功,id是", id, "]")
			this.Data["json"] = this.ResponseSuccessJSON(true, "添加网络服务提供商成功", id)
		}
	}else{
		this.Data["json"] = this.ResponseSuccessJSON(false, "网络服务提供商不能为空", -1)
	}

	this.ServeJSON()
}

// @Title networkbandwidth isp
// @Description 通过id删除网络服务提供商
// @Success 200 {map}
// @Param   ispId                query    string  true  "网络服务提供商ID"
// @Param   Authorization        header   string  true  "认证信息"
// @Param   timestamp            query    string  true  "时间戳"
// @Failure 400 删除网络服务提供商失败
// @router /isp [delete]
func (this *InternetServiceProviderController) DelIsp() {

	this.DbLog("ISP", "网络服务提供商", "删除")

	var err error
	v := this.GetStrings("ispId")
	if len(v) > 0 {
		for index, value := range v {
			for _, id := range strings.Split(value, ",") {
				beego.Info("索引ID是:", index)
				beego.Info("值是:", id)
				ispId, _ := util.StrToInt64(id)
				beego.Debug("[删除的网络服务提供商,ID是", ispId, "]")
				err = m.DelIsp(ispId)
			}
		}
		if err != nil {
			this.ResponseErrorJSON(http.StatusOK, err.Error())
		} else {
			this.Data["json"] = this.ResponseSuccessJSON(true, "删除网络服务提供商成功", 1)
		}
	} else {
		this.Data["json"] = this.ResponseSuccessJSON(false, "删除网络服务提供商失败", -1)
	}
	this.ServeJSON()
}

// @Title networkbandwidth isp
// @Description 更新网络服务提供商
// @Success 200 {map} map[string]interface{}
// @Param   ispId             query    int64   true    "网络服务提供商ID"
// @Param   isp               query    string  true    "网络服务提供商"
// @Param   Authorization     header   string  true    "认证信息"
// @Param   timestamp         query    string  true    "时间戳"
// @Failure 400 更新网络服务提供商失败
// @router /isp [put]
func (this *InternetServiceProviderController) PutIsp() {

	this.DbLog("ISP", "网络服务提供商", "更新")

	ispId, _ := this.GetInt64("ispId", 0)
	isp, err := m.GetInternetServiceProviderById(ispId)
	if err != nil {
		this.ResponseErrorJSON(http.StatusOK, err.Error())
	}
	isp.Name = strings.TrimSpace(this.GetString("isp", ""))
	beego.Info("[网络服务提供商Id是", isp.Id, "网络服务提供商是", isp.Name, "]")

	if updateBy := this.GetString("updateBy", ""); updateBy != "" {
		isp.UpdateBy = updateBy
	}

	if err := m.PutIsp(isp); err == nil {
		this.Data["json"] = this.ResponseSuccessJSON(true, "更新网络服务提供商成功", 1)
	} else {
		this.Data["json"] = this.ResponseSuccessJSON(false, "更新网络服务提供商失败", -1)
	}
	this.ServeJSON()
}
