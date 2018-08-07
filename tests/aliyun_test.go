package test

import (
	"net/http"
	"testing"
	_ "oneoaas.com/frontend/routers"
	. "github.com/smartystreets/goconvey/convey"
	"github.com/astaxie/beego"
	"net/url"
)

func TestGetAliyun(t *testing.T) {
	Convey("Get Aliyun REST API", t, func() {
		client := &http.Client{}
		req, err := http.NewRequest(http.MethodGet,AliyunApiAction.Get, nil)
		if err != nil{
			beego.Error(err)
		}
		req.Header.Add("Content-Type",ApiContextType)
		req.Header.Add("Authorization",ApiToken)
		response,err := client.Do(req)
		resp := ResponseTester{response}
		resp.json()
		resp.status(200)
	})
}

func TestAddAliyun(t *testing.T) {
	Convey("Add Aliyun REST API", t, func() {
		client := &http.Client{}

		req, err := http.NewRequest(http.MethodPost,AliyunApiAction.Add, nil)

		form := url.Values{}
		form.Add("instancename","test0101")
		req.PostForm = form
		if err != nil{
			beego.Error(err)
		}
		req.Header.Add("Content-Type",ApiContextType)
		req.Header.Add("Authorization",ApiToken)
		response,err := client.Do(req)
		resp := ResponseTester{response}
		resp.json()
		resp.status(200)
	})
}

func TestUpdateAliyun(t *testing.T) {
	Convey("Update Aliyun REST API", t, func() {
		client := &http.Client{}
		req, err := http.NewRequest(http.MethodPut,AliyunApiAction.Update, nil)
		if err != nil{
			beego.Error(err)
		}
		req.Header.Add("Content-Type",ApiContextType)
		req.Header.Add("Authorization",ApiToken)
		response,err := client.Do(req)
		resp := ResponseTester{response}
		resp.json()
		resp.status(200)
	})
}

func TestDeleteAliyun(t *testing.T) {
	Convey("Delete Aliyun REST API", t, func() {
		client := &http.Client{}
		req, err := http.NewRequest(http.MethodDelete,AliyunApiAction.Delete, nil)
		if err != nil{
			beego.Error(err)
		}
		req.Header.Add("Content-Type",ApiContextType)
		req.Header.Add("Authorization",ApiToken)
		response,err := client.Do(req)
		resp := ResponseTester{response}
		resp.json()
		resp.status(200)
	})
}