package controllers

import (
	"errors"
	"github.com/astaxie/beego"
	m "oneoaas.com/cmdb/models"
	"oneoaas.com/cmdb/util"
	"strings"
	"net/http"
)

//查询合同
func (this *AgreementController) GetAgreement() {
	var sort string
	var order string
	var query = make(map[string]string, 0)     //存储条件
	var agreementList = make([]interface{}, 0) //存储返回数据
	var limit int64 = -1
	var offset int64 = -1

	// limit: 10 (default is 10)
	if v, err := this.GetInt64("limit"); err == nil {
		limit = v
	}
	// offset: 0 (default is 0)
	if v, err := this.GetInt64("offset"); err == nil {
		offset = v
	}
	// sort: col1,col2
	if v := this.GetString("sort"); v != "" {
		sort = v
	}
	// order: desc,asc
	if v := this.GetString("order"); v != "" {
		order = v
	}
	if v := this.GetString("search"); v != "" {
		query["search"] = v
	}
	if v := this.GetString("enable"); v != "" {
		query["enable"] = v
	}

	agreementList, total := m.GetAgreement(query, sort, order, offset, limit)
	if agreementList == nil {
		agreementList = make([]interface{}, 0)
	}
	if v := this.GetString("format"); v == "json" {
		this.TotalRowsPageJSON(total, agreementList)
	} else {
		this.DataJSON(agreementList)
	}

	this.ServeJSON()
}

//添加合同
func (this *AgreementController) AddAgreement() {

	this.DbLog("Agreement", "合同", "添加")

	var agreement m.Agreement

	agreement.Enable=true
	agreement.AgreementName = this.GetString("agreementName", "")
	agreement.AgreementNo = this.GetString("agreementNo", "")
	agreement.AgreementPrice, _ = this.GetInt64("agreementPrice", 0)

	agreementSignDate := this.GetString("agreementSignDate", "")
	SignTime := util.TimeBuild(agreementSignDate)
	agreement.AgreementSignDate = SignTime

	agreementStartDate := this.GetString("agreementStartDate", "")
	StartTime := util.TimeBuild(agreementStartDate)
	agreement.AgreementStartDate = StartTime

	agreementStopDate := this.GetString("agreementStopDate", "")
	StopTime := util.TimeBuild(agreementStopDate)
	agreement.AgreementStopDate = StopTime

	agreement.AgreementSigner = this.GetString("agreementSigner", "")
	agreement.AgreementPath = this.GetString("agreementPath", "")
	agreement.Comment = this.GetString("comment", "")

	stateId, _ := this.GetInt64("stateId")
	beego.Info("stateId", stateId)
	stateObj, err := m.GetAgreementStateById(stateId)
	if err != nil {
		beego.Debug("[获取合同状态出错", err.Error(), "]")
		this.ResponseErrorJSON(http.StatusBadRequest, errorFormat(errors.New("获取合同状态出错"), err.Error()))
	}
	agreement.State = stateObj

	supplierId, _ := this.GetInt64("supplierId")
	beego.Info("supplierId", supplierId)
	supplierObj, err := m.SupplierGetById(supplierId)
	if err != nil {
		beego.Debug("[获取供应商出错", err.Error(), "]")
		this.ResponseErrorJSON(http.StatusBadRequest, errorFormat(errors.New("获取供应商出错"), err.Error()))
	}
	agreement.Supplier = supplierObj

	id, err := m.AddAgreement(agreement)
	if err != nil {
		beego.Debug("[保存合同错误", err.Error(), "]")
		this.ResponseErrorJSON(http.StatusBadRequest, errorFormat(ErrorBadRequest_400, err.Error()))
	} else {
		beego.Debug("[保存合同成功,id是", id, "]")
		this.Data["json"] = this.ResponseSuccessJSON(true, "添加合同成功", id)
	}
	this.ServeJSON()
}

//删除合同
func (this *AgreementController) DelAgreement() {

	this.DbLog("Agreement", "合同", "删除")

	var err error
	v := this.GetString("agreementId")
	hardDelete,err := this.GetBool("hardDelete")

	if len(v) > 0 {
		for _, id := range strings.Split(v, ",") {
			agreementid, _ := util.StrToInt64(id)
			if(hardDelete){
				err = m.HardDelAgreement(agreementid);
			}else{
				err = m.DelAgreement(agreementid)
			}
		}
		if err != nil {
			this.ResponseErrorJSON(http.StatusBadRequest, err.Error())
		} else {
			this.Data["json"] = this.ResponseSuccessJSON(true,"删除合同成功",1)
		}
	} else {
		this.Data["json"] = this.ResponseSuccessJSON(false,"删除合同失败",-1)
	}

	this.ServeJSON()
}

//更新合同
func (this *AgreementController) PutAgreement() {

	this.DbLog("Agreement", "合同", "更新")

	agreementId, _ := this.GetInt64("agreementId", 0)
	agreement, err := m.AgreementGetById(agreementId)
	if err != nil || agreement == nil {
		beego.Debug("[更新合同错误", err.Error(), "]")
		this.ResponseErrorJSON(http.StatusBadRequest, errorFormat(errors.New("合同更新失败"), err.Error()))
	}
	if agreementName := strings.TrimSpace(this.GetString("agreementName", "")); agreementName != "" {
		agreement.AgreementName = agreementName
	}

	if agreementNo := strings.TrimSpace(this.GetString("agreementNo", "")); agreementNo != "" {
		agreement.AgreementNo = agreementNo
	}

	if agreementPrice, _ := this.GetInt64("agreementPrice", 0); agreementPrice != 0 {
		agreement.AgreementPrice = agreementPrice
	}

	agreementSignDate := this.GetString("agreementSignDate", "")
	if agreementSignDate != "" {
		SignTime := util.TimeBuild(agreementSignDate)
		agreement.AgreementSignDate = SignTime
	}

	agreementStartDate := this.GetString("agreementStartDate", "")
	if agreementStartDate != "" {
		StartTime := util.TimeBuild(agreementStartDate)
		agreement.AgreementStartDate = StartTime
	}

	agreementStopDate := this.GetString("agreementStopDate", "")
	if agreementStopDate != "" {
		StopTime := util.TimeBuild(agreementStopDate)
		agreement.AgreementStopDate = StopTime
	}

	if agreementSigner := strings.TrimSpace(this.GetString("agreementSigner", "")); agreementSigner != "" {
		agreement.AgreementSigner = agreementSigner
	}

	if agreementPath := strings.TrimSpace(this.GetString("agreementPath", "")); agreementPath != "" {
		agreement.AgreementPath = agreementPath
	}

	if comment := strings.TrimSpace(this.GetString("comment", "")); comment != "" {
		agreement.Comment = comment
	}

	enable, _ := this.GetBool("enable",false)
	if enable {
		//恢复数据
		agreement.Enable = enable
	}

	stateId, _ := this.GetInt64("stateId")
	stateObj, err := m.GetAgreementStateById(stateId)
	if err != nil {
		beego.Debug("[更新获取合同状态出错", err.Error(), "]")
	} else {
		agreement.State = stateObj
	}

	supplierId, _ := this.GetInt64("supplierId")
	supplierObj, err := m.SupplierGetById(supplierId)
	if err != nil {
		beego.Error("[更新获取供应商出错", err.Error(), "]")
	} else {
		agreement.Supplier = supplierObj
	}

	if err := m.PutAgreement(agreement); err == nil {
		this.Data["json"] = this.ResponseSuccessJSON(true, "更新合同成功", 1)
	} else {
		this.Data["json"] = this.ResponseSuccessJSON(false, "更新合同失败", -1)
	}
	this.ServeJSON()
}

func (this *AgreementController) Fnish() {

}
