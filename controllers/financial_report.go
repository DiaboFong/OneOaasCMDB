package controllers

import (
	"github.com/astaxie/beego"
	"fmt"
)

// FinancialReportController operations for FinancialReport
type FinancialReportController struct {
	beego.Controller
}

// URLMapping ...
func (c *FinancialReportController) URLMapping() {
	c.Mapping("Post", c.Post)
	c.Mapping("GetOne", c.GetOne)
	c.Mapping("Detail", c.Detail)
	c.Mapping("Trend", c.Trend)
	c.Mapping("BusinessCostCompared", c.BusinessCostCompared)
	c.Mapping("ResourcesCostCompared", c.ResourcesCostCompared)
	c.Mapping("Put", c.Put)
	c.Mapping("Delete", c.Delete)
}

// Post ...
// @Title Create
// @Description create FinancialReport
// @Param	body		body 	models.FinancialReport	true		"body for FinancialReport content"
// @Success 201 {object} models.FinancialReport
// @Failure 403 body is empty
// @router / [post]
func (c *FinancialReportController) Post() {

}

// GetOne ...
// @Title GetOne
// @Description get FinancialReport by id
// @Param	id		path 	string	true		"The key for staticblock"
// @Success 200 {object} models.FinancialReport
// @Failure 403 :id is empty
// @router /:id [get]
func (c *FinancialReportController) GetOne() {

}

// GetAll ...
// @Title GetAll
// @Description get FinancialReport
// @Success 200 {object} models.FinancialReport
// @Failure 403
// @router /detail [get]
func (c *FinancialReportController) Detail() {
	fmt.Println("Detail...")
}

// GetAll ...
// @Title GetAll
// @Description get FinancialReport
// @Success 200 {object} models.FinancialReport
// @Failure 403
// @router /trend [get]
func (c *FinancialReportController) Trend() {
	fmt.Println("Trend...")
}

// GetAll ...
// @Title GetAll
// @Description get FinancialReport
// @Success 200 {object} models.FinancialReport
// @Failure 403
// @router /bcc [get]
func (c *FinancialReportController) BusinessCostCompared() {
	fmt.Println("BusinessCostCompared...")
}

// GetAll ...
// @Title GetAll
// @Description get FinancialReport
// @Success 200 {object} models.FinancialReport
// @Failure 403
// @router /rcc [get]
func (c *FinancialReportController) ResourcesCostCompared() {
	fmt.Println("ResourcesCostCompared...")
}



// Put ...
// @Title Put
// @Description update the FinancialReport
// @Param	id		path 	string	true		"The id you want to update"
// @Param	body		body 	models.FinancialReport	true		"body for FinancialReport content"
// @Success 200 {object} models.FinancialReport
// @Failure 403 :id is not int
// @router /:id [put]
func (c *FinancialReportController) Put() {

}

// Delete ...
// @Title Delete
// @Description delete the FinancialReport
// @Param	id		path 	string	true		"The id you want to delete"
// @Success 200 {string} delete success!
// @Failure 403 id is empty
// @router /:id [delete]
func (c *FinancialReportController) Delete() {

}
