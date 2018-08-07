package controllers

import (
	"encoding/json"
	"errors"
	"fmt"
	"io/ioutil"
	"net/http"
	"net/url"
	m "oneoaas.com/cmdb/models"
	"strings"
)

func (this *DnspodrecordController) AddDnspodrecord() {
	var dnspodrecord m.Domainrecord
	t := "12966,f463dbad16efcad6447929a5a8b86102"
	domainID := "24775445"
	data := url.Values{}
	data.Set("login_token", t)
	data.Set("domain_id", domainID)
	data.Set("format", "json")
	resp, err := http.PostForm("https://dnsapi.cn/Record.List", data)
	defer resp.Body.Close()
	body, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		fmt.Printf("{\"code\":1,\"msg\":\"Connect Error\"}")
	}
	//var domain omainrecord
	err = json.Unmarshal([]byte(body), &dnspodrecord)
	if err != nil {
		this.ResponseErrorJSON(400, errorFormat(ErrorBadRequest_400, err.Error()))
	}
	recordmsg := dnspodrecord.Records
	for _, record := range recordmsg {
		m.AddDnspodrecord(record)
	}
	if err != nil {
		this.ResponseErrorJSON(400, errorFormat(ErrorBadRequest_400, err.Error()))
	} else {
		this.Data["json"] = "OK"
	}
	this.ServeJSON()
}

func (c *DnspodrecordController) GetDnspodrecord() {
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

	l, err := m.GetDnspodrecord(query, fields, sort, order, offset, limit)
	if err != nil {
		c.Data["json"] = err.Error()
	} else {
		c.Data["json"] = l
	}
	if v := c.GetString("format"); v != "" {
		c.TotalRowsJSON(l)
	}
	c.ServeJSON()
}

func (this *DnspodrecordController) DelDnspodrecord() {
	Appid, _ := this.GetInt64("Appid", 0)
	//fmt.Println(Appid)
	err := m.DelApp(Appid)
	if err != nil {
		this.ResponseErrorJSON(400, errorFormat(ErrorBadRequest_400, err.Error()))
	} else {
		this.Data["json"] = err
	}
	this.ServeJSON()
}

//func (this *DnspodrecordController) PutDnspodrecord() {
//  var dc m.Domainrecord
//
//  if err := m.UpdateDnspodrecordById(dc); err == nil {
//      this.Data["json"] = "OK"
//  } else {
//      this.Data["json"] = err.Error()
//  }
//  this.ServeJSON()
//}
//
func (this *DnspodrecordController) Fnish() {

}
