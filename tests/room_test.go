package test

import (
	"net/http"
	"testing"
	_ "oneoaas.com/frontend/routers"
	. "github.com/smartystreets/goconvey/convey"
	"github.com/astaxie/beego"
	"net/url"
)

func TestGetRoom(t *testing.T) {
	Convey("Get Room REST API", t, func() {
		client := &http.Client{}
		req, err := http.NewRequest(http.MethodGet,RoomApiAction.Get, nil)
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

func TestAddRoom(t *testing.T) {
	Convey("Add Room REST API", t, func() {
		client := &http.Client{}

		req, err := http.NewRequest(http.MethodPost,RoomApiAction.Add, nil)

		form := url.Values{}
		form.Add("roomname","test0101")
		form.Add("dcId","1")
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

func TestUpdateRoom(t *testing.T) {
	Convey("Update Room REST API", t, func() {
		client := &http.Client{}
		req, err := http.NewRequest(http.MethodPut,RoomApiAction.Update, nil)
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

func TestDeleteRoom(t *testing.T) {
	Convey("Delete Room REST API", t, func() {
		client := &http.Client{}
		req, err := http.NewRequest(http.MethodDelete,RoomApiAction.Delete, nil)
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