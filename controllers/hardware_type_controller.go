package controllers

import (
	"github.com/astaxie/beego"
	"oneoaas.com/cmdb/models"
	m "oneoaas.com/cmdb/models"
	"oneoaas.com/cmdb/util"
	"strings"
	"net/http"
)

func (this *HardwareTypeController) GetAll() {
	var modelList []interface{}
	typeArray := models.GetAllHardwareType()
	for _, v := range typeArray {
		//类型向上转
		modelList = append(modelList, v)
	}
	this.DataJSON(modelList)
}

// @Title hardware type
// @Description 查询硬件类型
// @Success 200 {map} map[string]interface{}
// @Param   enable      	  query     string    false    "数据是否有效 0/1"
// @Param   format     		  query   	string 	  false    "json:返回带有总记录条数"
// @Param   order     		  query   	string 	  false    "排序方式asc/desc"
// @Param   sort     		  query   	string 	  false    "排序字段"
// @Param   limit     		  query   	int    	  false    "每页的数据量"
// @Param   Authorization     header    string 	  true     "认证信息"
// @Param   timestamp         query     string 	  true     "时间戳"
// @Failure 400 查询硬件类型失败
// @router /type [get]
func (this *HardwareTypeController) GetHardwareType() {
	var sort []string
	var order []string
	var query = make(map[string]string, 0)        //存储条件
	var hardwareTypeList = make([]interface{}, 0) //存储返回数据
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

	//搜索查询,默认按硬件类型查询
	if v := this.GetString("search"); v != "" {
		query["name__icontains"] = v
		//WHERE name LIKE '% %'

	}

	beego.Info("查询硬件类型条件",
		"offset=", offset,
		"limit=", limit,
		"sort=", sort,
		"order=", order,
		"query=", query,
	)

	hardwareTypeList, err := m.GetHardwareType(query, sort, order, offset, limit)
	if err != nil {
		beego.Debug("[查询硬件类型发生错误", err.Error(), "]")
	}
	if hardwareTypeList == nil {
		hardwareTypeList = make([]interface{}, 0)
	}
	if v := this.GetString("format"); v != "" {
		if v == "total" {
			countNum, _ := m.CountHardwareType(query)
			this.TotalRowsPageJSON(countNum, hardwareTypeList)
		}
	} else {
		this.DataJSON(hardwareTypeList)
	}
	this.ServeJSON()
}

// @Title hardware type
// @Description 添加硬件类型
// @Success 200 {map} map[string]interface{}
// @Param   hardwareType       query   string  true  "硬件类型"
// @Param   Authorization      header  string  true  "认证信息"
// @Param   timestamp          query   string  true  "时间戳"
// @Failure 400 添加硬件类型失败
// @router /type [post]
func (this *HardwareTypeController) AddHardwareType() {

	this.DbLog("HardwareType", "硬件类型", "添加")

	var hardwareType m.HardwareType
	if Type := this.GetString("hardwareType", ""); Type != "" {
		hardwareType.Name = Type
	}
	hardwareType.CreateBy = this.GetString("createBy", "")

	if hardwareType.Name != "" {
		id, err := m.AddHardwareType(hardwareType)
		if err != nil {
			beego.Debug("[保存硬件类型错误", err.Error(), "]")
			this.ResponseErrorJSON(http.StatusOK, err.Error())
		} else {
			beego.Debug("[保存硬件类型成功,id是", id, "]")
			this.Data["json"] = this.ResponseSuccessJSON(true, "添加硬件类型成功", id)
		}
	}else{
		this.Data["json"] = this.ResponseSuccessJSON(false, "硬件类型不能为空", -1)
	}

	this.ServeJSON()
}

// @Title hardware type
// @Description 通过id删除硬件类型
// @Success 200 {map}
// @Param   hardwareTypeId       query    string  true  "硬件类型ID"
// @Param   Authorization        header   string  true  "认证信息"
// @Param   timestamp            query    string  true  "时间戳"
// @Failure 400 删除硬件类型失败
// @router /type [delete]
func (this *HardwareTypeController) DelHardwareType() {

	this.DbLog("HardwareType", "硬件类型", "删除")

	var err error
	v := this.GetStrings("hardwareTypeId")
	if len(v) > 0 {
		for index, value := range v {
			for _, id := range strings.Split(value, ",") {
				beego.Info("索引ID是:", index)
				beego.Info("值是:", id)
				hardwareTypeId, _ := util.StrToInt64(id)
				beego.Debug("[删除的硬件类型,ID是", hardwareTypeId, "]")
				err = m.DelHardwareType(hardwareTypeId)
			}
		}
		if err != nil {
			this.ResponseErrorJSON(http.StatusOK, err.Error())
		} else {
			this.Data["json"] = this.ResponseSuccessJSON(true, "删除硬件类型成功", 1)
		}
	} else {
		this.Data["json"] = this.ResponseSuccessJSON(false, "删除硬件类型失败", -1)
	}
	this.ServeJSON()
}

// @Title hardware type
// @Description 更新硬件类型
// @Success 200 {map} map[string]interface{}
// @Param   hardwareTypeId    query    int64   true    "硬件类型ID"
// @Param   hardwareType      query    string  true    "硬件类型"
// @Param   Authorization     header   string  true    "认证信息"
// @Param   timestamp         query    string  true    "时间戳"
// @Failure 400 更新硬件类型失败
// @router /type [put]
func (this *HardwareTypeController) PutHardwareType() {

	this.DbLog("HardwareType", "硬件类型", "更新")

	hardwareTypeId, _ := this.GetInt64("hardwareTypeId", 0)
	hardwareType, err := m.GetHardwareTypeById(hardwareTypeId)
	if err != nil {
		this.ResponseErrorJSON(http.StatusOK, err.Error())
	}
	hardwareType.Name = strings.TrimSpace(this.GetString("hardwareType", ""))
	beego.Info("[硬件类型Id是", hardwareType.Id, "硬件类型是", hardwareType.Name, "]")

	if updateBy := this.GetString("updateBy", ""); updateBy != "" {
		hardwareType.UpdateBy = updateBy
	}

	if err := m.PutHardwareType(hardwareType); err == nil {
		this.Data["json"] = this.ResponseSuccessJSON(true, "更新硬件类型成功", 1)
	} else {
		this.Data["json"] = this.ResponseSuccessJSON(false, "更新硬件类型失败", -1)
	}
	this.ServeJSON()
}
