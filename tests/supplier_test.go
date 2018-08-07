package test

import (
	"net/http"
	"testing"
	_ "oneoaas.com/frontend/routers"
	. "github.com/smartystreets/goconvey/convey"
	"github.com/astaxie/beego"
	"net/url"
)

func TestGetSupplier(t *testing.T) {
	Convey("Get Supplier REST API", t, func() {
		client := &http.Client{}
		req, err := http.NewRequest(http.MethodGet,SupplierApiAction.Get, nil)
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


func TestAddSupplier(t *testing.T) {
	Convey("Add Supplier REST API", t, func() {
		client := &http.Client{}

		req, err := http.NewRequest(http.MethodPost,SupplierApiAction.Add, nil)

		form := url.Values{}
		form.Add("supplier","test0101")
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

func TestUpdateSupplier(t *testing.T) {
	Convey("Update Supplier REST API", t, func() {
		client := &http.Client{}
		req, err := http.NewRequest(http.MethodPut,SupplierApiAction.Update, nil)
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


func TestDeleteSupplier(t *testing.T) {
	Convey("Delete Supplier REST API", t, func() {
		client := &http.Client{}
		req, err := http.NewRequest(http.MethodDelete,SupplierApiAction.Delete, nil)
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