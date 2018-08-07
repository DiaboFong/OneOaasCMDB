package controllers

import (
	"github.com/astaxie/beego"
	"oneoaas.com/cmdb/models"
	"strconv"
	"net/http"
)

// DevicePerformanceReportController operations for DevicePerformanceReport
type DevicePerformanceReportController struct {
	BaseController
}

// URLMapping ...
func (c *DevicePerformanceReportController) URLMapping() {
	c.Mapping("Post", c.Post)
	c.Mapping("GetOne", c.GetOne)
	c.Mapping("GetAll", c.GetAll)
	c.Mapping("Put", c.Put)
	c.Mapping("Delete", c.Delete)
}

// Post ...
// @Title Create
// @Description create DevicePerformanceReport
// @Param	body		body 	models.DevicePerformanceReport	true		"body for DevicePerformanceReport content"
// @Success 201 {object} models.DevicePerformanceReport
// @Failure 403 body is empty
// @router / [post]
func (c *DevicePerformanceReportController) Post() {
	dpReport := new(models.DevicePerformanceReport)
	models.AddDevicePerformanceReport(dpReport)
}

// GetOne ...
// @Title GetOne
// @Description get DevicePerformanceReport by id
// @Param	id		path 	string	true		"The key for staticblock"
// @Success 200 {object} models.DevicePerformanceReport
// @Failure 403 :id is empty
// @router /:id [get]
func (c *DevicePerformanceReportController) GetOne() {
	idStr := c.Ctx.Input.Param(":id")
	idInt, err := strconv.ParseInt(idStr, 10, 64)
	if err !=nil{
		beego.Error(err)
	}
	models.GetDevicePerformanceReportById(idInt)
}


// GetAll ...
// @Title GetAll
// @Description get DevicePerformanceReport
// @Param	query	query	string	false	"Filter. e.g. col1:v1,col2:v2 ..."
// @Param	fields	query	string	false	"Fields returned. e.g. col1,col2 ..."
// @Param	sortby	query	string	false	"Sorted-by fields. e.g. col1,col2 ..."
// @Param	order	query	string	false	"Order corresponding to each sortby field, if single value, apply to all sortby fields. e.g. desc,asc ..."
// @Param	limit	query	string	false	"Limit the size of result set. Must be an integer"
// @Param	offset	query	string	false	"Start position of result set. Must be an integer"
// @Success 200 {object} models.DevicePerformanceReport
// @Failure 403
// @router /performance [get]
func (c *DevicePerformanceReportController) GetAll() {
	var query map[string]string
	var fields,sortby,order []string
	var offset,limit int64
	ml,err := models.GetAllDevicePerformanceReport(query,fields,sortby,order,offset,limit)
	if err != nil{
		beego.Error(err)
	}
	beego.Info(ml)
	c.Data["json"]=ml
	c.ServeJSON()
}

// Put ...
// @Title Put
// @Description update the DevicePerformanceReport
// @Param	id		path 	string	true		"The id you want to update"
// @Param	body		body 	models.DevicePerformanceReport	true		"body for DevicePerformanceReport content"
// @Success 200 {object} models.DevicePerformanceReport
// @Failure 403 :id is not int
// @router /:id [put]
func (c *DevicePerformanceReportController) Put() {
	idStr := c.Ctx.Input.Param(":id")
	idInt, err := strconv.ParseInt(idStr, 10, 64)
	if err != nil{
		beego.Error(err)
	}
	devicePerformanceReport,err := models.GetDevicePerformanceReportById(idInt)
	if err != nil{
		beego.Error(err)
	}
	err = models.UpdateDevicePerformanceReportById(devicePerformanceReport)

	if err != nil {
		c.ResponseErrorJSON(http.StatusBadRequest, errorFormat(ErrorBadRequest_400, err.Error()))
	} else {
		c.Data["json"] = c.ResponseSuccessJSON(true,"更新报表成功", idInt)
		c.ServeJSON()
	}

}

// Delete ...
// @Title Delete
// @Description delete the DevicePerformanceReport
// @Param	id		path 	string	true		"The id you want to delete"
// @Success 200 {string} delete success!
// @Failure 403 id is empty
// @router /:id [delete]
func (c *DevicePerformanceReportController) Delete() {
	idStr := c.Ctx.Input.Param(":id")
	idInt, err := strconv.ParseInt(idStr, 10, 64)
	if err != nil{
		beego.Error(err)
	}
	err = models.DeleteDevicePerformanceReport(idInt)
	if err !=nil {
		beego.Error(err)
	}
}
