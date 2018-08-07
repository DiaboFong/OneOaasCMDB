package test

import (
	"net/http"
	"testing"
	_ "oneoaas.com/frontend/routers"
	. "github.com/smartystreets/goconvey/convey"
	"github.com/astaxie/beego"
	"net/url"
)

func TestGetIp(t *testing.T) {
	Convey("Get Ip REST API", t, func() {
		client := &http.Client{}
		req, err := http.NewRequest(http.MethodGet,IpApiAction.Get, nil)
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

func TestAddIp(t *testing.T) {
	Convey("Add Ip REST API", t, func() {
		client := &http.Client{}

		req, err := http.NewRequest(http.MethodPost,IpApiAction.Add, nil)

		form := url.Values{}
		form.Add("ipaddress","test0101")
		form.Add("roomId","1")
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

func TestUpdateIp(t *testing.T) {
	Convey("Update Ip REST API", t, func() {
		client := &http.Client{}
		req, err := http.NewRequest(http.MethodPut,IpApiAction.Update, nil)
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

func TestDeleteIp(t *testing.T) {
	Convey("Delete Ip REST API", t, func() {
		client := &http.Client{}
		req, err := http.NewRequest(http.MethodDelete,IpApiAction.Delete, nil)
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