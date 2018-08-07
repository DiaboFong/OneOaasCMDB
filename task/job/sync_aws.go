package job

import (
	"github.com/astaxie/beego"
	"github.com/aws/aws-sdk-go/aws"
	"github.com/aws/aws-sdk-go/aws/credentials"
	"github.com/aws/aws-sdk-go/aws/session"
	"github.com/aws/aws-sdk-go/service/ec2"
	"github.com/jasonlvhit/gocron"
)

func SyncAWS() {
	s := gocron.NewScheduler()
	iTimeInterval, err := beego.AppConfig.Int64("AwsSyncTimeInterval")
	if err != nil || iTimeInterval <= 0 {
		iTimeInterval = int64(60)
	}
	s.Every(uint64(iTimeInterval)).Seconds().Do(syncAwsRemoteToLocal)
	<-s.Start()
}

func syncAwsRemoteToLocal() {
	beego.Info("syncAwsRemoteToLocal.......")
	aws_access_key_id := beego.AppConfig.String("AccessKeySecret")
	aws_secret_access_key := beego.AppConfig.String("AwsSecretAccessKey")
	creds := credentials.NewStaticCredentials(aws_access_key_id, aws_secret_access_key, "")
	svc := ec2.New(session.New(
		&aws.Config{
			Region:      aws.String("us-west-2"),
			Credentials: creds,
		}))
	describeRegionsOutput, err := svc.DescribeRegions(&ec2.DescribeRegionsInput{})
	beego.Info("Regions:", len(describeRegionsOutput.Regions))
	if err == nil {
		for _, region := range describeRegionsOutput.Regions {
			beego.Info(region.String())
		}
	}

	describeInstancesOutput, err := svc.DescribeInstances(&ec2.DescribeInstancesInput{})
	reservations := describeInstancesOutput.Reservations
	beego.Info("reservations:", len(reservations))
	for reservationIndex, reservation := range reservations {
		beego.Info(reservationIndex)
		instances := reservation.Instances
		for instanceIndex, instance := range instances {
			beego.Info(instanceIndex)
			beego.Info(instance.InstanceId)
			beego.Info(instance.Hypervisor)
			beego.Info(instance.InstanceLifecycle)
			beego.Info(instance.PublicIpAddress)
		}
	}
}
