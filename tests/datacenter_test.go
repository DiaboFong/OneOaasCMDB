package test

import (
	"net/http"
	"testing"
	_ "oneoaas.com/frontend/routers"
	. "github.com/smartystreets/goconvey/convey"
	"github.com/astaxie/beego"
	"net/url"
	"net/http/httptest"
	ctr "oneoaas.com/cmdb/controllers"
	"oneoaas.com/cmdb/models"
	"github.com/bitly/go-simplejson"
	"fmt"
)

type Response struct {
	Rows  []models.Datacenter `json:"rows"`
	Total int64 `json:"total"`
}

// 无需启动beego程序 测试get datacenter
func TestGetDatacenter(t *testing.T) {
	req, err := http.NewRequest(http.MethodGet,DatacenterApiAction.Get, nil)
	Convey("断言请求构造", t, func() {
		So(err, ShouldEqual,nil)
	})

	req.Header.Add("Content-Type",ApiContextType)
	req.Header.Add("Authorization",ApiToken)
	req.Context().Value(nil)

	w := httptest.NewRecorder()
	handler := beego.NewControllerRegister()
	handler.Add("/api/datacenter", &ctr.DatacenterController{}, "get:GetDatacenter")
	handler.ServeHTTP(w, req)
	Convey("断言/api/datacenter Get响应", t, func() {

		So(w.Body.String(), ShouldNotBeBlank)
		fmt.Println(w.Body.String())
		js, err := simplejson.NewJson([]byte(w.Body.String()))

		So(err, ShouldBeNil)

		supplier,_ := js.Get("Supplier").Map()

		fmt.Println(supplier)
		//So(supplier["Supplier"], ShouldNotBeBlank)
	})
}


func TestAdd(t *testing.T) {
	Convey("Add Datacenter REST API", t, func() {
		client := &http.Client{}

		req, err := http.NewRequest(http.MethodPost,DatacenterApiAction.Add, nil)

		form := url.Values{}
		form.Add("dcname","test0101")
		form.Add("supplierId","1")
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

func TestUpdate(t *testing.T) {
	Convey("Update Datacenter REST API", t, func() {
		client := &http.Client{}
		req, err := http.NewRequest(http.MethodPut,DatacenterApiAction.Update, nil)
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

func TestDelete(t *testing.T) {
	Convey("Delete Datacenter REST API", t, func() {
		client := &http.Client{}
		req, err := http.NewRequest(http.MethodDelete,DatacenterApiAction.Delete, nil)
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