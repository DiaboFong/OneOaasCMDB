package controllers

import (
	"github.com/astaxie/beego"
	m "oneoaas.com/cmdb/models"
	"oneoaas.com/cmdb/util"
	"strings"
	"net/http"
)

func (this *ManufacturerController) GetAll() {
	var modelList []interface{}
	stateArray := m.GetAllManufacturer()
	for _, v := range stateArray {
		//级别向上转
		modelList = append(modelList, v)
	}
	this.DataJSON(modelList)
}

// @Title server manufacturer
// @Description 查询制造商
// @Success 200 {map} map[string]interface{}
// @Param   enable      	  query     string    false    "数据是否有效 0/1"
// @Param   format     		  query   	string 	  false    "json:返回带有总记录条数"
// @Param   order     		  query   	string 	  false    "排序方式asc/desc"
// @Param   sort     		  query   	string 	  false    "排序字段"
// @Param   limit     		  query   	int    	  false    "每页的数据量"
// @Param   Authorization     header    string 	  true     "认证信息"
// @Param   timestamp         query     string 	  true     "时间戳"
// @Failure 400 查询制造商失败
// @router /manufacturer [get]
func (c *ManufacturerController) GetManufacturer() {
	var sort []string
	var order []string
	var query = make(map[string]string, 0)        //存储条件
	var manufacturerList = make([]interface{}, 0) //存储返回数据
	var limit int64 = 10
	var offset int64 = 0

	// limit: 10 (default is 10)
	if v, err := c.GetInt64("limit"); err == nil {
		limit = v
	}else{
		limit = 0
	}

	// offset: 0 (default is 0)
	if v, err := c.GetInt64("offset"); err == nil {
		offset = v
	}
	// sort: col1,col2
	if v := c.GetString("sort"); v != "" {
		sort = strings.Split(v, ",")
	}

	//搜索查询,默认按主机名查询
	if v := c.GetString("search"); v != "" {
		query["manufacturer__icontains"] = v
		//WHERE manufacturer LIKE '% %'

	}

	beego.Info("查询制造商条件",
		"offset=", offset,
		"limit=", limit,
		"sort=", sort,
		"order=", order,
		"query=", query,
	)

	manufacturerList, err := m.GetManufacturer(query, sort, order, offset, limit)
	if err != nil {
		beego.Debug("[查询制造商发生错误", err.Error(), "]")
	}
	if manufacturerList == nil {
		manufacturerList = make([]interface{}, 0)
	}
	if v := c.GetString("format"); v != "" {
		if v == "total" {
			countNum, _ := m.CountManufacturer(query)
			c.TotalRowsPageJSON(countNum, manufacturerList)
		}
	} else {
		c.DataJSON(manufacturerList)
	}
	c.ServeJSON()
}

// @Title server manufacturer
// @Description 添加制造商
// @Success 200 {map} map[string]interface{}
// @Param   serverManufacturer   query   string  true  "制造商"
// @Param   email                query   string  false "邮箱"
// @Param   telphone             query   string  false "电话"
// @Param   manufacturerComment  query   string  false "备注"
// @Param   Authorization        header  string  true  "认证信息"
// @Param   timestamp            query   string  true  "时间戳"
// @Failure 400 添加制造商失败
// @router /manufacturer [post]
func (this *ManufacturerController) AddManufacturer() {

	this.DbLog("Manufacturer", "制造商", "添加")

	var manufacturer m.Manufacturer
	if Manufacturer := this.GetString("serverManufacturer", ""); Manufacturer != "" {
		manufacturer.Manufacturer = Manufacturer
	}
	manufacturer.Email = this.GetString("email", "")
	manufacturer.Telphone = this.GetString("telphone", "")
	manufacturer.Comment = this.GetString("manufacturerComment", "")

	if manufacturer.Manufacturer != "" {
		id, err := m.AddManufacturer(manufacturer)
		if err != nil {
			beego.Debug("[保存制造商错误", err.Error(), "]")
			this.ResponseErrorJSON(http.StatusOK, err.Error())
		} else {
			beego.Debug("[保存制造商成功,id是", id, "]")
			this.Data["json"] = this.ResponseSuccessJSON(true, "添加制造商成功", id)
		}
	}else{
		this.Data["json"] = this.ResponseSuccessJSON(false, "制造商不能为空", -1)
	}

	this.ServeJSON()
}

// @Title server manufacturer
// @Description 通过id删除制造商
// @Success 200 {map}
// @Param   serverManufacturerId query    string  true  "制造商ID"
// @Param   Authorization        header   string  true  "认证信息"
// @Param   timestamp            query    string  true  "时间戳"
// @Failure 400 删除制造商失败
// @router /manufacturer [delete]
func (this *ManufacturerController) DelManufacturer() {

	this.DbLog("Manufacturer", "制造商", "删除")

	var err error
	v := this.GetStrings("serverManufacturerId")
	if len(v) > 0 {
		for index, value := range v {
			for _, id := range strings.Split(value, ",") {
				beego.Info("索引ID是:", index)
				beego.Info("值是:", id)
				serverManufacturerId, _ := util.StrToInt64(id)
				beego.Debug("[删除的制造商,ID是", serverManufacturerId, "]")
				err = m.DelManufacturer(serverManufacturerId)
			}
		}
		if err != nil {
			this.ResponseErrorJSON(http.StatusOK, err.Error())
		} else {
			this.Data["json"] = this.ResponseSuccessJSON(true, "删除制造商成功", 1)
		}
	} else {
		this.Data["json"] = this.ResponseSuccessJSON(false, "删除制造商失败", -1)
	}
	this.ServeJSON()
}

// @Title server manufacturer
// @Description 更新制造商
// @Success 200 {map} map[string]interface{}
// @Param   serverManufacturerId   query    int64    true    "制造商ID"
// @Param   serverManufacturer     query    string   true    "制造商"
// @Param   email            	   query    string   false   "邮箱"
// @Param   telphone         	   query    string   false   "电话"
// @Param   comment          	   query    string   false   "备注"
// @Param   Authorization    	   header   string   true    "认证信息"
// @Param   timestamp        	   query    string   true    "时间戳"
// @Failure 400 更新制造商失败
// @router /manufacturer [put]
func (this *ManufacturerController) PutManufacturer() {

	this.DbLog("Manufacturer", "制造商", "更新")

	serverManufacturerId, _ := this.GetInt64("serverManufacturerId", 0)
	serverManufacturer, err := m.GetManufacturerById(serverManufacturerId)
	if err != nil {
		this.ResponseErrorJSON(http.StatusOK, err.Error())
	}
	serverManufacturer.Manufacturer = strings.TrimSpace(this.GetString("serverManufacturer", ""))
	beego.Info("[制造商Id是", serverManufacturer.Id, "制造商是", serverManufacturer.Manufacturer, "]")

	if Email := this.GetString("email", ""); Email != "" {
		serverManufacturer.Email = Email
	}

	if Telphone := this.GetString("telphone", ""); Telphone != "" {
		serverManufacturer.Telphone = Telphone
	}

	if Comment := this.GetString("comment", ""); Comment != "" {
		serverManufacturer.Comment = Comment
	}

	if err := m.PutManufacturer(serverManufacturer); err == nil {
		this.Data["json"] = this.ResponseSuccessJSON(true, "更新制造商成功", 1)
	} else {
		this.Data["json"] = this.ResponseSuccessJSON(false, "更新制造商失败", -1)
	}
	this.ServeJSON()
}

func (this *ManufacturerController) Fnish() {

}
