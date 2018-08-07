package controllers

import (
	"github.com/astaxie/beego"
	"oneoaas.com/cmdb/models"
	m "oneoaas.com/cmdb/models"
	"oneoaas.com/cmdb/util"
	"strings"
	"net/http"
)

func (this *AppLevelController) GetAll() {
	var modelList []interface{}
	levelArray := models.GetAllAppLevel()
	for _, v := range levelArray {
		//级别向上转
		modelList = append(modelList, v)
	}
	this.DataJSON(modelList)
}

// @Title app level
// @Description 查询业务等级
// @Success 200 {map} map[string]interface{}
// @Param   enable      	  query     string    false    "数据是否有效 0/1"
// @Param   format     		  query   	string 	  false    "json:返回带有总记录条数"
// @Param   order     		  query   	string 	  false    "排序方式asc/desc"
// @Param   sort     		  query   	string 	  false    "排序字段"
// @Param   limit     		  query   	int    	  false    "每页的数据量"
// @Param   Authorization     header    string 	  true     "认证信息"
// @Param   timestamp         query     string 	  true     "时间戳"
// @Failure 400 查询业务等级失败
// @router /level [get]
func (this *AppLevelController) GetAppLevel() {
	var sort []string
	var order []string
	var query = make(map[string]string, 0)    //存储条件
	var appLevelList = make([]interface{}, 0) //存储返回数据
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

	//搜索查询,默认按业务等级查询
	if v := this.GetString("search"); v != "" {
		query["name__icontains"] = v
		//WHERE name LIKE '% %'

	}

	beego.Info("查询业务等级条件",
		"offset=", offset,
		"limit=", limit,
		"sort=", sort,
		"order=", order,
		"query=", query,
	)

	appLevelList, err := m.GetAppLevel(query, sort, order, offset, limit)
	if err != nil {
		beego.Debug("[查询业务等级发生错误", err.Error(), "]")
	}
	if appLevelList == nil {
		appLevelList = make([]interface{}, 0)
	}
	if v := this.GetString("format"); v != "" {
		if v == "total" {
			countNum, _ := m.CountAppLevel(query)
			this.TotalRowsPageJSON(countNum, appLevelList)
		}
	} else {
		this.DataJSON(appLevelList)
	}
	this.ServeJSON()
}

// @Title app level
// @Description 添加业务等级
// @Success 200 {map} map[string]interface{}
// @Param   appLevel           query   string  true  "业务等级"
// @Param   Authorization      header  string  true  "认证信息"
// @Param   timestamp          query   string  true  "时间戳"
// @Failure 400 添加业务等级失败
// @router /level [post]
func (this *AppLevelController) AddAppLevel() {

	this.DbLog("AppLevel", "业务级别", "添加")

	var appLevel m.AppLevel
	if Name := this.GetString("appLevel", ""); Name != "" {
		appLevel.Name = Name
	}
	appLevel.CreateBy = this.GetString("createBy", "")

	if appLevel.Name != "" {
		id, err := m.AddAppLevel(appLevel)
		if err != nil {
			beego.Debug("[保存业务等级错误", err.Error(), "]")
			this.ResponseErrorJSON(http.StatusOK, err.Error())
		} else {
			beego.Debug("[保存业务等级成功,id是", id, "]")
			this.Data["json"] = this.ResponseSuccessJSON(true, "添加业务等级成功", id)
		}
	}else{
		this.Data["json"] = this.ResponseSuccessJSON(false, "业务等级不能为空", -1)
	}

	this.ServeJSON()
}

// @Title app level
// @Description 通过id删除业务等级
// @Success 200 {map}
// @Param   appLevelId           query    string  true  "业务等级ID"
// @Param   Authorization        header   string  true  "认证信息"
// @Param   timestamp            query    string  true  "时间戳"
// @Failure 400 删除业务等级失败
// @router /level [delete]
func (this *AppLevelController) DelAppLevel() {

	this.DbLog("AppLevel", "业务级别", "删除")

	var err error
	v := this.GetStrings("appLevelId")
	if len(v) > 0 {
		for index, value := range v {
			for _, id := range strings.Split(value, ",") {
				beego.Info("索引ID是:", index)
				beego.Info("值是:", id)
				appLevelId, _ := util.StrToInt64(id)
				beego.Debug("[删除的业务等级,ID是", appLevelId, "]")
				err = m.DelAppLevel(appLevelId)
			}
		}
		if err != nil {
			this.ResponseErrorJSON(http.StatusOK, err.Error())
		} else {
			this.Data["json"] = this.ResponseSuccessJSON(true, "删除业务等级成功", 1)
		}
	} else {
		this.Data["json"] = this.ResponseSuccessJSON(false, "删除业务等级失败", -1)
	}
	this.ServeJSON()
}

// @Title app level
// @Description 更新业务等级
// @Success 200 {map} map[string]interface{}
// @Param   appLevelId        query    int64   true    "业务等级ID"
// @Param   appLevel          query    string  true    "业务等级"
// @Param   Authorization     header   string  true    "认证信息"
// @Param   timestamp         query    string  true    "时间戳"
// @Failure 400 更新业务等级失败
// @router /level [put]
func (this *AppLevelController) PutAppLevel() {

	this.DbLog("AppLevel", "业务级别", "更新")

	appLevelId, _ := this.GetInt64("appLevelId", 0)
	appLevel, err := m.GetAppLevelById(appLevelId)
	if err != nil {
		this.ResponseErrorJSON(http.StatusOK, err.Error())
	}
	appLevel.Name = strings.TrimSpace(this.GetString("appLevel", ""))
	beego.Info("[业务等级Id是", appLevel.Id, "业务等级是", appLevel.Name, "]")

	if updateBy := this.GetString("updateBy", ""); updateBy != "" {
		appLevel.UpdateBy = updateBy
	}

	if err := m.PutAppLevel(appLevel); err == nil {
		this.Data["json"] = this.ResponseSuccessJSON(true, "更新业务等级成功", 1)
	} else {
		this.Data["json"] = this.ResponseSuccessJSON(false, "更新业务等级失败", -1)
	}
	this.ServeJSON()
}
