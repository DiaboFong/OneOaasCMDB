package test

import (
	"net/http"
	"testing"
	_ "oneoaas.com/frontend/routers"
	. "github.com/smartystreets/goconvey/convey"
	"github.com/astaxie/beego"
	"net/url"
)

func TestGetHardware(t *testing.T) {
	Convey("Get Hardware REST API", t, func() {
		client := &http.Client{}
		req, err := http.NewRequest(http.MethodGet,HardwareApiAction.Get, nil)
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


func TestAddHardware(t *testing.T) {
	Convey("Add Hardware REST API", t, func() {
		client := &http.Client{}

		req, err := http.NewRequest(http.MethodPost,HardwareApiAction.Add, nil)

		form := url.Values{}
		form.Add("hardwareSn","test0101")
		form.Add("rackId","1")
		req.PostForm = form
		if err != nil{
			beego.Error(err)
		}
		req.Header.Add("Content-Type",ApiContextType)
		req.Header.Add("Authorization",ApiToken)
		response,err := client.Do(req)
		//fmt.Printf("%#v\n",response)
		resp := ResponseTester{response}
		resp.json()
		resp.status(200)
	})
}

func TestUpdateHardware(t *testing.T) {
	Convey("Update Hardware REST API", t, func() {
		client := &http.Client{}
		req, err := http.NewRequest(http.MethodPut,HardwareApiAction.Update, nil)
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


func TestDeleteHardware(t *testing.T) {
	Convey("Delete Hardware REST API", t, func() {
		client := &http.Client{}
		req, err := http.NewRequest(http.MethodDelete,HardwareApiAction.Delete, nil)
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