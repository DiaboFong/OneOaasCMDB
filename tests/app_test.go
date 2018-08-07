package test

import (
	"net/http"
	"testing"
	_ "oneoaas.com/frontend/routers"
	. "github.com/smartystreets/goconvey/convey"
	"github.com/astaxie/beego"
	"net/url"
)

func TestGetApp(t *testing.T) {
	Convey("Get App REST API", t, func() {
		client := &http.Client{}
		req, err := http.NewRequest(http.MethodGet,AppApiAction.Get, nil)
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

func TestAddApp(t *testing.T) {
	Convey("Add App REST API", t, func() {
		client := &http.Client{}

		req, err := http.NewRequest(http.MethodPost,AppApiAction.Add, nil)

		form := url.Values{}
		form.Add("appName","test0101")
		form.Add("appLevel","1")
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

func TestUpdateApp(t *testing.T) {
	Convey("Update App REST API", t, func() {
		client := &http.Client{}
		req, err := http.NewRequest(http.MethodPut,AppApiAction.Update, nil)
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

func TestDeleteApp(t *testing.T) {
	Convey("Delete App REST API", t, func() {
		client := &http.Client{}
		req, err := http.NewRequest(http.MethodDelete,AppApiAction.Delete, nil)
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