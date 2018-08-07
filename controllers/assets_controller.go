package controllers

import (
	"github.com/astaxie/beego"
	"fmt"
	"encoding/json"
	"github.com/couchbase/gocb"
	"time"
	"oneoaas.com/cmdb/models"
	"errors"
	"net/http"
)

func (this *AssetsController) AddCustomAsset() {
	this.DbLog("Assert", "资产模块", "添加")
	assetModelJson := this.GetString("json", "")
	assetsName := this.GetString("assets", "")
	beego.Info(assetModelJson)
	var assetModelMap map[string]interface{}
	byt := []byte(assetModelJson)
	if err := json.Unmarshal(byt, &assetModelMap); err != nil {
		beego.Error(err.Error())
	}
	assetModelMap["id"] = time.Now().Unix()  //生成随机ID
	var assetMap map[string]interface{}
	cas, err := models.Bucket.Get(assetsName, &assetMap)
	if err != nil {
		beego.Error(err.Error())
	}
	if assetMap != nil && assetMap["data"] != nil {
		if assetMap["data"] != nil {
			data := assetMap["data"].([]interface{})
			data = append(data, assetModelMap)
			assetMap["data"] = data
			json, _ := json.Marshal(&assetMap)
			fmt.Println(string(json))
			_, err = models.Bucket.Replace(assetsName, &assetMap, cas, 0)
			if err != nil {
				beego.Error(err.Error())
			}
		}
	} else {
		assetData := make([]map[string]interface{}, 0)
		assetData = append(assetData, assetModelMap)
		assetMap["data"] = assetData
		json, _ := json.Marshal(&assetMap)
		fmt.Println(string(json))
		_, err = models.Bucket.Replace(assetsName, &assetMap, cas, 0)
	}
	if err != nil {
		this.ResponseErrorJSON(400, errorFormat(ErrorBadRequest_400, err.Error()))
	} else {
		this.Data["json"] = this.ResponseSuccessJSON(true, "创建自定义资产配置项成功", 1)
	}
	this.ServeJSON()
}

func (this *AssetsController) GetCustomAsset() {
	assetsName := this.GetString("assets", "")
	beego.Info("获取" + assetsName + "资产配置项目信息")
	var assetMap map[string]interface{}
	_, error := models.Bucket.Get(assetsName, &assetMap)
	if error != nil {
		beego.Error(error.Error())
	}
	this.Data["json"] = assetMap
	this.ServeJSON()
}

func (this *AssetsController) DeleteCustomAsset() {
	assetsId, err := this.GetInt64("id")
	if err != nil {
		beego.Info(err.Error())
	}
	assetsName := this.GetString("assets", "")
	if assetsName == "" {
		this.ResponseErrorJSON(400, errorFormat(errors.New("资产名称错误"), err.Error()))
	}
	beego.Info("资产id", assetsId, "资产名称", assetsName)
	myQuery := gocb.NewN1qlQuery("UPDATE default USE KEYS ? SET data = ARRAY c FOR c IN data WHEN c.id !=? END")
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

/*
UPDATE default
USE KEYS "firewall"
SET a.test1="99999999" FOR a IN data WHEN a.id=1 END,
    a.test2="88888888" FOR a IN data WHEN a.id=1 END,
    a.test3="444444455" FOR a IN data WHEN a.id=1 END
RETURNING firewall;
 */
func (this *AssetsController) UpdateCustomAsset() {
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
	n1Sql := " UPDATE default USE KEYS ? SET a=" + assetModelJson + " FOR a IN data WHEN a.id=? END RETURNING " + assetsName + ";";
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

// @Title 获取根类资产类型
// @Description 获取基础资产类型
// @Success 200 {array} []models.Asserts
// @Param   Authorization     header   string true       "认证信息"
// @Param   timestamp         query   string true       "时间戳"
// @Failure 400 获取资产类型错误
// @router / [get]
func (this *AssetsController) GetAssets() {
	asserts := new(models.Asserts)
	list := asserts.GetAsserts()
	this.Data["json"] = list
	this.ServeJSON()
}

// @Title 获取资产类型
// @Description 通过id获取资产类型
// @Success 200 {object} models.Asserts
// @Param   Authorization     header   string true       "认证信息"
// @Param   timestamp         query   string true       "时间戳"
// @Failure 400 获取资产类型错误
// @router /:id [get]
func (this *AssetsController) GetAssetsById() {
	id,err := this.GetInt64("id")
	if err != nil{
		beego.Error(err)
	}
	asserts := new(models.Asserts)
	asserts.Id = id
	this.Data["json"] = asserts.GetAssertsById()
	this.ServeJSON()
}


// @Title 资产
// @Description 添加资产类型
// @Success 200 {map} map[string]interface{}
// @Param   Authorization     header   string true       "认证信息"
// @Param   timestamp         query   string true       "时间戳"
// @Failure 400 添加资产错误
// @router / [post]
func (this *AssetsController) AddAssets() {
	asserts := new(models.Asserts)
	json.Unmarshal(this.Ctx.Input.RequestBody, asserts)
	fmt.Printf("%v#\n",asserts)
	id ,err := asserts.AddAsserts()
	if err != nil {
		beego.Error(err.Error())
		this.ResponseErrorJSON(http.StatusBadRequest,errorFormat(ErrorBadRequest_400, err.Error()))
	} else {
		this.Data["json"] = this.ResponseSuccessJSON(true, "添加资产成功", id)
	}

	this.ServeJSON()
}
