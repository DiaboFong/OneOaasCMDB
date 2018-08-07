package controllers

import (
	"errors"
	m "oneoaas.com/cmdb/models"
	"strings"

	"github.com/astaxie/beego"
)

func (this *SoftwareController) Prepare() {
	user := this.GetSession("username")
	if user == nil {
		this.Data["userIs"] = ""
	} else {
		this.Data["userIs"] = "admin"
	}
	this.Data["inDev"] = beego.AppConfig.String("runmode") == "dev"
}

func (this *SoftwareController) AddSoftware() {
	var software m.Software
	software.Software = this.GetString("Software", "")
	software.Version = this.GetString("version", "")
	software.Appid, _ = this.GetInt64("appid", 0)
	software.Comment = this.GetString("comment", "")
	id, err := m.AddSoftware(software)
	if err != nil {
		this.ResponseErrorJSON(400, errorFormat(ErrorBadRequest_400, err.Error()))
	} else {
		this.Data["json"] = id
	}
	this.ServeJSON()
}

func (this *SoftwareController) DelSoftware() {
	softwareid, _ := this.GetInt64("Softwareid", 0)
	err := m.DelSoftware(softwareid)
	if err != nil {
		this.ResponseErrorJSON(400, errorFormat(ErrorBadRequest_400, err.Error()))
	} else {
		this.Data["json"] = err
	}
	this.ServeJSON()
}

func (c *SoftwareController) GetSoftware() {
	var fields []string
	var sort []string
	var order []string
	var query map[string]string = make(map[string]string)
	var limit int64 = 10
	var offset int64 = 0

	// fields: col1,col2,entity.col3
	if v := c.GetString("fields"); v != "" {
		fields = strings.Split(v, ",")
	}
	// limit: 10 (default is 10)
	if v, err := c.GetInt64("limit"); err == nil {
		limit = v
	}
	// offset: 0 (default is 0)
	if v, err := c.GetInt64("offset"); err == nil {
		offset = v
	}
	// sort: col1,col2
	if v := c.GetString("sort"); v != "" {
		sort = strings.Split(v, ",")
	}
	// order: desc,asc
	if v := c.GetString("order"); v != "" {
		order = strings.Split(v, ",")
	}
	// query: k:v,k:v
	if v := c.GetString("query"); v != "" {
		for _, cond := range strings.Split(v, ",") {
			kv := strings.Split(cond, ":")
			if len(kv) != 2 {
				c.Data["json"] = errors.New("Error: invalid query key/value pair")
				c.ServeJSON()
				return
			}
			k, v := kv[0], kv[1]
			query[k] = v
		}
	}

	l, err := m.GetSoftware(query, fields, sort, order, offset, limit)
	if err != nil {
		c.Data["json"] = err.Error()
	} else {
		c.Data["json"] = l
	}
	if v := c.GetString("format"); v != "" {
		if v == "total" {
			c.TotalRowsJSON(l)
		}
		if v == "data" {
			c.DataJSON(l)
		}
	}
	c.ServeJSON()
}

func (this *SoftwareController) PutSoftware() {
	var software m.Software
	software.Softwareid, _ = this.GetInt64("Softwareid", 0)
	software.Software = this.GetString("Software", "")
	software.Version = this.GetString("version", "")
	software.Appid, _ = this.GetInt64("appid", 0)
	software.Comment = this.GetString("comment", "")
	if err := m.UpdateSoftwareById(software); err == nil {
		this.Data["json"] = "OK"
	} else {
		this.Data["json"] = err.Error()
	}
	this.ServeJSON()
}

func (this *SoftwareController) Fnish() {

}
