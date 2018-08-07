package controllers

import (
	"github.com/astaxie/beego"
	"fmt"
	"encoding/json"
	"time"
	"oneoaas.com/cmdb/models"
	"github.com/couchbase/gocb"
)

type Class struct {
	Name        string       `json:"name"`
	Description string       `json:"description"`
	Inherits    string        `json:"inherits"`
	Superclass  bool        `json:"superclass"`
	Active      bool            `json:"active"`
	CiData      []*Ci         `json:"cidata"`
}
type Ci struct {
	Name        string     `json:"name"`
	Description string     `json:"description"`
	Class       string     `json:"class"`
	Show        bool       `json:"show"`
	Active      bool       `json:"active"`
	Editmode    string     `json:"editmode"`
}

func (this *CiController) AddCi() {
	assetsName := this.GetString("assets", "")
	ciName := this.GetString("name", "")
	ciDescription := this.GetString("description", "")
	//ciClass := this.GetString("class", "")
	//ciShow, err := this.GetBool("show")
	//ciActive, err := this.GetBool("active")
	//ciEditmode := this.GetString("editmode", "")
	beego.Info("资产名称", assetsName, "配置项名称", ciName, "配置项目描述", ciDescription)
	var assetMap map[string]interface{}
	cas, err := models.Bucket.Get(assetsName, &assetMap)
	if err != nil {
		beego.Error(err.Error())
	}
	if assetMap != nil && assetMap["cidata"] != nil {
		ciMsg := assetMap["cidata"].([]interface{})
		ciItem := make(map[string]interface{})
		ciItem["id"] = time.Now().Unix()
		ciItem["name"] = ciName
		ciItem["description"] = ciDescription
		//assetItem["class"] = ciClass
		//assetItem["isshow"] = ciShow
		//assetItem["active"] = ciActive
		//assetItem["editmode"] = ciEditmode
		ciMsg = append(ciMsg, ciItem)
		assetMap["cidata"] = ciMsg
		json, _ := json.Marshal(&assetMap)
		beego.Info("new cimap", json)
		cas, err = models.Bucket.Replace(assetsName, &assetMap, cas, 0)
	} else {
		assetMap = make(map[string]interface{})
		assetCiData := make([]map[string]interface{}, 0)
		assetItem := make(map[string]interface{})
		assetItem["id"] = time.Now().Unix()
		assetItem["name"] = ciName
		assetItem["description"] = ciDescription
		//assetItem["class"] = ciClass
		//assetItem["isshow"] = ciShow
		//assetItem["active"] = ciActive
		//assetItem["editmode"] = ciEditmode
		assetCiData = append(assetCiData, assetItem)
		assetMap["cidata"] = assetCiData
		json, _ := json.Marshal(&assetMap)
		beego.Info("new cimap", json)
		cas, err = models.Bucket.Replace(assetsName, &assetMap, cas, 0)
	}
	if err != nil {
		this.ResponseErrorJSON(400, errorFormat(ErrorBadRequest_400, err.Error()))
	} else {
		this.Data["json"] = this.ResponseSuccessJSON(true, "创建资产配置项成功", 1)
	}
	this.ServeJSON()
}

func (this *CiController) GetCi() {
	assetsName := this.GetString("assets", "")
	if assetsName == "" {
		beego.Error("资产名称输入错误")
	}
	beego.Info("获取" + assetsName + "资产配置项目信息")
	var assetMap map[string]interface{}
	_, error := models.Bucket.Get(assetsName, &assetMap)
	if error != nil {
		beego.Error(error.Error())
	}
	this.Data["json"] = assetMap
	this.ServeJSON()
}

func (this *CiController) UpdateCi() {
	assetsId, err := this.GetInt64("id")
	if err != nil {
		beego.Info(err.Error())
	}
	assetModelJson := this.GetString("json", "")
	assetsName := this.GetString("assets", "")
	beego.Info("资产id", assetsId, "资产名称", assetsName)
	var assetModelMap map[string]interface{}
	byt := []byte(assetModelJson)
	if err := json.Unmarshal(byt, &assetModelMap); err != nil {
		beego.Error(err.Error())
	}
	assetModelMap["id"] = time.Now().Unix()
	newByt, _ := json.Marshal(assetModelMap)
	assetModelJson = string(newByt)
	n1Sql := " UPDATE default USE KEYS ? SET a=" + assetModelJson + " FOR a IN cidata WHEN a.id=? END RETURNING " + assetsName + ";"
	beego.Info(n1Sql)
	myQuery := gocb.NewN1qlQuery(n1Sql)
	var myParams []interface{}
	myParams = append(myParams, assetsName)
	myParams = append(myParams, assetsId)
	rows, err := models.Bucket.ExecuteN1qlQuery(myQuery, myParams)
	fmt.Printf("Results: %v\n", rows)
	if err != nil {
		beego.Error(err.Error())
		this.ResponseErrorJSON(400, errorFormat(ErrorBadRequest_400, err.Error()))
	} else {
		this.Data["json"] = this.ResponseSuccessJSON(true, "更新资产成功", 1)
	}
	this.ServeJSON()
}

func (this *CiController) DelCi() {
	assetsId, err := this.GetInt64("id")
	if err != nil {
		beego.Info(err.Error())
	}
	assetsName := this.GetString("assets", "")
	beego.Info("资产id", assetsId, "资产名称", assetsName)
	myQuery := gocb.NewN1qlQuery("UPDATE default USE KEYS ? SET cidata = ARRAY c FOR c IN cidata WHEN c.id !=? END")
	var myParams []interface{}
	myParams = append(myParams, assetsName)
	myParams = append(myParams, assetsId)
	rows, err := models.Bucket.ExecuteN1qlQuery(myQuery, myParams)
	fmt.Printf("Results: %v\n", rows)
	if err != nil {
		beego.Error(err.Error())
		this.ResponseErrorJSON(400, errorFormat(ErrorBadRequest_400, err.Error()))
	} else {
		this.Data["json"] = this.ResponseSuccessJSON(true, "删除资产成功", 1)
	}
	this.ServeJSON()
}