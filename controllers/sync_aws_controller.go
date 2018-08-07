package controllers

import (
	"github.com/astaxie/beego"
	"github.com/aws/aws-sdk-go/aws"
	"github.com/aws/aws-sdk-go/aws/credentials"
	"github.com/aws/aws-sdk-go/aws/session"
	"github.com/aws/aws-sdk-go/service/ec2"
	"oneoaas.com/cmdb/models"
)


// @Title syncaws
// @Description 同步远程aws信息
// @Success 200 {map} map[string]interface{}
// @Param   id              query   int64   true  "云帐号ID"
// @Param   Authorization   header  string  true  "认证信息"
// @Param   timestamp       query   string  true  "时间戳"
// @Failure 400 同步远程aws信息
// @router / [post]
func (this *SyncAwsController)SyncAwsRemoteToLocal() {

	var id, _ = this.GetInt64("id", 0)
	accessKeyId,accessKeySecret := models.GetAccountDetail(id)

	creds := credentials.NewStaticCredentials(accessKeyId, accessKeySecret, "")
	svc := ec2.New(session.New(
		&aws.Config{
			Region:      aws.String("us-west-2"),
			Credentials: creds,
		}))
	describeRegionsOutput, err := svc.DescribeRegions(&ec2.DescribeRegionsInput{})
	if err == nil {
		for _, region := range describeRegionsOutput.Regions {
			beego.Info(region.String())
		}
	}

	describeInstancesOutput, err := svc.DescribeInstances(&ec2.DescribeInstancesInput{})
	reservations := describeInstancesOutput.Reservations
	for _, reservation := range reservations {
		instances := reservation.Instances
		for _, instance := range instances {
			var vm = models.VmAws{
				Enable:	 true,
			}
			if instance.Architecture != nil{
				vm.Architecture = *instance.Architecture
			}
			if instance.Hypervisor != nil{
				vm.Hypervisor = *instance.Hypervisor
			}
			if instance.ImageId != nil{
				vm.ImageId = *instance.ImageId
			}
			if instance.InstanceId != nil{
				vm.InstanceId = *instance.InstanceId
			}
			if instance.InstanceLifecycle != nil{
				vm.InstanceLifecycle = *instance.InstanceLifecycle
			}
			if instance.InstanceType != nil{
				vm.InstanceType = *instance.InstanceType
			}
			if instance.KernelId != nil{
				vm.KernelId = *instance.KernelId
			}
			if instance.LaunchTime != nil{
				vm.Launch = *instance.LaunchTime
			}
			if instance.Platform != nil{
				vm.Platform = *instance.Platform
			}
			if instance.PrivateDnsName != nil{
				vm.PrivateDnsName = *instance.PrivateDnsName
			}
			if instance.PublicDnsName != nil{
				vm.PublicDnsName = *instance.PublicDnsName
			}
			if instance.PrivateIpAddress != nil{
				vm.PrivateIpAddress = *instance.PrivateIpAddress
			}
			if instance.PublicIpAddress != nil{
				vm.PublicIpAddress = *instance.PublicIpAddress
			}
			if instance.VirtualizationType != nil{
				vm.VirtualizationType = *instance.VirtualizationType
			}

			_, err = vm.AddAwsVm(vm)
			if err != nil{
				beego.Error("添加aws虚拟机错误",err.Error())
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
