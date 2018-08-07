package routers

import (
	"net/http/httptest"
	"testing"
	"net/http"
	"github.com/astaxie/beego"
	ctr "oneoaas.com/cmdb/controllers"
	"fmt"
	"time"
	. "github.com/smartystreets/goconvey/convey"
)

// 测试get datacenter
func TestGetDatacenter(t *testing.T) {
	r, _ := http.NewRequest("GET", "/api/datacenter?enable=1&format=json&order=asc&sort=dcid&timestamp=1484735401", nil)

	fmt.Println(time.Now().Format(time.RFC850))
	auth :="BEARER eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhZG1pbiI6dHJ1ZSwiZXhwIjoxNDg1NDg1Mjk3LCJpYXQiOjE0ODQ4ODA0OTcsInVzZXJuYW1lIjoiYWRtaW4ifQ.owoyaScUhD8e37Cmq9m5vwakg30vmukXpsmeLR9WRoA"
	r.Header.Add("Authorization",auth)
	//timestamp :="1484734945"
	r.Context().Value(nil)
	w := httptest.NewRecorder()
	handler := beego.NewControllerRegister()
	handler.Add("/api/datacenter", &ctr.DatacenterController{}, "get:GetDatacenter")
	handler.ServeHTTP(w, r)

	Convey("Get Datacenter REST API", t, func() {
		fmt.Println(w.Body.String())
		//todo body to json
		So(w.Body.String(), ShouldNotBeBlank)
	})
}

// 测试post datacenter
func TestAddDatacenter(t *testing.T) {
	r, _ := http.NewRequest("POST", "/api/datacenter?dcname=hjz&supplierId=3&regionId=2&stateId=1&dcaddress=1&timestamp=1484735401", nil)

	fmt.Println(time.Now().Format(time.RFC850))
	auth :="BEARER eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhZG1pbiI6dHJ1ZSwiZXhwIjoxNDg1NDg1Mjk3LCJpYXQiOjE0ODQ4ODA0OTcsInVzZXJuYW1lIjoiYWRtaW4ifQ.owoyaScUhD8e37Cmq9m5vwakg30vmukXpsmeLR9WRoA"
	r.Header.Add("Authorization",auth)
	r.Context().Value(nil)
	w := httptest.NewRecorder()
	handler := beego.NewControllerRegister()
	handler.Add("/api/datacenter", &ctr.DatacenterController{}, "post:AddDatacenter")
	handler.ServeHTTP(w, r)

	Convey("Post Datacenter REST API", t, func() {
		fmt.Println(w.Body.String())
		//todo body to json
		So(w.Body.String(), ShouldNotBeBlank)
	})
}

// 测试update datacenter
func TestPutDatacenter(t *testing.T) {
	r, _ := http.NewRequest("PUT", "/api/datacenter?dcid=194&dcname=hanjiuzhou&&timestamp=1484735401", nil)

	fmt.Println(time.Now().Format(time.RFC850))
	auth :="BEARER eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhZG1pbiI6dHJ1ZSwiZXhwIjoxNDg1NDg1Mjk3LCJpYXQiOjE0ODQ4ODA0OTcsInVzZXJuYW1lIjoiYWRtaW4ifQ.owoyaScUhD8e37Cmq9m5vwakg30vmukXpsmeLR9WRoA"
	r.Header.Add("Authorization",auth)
	r.Context().Value(nil)
	w := httptest.NewRecorder()
	handler := beego.NewControllerRegister()
	handler.Add("/api/datacenter", &ctr.DatacenterController{}, "put:PutDatacenter")
	handler.ServeHTTP(w, r)

	Convey("Update Datacenter REST API", t, func() {
		fmt.Println(w.Body.String())
		//todo body to json
		So(w.Body.String(), ShouldNotBeBlank)
	})
}

// 测试delete datacenter
func TestDelDatacenter(t *testing.T) {
	r, _ := http.NewRequest("DELETE", "/api/datacenter?dcid=194&hardDelete=true&timestamp=1484735401", nil)

	fmt.Println(time.Now().Format(time.RFC850))
	auth :="BEARER eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhZG1pbiI6dHJ1ZSwiZXhwIjoxNDg1NDg1Mjk3LCJpYXQiOjE0ODQ4ODA0OTcsInVzZXJuYW1lIjoiYWRtaW4ifQ.owoyaScUhD8e37Cmq9m5vwakg30vmukXpsmeLR9WRoA"
	r.Header.Add("Authorization",auth)
	r.Context().Value(nil)
	w := httptest.NewRecorder()
	handler := beego.NewControllerRegister()
	handler.Add("/api/datacenter", &ctr.DatacenterController{}, "delete:DelDatacenter")
	handler.ServeHTTP(w, r)

	Convey("Delete Datacenter REST API", t, func() {
		fmt.Println(w.Body.String())
		//todo body to json
		So(w.Body.String(), ShouldNotBeBlank)
	})
}

// 测试get room
func TestGetRoom(t *testing.T) {
	r, _ := http.NewRequest("GET", "/api/room?enable=1&format=json&order=asc&sort=roomid&timestamp=1484735401", nil)

	fmt.Println(time.Now().Format(time.RFC850))
	auth :="BEARER eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhZG1pbiI6dHJ1ZSwiZXhwIjoxNDg1NDg1Mjk3LCJpYXQiOjE0ODQ4ODA0OTcsInVzZXJuYW1lIjoiYWRtaW4ifQ.owoyaScUhD8e37Cmq9m5vwakg30vmukXpsmeLR9WRoA"
	r.Header.Add("Authorization",auth)
	r.Context().Value(nil)
	w := httptest.NewRecorder()
	handler := beego.NewControllerRegister()
	handler.Add("/api/room", &ctr.RoomController{}, "get:GetRoom")
	handler.ServeHTTP(w, r)

	Convey("Get Room REST API", t, func() {
		fmt.Println(w.Body.String())
		//todo body to json
		So(w.Body.String(), ShouldNotBeBlank)
	})
}

// 测试post room
func TestAddRoom(t *testing.T) {
	r, _ := http.NewRequest("POST", "/api/room?roomname=zhang&stateId=1&dcId=188&floor=1&timestamp=1484735401", nil)

	fmt.Println(time.Now().Format(time.RFC850))
	auth :="BEARER eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhZG1pbiI6dHJ1ZSwiZXhwIjoxNDg1NDg1Mjk3LCJpYXQiOjE0ODQ4ODA0OTcsInVzZXJuYW1lIjoiYWRtaW4ifQ.owoyaScUhD8e37Cmq9m5vwakg30vmukXpsmeLR9WRoA"
	r.Header.Add("Authorization",auth)
	r.Context().Value(nil)
	w := httptest.NewRecorder()
	handler := beego.NewControllerRegister()
	handler.Add("/api/room", &ctr.RoomController{}, "post:AddRoom")
	handler.ServeHTTP(w, r)

	Convey("Post Room REST API", t, func() {
		fmt.Println(w.Body.String())
		//todo body to json
		So(w.Body.String(), ShouldNotBeBlank)
	})
}

// 测试update room
func TestPutRoom(t *testing.T) {
	r, _ := http.NewRequest("PUT", "/api/room?roomId=39&roomName=hjz&timestamp=1484735401", nil)

	fmt.Println(time.Now().Format(time.RFC850))
	auth :="BEARER eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhZG1pbiI6dHJ1ZSwiZXhwIjoxNDg1NDg1Mjk3LCJpYXQiOjE0ODQ4ODA0OTcsInVzZXJuYW1lIjoiYWRtaW4ifQ.owoyaScUhD8e37Cmq9m5vwakg30vmukXpsmeLR9WRoA"
	r.Header.Add("Authorization",auth)
	r.Context().Value(nil)
	w := httptest.NewRecorder()
	handler := beego.NewControllerRegister()
	handler.Add("/api/room", &ctr.RoomController{}, "put:PutRoom")
	handler.ServeHTTP(w, r)

	Convey("Update Room REST API", t, func() {
		fmt.Println(w.Body.String())
		//todo body to json
		So(w.Body.String(), ShouldNotBeBlank)
	})
}

// 测试delete room
func TestDelRoom(t *testing.T) {
	r, _ := http.NewRequest("DELETE", "/api/room?roomid=39&hardDelete=true&timestamp=1484735401", nil)

	fmt.Println(time.Now().Format(time.RFC850))
	auth :="BEARER eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhZG1pbiI6dHJ1ZSwiZXhwIjoxNDg1NDg1Mjk3LCJpYXQiOjE0ODQ4ODA0OTcsInVzZXJuYW1lIjoiYWRtaW4ifQ.owoyaScUhD8e37Cmq9m5vwakg30vmukXpsmeLR9WRoA"
	r.Header.Add("Authorization",auth)
	r.Context().Value(nil)
	w := httptest.NewRecorder()
	handler := beego.NewControllerRegister()
	handler.Add("/api/room", &ctr.RoomController{}, "delete:DelRoom")
	handler.ServeHTTP(w, r)

	Convey("Delete Room REST API", t, func() {
		fmt.Println(w.Body.String())
		//todo body to json
		So(w.Body.String(), ShouldNotBeBlank)
	})
}

// 测试get rack
func TestGetRack(t *testing.T) {
	r, _ := http.NewRequest("GET", "/api/rack?enable=1&format=json&order=asc&sort=rackid&timestamp=1484735401", nil)

	fmt.Println(time.Now().Format(time.RFC850))
	auth :="BEARER eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhZG1pbiI6dHJ1ZSwiZXhwIjoxNDg1NDg1Mjk3LCJpYXQiOjE0ODQ4ODA0OTcsInVzZXJuYW1lIjoiYWRtaW4ifQ.owoyaScUhD8e37Cmq9m5vwakg30vmukXpsmeLR9WRoA"
	r.Header.Add("Authorization",auth)
	r.Context().Value(nil)
	w := httptest.NewRecorder()
	handler := beego.NewControllerRegister()
	handler.Add("/api/rack", &ctr.RackController{}, "get:GetRack")
	handler.ServeHTTP(w, r)

	Convey("Get Rack REST API", t, func() {
		fmt.Println(w.Body.String())
		//todo body to json
		So(w.Body.String(), ShouldNotBeBlank)
	})
}

// 测试post rack
func TestAddRack(t *testing.T) {
	r, _ := http.NewRequest("POST", "/api/rack?rackName=zhang&status=2&room=30&timestamp=1484735401", nil)

	fmt.Println(time.Now().Format(time.RFC850))
	auth :="BEARER eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhZG1pbiI6dHJ1ZSwiZXhwIjoxNDg1NDg1Mjk3LCJpYXQiOjE0ODQ4ODA0OTcsInVzZXJuYW1lIjoiYWRtaW4ifQ.owoyaScUhD8e37Cmq9m5vwakg30vmukXpsmeLR9WRoA"
	r.Header.Add("Authorization",auth)
	r.Context().Value(nil)
	w := httptest.NewRecorder()
	handler := beego.NewControllerRegister()
	handler.Add("/api/rack", &ctr.RackController{}, "post:AddRack")
	handler.ServeHTTP(w, r)

	Convey("Post Rack REST API", t, func() {
		fmt.Println(w.Body.String())
		//todo body to json
		So(w.Body.String(), ShouldNotBeBlank)
	})
}

// 测试update rack
func TestPutRack(t *testing.T) {
	r, _ := http.NewRequest("PUT", "/api/rack?rackid=77&rackName=hjz&timestamp=1484735401", nil)

	fmt.Println(time.Now().Format(time.RFC850))
	auth :="BEARER eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhZG1pbiI6dHJ1ZSwiZXhwIjoxNDg1NDg1Mjk3LCJpYXQiOjE0ODQ4ODA0OTcsInVzZXJuYW1lIjoiYWRtaW4ifQ.owoyaScUhD8e37Cmq9m5vwakg30vmukXpsmeLR9WRoA"
	r.Header.Add("Authorization",auth)
	r.Context().Value(nil)
	w := httptest.NewRecorder()
	handler := beego.NewControllerRegister()
	handler.Add("/api/rack", &ctr.RackController{}, "put:PutRack")
	handler.ServeHTTP(w, r)

	Convey("Update Rack REST API", t, func() {
		fmt.Println(w.Body.String())
		//todo body to json
		So(w.Body.String(), ShouldNotBeBlank)
	})
}

// 测试delete rack
func TestDelRack(t *testing.T) {
	r, _ := http.NewRequest("DELETE", "/api/rack?rackid=77&hardDelete=true&timestamp=1484735401", nil)

	fmt.Println(time.Now().Format(time.RFC850))
	auth :="BEARER eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhZG1pbiI6dHJ1ZSwiZXhwIjoxNDg1NDg1Mjk3LCJpYXQiOjE0ODQ4ODA0OTcsInVzZXJuYW1lIjoiYWRtaW4ifQ.owoyaScUhD8e37Cmq9m5vwakg30vmukXpsmeLR9WRoA"
	r.Header.Add("Authorization",auth)
	r.Context().Value(nil)
	w := httptest.NewRecorder()
	handler := beego.NewControllerRegister()
	handler.Add("/api/rack", &ctr.RackController{}, "delete:DelRack")
	handler.ServeHTTP(w, r)

	Convey("Delete Rack REST API", t, func() {
		fmt.Println(w.Body.String())
		//todo body to json
		So(w.Body.String(), ShouldNotBeBlank)
	})
}

// 测试get bandwidth
func TestGetBandwidth(t *testing.T) {
	r, _ := http.NewRequest("GET", "/api/networkbandwidth?enable=1&format=json&order=asc&sort=id&timestamp=1484735401", nil)

	fmt.Println(time.Now().Format(time.RFC850))
	auth :="BEARER eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhZG1pbiI6dHJ1ZSwiZXhwIjoxNDg1NDg1Mjk3LCJpYXQiOjE0ODQ4ODA0OTcsInVzZXJuYW1lIjoiYWRtaW4ifQ.owoyaScUhD8e37Cmq9m5vwakg30vmukXpsmeLR9WRoA"
	r.Header.Add("Authorization",auth)
	r.Context().Value(nil)
	w := httptest.NewRecorder()
	handler := beego.NewControllerRegister()
	handler.Add("/api/networkbandwidth", &ctr.NetworkbandwidthController{}, "get:GetNetworkbandwidth")
	handler.ServeHTTP(w, r)

	Convey("Get Bandwidth REST API", t, func() {
		fmt.Println(w.Body.String())
		//todo body to json
		So(w.Body.String(), ShouldNotBeBlank)
	})
}

// 测试post bandwidth
func TestAddBandwidth(t *testing.T) {
	r, _ := http.NewRequest("POST", "/api/networkbandwidth?name=han&state=3&room=30&rack=43&isp=1&timestamp=1484735401", nil)

	fmt.Println(time.Now().Format(time.RFC850))
	auth :="BEARER eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhZG1pbiI6dHJ1ZSwiZXhwIjoxNDg1NDg1Mjk3LCJpYXQiOjE0ODQ4ODA0OTcsInVzZXJuYW1lIjoiYWRtaW4ifQ.owoyaScUhD8e37Cmq9m5vwakg30vmukXpsmeLR9WRoA"
	r.Header.Add("Authorization",auth)
	r.Context().Value(nil)
	w := httptest.NewRecorder()
	handler := beego.NewControllerRegister()
	handler.Add("/api/networkbandwidth", &ctr.NetworkbandwidthController{}, "post:AddNetworkbandwidth")
	handler.ServeHTTP(w, r)

	Convey("Post Bandwidth REST API", t, func() {
		fmt.Println(w.Body.String())
		//todo body to json
		So(w.Body.String(), ShouldNotBeBlank)
	})
}

// 测试update bandwidth
func TestPutBandwidth(t *testing.T) {
	r, _ := http.NewRequest("PUT", "/api/networkbandwidth?Id=24&name=hjz&timestamp=1484735401", nil)

	fmt.Println(time.Now().Format(time.RFC850))
	auth :="BEARER eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhZG1pbiI6dHJ1ZSwiZXhwIjoxNDg1NDg1Mjk3LCJpYXQiOjE0ODQ4ODA0OTcsInVzZXJuYW1lIjoiYWRtaW4ifQ.owoyaScUhD8e37Cmq9m5vwakg30vmukXpsmeLR9WRoA"
	r.Header.Add("Authorization",auth)
	r.Context().Value(nil)
	w := httptest.NewRecorder()
	handler := beego.NewControllerRegister()
	handler.Add("/api/networkbandwidth", &ctr.NetworkbandwidthController{}, "put:PutNetworkbandwidth")
	handler.ServeHTTP(w, r)

	Convey("Update Bandwidth REST API", t, func() {
		fmt.Println(w.Body.String())
		//todo body to json
		So(w.Body.String(), ShouldNotBeBlank)
	})
}

// 测试delete bandwidth
func TestDelBandwidth(t *testing.T) {
	r, _ := http.NewRequest("DELETE", "/api/networkbandwidth?Id=24&hardDelete=true&timestamp=1484735401", nil)

	fmt.Println(time.Now().Format(time.RFC850))
	auth :="BEARER eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhZG1pbiI6dHJ1ZSwiZXhwIjoxNDg1NDg1Mjk3LCJpYXQiOjE0ODQ4ODA0OTcsInVzZXJuYW1lIjoiYWRtaW4ifQ.owoyaScUhD8e37Cmq9m5vwakg30vmukXpsmeLR9WRoA"
	r.Header.Add("Authorization",auth)
	r.Context().Value(nil)
	w := httptest.NewRecorder()
	handler := beego.NewControllerRegister()
	handler.Add("/api/networkbandwidth", &ctr.NetworkbandwidthController{}, "delete:DelNetworkbandwidth")
	handler.ServeHTTP(w, r)

	Convey("Delete Bandwidth REST API", t, func() {
		fmt.Println(w.Body.String())
		//todo body to json
		So(w.Body.String(), ShouldNotBeBlank)
	})
}

// 测试get hardware
func TestGetHardware(t *testing.T) {
	r, _ := http.NewRequest("GET", "/api/hardware?enable=1&format=json&order=asc&sort=id&timestamp=1484735401", nil)

	fmt.Println(time.Now().Format(time.RFC850))
	auth :="BEARER eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhZG1pbiI6dHJ1ZSwiZXhwIjoxNDg1NDg1Mjk3LCJpYXQiOjE0ODQ4ODA0OTcsInVzZXJuYW1lIjoiYWRtaW4ifQ.owoyaScUhD8e37Cmq9m5vwakg30vmukXpsmeLR9WRoA"
	r.Header.Add("Authorization",auth)
	r.Context().Value(nil)
	w := httptest.NewRecorder()
	handler := beego.NewControllerRegister()
	handler.Add("/api/hardware", &ctr.HardwareController{}, "get:GetHardware")
	handler.ServeHTTP(w, r)

	Convey("Get Hardware REST API", t, func() {
		fmt.Println(w.Body.String())
		//todo body to json
		So(w.Body.String(), ShouldNotBeBlank)
	})
}

// 测试post hardware
func TestAddHardware(t *testing.T) {
	r, _ := http.NewRequest("POST", "/api/hardware?hardwareName=han&state=2&hardwareType=2&rack=43&timestamp=1484735401", nil)

	fmt.Println(time.Now().Format(time.RFC850))
	auth :="BEARER eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhZG1pbiI6dHJ1ZSwiZXhwIjoxNDg1NDg1Mjk3LCJpYXQiOjE0ODQ4ODA0OTcsInVzZXJuYW1lIjoiYWRtaW4ifQ.owoyaScUhD8e37Cmq9m5vwakg30vmukXpsmeLR9WRoA"
	r.Header.Add("Authorization",auth)
	r.Context().Value(nil)
	w := httptest.NewRecorder()
	handler := beego.NewControllerRegister()
	handler.Add("/api/hardware", &ctr.HardwareController{}, "post:AddHardware")
	handler.ServeHTTP(w, r)

	Convey("Post Hardware REST API", t, func() {
		fmt.Println(w.Body.String())
		//todo body to json
		So(w.Body.String(), ShouldNotBeBlank)
	})
}

// 测试update hardware
func TestPutHardware(t *testing.T) {
	r, _ := http.NewRequest("PUT", "/api/hardware?Id=34&hardwareName=hjz&timestamp=1484735401", nil)

	fmt.Println(time.Now().Format(time.RFC850))
	auth :="BEARER eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhZG1pbiI6dHJ1ZSwiZXhwIjoxNDg1NDg1Mjk3LCJpYXQiOjE0ODQ4ODA0OTcsInVzZXJuYW1lIjoiYWRtaW4ifQ.owoyaScUhD8e37Cmq9m5vwakg30vmukXpsmeLR9WRoA"
	r.Header.Add("Authorization",auth)
	r.Context().Value(nil)
	w := httptest.NewRecorder()
	handler := beego.NewControllerRegister()
	handler.Add("/api/hardware", &ctr.HardwareController{}, "put:PutHardware")
	handler.ServeHTTP(w, r)

	Convey("Update Hardware REST API", t, func() {
		fmt.Println(w.Body.String())
		//todo body to json
		So(w.Body.String(), ShouldNotBeBlank)
	})
}

// 测试delete hardware
func TestDelHardware(t *testing.T) {
	r, _ := http.NewRequest("DELETE", "/api/hardware?Id=34&hardDelete=true&timestamp=1484735401", nil)

	fmt.Println(time.Now().Format(time.RFC850))
	auth :="BEARER eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhZG1pbiI6dHJ1ZSwiZXhwIjoxNDg1NDg1Mjk3LCJpYXQiOjE0ODQ4ODA0OTcsInVzZXJuYW1lIjoiYWRtaW4ifQ.owoyaScUhD8e37Cmq9m5vwakg30vmukXpsmeLR9WRoA"
	r.Header.Add("Authorization",auth)
	r.Context().Value(nil)
	w := httptest.NewRecorder()
	handler := beego.NewControllerRegister()
	handler.Add("/api/hardware", &ctr.HardwareController{}, "delete:DelHardware")
	handler.ServeHTTP(w, r)

	Convey("Delete Hardware REST API", t, func() {
		fmt.Println(w.Body.String())
		//todo body to json
		So(w.Body.String(), ShouldNotBeBlank)
	})
}

// 测试get server
func TestGetServer(t *testing.T) {
	r, _ := http.NewRequest("GET", "/api/server?enable=1&format=json&order=asc&sort=serverid&timestamp=1484735401", nil)

	fmt.Println(time.Now().Format(time.RFC850))
	auth :="BEARER eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhZG1pbiI6dHJ1ZSwiZXhwIjoxNDg1NDg1Mjk3LCJpYXQiOjE0ODQ4ODA0OTcsInVzZXJuYW1lIjoiYWRtaW4ifQ.owoyaScUhD8e37Cmq9m5vwakg30vmukXpsmeLR9WRoA"
	r.Header.Add("Authorization",auth)
	r.Context().Value(nil)
	w := httptest.NewRecorder()
	handler := beego.NewControllerRegister()
	handler.Add("/api/server", &ctr.ServerController{}, "get:GetServer")
	handler.ServeHTTP(w, r)

	Convey("Get Server REST API", t, func() {
		fmt.Println(w.Body.String())
		//todo body to json
		So(w.Body.String(), ShouldNotBeBlank)
	})
}

// 测试post server
func TestAddServer(t *testing.T) {
	r, _ := http.NewRequest("POST", "/api/server?sn=hanjiuhou&state=1&cpu=1&host=1&app=35&timestamp=1484735401", nil)

	fmt.Println(time.Now().Format(time.RFC850))
	auth :="BEARER eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhZG1pbiI6dHJ1ZSwiZXhwIjoxNDg1NDg1Mjk3LCJpYXQiOjE0ODQ4ODA0OTcsInVzZXJuYW1lIjoiYWRtaW4ifQ.owoyaScUhD8e37Cmq9m5vwakg30vmukXpsmeLR9WRoA"
	r.Header.Add("Authorization",auth)
	r.Context().Value(nil)
	w := httptest.NewRecorder()
	handler := beego.NewControllerRegister()
	handler.Add("/api/server", &ctr.ServerController{}, "post:AddServer")
	handler.ServeHTTP(w, r)

	Convey("Post Server REST API", t, func() {
		fmt.Println(w.Body.String())
		//todo body to json
		So(w.Body.String(), ShouldNotBeBlank)
	})
}

// 测试update server
func TestPutServer(t *testing.T) {
	r, _ := http.NewRequest("PUT", "/api/server?serverid=5&sn=hjz&timestamp=1484735401", nil)

	fmt.Println(time.Now().Format(time.RFC850))
	auth :="BEARER eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhZG1pbiI6dHJ1ZSwiZXhwIjoxNDg1NDg1Mjk3LCJpYXQiOjE0ODQ4ODA0OTcsInVzZXJuYW1lIjoiYWRtaW4ifQ.owoyaScUhD8e37Cmq9m5vwakg30vmukXpsmeLR9WRoA"
	r.Header.Add("Authorization",auth)
	r.Context().Value(nil)
	w := httptest.NewRecorder()
	handler := beego.NewControllerRegister()
	handler.Add("/api/server", &ctr.ServerController{}, "put:PutServer")
	handler.ServeHTTP(w, r)

	Convey("Update Server REST API", t, func() {
		fmt.Println(w.Body.String())
		//todo body to json
		So(w.Body.String(), ShouldNotBeBlank)
	})
}

// 测试delete server
func TestDelServer(t *testing.T) {
	r, _ := http.NewRequest("DELETE", "/api/server?serverid=5&hardDelete=true&timestamp=1484735401", nil)

	fmt.Println(time.Now().Format(time.RFC850))
	auth :="BEARER eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhZG1pbiI6dHJ1ZSwiZXhwIjoxNDg1NDg1Mjk3LCJpYXQiOjE0ODQ4ODA0OTcsInVzZXJuYW1lIjoiYWRtaW4ifQ.owoyaScUhD8e37Cmq9m5vwakg30vmukXpsmeLR9WRoA"
	r.Header.Add("Authorization",auth)
	r.Context().Value(nil)
	w := httptest.NewRecorder()
	handler := beego.NewControllerRegister()
	handler.Add("/api/server", &ctr.ServerController{}, "delete:DelServer")
	handler.ServeHTTP(w, r)

	Convey("Delete Server REST API", t, func() {
		fmt.Println(w.Body.String())
		//todo body to json
		So(w.Body.String(), ShouldNotBeBlank)
	})
}

// 测试get ip
func TestGetNetworkip(t *testing.T) {
	r, _ := http.NewRequest("GET", "/api/networkip?enable=1&format=json&order=asc&sort=networkipid&timestamp=1484735401", nil)

	fmt.Println(time.Now().Format(time.RFC850))
	auth :="BEARER eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhZG1pbiI6dHJ1ZSwiZXhwIjoxNDg1NDg1Mjk3LCJpYXQiOjE0ODQ4ODA0OTcsInVzZXJuYW1lIjoiYWRtaW4ifQ.owoyaScUhD8e37Cmq9m5vwakg30vmukXpsmeLR9WRoA"
	r.Header.Add("Authorization",auth)
	r.Context().Value(nil)
	w := httptest.NewRecorder()
	handler := beego.NewControllerRegister()
	handler.Add("/api/networkip", &ctr.IpController{}, "get:GetNetworkip")
	handler.ServeHTTP(w, r)

	Convey("Get Networkip REST API", t, func() {
		fmt.Println(w.Body.String())
		//todo body to json
		So(w.Body.String(), ShouldNotBeBlank)
	})
}

// 测试post ip
func TestAddNetworkip(t *testing.T) {
	r, _ := http.NewRequest("POST", "/api/networkip?ipaddress=10.0.2.11&appId=35&hostId=2&roomId=30&timestamp=1484735401", nil)

	fmt.Println(time.Now().Format(time.RFC850))
	auth :="BEARER eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhZG1pbiI6dHJ1ZSwiZXhwIjoxNDg1NDg1Mjk3LCJpYXQiOjE0ODQ4ODA0OTcsInVzZXJuYW1lIjoiYWRtaW4ifQ.owoyaScUhD8e37Cmq9m5vwakg30vmukXpsmeLR9WRoA"
	r.Header.Add("Authorization",auth)
	r.Context().Value(nil)
	w := httptest.NewRecorder()
	handler := beego.NewControllerRegister()
	handler.Add("/api/networkip", &ctr.IpController{}, "post:AddNetworkip")
	handler.ServeHTTP(w, r)

	Convey("Post Networkip REST API", t, func() {
		fmt.Println(w.Body.String())
		//todo body to json
		So(w.Body.String(), ShouldNotBeBlank)
	})
}

// 测试update ip
func TestPutNetworkip(t *testing.T) {
	r, _ := http.NewRequest("PUT", "/api/networkip?networkipid=15&ipaddress=10.0.2.24&timestamp=1484735401", nil)

	fmt.Println(time.Now().Format(time.RFC850))
	auth :="BEARER eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhZG1pbiI6dHJ1ZSwiZXhwIjoxNDg1NDg1Mjk3LCJpYXQiOjE0ODQ4ODA0OTcsInVzZXJuYW1lIjoiYWRtaW4ifQ.owoyaScUhD8e37Cmq9m5vwakg30vmukXpsmeLR9WRoA"
	r.Header.Add("Authorization",auth)
	r.Context().Value(nil)
	w := httptest.NewRecorder()
	handler := beego.NewControllerRegister()
	handler.Add("/api/networkip", &ctr.IpController{}, "put:PutNetworkip")
	handler.ServeHTTP(w, r)

	Convey("Update Networkip REST API", t, func() {
		fmt.Println(w.Body.String())
		//todo body to json
		So(w.Body.String(), ShouldNotBeBlank)
	})
}

// 测试delete ip
func TestDelNetworkip(t *testing.T) {
	r, _ := http.NewRequest("DELETE", "/api/networkip?Networkipid=15&hardDelete=true&timestamp=1484735401", nil)

	fmt.Println(time.Now().Format(time.RFC850))
	auth :="BEARER eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhZG1pbiI6dHJ1ZSwiZXhwIjoxNDg1NDg1Mjk3LCJpYXQiOjE0ODQ4ODA0OTcsInVzZXJuYW1lIjoiYWRtaW4ifQ.owoyaScUhD8e37Cmq9m5vwakg30vmukXpsmeLR9WRoA"
	r.Header.Add("Authorization",auth)
	r.Context().Value(nil)
	w := httptest.NewRecorder()
	handler := beego.NewControllerRegister()
	handler.Add("/api/networkip", &ctr.IpController{}, "delete:DelNetworkip")
	handler.ServeHTTP(w, r)

	Convey("Delete Networkip REST API", t, func() {
		fmt.Println(w.Body.String())
		//todo body to json
		So(w.Body.String(), ShouldNotBeBlank)
	})
}

// 测试get domain
func TestGetDnspoddomain(t *testing.T) {
	r, _ := http.NewRequest("GET", "/api/dnspoddomain?enable=1&format=json&order=asc&sort=id&timestamp=1484735401", nil)

	fmt.Println(time.Now().Format(time.RFC850))
	auth :="BEARER eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhZG1pbiI6dHJ1ZSwiZXhwIjoxNDg1NDg1Mjk3LCJpYXQiOjE0ODQ4ODA0OTcsInVzZXJuYW1lIjoiYWRtaW4ifQ.owoyaScUhD8e37Cmq9m5vwakg30vmukXpsmeLR9WRoA"
	r.Header.Add("Authorization",auth)
	r.Context().Value(nil)
	w := httptest.NewRecorder()
	handler := beego.NewControllerRegister()
	handler.Add("/api/dnspoddomain", &ctr.DnspoddomainController{}, "get:GetDnspoddomain")
	handler.ServeHTTP(w, r)

	Convey("Get Dnspoddomain REST API", t, func() {
		fmt.Println(w.Body.String())
		//todo body to json
		So(w.Body.String(), ShouldNotBeBlank)
	})
}

// 测试post domain
func TestAddDnspoddomain(t *testing.T) {
	r, _ := http.NewRequest("POST", "/api/dnspoddomain?name=hanjiuzhou&stateId=1&extStatus=1&timestamp=1484735401", nil)

	fmt.Println(time.Now().Format(time.RFC850))
	auth :="BEARER eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhZG1pbiI6dHJ1ZSwiZXhwIjoxNDg1NDg1Mjk3LCJpYXQiOjE0ODQ4ODA0OTcsInVzZXJuYW1lIjoiYWRtaW4ifQ.owoyaScUhD8e37Cmq9m5vwakg30vmukXpsmeLR9WRoA"
	r.Header.Add("Authorization",auth)
	r.Context().Value(nil)
	w := httptest.NewRecorder()
	handler := beego.NewControllerRegister()
	handler.Add("/api/dnspoddomain", &ctr.DnspoddomainController{}, "post:AddDnspoddomain")
	handler.ServeHTTP(w, r)

	Convey("Post Dnspoddomain REST API", t, func() {
		fmt.Println(w.Body.String())
		//todo body to json
		So(w.Body.String(), ShouldNotBeBlank)
	})
}

// 测试update domain
func TestPutDnspoddomain(t *testing.T) {
	r, _ := http.NewRequest("PUT", "/api/dnspoddomain?id=17&name=hanjiuzhou.com&timestamp=1484735401", nil)

	fmt.Println(time.Now().Format(time.RFC850))
	auth :="BEARER eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhZG1pbiI6dHJ1ZSwiZXhwIjoxNDg1NDg1Mjk3LCJpYXQiOjE0ODQ4ODA0OTcsInVzZXJuYW1lIjoiYWRtaW4ifQ.owoyaScUhD8e37Cmq9m5vwakg30vmukXpsmeLR9WRoA"
	r.Header.Add("Authorization",auth)
	r.Context().Value(nil)
	w := httptest.NewRecorder()
	handler := beego.NewControllerRegister()
	handler.Add("/api/dnspoddomain", &ctr.DnspoddomainController{}, "put:PutDnspoddomain")
	handler.ServeHTTP(w, r)

	Convey("Update Dnspoddomain REST API", t, func() {
		fmt.Println(w.Body.String())
		//todo body to json
		So(w.Body.String(), ShouldNotBeBlank)
	})
}

// 测试delete domain
func TestDelDnspoddomain(t *testing.T) {
	r, _ := http.NewRequest("DELETE", "/api/dnspoddomain?id=17&hardDelete=true&timestamp=1484735401", nil)

	fmt.Println(time.Now().Format(time.RFC850))
	auth :="BEARER eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhZG1pbiI6dHJ1ZSwiZXhwIjoxNDg1NDg1Mjk3LCJpYXQiOjE0ODQ4ODA0OTcsInVzZXJuYW1lIjoiYWRtaW4ifQ.owoyaScUhD8e37Cmq9m5vwakg30vmukXpsmeLR9WRoA"
	r.Header.Add("Authorization",auth)
	r.Context().Value(nil)
	w := httptest.NewRecorder()
	handler := beego.NewControllerRegister()
	handler.Add("/api/dnspoddomain", &ctr.DnspoddomainController{}, "delete:DelDnspoddomain")
	handler.ServeHTTP(w, r)

	Convey("Delete Dnspoddomain REST API", t, func() {
		fmt.Println(w.Body.String())
		//todo body to json
		So(w.Body.String(), ShouldNotBeBlank)
	})
}

// 测试get supplier
func TestGetSupplier(t *testing.T) {
	r, _ := http.NewRequest("GET", "/api/supplier?enable=1&format=json&order=asc&sort=id&timestamp=1484735401", nil)

	fmt.Println(time.Now().Format(time.RFC850))
	auth :="BEARER eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhZG1pbiI6dHJ1ZSwiZXhwIjoxNDg1NDg1Mjk3LCJpYXQiOjE0ODQ4ODA0OTcsInVzZXJuYW1lIjoiYWRtaW4ifQ.owoyaScUhD8e37Cmq9m5vwakg30vmukXpsmeLR9WRoA"
	r.Header.Add("Authorization",auth)
	r.Context().Value(nil)
	w := httptest.NewRecorder()
	handler := beego.NewControllerRegister()
	handler.Add("/api/supplier", &ctr.SupplierController{}, "get:GetSupplier")
	handler.ServeHTTP(w, r)

	Convey("Get Supplier REST API", t, func() {
		fmt.Println(w.Body.String())
		//todo body to json
		So(w.Body.String(), ShouldNotBeBlank)
	})
}

// 测试post supplier
func TestAddSupplier(t *testing.T) {
	r, _ := http.NewRequest("POST", "/api/supplier?supplier=hanjiuzhou&timestamp=1484735401", nil)

	fmt.Println(time.Now().Format(time.RFC850))
	auth :="BEARER eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhZG1pbiI6dHJ1ZSwiZXhwIjoxNDg1NDg1Mjk3LCJpYXQiOjE0ODQ4ODA0OTcsInVzZXJuYW1lIjoiYWRtaW4ifQ.owoyaScUhD8e37Cmq9m5vwakg30vmukXpsmeLR9WRoA"
	r.Header.Add("Authorization",auth)
	r.Context().Value(nil)
	w := httptest.NewRecorder()
	handler := beego.NewControllerRegister()
	handler.Add("/api/supplier", &ctr.SupplierController{}, "post:AddSupplier")
	handler.ServeHTTP(w, r)

	Convey("Post Supplier REST API", t, func() {
		fmt.Println(w.Body.String())
		//todo body to json
		So(w.Body.String(), ShouldNotBeBlank)
	})
}

// 测试update supplier
func TestPutSupplier(t *testing.T) {
	r, _ := http.NewRequest("PUT", "/api/supplier?supplierid=25&supplier=han&timestamp=1484735401", nil)

	fmt.Println(time.Now().Format(time.RFC850))
	auth :="BEARER eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhZG1pbiI6dHJ1ZSwiZXhwIjoxNDg1NDg1Mjk3LCJpYXQiOjE0ODQ4ODA0OTcsInVzZXJuYW1lIjoiYWRtaW4ifQ.owoyaScUhD8e37Cmq9m5vwakg30vmukXpsmeLR9WRoA"
	r.Header.Add("Authorization",auth)
	r.Context().Value(nil)
	w := httptest.NewRecorder()
	handler := beego.NewControllerRegister()
	handler.Add("/api/supplier", &ctr.SupplierController{}, "put:PutSupplier")
	handler.ServeHTTP(w, r)

	Convey("Update Supplier REST API", t, func() {
		fmt.Println(w.Body.String())
		//todo body to json
		So(w.Body.String(), ShouldNotBeBlank)
	})
}

// 测试delete supplier
func TestDelSupplier(t *testing.T) {
	r, _ := http.NewRequest("DELETE", "/api/supplier?supplierid=25&hardDelete=true&timestamp=1484735401", nil)

	fmt.Println(time.Now().Format(time.RFC850))
	auth :="BEARER eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhZG1pbiI6dHJ1ZSwiZXhwIjoxNDg1NDg1Mjk3LCJpYXQiOjE0ODQ4ODA0OTcsInVzZXJuYW1lIjoiYWRtaW4ifQ.owoyaScUhD8e37Cmq9m5vwakg30vmukXpsmeLR9WRoA"
	r.Header.Add("Authorization",auth)
	r.Context().Value(nil)
	w := httptest.NewRecorder()
	handler := beego.NewControllerRegister()
	handler.Add("/api/supplier", &ctr.SupplierController{}, "delete:DelSupplier")
	handler.ServeHTTP(w, r)

	Convey("Delete Supplier REST API", t, func() {
		fmt.Println(w.Body.String())
		//todo body to json
		So(w.Body.String(), ShouldNotBeBlank)
	})
}

// 测试get app
func TestGetApp(t *testing.T) {
	r, _ := http.NewRequest("GET", "/api/app?enable=1&format=json&order=asc&sort=appid&timestamp=1484735401", nil)

	fmt.Println(time.Now().Format(time.RFC850))
	auth :="BEARER eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhZG1pbiI6dHJ1ZSwiZXhwIjoxNDg1NDg1Mjk3LCJpYXQiOjE0ODQ4ODA0OTcsInVzZXJuYW1lIjoiYWRtaW4ifQ.owoyaScUhD8e37Cmq9m5vwakg30vmukXpsmeLR9WRoA"
	r.Header.Add("Authorization",auth)
	r.Context().Value(nil)
	w := httptest.NewRecorder()
	handler := beego.NewControllerRegister()
	handler.Add("/api/app", &ctr.AppController{}, "get:GetApp")
	handler.ServeHTTP(w, r)

	Convey("Get App REST API", t, func() {
		fmt.Println(w.Body.String())
		//todo body to json
		So(w.Body.String(), ShouldNotBeBlank)
	})
}

// 测试post app
func TestAddApp(t *testing.T) {
	r, _ := http.NewRequest("POST", "/api/app?appName=hanjiuzhou&appLevel=2&timestamp=1484735401", nil)

	fmt.Println(time.Now().Format(time.RFC850))
	auth :="BEARER eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhZG1pbiI6dHJ1ZSwiZXhwIjoxNDg1NDg1Mjk3LCJpYXQiOjE0ODQ4ODA0OTcsInVzZXJuYW1lIjoiYWRtaW4ifQ.owoyaScUhD8e37Cmq9m5vwakg30vmukXpsmeLR9WRoA"
	r.Header.Add("Authorization",auth)
	r.Context().Value(nil)
	w := httptest.NewRecorder()
	handler := beego.NewControllerRegister()
	handler.Add("/api/app", &ctr.AppController{}, "post:AddApp")
	handler.ServeHTTP(w, r)

	Convey("Post App REST API", t, func() {
		fmt.Println(w.Body.String())
		//todo body to json
		So(w.Body.String(), ShouldNotBeBlank)
	})
}

// 测试update app
func TestPutApp(t *testing.T) {
	r, _ := http.NewRequest("PUT", "/api/app?Id=47&appName=han&timestamp=1484735401", nil)

	fmt.Println(time.Now().Format(time.RFC850))
	auth :="BEARER eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhZG1pbiI6dHJ1ZSwiZXhwIjoxNDg1NDg1Mjk3LCJpYXQiOjE0ODQ4ODA0OTcsInVzZXJuYW1lIjoiYWRtaW4ifQ.owoyaScUhD8e37Cmq9m5vwakg30vmukXpsmeLR9WRoA"
	r.Header.Add("Authorization",auth)
	r.Context().Value(nil)
	w := httptest.NewRecorder()
	handler := beego.NewControllerRegister()
	handler.Add("/api/app", &ctr.AppController{}, "put:PutApp")
	handler.ServeHTTP(w, r)

	Convey("Update App REST API", t, func() {
		fmt.Println(w.Body.String())
		//todo body to json
		So(w.Body.String(), ShouldNotBeBlank)
	})
}

// 测试delete app
func TestDelApp(t *testing.T) {
	r, _ := http.NewRequest("DELETE", "/api/app?appid=47&hardDelete=true&timestamp=1484735401", nil)

	fmt.Println(time.Now().Format(time.RFC850))
	auth :="BEARER eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhZG1pbiI6dHJ1ZSwiZXhwIjoxNDg1NDg1Mjk3LCJpYXQiOjE0ODQ4ODA0OTcsInVzZXJuYW1lIjoiYWRtaW4ifQ.owoyaScUhD8e37Cmq9m5vwakg30vmukXpsmeLR9WRoA"
	r.Header.Add("Authorization",auth)
	r.Context().Value(nil)
	w := httptest.NewRecorder()
	handler := beego.NewControllerRegister()
	handler.Add("/api/app", &ctr.AppController{}, "delete:DelApp")
	handler.ServeHTTP(w, r)

	Convey("Delete App REST API", t, func() {
		fmt.Println(w.Body.String())
		//todo body to json
		So(w.Body.String(), ShouldNotBeBlank)
	})
}

// 测试get aws
func TestGetAws(t *testing.T) {
	r, _ := http.NewRequest("GET", "/api/aws?enable=1&format=json&order=asc&sort=id&timestamp=1484735401", nil)

	fmt.Println(time.Now().Format(time.RFC850))
	auth :="BEARER eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhZG1pbiI6dHJ1ZSwiZXhwIjoxNDg1NDg1Mjk3LCJpYXQiOjE0ODQ4ODA0OTcsInVzZXJuYW1lIjoiYWRtaW4ifQ.owoyaScUhD8e37Cmq9m5vwakg30vmukXpsmeLR9WRoA"
	r.Header.Add("Authorization",auth)
	r.Context().Value(nil)
	w := httptest.NewRecorder()
	handler := beego.NewControllerRegister()
	handler.Add("/api/aws", &ctr.AwsController{}, "get:GetVM")
	handler.ServeHTTP(w, r)

	Convey("Get Aws REST API", t, func() {
		fmt.Println(w.Body.String())
		//todo body to json
		So(w.Body.String(), ShouldNotBeBlank)
	})
}

// 测试post aws
func TestAddAws(t *testing.T) {
	r, _ := http.NewRequest("POST", "/api/aws?architecture=han&timestamp=1484735401", nil)

	fmt.Println(time.Now().Format(time.RFC850))
	auth :="BEARER eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhZG1pbiI6dHJ1ZSwiZXhwIjoxNDg1NDg1Mjk3LCJpYXQiOjE0ODQ4ODA0OTcsInVzZXJuYW1lIjoiYWRtaW4ifQ.owoyaScUhD8e37Cmq9m5vwakg30vmukXpsmeLR9WRoA"
	r.Header.Add("Authorization",auth)
	r.Context().Value(nil)
	w := httptest.NewRecorder()
	handler := beego.NewControllerRegister()
	handler.Add("/api/aws", &ctr.AwsController{}, "post:AddAws")
	handler.ServeHTTP(w, r)

	Convey("Post Aws REST API", t, func() {
		fmt.Println(w.Body.String())
		//todo body to json
		So(w.Body.String(), ShouldNotBeBlank)
	})
}

// 测试update aws
func TestPutAws(t *testing.T) {
	r, _ := http.NewRequest("PUT", "/api/aws?editawsid=2&editarchitecture=hanjiuzhou&timestamp=1484735401", nil)

	fmt.Println(time.Now().Format(time.RFC850))
	auth :="BEARER eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhZG1pbiI6dHJ1ZSwiZXhwIjoxNDg1NDg1Mjk3LCJpYXQiOjE0ODQ4ODA0OTcsInVzZXJuYW1lIjoiYWRtaW4ifQ.owoyaScUhD8e37Cmq9m5vwakg30vmukXpsmeLR9WRoA"
	r.Header.Add("Authorization",auth)
	r.Context().Value(nil)
	w := httptest.NewRecorder()
	handler := beego.NewControllerRegister()
	handler.Add("/api/aws", &ctr.AwsController{}, "put:PutAws")
	handler.ServeHTTP(w, r)

	Convey("Update Aws REST API", t, func() {
		fmt.Println(w.Body.String())
		//todo body to json
		So(w.Body.String(), ShouldNotBeBlank)
	})
}

// 测试delete aws
func TestDelAws(t *testing.T) {
	r, _ := http.NewRequest("DELETE", "/api/aws?awsid=2&hardDelete=true&timestamp=1484735401", nil)

	fmt.Println(time.Now().Format(time.RFC850))
	auth :="BEARER eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhZG1pbiI6dHJ1ZSwiZXhwIjoxNDg1NDg1Mjk3LCJpYXQiOjE0ODQ4ODA0OTcsInVzZXJuYW1lIjoiYWRtaW4ifQ.owoyaScUhD8e37Cmq9m5vwakg30vmukXpsmeLR9WRoA"
	r.Header.Add("Authorization",auth)
	r.Context().Value(nil)
	w := httptest.NewRecorder()
	handler := beego.NewControllerRegister()
	handler.Add("/api/aws", &ctr.AwsController{}, "delete:DelAws")
	handler.ServeHTTP(w, r)

	Convey("Delete Aws REST API", t, func() {
		fmt.Println(w.Body.String())
		//todo body to json
		So(w.Body.String(), ShouldNotBeBlank)
	})
}

// 测试get aliyun
func TestGetAliyun(t *testing.T) {
	r, _ := http.NewRequest("GET", "/api/aliyun?enable=1&format=json&order=asc&sort=id&timestamp=1484735401", nil)

	fmt.Println(time.Now().Format(time.RFC850))
	auth :="BEARER eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhZG1pbiI6dHJ1ZSwiZXhwIjoxNDg1NDg1Mjk3LCJpYXQiOjE0ODQ4ODA0OTcsInVzZXJuYW1lIjoiYWRtaW4ifQ.owoyaScUhD8e37Cmq9m5vwakg30vmukXpsmeLR9WRoA"
	r.Header.Add("Authorization",auth)
	r.Context().Value(nil)
	w := httptest.NewRecorder()
	handler := beego.NewControllerRegister()
	handler.Add("/api/aliyun", &ctr.AliyunController{}, "get:GetVM")
	handler.ServeHTTP(w, r)

	Convey("Get Aliyun REST API", t, func() {
		fmt.Println(w.Body.String())
		//todo body to json
		So(w.Body.String(), ShouldNotBeBlank)
	})
}

// 测试post aliyun
func TestAddAliyun(t *testing.T) {
	r, _ := http.NewRequest("POST", "/api/aliyun?instancename=hanjiuzhou&timestamp=1484735401", nil)

	fmt.Println(time.Now().Format(time.RFC850))
	auth :="BEARER eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhZG1pbiI6dHJ1ZSwiZXhwIjoxNDg1NDg1Mjk3LCJpYXQiOjE0ODQ4ODA0OTcsInVzZXJuYW1lIjoiYWRtaW4ifQ.owoyaScUhD8e37Cmq9m5vwakg30vmukXpsmeLR9WRoA"
	r.Header.Add("Authorization",auth)
	r.Context().Value(nil)
	w := httptest.NewRecorder()
	handler := beego.NewControllerRegister()
	handler.Add("/api/aliyun", &ctr.AliyunController{}, "post:AddAliyun")
	handler.ServeHTTP(w, r)

	Convey("Post Aliyun REST API", t, func() {
		fmt.Println(w.Body.String())
		//todo body to json
		So(w.Body.String(), ShouldNotBeBlank)
	})
}

// 测试update aliyun
func TestPutAliyun(t *testing.T) {
	r, _ := http.NewRequest("PUT", "/api/aliyun?editAliyunId=11&editinstancename=han&timestamp=1484735401", nil)

	fmt.Println(time.Now().Format(time.RFC850))
	auth :="BEARER eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhZG1pbiI6dHJ1ZSwiZXhwIjoxNDg1NDg1Mjk3LCJpYXQiOjE0ODQ4ODA0OTcsInVzZXJuYW1lIjoiYWRtaW4ifQ.owoyaScUhD8e37Cmq9m5vwakg30vmukXpsmeLR9WRoA"
	r.Header.Add("Authorization",auth)
	r.Context().Value(nil)
	w := httptest.NewRecorder()
	handler := beego.NewControllerRegister()
	handler.Add("/api/aliyun", &ctr.AliyunController{}, "put:PutAliyun")
	handler.ServeHTTP(w, r)

	Convey("Update Aliyun REST API", t, func() {
		fmt.Println(w.Body.String())
		//todo body to json
		So(w.Body.String(), ShouldNotBeBlank)
	})
}

// 测试delete aliyun
func TestDelAliyun(t *testing.T) {
	r, _ := http.NewRequest("DELETE", "/api/aliyun?aliyunid=11&hardDelete=true&timestamp=1484735401", nil)

	fmt.Println(time.Now().Format(time.RFC850))
	auth :="BEARER eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhZG1pbiI6dHJ1ZSwiZXhwIjoxNDg1NDg1Mjk3LCJpYXQiOjE0ODQ4ODA0OTcsInVzZXJuYW1lIjoiYWRtaW4ifQ.owoyaScUhD8e37Cmq9m5vwakg30vmukXpsmeLR9WRoA"
	r.Header.Add("Authorization",auth)
	r.Context().Value(nil)
	w := httptest.NewRecorder()
	handler := beego.NewControllerRegister()
	handler.Add("/api/aliyun", &ctr.AliyunController{}, "delete:DelAliyun")
	handler.ServeHTTP(w, r)

	Convey("Delete Aliyun REST API", t, func() {
		fmt.Println(w.Body.String())
		//todo body to json
		So(w.Body.String(), ShouldNotBeBlank)
	})
}

// 测试get vcenter
func TestGetVcenter(t *testing.T) {
	r, _ := http.NewRequest("GET", "/api/vcenter?enable=1&format=json&order=asc&sort=vcenter_id&timestamp=1484735401", nil)

	fmt.Println(time.Now().Format(time.RFC850))
	auth :="BEARER eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhZG1pbiI6dHJ1ZSwiZXhwIjoxNDg1NDg1Mjk3LCJpYXQiOjE0ODQ4ODA0OTcsInVzZXJuYW1lIjoiYWRtaW4ifQ.owoyaScUhD8e37Cmq9m5vwakg30vmukXpsmeLR9WRoA"
	r.Header.Add("Authorization",auth)
	r.Context().Value(nil)
	w := httptest.NewRecorder()
	handler := beego.NewControllerRegister()
	handler.Add("/api/vcenter", &ctr.VcenterController{}, "get:GetVM")
	handler.ServeHTTP(w, r)

	Convey("Get Vcenter REST API", t, func() {
		fmt.Println(w.Body.String())
		//todo body to json
		So(w.Body.String(), ShouldNotBeBlank)
	})
}

// 测试post vcenter
func TestAddVcenter(t *testing.T) {
	r, _ := http.NewRequest("POST", "/api/vcenter?instancename=hanjiuzhou&timestamp=1484735401", nil)

	fmt.Println(time.Now().Format(time.RFC850))
	auth :="BEARER eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhZG1pbiI6dHJ1ZSwiZXhwIjoxNDg1NDg1Mjk3LCJpYXQiOjE0ODQ4ODA0OTcsInVzZXJuYW1lIjoiYWRtaW4ifQ.owoyaScUhD8e37Cmq9m5vwakg30vmukXpsmeLR9WRoA"
	r.Header.Add("Authorization",auth)
	r.Context().Value(nil)
	w := httptest.NewRecorder()
	handler := beego.NewControllerRegister()
	handler.Add("/api/vcenter", &ctr.VcenterController{}, "post:AddVcenter")
	handler.ServeHTTP(w, r)

	Convey("Post Vcenter REST API", t, func() {
		fmt.Println(w.Body.String())
		//todo body to json
		So(w.Body.String(), ShouldNotBeBlank)
	})
}

// 测试update vcenter
func TestPutVcenter(t *testing.T) {
	r, _ := http.NewRequest("PUT", "/api/vcenter?editVcenterId=2823&editinstancename=han&timestamp=1484735401", nil)

	fmt.Println(time.Now().Format(time.RFC850))
	auth :="BEARER eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhZG1pbiI6dHJ1ZSwiZXhwIjoxNDg1NDg1Mjk3LCJpYXQiOjE0ODQ4ODA0OTcsInVzZXJuYW1lIjoiYWRtaW4ifQ.owoyaScUhD8e37Cmq9m5vwakg30vmukXpsmeLR9WRoA"
	r.Header.Add("Authorization",auth)
	r.Context().Value(nil)
	w := httptest.NewRecorder()
	handler := beego.NewControllerRegister()
	handler.Add("/api/vcenter", &ctr.VcenterController{}, "put:PutVcenter")
	handler.ServeHTTP(w, r)

	Convey("Update Vcenter REST API", t, func() {
		fmt.Println(w.Body.String())
		//todo body to json
		So(w.Body.String(), ShouldNotBeBlank)
	})
}

// 测试delete vcenter
func TestDelVcenter(t *testing.T) {
	r, _ := http.NewRequest("DELETE", "/api/vcenter?vcenterid=2823&hardDelete=true&timestamp=1484735401", nil)

	fmt.Println(time.Now().Format(time.RFC850))
	auth :="BEARER eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhZG1pbiI6dHJ1ZSwiZXhwIjoxNDg1NDg1Mjk3LCJpYXQiOjE0ODQ4ODA0OTcsInVzZXJuYW1lIjoiYWRtaW4ifQ.owoyaScUhD8e37Cmq9m5vwakg30vmukXpsmeLR9WRoA"
	r.Header.Add("Authorization",auth)
	r.Context().Value(nil)
	w := httptest.NewRecorder()
	handler := beego.NewControllerRegister()
	handler.Add("/api/vcenter", &ctr.VcenterController{}, "delete:DelVcenter")
	handler.ServeHTTP(w, r)

	Convey("Delete Vcenter REST API", t, func() {
		fmt.Println(w.Body.String())
		//todo body to json
		So(w.Body.String(), ShouldNotBeBlank)
	})
}