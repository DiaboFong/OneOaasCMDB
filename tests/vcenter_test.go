package test

import (
	"net/http"
	"testing"
	_ "oneoaas.com/frontend/routers"
	. "github.com/smartystreets/goconvey/convey"
	"github.com/astaxie/beego"
	"net/url"
)

func TestGetVcenter(t *testing.T) {
	Convey("Get Vcenter REST API", t, func() {
		client := &http.Client{}
		req, err := http.NewRequest(http.MethodGet,VcenterApiAction.Get, nil)
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

func TestAddVcenter(t *testing.T) {
	Convey("Add Vcenter REST API", t, func() {
		client := &http.Client{}

		req, err := http.NewRequest(http.MethodPost,VcenterApiAction.Add, nil)

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

func TestUpdateVcenter(t *testing.T) {
	Convey("Update Vcenter REST API", t, func() {
		client := &http.Client{}
		req, err := http.NewRequest(http.MethodPut,VcenterApiAction.Update, nil)
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

func TestDeleteVcenter(t *testing.T) {
	Convey("Delete Vcenter REST API", t, func() {
		client := &http.Client{}
		req, err := http.NewRequest(http.MethodDelete,VcenterApiAction.Delete, nil)
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