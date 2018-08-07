package controllers

import (
	"errors"
	"github.com/astaxie/beego"
	m "oneoaas.com/cmdb/models"
	"oneoaas.com/cmdb/util"
	"strings"
	"net/http"
)

// @Title datacenter
// @Description 查询数据中心
// @Success 200 {map} map[string]interface{}
// @Param   enable      	  query   string   false   "数据是否有效 0/1"
// @Param   format     		  query   string   false   "json:返回带有总记录条数"
// @Param   order     		  query   string   false   "排序方式asc/desc"
// @Param   sort     		  query   string   false   "排序字段"
// @Param   limit     		  query   int      false   "每页的数据量"
// @Param   dcname     		  query   string   false   "按名称筛选"
// @Param   state     		  query   string   false   "按状态筛选"
// @Param   region     		  query   string   false   "按区域筛选"
// @Param   supplier  		  query   string   false   "按供应商筛选"
// @Param   start_time   	  query   string   false   "筛选起始时间"
// @Param   end_time    	  query   string   false   "筛选结束时间"
// @Param   Authorization     header  string   true    "认证信息"
// @Param   timestamp         query   string   true    "时间戳"
// @Failure 400 查询数据中心失败
// @router / [get]
func (c *DatacenterController) GetDatacenter() {
	var sort string
	var order string
	var query = make(map[string]string, 0) //存储条件
	var advancedSearch = make(map[string]string, 0) //存储条件
	var dcList = make([]interface{}, 0)    //存储返回数据
	var limit int64 = -1
	var offset int64 = -1
	var dcname string
	var state string
	var region string
	var supplier string
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

	if v := c.GetString("dcname"); v != "" {
		dcname = v
	}

	if v := c.GetString("state"); v != "" {
		state = v
	}

	if v := c.GetString("region"); v != "" {
		region = v
	}

	if v := c.GetString("supplier"); v != "" {
		supplier = v
	}

	if v := c.GetString("start_time"); v != "" {
		start_time = v
	}

	if v := c.GetString("end_time"); v != "" {
		end_time = v
	}

	if v := c.GetString("dcname"); v != "" {
		advancedSearch["dcname"] = v
	}

	if v := c.GetString("enable"); v != "" {
		advancedSearch["enable"] = v
	}

	dcList, total := m.GetDatacenter(query, sort, order, offset, limit, dcname, state, region, supplier, start_time, end_time)
	if dcList == nil {
		dcList = make([]interface{}, 0)
	}
	if v := c.GetString("format"); v == "json" {
		c.TotalRowsPageJSON(total, dcList)
	} else {
		c.DataJSON(dcList)
	}
	c.ServeJSON()
}


// @Title datacenter
// @Description 验证数据中心名称是否存在
// @Success 200 {object} controllers.api.ValidResult
// @Param   dcname            query   	string true    "验证名称"
// @Param   Authorization     header    string true    "认证信息"
// @Param   timestamp         query     string true    "时间戳"
// @Failure 400  验证失败
// @router /valid [get]
func (this *DatacenterController) ValidDatacenter() {
	name := this.GetString("dcname", "")
	if name == ""{
		this.ResponseErrorJSON(http.StatusOK, errorFormat(errors.New("验证名称为空"),"请输入验证名称"))
	}
	dc ,_ :=m.GetDatacenterByName(name)
	if dc != nil{
		this.Data["json"] = ValidResult{
			Valid:false,
			Message:"名称已存在",
		}
	}else{
		this.Data["json"] = ValidResult{
			Valid:true,
			Message:"名称不存在",
		}
	}
	this.ServeJSON()
}


// @Title datacenter
// @Description 添加数据中心
// @Success 200 {map} map[string]interface{}
// @Param   dcname      	query   string   true    "数据中心名字"
// @Param   regionId    	query   string   true    "数据中心区域"
// @Param   stateId     	query   string   true    "数据中心状态"
// @Param   dcaddress  		query   string   true    "地址"
// @Param   supplierId  	query   string   false   "供应商"
// @Param   comment     	query   string   false   "备注"
// @Param   Authorization   header  string   true    "认证信息"
// @Param   timestamp       query   string   true    "时间戳"
// @Failure 400 添加数据中心失败
// @router / [post]
func (this *DatacenterController) AddDatacenter() {

	this.DbLog("Datacenter", "数据中心", "添加")

	var dc m.Datacenter
	dc.Dcname = this.GetString("dcname", "")
	dc.Dcaddress = this.GetString("dcaddress", "")
	dc.Comment = this.GetString("comment", "")
	dc.Enable=true

	supplierId, _ := this.GetInt64("supplierId",0)
	if supplierId != 0 {
		supplierObj, err := m.SupplierGetById(supplierId)
		if err != nil {
			beego.Debug("[获取供应商出错", err.Error(), "]")
			this.ResponseErrorJSON(http.StatusOK, err.Error())
		}
		dc.Supplier = supplierObj
	}

	regionId, _ := this.GetInt64("regionId",0)
	if regionId != 0 {
		regionObj, err := m.GetDatacenterRegionById(regionId)
		if err != nil {
			beego.Debug("[获取数据中心区域出错", err.Error(), "]")
			this.ResponseErrorJSON(http.StatusOK, err.Error())
		}
		dc.Region = regionObj
	}

	stateId, _ := this.GetInt64("stateId",0)
	if stateId != 0 {
		stateObj, err := m.GetDatacenterStateById(stateId)
		if err != nil {
			beego.Debug("[获取数据中心状态出错", err.Error(), "]")
			this.ResponseErrorJSON(http.StatusOK, err.Error())
		}
		dc.State = stateObj
	}

	id, err := m.AddDatacenter(dc)
	if err != nil {
		beego.Debug("[保存数据中心错误", err.Error(), "]")
		this.ResponseErrorJSON(http.StatusOK, err.Error())
	} else {
		beego.Debug("[保存数据中心成功,id是", id, "]")
		this.Data["json"] = this.ResponseSuccessJSON(true, "添加数据中心成功", id)
	}
	this.ServeJSON()
}

// @Title datacenter
// @Description 通过id删除数据中心
// @Success 200 {map}
// @Param   dcid              query   string  true  "数据中心ID"
// @Param   Authorization     header  string  true  "认证信息"
// @Param   timestamp         query   string  true  "时间戳"
// @Failure 400 删除数据中心失败
// @router / [delete]
func (this *DatacenterController) DelDatacenter() {

	this.DbLog("Datacenter", "数据中心", "删除")

	var err error
	v := this.GetString("dcid")
	hardDelete,err := this.GetBool("hardDelete")
	if len(v) > 0 {
		for _, id := range strings.Split(v, ",") {
			dcid, _ := util.StrToInt64(id)
			if(hardDelete){
				err = m.HardDelDatacenter(dcid);
			}else{
				err = m.DelDatacenter(dcid)
			}
		}
		if err != nil {
			this.ResponseErrorJSON(http.StatusOK, err.Error())
		} else {
			this.Data["json"] = this.ResponseSuccessJSON(true,"删除数据中心成功",1)
		}
	} else {
		this.Data["json"] = this.ResponseSuccessJSON(false,"删除数据中心失败",-1)
	}

	this.ServeJSON()
}

// @Title datacenter
// @Description 更新数据中心
// @Success 200 {map} map[string]interface{}
// @Param   dcid           query   int64    true    "数据中心ID"
// @Param   dcname         query   string   true    "数据中心名字"
// @Param   supplierId     query   string   true    "供应商"
// @Param   regionId       query   string   true    "数据中心区域"
// @Param   stateId        query   string   true    "数据中心状态"
// @Param   dcprovince     query   string   false   "省份"
// @Param   dccounty       query   string   false   "城市"
// @Param   dcaddress  	   query   string   true    "地址"
// @Param   dcgeo     	   query   string   false   "地理坐标"
// @Param   comment        query   string   false   "备注"
// @Param   Authorization  header  string   true    "认证信息"
// @Param   timestamp      query   string   true    "时间戳"
// @Failure 400 更新数据中心失败
// @router / [put]
func (this *DatacenterController) PutDatacenter() {

	this.DbLog("Datacenter", "数据中心", "更新")
	dcId, _ := this.GetInt64("dcid", 0)
	dc, err := m.GetDatacenterById(dcId)
	if err != nil {
		this.ResponseErrorJSON(http.StatusOK, err.Error())
	}

	if dcname := strings.TrimSpace(this.GetString("dcname", "")); dcname !=""{
		dc.Dcname = dcname
	}

	if dcprovince := this.GetString("dcprovince", ""); dcprovince != "" {
		dc.Dcprovince = dcprovince
	}

	if dccity := this.GetString("dccity", ""); dccity != "" {
		dc.Dccity = dccity
	}

	if dccounty := this.GetString("dccounty", ""); dccounty != "" {
		dc.Dccounty = dccounty
	}

	if dcaddress := this.GetString("dcaddress", ""); dcaddress != "" {
		dc.Dcaddress = dcaddress
	}

	if dcgeo := this.GetString("dcgeo", ""); dcgeo != "" {
		dc.Dcgeo = dcgeo
	}

	if comment := this.GetString("comment", ""); comment != "" {
		dc.Comment = comment
	}

	enable, _ := this.GetBool("enable",false)
	if enable {
		//恢复数据
		dc.Enable = enable
	}
	supplierId, _ := this.GetInt64("supplierId")
	supplierObj, err := m.SupplierGetById(supplierId)
	if err != nil {
		beego.Error("[更新获取供应商出错", err.Error(), "]")
	} else {
		dc.Supplier = supplierObj
	}

	regionId, _ := this.GetInt64("regionId")
	regionObj, err := m.GetDatacenterRegionById(regionId)
	if err != nil {
		beego.Debug("[更新获取数据中心区域出错", err.Error(), "]")
	} else {
		dc.Region = regionObj
	}

	stateId, _ := this.GetInt64("stateId")
	stateObj, err := m.GetDatacenterStateById(stateId)
	if err != nil {
		beego.Debug("[更新获取数据中心状态出错", err.Error(), "]")
	} else {
		dc.State = stateObj
	}

	if err := m.PutDatacenter(dc); err == nil {
		this.Data["json"] = this.ResponseSuccessJSON(true, "操作成功", 1)
	} else {
		this.Data["json"] = this.ResponseSuccessJSON(false, "操作失败", -1)
	}
	this.ServeJSON()
}

//------------/api/v2/datacenter-----------------------

func (this *DatacenterController) QueryDatacenter() {
	id, err := this.GetInt64("id", -1)
	if err != nil {
		beego.Error(err)
	}
	var datacenter m.Datacenter
	datacenter.Dcid = id
	this.Data["json"] = datacenter.QueryDatacenter()
	this.ServeJSON()
}
