package test

import (
	"net/http"
	"testing"
	_ "oneoaas.com/frontend/routers"
	. "github.com/smartystreets/goconvey/convey"
	"github.com/astaxie/beego"
	"net/url"
)

func TestGetServer(t *testing.T) {
	Convey("Get Server REST API", t, func() {
		client := &http.Client{}
		req, err := http.NewRequest(http.MethodGet,ServerApiAction.Get, nil)
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

func TestAddServer(t *testing.T) {
	Convey("Add Server REST API", t, func() {
		client := &http.Client{}

		req, err := http.NewRequest(http.MethodPost,ServerApiAction.Add, nil)

		form := url.Values{}
		form.Add("sn","test0101")
		form.Add("rackId","1")
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

func TestUpdateServer(t *testing.T) {
	Convey("Update Server REST API", t, func() {
		client := &http.Client{}
		req, err := http.NewRequest(http.MethodPut,ServerApiAction.Update, nil)
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

func TestDeleteServer(t *testing.T) {
	Convey("Delete Server REST API", t, func() {
		client := &http.Client{}
		req, err := http.NewRequest(http.MethodDelete,ServerApiAction.Delete, nil)
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