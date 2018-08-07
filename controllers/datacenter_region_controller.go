package controllers

import (
	"github.com/astaxie/beego"
	"oneoaas.com/cmdb/models"
	m "oneoaas.com/cmdb/models"
	"oneoaas.com/cmdb/util"
	"strings"
	"net/http"
)

func (this *DcRegionController) GetAll() {
	var ml []interface{}
	regionArray := models.GetAllDatacenterRegion()
	for _, v := range regionArray {
		ml = append(ml, v)
	}
	this.DataJSON(ml)
}

// @Title datacenter region
// @Description 查询数据中心区域
// @Success 200 {map} map[string]interface{}
// @Param   enable      	  query     string    false    "数据是否有效 0/1"
// @Param   format     		  query   	string 	  false    "json:返回带有总记录条数"
// @Param   order     		  query   	string 	  false    "排序方式asc/desc"
// @Param   sort     		  query   	string 	  false    "排序字段"
// @Param   limit     		  query   	int    	  false    "每页的数据量"
// @Param   Authorization     header    string 	  true     "认证信息"
// @Param   timestamp         query     string 	  true     "时间戳"
// @Failure 400 查询数据中心区域失败
// @router /region [get]
func (this *DcRegionController) GetDcRegion() {
	var sort []string
	var order []string
	var query = make(map[string]string, 0)    //存储条件
	var dcRegionList = make([]interface{}, 0) //存储返回数据
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

	//搜索查询,默认按数据中心区域查询
	if v := this.GetString("search"); v != "" {
		query["regionName__icontains"] = v
		//WHERE regionName LIKE '% %'

	}

	dcRegionList, err := m.GetDcRegion(query, sort, order, offset, limit)
	if err != nil {
		beego.Debug("[查询数据中心区域发生错误", err.Error(), "]")
	}
	if dcRegionList == nil {
		dcRegionList = make([]interface{}, 0)
	}
	if v := this.GetString("format"); v != "" {
		if v == "total" {
			countNum, _ := m.CountDcRegion(query)
			this.TotalRowsPageJSON(countNum, dcRegionList)
		}
	} else {
		this.DataJSON(dcRegionList)
	}
	this.ServeJSON()
}

// @Title datacenter region
// @Description 添加数据中心区域
// @Success 200 {map} map[string]interface{}
// @Param   dcRegion           query   string  true  "数据中心区域"
// @Param   Authorization      header  string  true  "认证信息"
// @Param   timestamp          query   string  true  "时间戳"
// @Failure 400 添加数据中心区域失败
// @router /region [post]
func (this *DcRegionController) AddDcRegion() {

	this.DbLog("DatacenterRegion", "数据中心区域", "添加")

	var dcRegion m.DatacenterRegion

	if RegionName := this.GetString("dcRegion", ""); RegionName != "" {
		dcRegion.RegionName = RegionName
	}
	dcRegion.CreateBy = this.GetString("createBy", "")

	if dcRegion.RegionName != "" {
		id, err := m.AddDcRegion(dcRegion)
		if err != nil {
			beego.Debug("[保存数据中心区域错误", err.Error(), "]")
			this.ResponseErrorJSON(http.StatusOK, err.Error())
		} else {
			beego.Debug("[保存数据中心区域成功,id是", id, "]")
			this.Data["json"] = this.ResponseSuccessJSON(true, "添加数据中心区域成功", id)
		}
	}else{
		this.Data["json"] = this.ResponseSuccessJSON(false, "数据中心区域不能为空", -1)
	}

	this.ServeJSON()
}

// @Title datacenter region
// @Description 通过id删除数据中心区域
// @Success 200 {map}
// @Param   dcRegionId           query    string  true  "数据中心区域ID"
// @Param   Authorization        header   string  true  "认证信息"
// @Param   timestamp            query    string  true  "时间戳"
// @Failure 400 删除数据中心区域失败
// @router /region [delete]
func (this *DcRegionController) DelDcRegion() {

	this.DbLog("DatacenterRegion", "数据中心区域", "删除")

	var err error
	v := this.GetStrings("dcRegionId")
	if len(v) > 0 {
		for index, value := range v {
			for _, id := range strings.Split(value, ",") {
				beego.Info("索引ID是:", index)
				beego.Info("值是:", id)
				dcRegionId, _ := util.StrToInt64(id)
				beego.Debug("[删除的数据中心区域,ID是", dcRegionId, "]")
				err = m.DelDcRegion(dcRegionId)
			}
		}
		if err != nil {
			this.ResponseErrorJSON(http.StatusOK, err.Error())
		} else {
			this.Data["json"] = this.ResponseSuccessJSON(true, "删除数据中心区域成功", 1)
		}
	} else {
		this.Data["json"] = this.ResponseSuccessJSON(false, "删除数据中心区域失败", -1)
	}
	this.ServeJSON()
}

// @Title datacenter region
// @Description 更新数据中心区域
// @Success 200 {map} map[string]interface{}
// @Param   dcRegionId        query    int64   true    "数据中心区域ID"
// @Param   dcRegion          query    string  true    "数据中心区域"
// @Param   Authorization     header   string  true    "认证信息"
// @Param   timestamp         query    string  true    "时间戳"
// @Failure 400 更新数据中心区域失败
// @router /region [put]
func (this *DcRegionController) PutDcRegion() {

	this.DbLog("DatacenterRegion", "数据中心区域", "更新")

	dcRegionId, _ := this.GetInt64("dcRegionId", 0)
	dcRegion, err := m.GetDatacenterRegionById(dcRegionId)
	if err != nil {
		this.ResponseErrorJSON(http.StatusOK, err.Error())
	}
	dcRegion.RegionName = strings.TrimSpace(this.GetString("dcRegion", ""))
	beego.Info("[数据中心区域Id是", dcRegion.Id, "数据中心区域是", dcRegion.RegionName, "]")

	if updateBy := this.GetString("updateBy", ""); updateBy != "" {
		dcRegion.UpdateBy = updateBy
	}

	if err := m.PutDcRegion(dcRegion); err == nil {
		this.Data["json"] = this.ResponseSuccessJSON(true, "更新数据中心区域成功", 1)
	} else {
		this.Data["json"] = this.ResponseSuccessJSON(false, "更新数据中心区域失败", -1)
	}
	this.ServeJSON()
}
