package controllers

import (
	"github.com/astaxie/beego"
	"fmt"
	"oneoaas.com/cmdb/models"
)

const (
	final_datacenter="datacenter"
	final_device="device"
	final_soft="soft"
	final_cloud="cloud"

)
// ResourceReportController operations for ResourceReport
type ResourceReportController struct {
	beego.Controller
}

// URLMapping ...
func (c *ResourceReportController) URLMapping() {
	c.Mapping("GetStatistics", c.GetStatistics)
}


// @Title resource statistics
// @Description 资源统计
// @Param   Authorization     header    string 	  true     "认证信息"
// @Param   timestamp         query     string 	  true     "时间戳"
// @Success 200 {object} models.ResourceReport"
// @Failure 400 统计资源失败
// @router /statistics [get]
func (c *ResourceReportController) GetStatistics() {

	fmt.Println("GetStatistics ....")
	category :=c.GetString("category")
	fmt.Println("category",category)

	list := models.GetAllAssertsInstance()

	var (
		bandwidth int64
		rack int64
		server int64
		network int64
		storage int64
		virtualization int64
		common int64
		aliyun int64
		aws int64


	)
	for _,assertsInstance := range list{
		if assertsInstance.Name == "bandwidth"{
			bandwidth += assertsInstance.Number
		}else if assertsInstance.Name =="rack"{
			rack += assertsInstance.Number
		}else if assertsInstance.Name =="server"{
			server += assertsInstance.Number
		}else if assertsInstance.Name =="network"{
			network += assertsInstance.Number
		}else if assertsInstance.Name =="hardware"{
			storage += assertsInstance.Number
		}else if assertsInstance.Name =="aliyun"{
			aliyun += assertsInstance.Number
		}else if assertsInstance.Name =="aws"{
			aws += assertsInstance.Number
		}else if assertsInstance.Name =="vcenter"{
			virtualization += assertsInstance.Number
		}else if assertsInstance.Name =="supplier" || assertsInstance.Name =="supplier"{
			common += assertsInstance.Number
		}
	}
	if category == final_datacenter{
		c.Data["json"]= map[string]int64{
			"bandwidth":bandwidth,
			"rack":rack,
		}
	}else if category == final_device{
		c.Data["json"]= map[string]int64{
			"server":server,
			"network":network,
			"storage":storage,
		}
	}else if category == final_soft{
		c.Data["json"]= map[string]int64{
			"virtualization":virtualization,
			"common":common,
		}
	}else if category == final_cloud{
		c.Data["json"]= map[string]int64{
			"aliyun":aliyun,
			"aws":aws,
		}
	}

	c.ServeJSON()
}

