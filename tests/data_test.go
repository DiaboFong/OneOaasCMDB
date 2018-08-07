package test

import (
	"testing"
	"fmt"
	"github.com/bitly/go-simplejson"
	. "github.com/smartystreets/goconvey/convey"
)



// 测试数据中心json结构转为map
func TestDatacenterJson2Map(t *testing.T)  {
	dcJsonStr :=` {
	      "Dcid": 177,
	      "Dcname": "江苏无锡数据中心",
	      "Dcprovince": "",
	      "Dccity": "",
	      "Dccounty": "",
	      "Dcaddress": "江苏无锡",
	      "Dcgeo": "",
	      "Comment": "XXXX",
	      "Region": {
		"Id": 5,
		"RegionName": "华中",
		"Enable": false,
		"CreateTime": "2016-05-31T04:48:40+08:00",
		"CreateBy": "han",
		"UpdateBy": "han",
		"UpdateTime": "2016-05-31T04:48:48+08:00",
		"Datacenter": null
	      },
	      "State": {
		"Id": 1,
		"State": "使用中",
		"Color": "#0DB550",
		"Enable": false,
		"CreateTime": "2016-12-01T23:18:00+08:00",
		"CreateBy": "",
		"UpdateBy": "",
		"UpdateTime": "2016-12-29T08:30:17+08:00",
		"Datacenter": null
	      },
	      "Supplier": {
		"Id": 4,
		"Supplier": "上海DELL服务器",
		"BusinessContact": "小米",
		"BusinessTelPhone": "",
		"BusinessMobilePhone": "555555555555",
		"BusinessEmail": "",
		"TechnologyContact": "小敏",
		"TechnologyTelphone": "13578908765",
		"TechnologyMobilePhone": "13578908765",
		"TechnologyEmail": "",
		"OfficeAddress": "",
		"Comment": "",
		"Datacenter": null,
		"Agreement": null,
		"Server": null,
		"Enable": true,
		"CreateTime": "2016-09-25T17:38:11+08:00",
		"CreateBy": "",
		"UpdateBy": "",
		"UpdateTime": "2017-01-06T08:27:59+08:00"
	      },
	      "Room": null,
	      "Enable": true,
	      "CreateTime": "2016-12-22T03:11:42+08:00",
	      "CreateBy": "",
	      "UpdateBy": "",
	      "UpdateTime": "2017-01-07T04:25:01+08:00"
	    }`


	//var f interface{}
	//jsonByte := []byte(dcJsonStr)
	//json.Unmarshal(jsonByte,&f)
	//m := f.(map[string]interface{})
	//结合switch类型断言
	//for k, v := range m {
	//	switch vv := v.(type) {
	//	case string:
	//		fmt.Println(k, "is string", vv)
	//	case int:
	//		fmt.Println(k, "is int", vv)
	//	case float64:
	//		fmt.Println(k,"is float64",vv)
	//	case []interface{}:
	//		fmt.Println(k, "is an array:")
	//		for i, u := range vv {
	//			fmt.Println(i, u)
	//		}
	//	default:
	//		fmt.Println(k, "is of a type I don't know how to handle")
	//	}
	//}
	js, err := simplejson.NewJson([]byte(dcJsonStr))
	if err != nil {
		fmt.Println(err)
	}

	supplier,err := js.Get("Supplier").Map()
	if err != nil{
		fmt.Println(err)
	}

	Convey("测试Map转JSON数据", t, func() {
		So(supplier["Supplier"], ShouldEqual,"上海DELL服务器")
	})



}


