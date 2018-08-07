package test

import (
	"net/http"
	"testing"
	_ "oneoaas.com/frontend/routers"
	. "github.com/smartystreets/goconvey/convey"
	"github.com/astaxie/beego"
	"net/url"
)

func TestGetDomain(t *testing.T) {
	Convey("Get Domain REST API", t, func() {
		client := &http.Client{}
		req, err := http.NewRequest(http.MethodGet,DomainApiAction.Get, nil)
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

func TestAddDomain(t *testing.T) {
	Convey("Add Domain REST API", t, func() {
		client := &http.Client{}

		req, err := http.NewRequest(http.MethodPost,DomainApiAction.Add, nil)

		form := url.Values{}
		form.Add("name","test0101")
		form.Add("stateId","1")
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

func TestUpdateDomain(t *testing.T) {
	Convey("Update Domain REST API", t, func() {
		client := &http.Client{}
		req, err := http.NewRequest(http.MethodPut,DomainApiAction.Update, nil)
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

func TestDeleteDomain(t *testing.T) {
	Convey("Delete Domain REST API", t, func() {
		client := &http.Client{}
		req, err := http.NewRequest(http.MethodDelete,DomainApiAction.Delete, nil)
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