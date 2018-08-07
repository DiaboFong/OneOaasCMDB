package test

import (
	"net/http"
	"testing"
	_ "oneoaas.com/frontend/routers"
	. "github.com/smartystreets/goconvey/convey"
	"github.com/astaxie/beego"
	"net/url"
)

func TestGetAws(t *testing.T) {
	Convey("Get Aws REST API", t, func() {
		client := &http.Client{}
		req, err := http.NewRequest(http.MethodGet,AwsApiAction.Get, nil)
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

func TestAddAws(t *testing.T) {
	Convey("Add Aws REST API", t, func() {
		client := &http.Client{}

		req, err := http.NewRequest(http.MethodPost,AwsApiAction.Add, nil)

		form := url.Values{}
		form.Add("architecture","test0101")
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

func TestUpdateAws(t *testing.T) {
	Convey("Update Aws REST API", t, func() {
		client := &http.Client{}
		req, err := http.NewRequest(http.MethodPut,AwsApiAction.Update, nil)
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

func TestDeleteAws(t *testing.T) {
	Convey("Delete Aws REST API", t, func() {
		client := &http.Client{}
		req, err := http.NewRequest(http.MethodDelete,AwsApiAction.Delete, nil)
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