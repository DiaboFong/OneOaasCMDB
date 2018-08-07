package test

import (
	"fmt"
	"net/http"
	. "github.com/smartystreets/goconvey/convey"
	"oneoaas.com/cmdb/util"
)


const CMDB_SERVER_ENDPOINT ="http://localhost:9898"

type CmdbAPI struct {
	Get string
	Add string
	Update string
	Delete string
}

var ApiAction CmdbAPI

var DatacenterApiAction CmdbAPI
var RoomApiAction CmdbAPI
var RackApiAction CmdbAPI
var BandwidthApiAction CmdbAPI
var HardwareApiAction CmdbAPI
var ServerApiAction CmdbAPI
var IpApiAction CmdbAPI
var DomainApiAction CmdbAPI
var SupplierApiAction CmdbAPI
var AppApiAction CmdbAPI
var AliyunApiAction CmdbAPI
var AwsApiAction CmdbAPI
var VcenterApiAction CmdbAPI

var ApiToken string

var ApiContextType string

var ApiTimestamp string
var ApiTimestamp_test string

type ResponseTester struct {
	response *http.Response
}

func (rt ResponseTester) json() {
	Convey("content type is json", func() {
		So(rt.response.Header.Get("Content-Type"), ShouldEqual, "application/json; charset=utf-8")
	})
}

func (rt ResponseTester) status(code int) {
	Convey(fmt.Sprintf("status code is %d", code), func() {
		So(rt.response.StatusCode, ShouldEqual, code)
	})
}

func init() {
	//获取当前时间戳
	ApiTimestamp := fmt.Sprintf("%d",util.MakeTimestamp)

	//获取当前token
	ApiToken = "BEARER eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhZG1pbiI6dHJ1ZSwiZXhwIjoxNDg1NDg1Mjk3LCJpYXQiOjE0ODQ4ODA0OTcsInVzZXJuYW1lIjoiYWRtaW4ifQ.owoyaScUhD8e37Cmq9m5vwakg30vmukXpsmeLR9WRoA"

	ApiContextType = "application/json; charset=utf-8"

	DatacenterApiAction = CmdbAPI{
		Get:CMDB_SERVER_ENDPOINT+"/api/datacenter?enable=1&format=json&order=asc&sort=dcid&timestamp="+ApiTimestamp,
		Add:CMDB_SERVER_ENDPOINT+"/api/datacenter?dcname=han&supplierId=3&regionId=2&stateId=1&dcaddress=1&timestamp="+ApiTimestamp,
		Update:CMDB_SERVER_ENDPOINT+"/api/datacenter?dcid=188&dcname=hanjiuzhou&&timestamp="+ApiTimestamp,
		Delete:CMDB_SERVER_ENDPOINT+"/api/datacenter?dcid=187&hardDelete=true&timestamp="+ApiTimestamp,
	}

	RoomApiAction = CmdbAPI{
		Get:CMDB_SERVER_ENDPOINT+"/api/room?enable=1&format=json&order=asc&sort=roomid&timestamp="+ApiTimestamp,
		Add:CMDB_SERVER_ENDPOINT+"/api/room?roomname=zhang&stateId=1&dcId=188&floor=1&timestamp="+ApiTimestamp,
		Update:CMDB_SERVER_ENDPOINT+"/api/room?roomId=37&roomName=hanjiuzhou&timestamp="+ApiTimestamp,
		Delete:CMDB_SERVER_ENDPOINT+"/api/room?roomid=38&hardDelete=true&timestamp="+ApiTimestamp,
	}

	RackApiAction = CmdbAPI{
		Get:CMDB_SERVER_ENDPOINT+"/api/rack?enable=1&format=json&order=asc&sort=rackid&timestamp="+ApiTimestamp,
		Add:CMDB_SERVER_ENDPOINT+"/api/rack?rackName=zhang&status=2&room=30&timestamp="+ApiTimestamp,
		Update:CMDB_SERVER_ENDPOINT+"/api/rack?rackid=73&rackName=hanjiuzhou&timestamp="+ApiTimestamp,
		Delete:CMDB_SERVER_ENDPOINT+"/api/rack?rackid=74&hardDelete=true&timestamp="+ApiTimestamp,
	}

	BandwidthApiAction = CmdbAPI{
		Get:CMDB_SERVER_ENDPOINT+"/api/networkbandwidth?enable=1&format=json&order=asc&sort=id&timestamp="+ApiTimestamp,
		Add:CMDB_SERVER_ENDPOINT+"/api/networkbandwidth?name=han&state=3&room=30&rack=43&isp=1&timestamp="+ApiTimestamp,
		Update:CMDB_SERVER_ENDPOINT+"/api/networkbandwidth?Id=24&name=hanjiuzhou&timestamp="+ApiTimestamp,
		Delete:CMDB_SERVER_ENDPOINT+"/api/networkbandwidth?Id=25&hardDelete=true&timestamp="+ApiTimestamp,
	}

	HardwareApiAction = CmdbAPI{
		Get:CMDB_SERVER_ENDPOINT+"/api/hardware?enable=1&format=json&order=asc&sort=id&timestamp="+ApiTimestamp,
		Add:CMDB_SERVER_ENDPOINT+"/api/hardware?hardwareName=han&state=2&hardwareType=2&rack=43&timestamp="+ApiTimestamp,
		Update:CMDB_SERVER_ENDPOINT+"/api/hardware?Id=32&hardwareName=hanjiuzhou&timestamp="+ApiTimestamp,
		Delete:CMDB_SERVER_ENDPOINT+"/api/hardware?Id=33&hardDelete=true&timestamp="+ApiTimestamp,
	}

	ServerApiAction = CmdbAPI{
		Get:CMDB_SERVER_ENDPOINT+"/api/server?enable=1&format=json&order=asc&sort=serverid&timestamp="+ApiTimestamp,
		Add:CMDB_SERVER_ENDPOINT+"/api/server?sn=han&state=1&manufacturer=1&supplier=3&cpu=1&memory=1&harddisk=1&networkadapter=1&host=1&rack=43&app=35&timestamp="+ApiTimestamp,
		Update:CMDB_SERVER_ENDPOINT+"/api/server?serverid=249&sn=hanjiuzhou&timestamp="+ApiTimestamp,
		Delete:CMDB_SERVER_ENDPOINT+"/api/server?serverid=241&hardDelete=true&timestamp="+ApiTimestamp,
	}

	IpApiAction = CmdbAPI{
		Get:CMDB_SERVER_ENDPOINT+"/api/networkip?enable=1&format=json&order=asc&sort=networkipid&timestamp="+ApiTimestamp,
		Add:CMDB_SERVER_ENDPOINT+"/api/networkip?ipaddress=10.0.2.1&appId=35&hostId=2&roomId=30&timestamp="+ApiTimestamp,
		Update:CMDB_SERVER_ENDPOINT+"/api/networkip?networkipid=13&ipaddress=10.0.2.3&timestamp="+ApiTimestamp,
		Delete:CMDB_SERVER_ENDPOINT+"/api/networkip?Networkipid=15&hardDelete=true&timestamp="+ApiTimestamp,
	}

	DomainApiAction = CmdbAPI{
		Get:CMDB_SERVER_ENDPOINT+"/api/dnspoddomain?enable=1&format=json&order=asc&sort=id&timestamp="+ApiTimestamp,
		Add:CMDB_SERVER_ENDPOINT+"/api/dnspoddomain?name=han&stateId=1&extStatus=1&timestamp="+ApiTimestamp,
		Update:CMDB_SERVER_ENDPOINT+"/api/dnspoddomain?id=14&name=han.com&timestamp="+ApiTimestamp,
		Delete:CMDB_SERVER_ENDPOINT+"/api/dnspoddomain?id=15&hardDelete=true&timestamp="+ApiTimestamp,
	}

	SupplierApiAction = CmdbAPI{
		Get:CMDB_SERVER_ENDPOINT+"/api/supplier?enable=1&format=json&order=asc&sort=id&timestamp="+ApiTimestamp,
		Add:CMDB_SERVER_ENDPOINT+"/api/supplier?timestamp="+ApiTimestamp,
		Update:CMDB_SERVER_ENDPOINT+"/api/supplier?supplierid=22&supplier=han&timestamp="+ApiTimestamp,
		Delete:CMDB_SERVER_ENDPOINT+"/api/supplier?supplierid=23&hardDelete=true&timestamp="+ApiTimestamp,
	}

	AppApiAction = CmdbAPI{
		Get:CMDB_SERVER_ENDPOINT+"/api/app?enable=1&format=json&order=asc&sort=appid&timestamp="+ApiTimestamp,
		Add:CMDB_SERVER_ENDPOINT+"/api/app?appName=kou&appLevel=2&timestamp="+ApiTimestamp,
		Update:CMDB_SERVER_ENDPOINT+"/api/app?Id=43&appName=bbb&timestamp="+ApiTimestamp,
		Delete:CMDB_SERVER_ENDPOINT+"/api/app?appid=42&hardDelete=true&timestamp="+ApiTimestamp,
	}

	AwsApiAction = CmdbAPI{
		Get:CMDB_SERVER_ENDPOINT+"/api/aws?enable=1&format=json&order=asc&sort=id&timestamp="+ApiTimestamp,
		Add:CMDB_SERVER_ENDPOINT+"/api/aws?architecture=zhang&timestamp="+ApiTimestamp,
		Update:CMDB_SERVER_ENDPOINT+"/api/aws?editawsid=2&editarchitecture=he&timestamp="+ApiTimestamp,
		Delete:CMDB_SERVER_ENDPOINT+"/api/aws?awsid=3&hardDelete=true&timestamp="+ApiTimestamp,
	}

	AliyunApiAction = CmdbAPI{
		Get:CMDB_SERVER_ENDPOINT+"/api/aliyun?enable=1&format=json&order=asc&sort=id&timestamp="+ApiTimestamp,
		Add:CMDB_SERVER_ENDPOINT+"/api/aliyun?instancename=han&timestamp="+ApiTimestamp,
		Update:CMDB_SERVER_ENDPOINT+"/api/aliyun?editAliyunId=9&editinstancename=hanjiuzhou&timestamp="+ApiTimestamp,
		Delete:CMDB_SERVER_ENDPOINT+"/api/aliyun?aliyunid=9&hardDelete=true&timestamp="+ApiTimestamp,
	}

	VcenterApiAction = CmdbAPI{
		Get:CMDB_SERVER_ENDPOINT+"/api/vcenter?enable=1&format=json&order=asc&sort=vcenter_id&timestamp="+ApiTimestamp,
		Add:CMDB_SERVER_ENDPOINT+"/api/vcenter?instancename=123&timestamp="+ApiTimestamp,
		Update:CMDB_SERVER_ENDPOINT+"/api/vcenter?editVcenterId=2820&editinstancename=han&timestamp="+ApiTimestamp,
		Delete:CMDB_SERVER_ENDPOINT+"/api/vcenter?vcenterid=2828&hardDelete=true&timestamp="+ApiTimestamp,
	}
}