package controllers

import (
	"github.com/astaxie/beego"
	"oneoaas.com/cmdb/models"
	m "oneoaas.com/cmdb/models"
	"oneoaas.com/cmdb/util"
	"strings"
)

func (this *AgreementStateController) GetAll() {
	var modelList []interface{}
	stateArray := models.GetAllAgreementState()
	for _, v := range stateArray {
		//级别向上转
		modelList = append(modelList, v)
	}
	this.DataJSON(modelList)
}

//查询合同状态
func (this *AgreementStateController) GetAgreementState() {
	var sort []string
	var order []string
	var query = make(map[string]string, 0)          //存储条件
	var agreementStateList = make([]interface{}, 0) //存储返回数据
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

	//搜索查询,默认按合同状态查询
	if v := this.GetString("search"); v != "" {
		query["state__icontains"] = v
		//WHERE state LIKE '% %'

	}

	beego.Info("查询合同状态条件",
		"offset=", offset,
		"limit=", limit,
		"sort=", sort,
		"order=", order,
		"query=", query,
	)

	agreementStateList, err := m.GetAgreementState(query, sort, order, offset, limit)
	if err != nil {
		beego.Debug("[查询合同状态发生错误", err.Error(), "]")
	}
	if agreementStateList == nil {
		agreementStateList = make([]interface{}, 0)
	}
	if v := this.GetString("format"); v != "" {
		if v == "total" {
			countNum, _ := m.CountAgreementState(query)
			this.TotalRowsPageJSON(countNum, agreementStateList)
		}
	} else {
		this.DataJSON(agreementStateList)
	}
	this.ServeJSON()
}

//添加合同状态
func (this *AgreementStateController) AddAgreementState() {

	this.DbLog("AgreementState", "合同状态", "添加")

	var agreementState m.AgreementState
	agreementState.State = this.GetString("agreementState", "")
	agreementState.CreateBy = this.GetString("createBy", "")

	id, err := m.AddAgreementState(agreementState)
	if err != nil {
		beego.Debug("[保存合同状态错误", err.Error(), "]")
		this.ResponseErrorJSON(400, errorFormat(ErrorBadRequest_400, err.Error()))
	} else {
		beego.Debug("[保存合同状态成功,id是", id, "]")
		this.Data["json"] = this.ResponseSuccessJSON(true, "添加合同状态成功", id)
	}
	this.ServeJSON()
}

//删除合同状态
func (this *AgreementStateController) DelAgreementState() {

	this.DbLog("AgreementState", "合同状态", "删除")

	var err error
	v := this.GetStrings("agreementStateId")
	if len(v) > 0 {
		for index, value := range v {
			for _, id := range strings.Split(value, ",") {
				beego.Info("索引ID是:", index)
				beego.Info("值是:", id)
				agreementStateId, _ := util.StrToInt64(id)
				beego.Debug("[删除的合同状态,ID是", agreementStateId, "]")
				err = m.DelAgreementState(agreementStateId)
			}
		}
		if err != nil {
			this.ResponseErrorJSON(400, err.Error())
		} else {
			this.Data["json"] = this.ResponseSuccessJSON(true, "删除合同状态成功", 1)
		}
	} else {
		this.Data["json"] = this.ResponseSuccessJSON(false, "删除合同状态失败", -1)
	}
	this.ServeJSON()
}

//更新合同状态
func (this *AgreementStateController) PutAgreementState() {

	this.DbLog("AgreementState", "合同状态", "更新")

	agreementStateId, _ := this.GetInt64("agreementStateId", 0)
	agreementState, err := m.GetAgreementStateById(agreementStateId)
	if err != nil {
		this.ResponseErrorJSON(400, err.Error())
	}
	agreementState.State = strings.TrimSpace(this.GetString("agreementState", ""))
	beego.Info("[合同状态Id是", agreementState.Id, "合同状态是", agreementState.State, "]")

	if updateBy := this.GetString("updateBy", ""); updateBy != "" {
		agreementState.UpdateBy = updateBy
	}

	if err := m.PutAgreementState(agreementState); err == nil {
		this.Data["json"] = this.ResponseSuccessJSON(true, "更新合同状态成功", 1)
	} else {
		this.Data["json"] = this.ResponseSuccessJSON(false, "更新合同状态失败", -1)
	}
	this.ServeJSON()
}
