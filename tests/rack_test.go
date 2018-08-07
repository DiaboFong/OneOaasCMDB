package test

import (
	"net/http"
	"testing"
	_ "oneoaas.com/frontend/routers"
	. "github.com/smartystreets/goconvey/convey"
	"github.com/astaxie/beego"
	"net/url"
)

func TestGetRack(t *testing.T) {
	Convey("Get Rack REST API", t, func() {
		client := &http.Client{}
		req, err := http.NewRequest(http.MethodGet,RackApiAction.Get, nil)
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

func TestAddRack(t *testing.T) {
	Convey("Add Rack REST API", t, func() {
		client := &http.Client{}

		req, err := http.NewRequest(http.MethodPost,RackApiAction.Add, nil)

		form := url.Values{}
		form.Add("rackName","test0101")
		form.Add("status","2")
		form.Add("room","30")
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

func TestUpdateRack(t *testing.T) {
	Convey("Update Rack REST API", t, func() {
		client := &http.Client{}
		req, err := http.NewRequest(http.MethodPut,RackApiAction.Update, nil)
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


func TestDeleteRack(t *testing.T) {
	Convey("Delete Rack REST API", t, func() {
		client := &http.Client{}
		req, err := http.NewRequest(http.MethodDelete,RackApiAction.Delete, nil)
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