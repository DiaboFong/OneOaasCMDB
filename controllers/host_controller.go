package controllers

import (
	"github.com/astaxie/beego"
	"oneoaas.com/cmdb/models"
	m "oneoaas.com/cmdb/models"
	"oneoaas.com/cmdb/util"
	"strings"
)

func (this *HostController) GetAll() {
	var modelList []interface{}
	stateArray := models.GetAllHost()
	for _, v := range stateArray {
		//级别向上转
		modelList = append(modelList, v)
	}
	this.DataJSON(modelList)
}

// @Title server host
// @Description 查询操作系统
// @Success 200 {map} map[string]interface{}
// @Param   enable      	  query     string    false    "数据是否有效 0/1"
// @Param   format     		  query   	string 	  false    "json:返回带有总记录条数"
// @Param   order     		  query   	string 	  false    "排序方式asc/desc"
// @Param   sort     		  query   	string 	  false    "排序字段"
// @Param   limit     		  query   	int    	  false    "每页的数据量"
// @Param   Authorization     header    string 	  true     "认证信息"
// @Param   timestamp         query     string 	  true     "时间戳"
// @Failure 400 查询操作系统失败
// @router /host [get]
func (this *HostController) GetHost() {
	var sort []string
	var order []string
	var query = make(map[string]string, 0) //存储条件
	var hostList = make([]interface{}, 0)  //存储返回数据
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

	//搜索查询,默认按主机查询
	if v := this.GetString("search"); v != "" {
		query["name__icontains"] = v
		//WHERE name LIKE '% %'

	}

	beego.Info("查询主机条件",
		"offset=", offset,
		"limit=", limit,
		"sort=", sort,
		"order=", order,
		"query=", query,
	)

	hostList, err := m.GetHost(query, sort, order, offset, limit)
	if err != nil {
		beego.Debug("[查询主机发生错误", err.Error(), "]")
	}
	if hostList == nil {
		hostList = make([]interface{}, 0)
	}
	if v := this.GetString("format"); v != "" {
		if v == "total" {
			countNum, _ := m.CountHost(query)
			this.TotalRowsPageJSON(countNum, hostList)
		}
	} else {
		this.DataJSON(hostList)
	}
	this.ServeJSON()
}

// @Title server host
// @Description 添加操作系统
// @Success 200 {map} map[string]interface{}
// @Param   name   				 query   string  true  "操作系统"
// @Param   Authorization        header  string  true  "认证信息"
// @Param   timestamp            query   string  true  "时间戳"
// @Failure 400 添加操作系统失败
// @router /host [post]
func (this *HostController) AddHost() {

	this.DbLog("Host", "主机", "添加")

	var host m.Host
	if Name := this.GetString("hostname", ""); Name != "" {
		host.Name = Name
	}
	host.CreateBy = this.GetString("createBy", "")

	if host.Name != "" {
		id, err := m.AddHost(host)
		if err != nil {
			beego.Debug("[保存主机错误", err.Error(), "]")
			this.ResponseErrorJSON(400, errorFormat(ErrorBadRequest_400, err.Error()))
		} else {
			beego.Debug("[保存主机成功,id是", id, "]")
			this.Data["json"] = this.ResponseSuccessJSON(true, "添加主机成功", id)
		}
	}else{
		this.Data["json"] = this.ResponseSuccessJSON(false, "主机不能为空", -1)
	}

	this.ServeJSON()
}

// @Title server host
// @Description 通过id删除操作系统
// @Success 200 {map}
// @Param   hostId               query    string  true  "操作系统ID"
// @Param   Authorization        header   string  true  "认证信息"
// @Param   timestamp            query    string  true  "时间戳"
// @Failure 400 删除操作系统失败
// @router /host [delete]
func (this *HostController) DelHost() {

	this.DbLog("Host", "主机", "删除")

	var err error
	v := this.GetStrings("hostId")
	if len(v) > 0 {
		for index, value := range v {
			for _, id := range strings.Split(value, ",") {
				beego.Info("索引ID是:", index)
				beego.Info("值是:", id)
				hostId, _ := util.StrToInt64(id)
				beego.Debug("[删除的主机,ID是", hostId, "]")
				err = m.DelHost(hostId)
			}
		}
		if err != nil {
			this.ResponseErrorJSON(400, err.Error())
		} else {
			this.Data["json"] = this.ResponseSuccessJSON(true, "删除主机成功", 1)
		}
	} else {
		this.Data["json"] = this.ResponseSuccessJSON(false, "删除主机失败", -1)
	}
	this.ServeJSON()
}

// @Title server host
// @Description 更新操作系统
// @Success 200 {map} map[string]interface{}
// @Param   hostId   			   query    int64    true    "操作系统ID"
// @Param   name      			   query    string   true    "硬件状态"
// @Param   Authorization    	   header   string   true    "认证信息"
// @Param   timestamp        	   query    string   true    "时间戳"
// @Failure 400 更新操作系统失败
// @router /host [put]
func (this *HostController) PutHost() {

	this.DbLog("Host", "主机", "更新")

	hostId, _ := this.GetInt64("hostId", 0)
	host, err := m.GetHostById(hostId)
	if err != nil {
		this.ResponseErrorJSON(400, err.Error())
	}
	host.Name = strings.TrimSpace(this.GetString("name", ""))
	beego.Info("[主机Id是", host.Id, "主机是", host.Name, "]")

	if updateBy := this.GetString("updateBy", ""); updateBy != "" {
		host.UpdateBy = updateBy
	}

	if err := m.PutHost(host); err == nil {
		this.Data["json"] = this.ResponseSuccessJSON(true, "更新主机成功", 1)
	} else {
		this.Data["json"] = this.ResponseSuccessJSON(false, "更新主机失败", -1)
	}
	this.ServeJSON()
}
