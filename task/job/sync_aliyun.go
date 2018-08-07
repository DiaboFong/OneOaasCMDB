package job

import (
	"github.com/astaxie/beego"
	"github.com/denverdino/aliyungo/common"
	"github.com/denverdino/aliyungo/ecs"
	"github.com/jasonlvhit/gocron"
	"oneoaas.com/cmdb/models"
	"time"
)

func SyncAliyun() {
	s := gocron.NewScheduler()
	iTimeInterval, err := beego.AppConfig.Int64("AliyunSyncTimeInterval")
	if err != nil || iTimeInterval <= 0 {
		iTimeInterval = int64(60)
	}
	s.Every(uint64(iTimeInterval)).Seconds().Do(syncAliyunRemoteToLocal)
	<-s.Start()
}

func syncAliyunRemoteToLocal() {
	accessKeyId := beego.AppConfig.String("AccessKeyId")
	accessKeySecret := beego.AppConfig.String("AccessKeySecret")
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
					beego.Info(instance.CreationTime.String())
					beego.Info(instance.ExpiredTime.String())
					var vm = models.VmAliyun{
						InstanceName: instance.InstanceName,
						InstanceId:   instance.InstanceId,
						CPU:          instance.CPU,
						Memory:       instance.Memory,
						CreationTime: time.Time(instance.CreationTime),
						IpAddress:    instance.EipAddress.IpAddress,
						ExpiredTime:  time.Time(instance.ExpiredTime),
						HostName:     instance.HostName,
						ImageId:      instance.ImageId,
						Description:  instance.Description,
						ZoneId:       instance.ZoneId,
					}

					_, err = vm.AddAliyunVm(vm)
					if err != nil {
						beego.Error(err.Error())
					}
				}
			}
		}
	} else {
		beego.Error(errRes.Error())
	}

}
