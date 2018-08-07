package controllers

import (
	m "oneoaas.com/cmdb/models"
	"strings"
	"github.com/astaxie/beego"
	"oneoaas.com/cmdb/util"
	"net/http"
)

// @Title dnspoddomain
// @Description 查询域名
// @Success 200 {map} map[string]interface{}
// @Param   enable      	  query   	string   false   "数据是否有效 0/1"
// @Param   format     		  query   	string   false   "json:返回带有总记录条数"
// @Param   order     		  query   	string   false	 "排序方式asc/desc"
// @Param   sort     		  query   	string   false   "排序字段"
// @Param   limit     		  query   	int      false   "每页的数据量"
// @Param   name		   	  query     string   false   "筛选域名"
// @Param   state     		  query     string   false   "按状态筛选"
// @Param   grade     		  query     string   false   "按等级筛选"
// @Param   start_time   	  query     string   false   "筛选起始时间"
// @Param   end_time    	  query     string   false   "筛选结束时间"
// @Param   Authorization     header    string   true    "认证信息"
// @Param   timestamp         query     string   true    "时间戳"
// @Failure 400 查询域名失败
// @router / [get]
func (this *DnspoddomainController) GetDnspoddomain() {
	var sort string
	var order string
	var query = make(map[string]string, 0)        //存储条件
	var dnspoddomainList = make([]interface{}, 0) //存储返回数据
	var limit int64 = 10
	var offset int64 = 0
	var name string
	var state string
	var grade string
	var start_time string
	var end_time string

	if v, err := this.GetInt64("limit"); err == nil {
		limit = v
	}
	if v, err := this.GetInt64("offset"); err == nil {
		offset = v
	}
	if v := this.GetString("sort"); v != "" {
		sort = v
	}
	if v := this.GetString("order"); v != "" {
		order = v
	}
	if v := this.GetString("search"); v != "" {
		query["search"] = v
	}

	if v := this.GetString("enable"); v != "" {
		query["enable"] = v
	}

	if v := this.GetString("name"); v != "" {
		name = v
	}

	if v := this.GetString("state"); v != "" {
		state = v
	}

	if v := this.GetString("grade"); v != "" {
		grade = v
	}

	if v := this.GetString("start_time"); v != "" {
		start_time = v
	}

	if v := this.GetString("end_time"); v != "" {
		end_time = v
	}

	dnspoddomainList, total := m.GetDnspoddomain(query, sort, order, offset, limit, name, state, grade, start_time, end_time)
	if dnspoddomainList == nil {
		dnspoddomainList = make([]interface{}, 0)
	}
	if v := this.GetString("format"); v != "" {
		this.TotalRowsPageJSON(total, dnspoddomainList)
	} else {
		this.DataJSON(dnspoddomainList)
	}
	this.ServeJSON()
}

// @Title dnspoddomain
// @Description 添加域名
// @Success 200 {map} map[string]interface{}
// @Param   name              query   string true    "域名"
// @Param   stateId           query   int    true    "域名状态"
// @Param   gradeId           query   int    false   "域名等级"
// @Param   extStatus         query   int    true    "域名扩展状态"
// @Param   cnameSpeedup      query   int    false   "CNAME加速状态"
// @Param   createdOn         query   int    false   "添加时间"
// @Param   groupId  		  query   string false   "域名分组ID"
// @Param   isMark    	      query   int    false   "是否设置域名星标"
// @Param   isVip             query   int    false   "是否属于VIP"
// @Param   owner             query   string false   "域名所有者"
// @Param   punycode          query   string false   "转码后域名"
// @Param   records           query   string false   "记录总条数"
// @Param   searchenginePush  query   int    false   "是否开启搜索引擎推送"
// @Param   ttl               query   string false   "域名默认的TTL值"
// @Param   updatedOn         query   string false   "修改时间"
// @Param   tokenId           query   int    false   "TokenID"
// @Param   remark  		  query   string false   "备注"
// @Param   Authorization     header  string true    "认证信息"
// @Param   timestamp         query   string true    "时间戳"
// @Failure 400 添加域名失败
// @router / [post]
func (this *DnspoddomainController) AddDnspoddomain() {

	this.DbLog("Dnspoddomain", "域名", "添加")

	var dnspoddomain m.Dnspoddomain
	dnspoddomain.Name = this.GetString("name", "")
	dnspoddomain.CnameSpeedup = this.GetString("cnameSpeedup", "")
	dnspoddomain.CreatedOn = this.GetString("createdOn", "")
	dnspoddomain.ExtStatus = this.GetString("extStatus", "")
	dnspoddomain.GroupId = this.GetString("groupId", "")
	dnspoddomain.IsMark, _ = this.GetInt64("isMark", -1)
	dnspoddomain.IsVip, _ = this.GetInt64("isVip", -1)
	dnspoddomain.Owner = this.GetString("owner", "")
	dnspoddomain.Punycode = this.GetString("punycode", "")
	dnspoddomain.Records = this.GetString("records", "")
	dnspoddomain.Remark = this.GetString("remark", "")
	dnspoddomain.SearchenginePush, _ = this.GetInt64("searchenginePush", -1)
	dnspoddomain.Ttl = this.GetString("ttl", "")
	dnspoddomain.UpdatedOn = this.GetString("updatedOn", "")
	dnspoddomain.TokenId, _ = this.GetInt64("tokenId", 0)
	dnspoddomain.Enable = true
	stateId, _ := this.GetInt64("stateId")
	stateObj, err := m.GetDnspoddomainStateById(stateId)
	if err != nil {
		beego.Debug("[获取域名状态出错", err.Error(), "]")
		this.ResponseErrorJSON(http.StatusOK, err.Error())
	}
	dnspoddomain.State = stateObj

	id, err := m.AddDnspoddomain(dnspoddomain)
	if err != nil {
		beego.Debug("[添加域名错误", err.Error(), "]")
		this.ResponseErrorJSON(http.StatusOK, err.Error())
	} else {
		this.Data["json"] = this.ResponseSuccessJSON(true, "添加域名成功", id)
	}
	this.ServeJSON()
}

// @Title dnspoddomain
// @Description 通过id删除域名
// @Success 200 {map}
// @Param   id                query    string true      "域名ID"
// @Param   Authorization     header   string true      "认证信息"
// @Param   timestamp         query    string true      "时间戳"
// @Failure 400 删除域名失败
// @router / [delete]
func (this *DnspoddomainController) DelDnspoddomain() {

	this.DbLog("Dnspoddomain", "域名", "删除")

	var err error
	v := this.GetString("id")
	hardDelete,err := this.GetBool("hardDelete")
	if len(v) > 0 {
		for _, id := range strings.Split(v, ",") {
			id, _ := util.StrToInt64(id)
			if(hardDelete){
				err = m.HardDelDnspoddomain(id);
			}else{
				err = m.DelDnspoddomain(id)
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

// @Title dnspoddomain
// @Description 更新域名
// @Success 200 {map} map[string]interface{}
// @Param   id                query   int    true    "域名ID"
// @Param   name              query   string true    "域名"
// @Param   stateId           query   int    true    "域名状态"
// @Param   gradeId           query   int    true    "域名等级"
// @Param   extStatus         query   int    true    "域名扩展状态"
// @Param   cnameSpeedup      query   int    false   "CNAME加速状态"
// @Param   createdOn         query   int    false   "添加时间"
// @Param   groupId  		  query   string false   "域名分组ID"
// @Param   isMark    	      query   int    false   "是否设置域名星标"
// @Param   isVip             query   int    false   "是否属于VIP"
// @Param   owner             query   string false   "域名所有者"
// @Param   punycode          query   string false   "转码后域名"
// @Param   records           query   string false   "记录总条数"
// @Param   searchenginePush  query   int    false   "是否开启搜索引擎推送"
// @Param   ttl               query   string false   "域名默认的TTL值"
// @Param   updatedOn         query   string false   "修改时间"
// @Param   tokenId           query   int    false   "TokenID"
// @Param   remark  		  query   string false   "备注"
// @Param   Authorization     header  string true    "认证信息"
// @Param   timestamp         query   string true    "时间戳"
// @Failure 400 更新域名失败
// @router / [put]
func (this *DnspoddomainController) PutDnspoddomain() {

	this.DbLog("Dnspoddomain", "域名", "更新")

	Id, _ := this.GetInt64("id", 0)
	beego.Debug("[更新域名,当前域名ID是", Id, "]")
	dnspoddomain, err := m.DnspoddomainGetById(Id)
	if err != nil {
		beego.Debug("[更新域名,发生错误,", err.Error(), "]")
		this.ResponseErrorJSON(http.StatusOK, err.Error())
	}

	if cnameSpeedup := this.GetString("cnameSpeedup", ""); cnameSpeedup != "" {
		dnspoddomain.CnameSpeedup = cnameSpeedup
	}

	if createdOn := this.GetString("createdOn", ""); createdOn != "" {
		dnspoddomain.CreatedOn = createdOn
	}

	if extStatus := this.GetString("extStatus", ""); extStatus != "" {
		dnspoddomain.ExtStatus = extStatus
	}

	if isMark, _ := this.GetInt64("isMark", -1); isMark != -1 {
		dnspoddomain.IsMark = isMark
	}

	if isVip, _ := this.GetInt64("isVip", -1); isVip != -1 {
		dnspoddomain.IsVip = isVip
	}

	if name := this.GetString("name", ""); name != "" {
		dnspoddomain.Name = name
	}

	if owner := this.GetString("owner", ""); owner != "" {
		dnspoddomain.Owner = owner
	}

	if punycode := this.GetString("punycode", ""); punycode != "" {
		dnspoddomain.Punycode = punycode
	}

	if records := this.GetString("records", ""); records != "" {
		dnspoddomain.Records = records
	}

	if remark := this.GetString("remark", ""); remark != "" {
		dnspoddomain.Remark = remark
	}

	if searchenginePush, _ := this.GetInt64("searchenginePush", -1); searchenginePush != -1 {
		dnspoddomain.SearchenginePush = searchenginePush
	}

	stateId, _ := this.GetInt64("stateId")
	stateObj, err := m.GetDnspoddomainStateById(stateId)
	if err != nil {
		beego.Debug("[更新获取域名状态出错", err.Error(), "]")
	} else {
		dnspoddomain.State = stateObj
	}

	if ttl := this.GetString("ttl", ""); ttl != "" {
		dnspoddomain.Ttl = ttl
	}

	if updatedOn := this.GetString("updatedOn", ""); updatedOn != "" {
		dnspoddomain.UpdatedOn = updatedOn
	}

	if tokenId, _ := this.GetInt64("tokenId", 0); tokenId != 0 {
		dnspoddomain.TokenId = tokenId
	}

	enable, _ := this.GetBool("enable",false)
	if enable {
		dnspoddomain.Enable = enable
	}

	if err := m.PutDnspoddomain(dnspoddomain); err == nil {
		this.Data["json"] = this.ResponseSuccessJSON(true, "操作成功", 1)
	} else {
		this.Data["json"] = this.ResponseSuccessJSON(false, "操作失败", -1)
	}
	this.ServeJSON()
}

func (this *DnspoddomainController) Fnish() {

}
