package controllers

import (
	m "oneoaas.com/cmdb/models"
	"strings"

	"github.com/astaxie/beego"
	"oneoaas.com/cmdb/util"
	"net/http"
)


// @Title supplier
// @Description 查询供应商
// @Success 200 {map} map[string]interface{}
// @Param   enable      	  query    string   false  "数据是否有效 0/1"
// @Param   format     		  query    string   false  "json:返回带有总记录条数"
// @Param   order     		  query    string   false  "排序方式asc/desc"
// @Param   sort     		  query    string   false  "排序字段"
// @Param   limit     		  query    int      false  "每页的数据量"
// @Param   name	 		  query    string   false  "筛选名称"
// @Param   businesscontact   query    string   false  "筛选商务联系人"
// @Param   technologycontact query    string   false  "筛选技术联系人"
// @Param   start_time   	  query    string   false  "筛选起始时间"
// @Param   end_time    	  query    string   false  "筛选结束时间"
// @Param   Authorization     header   string   true   "认证信息"
// @Param   timestamp         query    string   true   "时间戳"
// @Failure 400 查询供应商失败
// @router / [get]
func (c *SupplierController) GetSupplier() {
	var sort string
	var order string
	var query = make(map[string]string, 0)    //存储条件
	var supplierList = make([]interface{}, 0) //存储返回数据
	var limit int64 = 10
	var offset int64 = 0
	var name string
	var businesscontact string
	var technologycontact string
	var start_time string
	var end_time string

	if v, err := c.GetInt64("limit"); err == nil {
		limit = v
	}
	if v, err := c.GetInt64("offset"); err == nil {
		offset = v
	}
	if v := c.GetString("sort"); v != "" {
		sort = v
	}
	if v := c.GetString("order"); v != "" {
		order = v
	}

	if v := c.GetString("search"); v != "" {
		query["search"] = v
	}

	if v := c.GetString("enable"); v != "" {
		query["enable"] = v
	}

	if v := c.GetString("name"); v != "" {
		name = v
	}

	if v := c.GetString("businesscontact"); v != "" {
		businesscontact = v
	}

	if v := c.GetString("technologycontact"); v != "" {
		technologycontact = v
	}

	if v := c.GetString("start_time"); v != "" {
		start_time = v
	}

	if v := c.GetString("end_time"); v != "" {
		end_time = v
	}

	supplierList, total := m.GetSupplier(query, sort, order, offset, limit, name, businesscontact, technologycontact, start_time, end_time)

	if supplierList == nil {
		supplierList = make([]interface{}, 0)
	}
	if v := c.GetString("format"); v == "json" {
		c.TotalRowsPageJSON(total, supplierList)
	} else {
		c.DataJSON(supplierList)
	}
	c.ServeJSON()
}

// @Title supplier
// @Description 添加供应商
// @Success 200 {map} map[string]interface{}
// @Param   supplier               query   string true    "供应商名称"
// @Param   businesscontact        query   string false   "商务联系人"
// @Param   businesstelphone       query   string true    "商务联系手机"
// @Param   mobilephone            query   string false   "商务联系电话"
// @Param   businessemail          query   string false   "商务邮箱"
// @Param   technologycontact      query   string false   "技术联系人"
// @Param   telphone  		       query   string false   "技术联系手机"
// @Param   technologymobilephone  query   string true    "技术联系电话"
// @Param   technologyemail        query   string false   "技术邮箱"
// @Param   officeaddress          query   string false   "公司地址"
// @Param   comment  		       query   string false   "备注"
// @Param   Authorization          header  string true    "认证信息"
// @Param   timestamp              query   string true    "时间戳"
// @Failure 400 添加供应商失败
// @router / [post]
func (this *SupplierController) AddSupplier() {

	this.DbLog("Supplier", "供应商", "添加")

	supplier := new(m.Supplier)
	supplier.Supplier = this.GetString("supplier", "")
	supplier.BusinessContact = this.GetString("businesscontact", "")
	supplier.BusinessTelPhone = this.GetString("businesstelphone", "")
	supplier.BusinessMobilePhone = this.GetString("mobilephone", "")
	supplier.BusinessEmail = this.GetString("businessemail", "")
	supplier.TechnologyContact = this.GetString("technologycontact", "")
	supplier.TechnologyTelphone = this.GetString("telphone", "")
	supplier.TechnologyMobilePhone = this.GetString("technologymobilephone", "")
	supplier.TechnologyEmail = this.GetString("technologyemail", "")
	supplier.OfficeAddress = this.GetString("officeaddress", "")
	supplier.Comment = this.GetString("comment", "")
	supplier.Enable=true

	id, err := m.AddSupplier(supplier)
	if err != nil {
		beego.Debug("[保存供应商错误", err.Error(), "]")
		this.ResponseErrorJSON(http.StatusOK, err.Error())
	} else {
		beego.Debug("[保存供应商成功,id是", id, "]")
		this.Data["json"] = this.ResponseSuccessJSON(true, "添加供应商成功", id)
	}
	this.ServeJSON()
}

// @Title supplier
// @Description 通过id删除供应商
// @Success 200 {map}
// @Param   id                query    string true      "供应商ID"
// @Param   Authorization     header   string true      "认证信息"
// @Param   timestamp         query    string true      "时间戳"
// @Failure 400 删除供应商失败
// @router / [delete]
func (this *SupplierController) DelSupplier() {

	this.DbLog("Supplier", "供应商", "删除")

	var err error
	v := this.GetString("supplierid")
	hardDelete,err := this.GetBool("hardDelete")
	if len(v) > 0 {
		for _, id := range strings.Split(v, ",") {
			supplierid, _ := util.StrToInt64(id)
			if(hardDelete){
				err = m.HardDelSupplier(supplierid)
			}else{
				err = m.DelSupplier(supplierid)
			}
		}
		if err != nil {
			this.ResponseErrorJSON(http.StatusOK, err.Error())
		} else {
			this.Data["json"] = this.ResponseSuccessJSON(true, "操作成功", 1)
		}
	} else {
		this.Data["json"] = this.ResponseSuccessJSON(false, "操作失败", -1)
	}
	this.ServeJSON()
}

// @Title supplier
// @Description 更新供应商
// @Success 200 {map} map[string]interface{}
// @Param   supplierid             query   int    true    "供应商ID"
// @Param   supplier               query   string true    "供应商名称"
// @Param   businesscontact        query   string false   "商务联系人"
// @Param   businesstelphone       query   string true    "商务联系手机"
// @Param   mobilephone            query   string false   "商务联系电话"
// @Param   businessemail          query   string false   "商务邮箱"
// @Param   technologycontact      query   string false   "技术联系人"
// @Param   telphone  		       query   string false   "技术联系手机"
// @Param   technologymobilephone  query   string true    "技术联系电话"
// @Param   technologyemail        query   string false   "技术邮箱"
// @Param   officeaddress          query   string false   "公司地址"
// @Param   comment  		       query   string false   "备注"
// @Param   Authorization          header  string true    "认证信息"
// @Param   timestamp              query   string true    "时间戳"
// @Failure 400 更新供应商失败
// @router / [put]
func (this *SupplierController) PutSupplier() {

	this.DbLog("Supplier", "供应商", "更新")

	supplierId, _ := this.GetInt64("supplierid", 0)
	supplier, err := m.SupplierGetById(supplierId)
	if err != nil {
		this.ResponseErrorJSON(http.StatusOK, err.Error())
	}

	if v:=this.GetString("supplier", "") ; v!=""{
		supplier.Supplier = v
	}

	if v:=this.GetString("businesscontact", ""); v!=""{
		supplier.BusinessContact = v
	}

	if v:=this.GetString("businesstelphone", ""); v!=""{
		supplier.BusinessTelPhone = v
	}

	if v:=this.GetString("mobilephone", ""); v!=""{
		supplier.BusinessMobilePhone = v
	}

	if v:=this.GetString("businessemail", ""); v!=""{
		supplier.BusinessEmail = v
	}

	if v:=this.GetString("technologycontact", ""); v!=""{
		supplier.TechnologyContact = v
	}

	if v:=this.GetString("telphone", ""); v!=""{
		supplier.TechnologyTelphone = v
	}

	if v:=this.GetString("technologymobilephone", ""); v!=""{
		supplier.TechnologyMobilePhone = v
	}

	if v:=this.GetString("technologyemail", ""); v!=""{
		supplier.TechnologyEmail = v
	}

	if v:=this.GetString("officeaddress", ""); v!=""{
		supplier.OfficeAddress = v
	}

	if v:=this.GetString("comment", ""); v!=""{
		supplier.Comment = v
	}

	enable, _ := this.GetBool("enable",false)
	if enable {
		supplier.Enable = enable
	}

	if err := m.PutSupplier(supplier); err == nil {
		this.Data["json"] = this.ResponseSuccessJSON(true, "更新供应商成功", 1)
	} else {
		this.Data["json"] = this.ResponseSuccessJSON(false, "更新供应商失败", -1)
	}
	this.ServeJSON()
}

func (this *SupplierController) Fnish() {

}
