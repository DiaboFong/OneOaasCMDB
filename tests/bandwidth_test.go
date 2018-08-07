package test

import (
	"net/http"
	"testing"
	_ "oneoaas.com/frontend/routers"
	. "github.com/smartystreets/goconvey/convey"
	"github.com/astaxie/beego"
	"net/url"
)

func TestGetBandwidth(t *testing.T) {
	Convey("Get Bandwidth REST API", t, func() {
		client := &http.Client{}
		req, err := http.NewRequest(http.MethodGet,BandwidthApiAction.Get, nil)
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

func TestAddBandwidth(t *testing.T) {
	Convey("Add Bandwidth REST API", t, func() {
		client := &http.Client{}

		req, err := http.NewRequest(http.MethodPost,BandwidthApiAction.Add, nil)

		form := url.Values{}
		form.Add("name","test0101")
		form.Add("roomId","1")
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

func TestUpdateBandwidth(t *testing.T) {
	Convey("Update Bandwidth REST API", t, func() {
		client := &http.Client{}
		req, err := http.NewRequest(http.MethodPut,BandwidthApiAction.Update, nil)
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

func TestDeleteBandwidth(t *testing.T) {
	Convey("Delete Bandwidth REST API", t, func() {
		client := &http.Client{}
		req, err := http.NewRequest(http.MethodDelete,BandwidthApiAction.Delete, nil)
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