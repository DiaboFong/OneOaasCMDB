package controllers

import (
	"errors"
	"github.com/astaxie/beego"
	"oneoaas.com/cmdb/models"
	"strings"
	"oneoaas.com/cmdb/util"
	"net/http"
	"time"
)


func (this *AccessKeyController) GetAccessKey() {
	ack := new(models.AccessKey)
	var sort []string
	var order []string
	var query = make(map[string]string, 0) //存储条件
	var limit int64 = -1
	var offset int64 = -1

	if v, err := this.GetInt64("limit"); err == nil {
		limit = v
	}
	if v, err := this.GetInt64("offset"); err == nil {
		offset = v
	}
	if v := this.GetString("sort"); v != "" {
		sort = strings.Split(v, ",")
	}
	if v := this.GetString("order"); v != "" {
		order = strings.Split(v, ",")
	}

	format := this.GetString("format", "")
	query["access_key_type"]=util.OtherToken
	keys, _ := ack.GetAccessKey(query, sort, order, offset, limit)
	if format != "" && format == "json" {
		countNum, err := ack.CountAccessKey(query)
		if err == nil {
			this.TotalRowsPageJSON(countNum, keys)
		} else {
			this.TotalRowsPageJSON(0, keys)
		}
	} else {
		this.DataJSON(keys)
	}
	this.ServeJSON()
}

func (this *AccessKeyController) AddAccessKey() {
	token := new(models.AccessKey)
	createTime := time.Now().Unix()
	expireTime := createTime + util.ExpireAmonth
	user, err := this.TokenUser()
	if err != nil{
		beego.Error(err.Error())
		this.ResponseErrorJSON(http.StatusBadRequest, errorFormat(errors.New("创建访问Key失败"), err.Error()))
	}
	token.User = user
	AccessName := this.GetString("access_name", "")
	AccessDesc := this.GetString("access_desc", "")
	token.AccessKeyName = AccessName
	token.AccessKeyId = util.MakeAccessKeyId()
	token.AccessKeyType = util.OtherToken
	token.AccessKeyDesc = AccessDesc
	token.AccessKeySecret = util.CreateToke(string(user.LoginName),util.OtherToken,createTime,expireTime,util.ClientId(AccessName))
	token.ExpireTime = expireTime
	token.IsDelete = 0
	token.IsDisable = 1
	id, err := token.AddAccessKey()
	if err != nil {
		beego.Error(err.Error())
		this.ResponseErrorJSON(http.StatusBadRequest, errorFormat(errors.New("创建访问Key失败"), err.Error()))
	}
	this.Data["json"] = this.ResponseSuccessJSON(true, token.AccessKeySecret, id)
	this.ServeJSON()
}

func (this *AccessKeyController) UpdateAccessKey() {

	tokenId, err := this.GetInt64("id", 0)

	accessKeyName := this.GetString("access_key_name")
	resetAccessKeySecret, err := this.GetBool("reset_secret", false)
	accessKeyDesc := this.GetString("access_key_desc")

	createTime := time.Now().Unix()
	expireTime := createTime + util.ExpireAmonth //一个月过期
	token := new(models.AccessKey)
	if this.tokeType == util.SelfToken && resetAccessKeySecret == true { // 本身
		accessKeySecret := util.CreateToke(util.OtherToken, util.OtherToken, createTime, expireTime, util.ClientId(accessKeyName))
		token.Id = tokenId
		err := token.One()
		if err != nil {
			beego.Error(err)
		}
		token.AccessKeyDesc = accessKeyDesc
		token.AccessKeySecret = accessKeySecret
		token.AccessKeyName = accessKeyName
		token.CreateTime = time.Now()
		token.Update()
	} else if this.tokeType == util.OtherToken {// 第三方
		token.Id = tokenId
		err := token.One()
		if err != nil {
			beego.Error(err)
		}
		token.AccessKeyDesc = accessKeyDesc
		//token.AccessKeySecret = accessKeySecret
		token.AccessKeyName = accessKeyName
		token.CreateTime = time.Now()
		token.Update()
	} else {
		err = token.UpdateState(tokenId)
		if err != nil {
			beego.Error(err.Error())
			this.ResponseErrorJSON(http.StatusBadRequest, errorFormat(errors.New("操作失败"), err.Error()))
		}
	}
	this.Data["json"] = this.ResponseSuccessJSON(true, "操作成功", tokenId)
	this.ServeJSON()
}

func (this *AccessKeyController) DelAccessKey() {
	var err error
	ack := new(models.AccessKey)
	v := this.GetString("id")
	if len(v) > 0 {
		for _, id := range strings.Split(v, ",") {
			accesskeyid, _ := util.StrToInt64(id)
			ack.Id = accesskeyid
			_, err = ack.DeleteAccessKey()
		}
		if err != nil {
			this.ResponseErrorJSON(http.StatusBadRequest, err.Error())
		} else {
			this.Data["json"] = this.ResponseSuccessJSON(true, "删除成功", 1)
		}
	} else {
		this.Data["json"] = this.ResponseSuccessJSON(false, "删除失败", -1)
	}

	this.ServeJSON()
}
