package controllers

import (
	"github.com/astaxie/beego"
	"github.com/denverdino/aliyungo/ecs"
	"oneoaas.com/cmdb/models"
	"time"
	"github.com/denverdino/aliyungo/common"
)


// @Title syncaliyun
// @Description 同步远程aliyun信息
// @Success 200 {map} map[string]interface{}
// @Param   id              query   int64   true  "云帐号ID"
// @Param   Authorization   header  string  true  "认证信息"
// @Param   timestamp       query   string  true  "时间戳"
// @Failure 400 同步远程aliyun信息
// @router / [post]
func (this *SyncAliyunController)SyncAliyunRemoteToLocal() {

	var id, _ = this.GetInt64("id", 0)
	accessKeyId,accessKeySecret := models.GetAccountDetail(id)

	ecsClient := ecs.NewClient(accessKeyId, accessKeySecret)
	regionList, errRes := ecsClient.DescribeRegions()
	if errRes == nil {
		for _, region := range regionList {
			beego.Info(region.RegionId)
			instances, _, err := ecsClient.DescribeInstances(&ecs.DescribeInstancesArgs{
				RegionId: common.Hangzhou,
			})

			if err == nil {
				for _, instance := range instances {
					var vm = models.VmAliyun{
						InstanceName: instance.InstanceName,
						InstanceId:   instance.InstanceId,
						CPU:          instance.CPU,
						Memory:       instance.Memory,
						CreationTime: time.Time(instance.CreationTime),
						IpAddress:    instance.PublicIpAddress.IpAddress[0],
						ExpiredTime:  time.Time(instance.ExpiredTime),
						HostName:     instance.HostName,
						ImageId:      instance.ImageId,
						Description:  instance.Description,
						ZoneId:       instance.ZoneId,
						Enable:	 	  true,
					}

					_, err = vm.AddAliyunVm(vm)
					if err != nil{
						beego.Error("添加aliyun虚拟机错误",err.Error())
					}
				}

				if err != nil {
					this.Data["json"] = this.ResponseSuccessJSON(false, "同步失败", -1)
				} else {
					this.Data["json"] = this.ResponseSuccessJSON(true, "同步成功", 100)
				}
				this.ServeJSON()
			}
		}
	}
}
