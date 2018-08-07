package models

import (
	"errors"
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/validation"
	"log"
	"time"
	"fmt"
	"github.com/astaxie/beego/orm"
)

type VmAws struct {
	Id                 int64     `orm:"pk;auto"`
	Architecture       string    `orm:"size(50)"`
	Hypervisor         string    `orm:"size(50)"`
	ImageId            string    `orm:"size(50)"`
	InstanceId         string    `orm:"size(50)"`
	InstanceLifecycle  string    `orm:"size(50)"`
	InstanceType       string    `orm:"size(50)"`
	KernelId           string    `orm:"size(50)"`
	Launch             time.Time `orm:"column(launchtime);auto_now;type(datetime)"` //不能取LaunchTime,框架内已定义LaunchTime
	Platform           string    `orm:"size(50)"`
	PrivateDnsName     string    `orm:"size(50)"`
	PrivateIpAddress   string    `orm:"size(50)"`
	PublicDnsName      string    `orm:"size(50)"`
	PublicIpAddress    string    `orm:"size(50)"`
	VirtualizationType string    `orm:"size(50)"`
	Enable             bool         `orm:"column(enable);size(1);null"`
	CreateTime         time.Time    `orm:"column(createtime);auto_now_add;type(datetime)"`
	CreateBy           string       `orm:"column(createby);size(100);null"`
	UpdateBy           string       `orm:"column(updateby);size(100);null"`
	UpdateTime         time.Time    `orm:"column(updatetime);auto_now;type(datetime)"`
}

func (this *VmAws) TableEngine() string {
	return "INNODB"
}

func (this *VmAws) AddAwsVm(vm VmAws) (int64, error) {
	var vmUpdateObject = new(VmAws)
	if !Orm.QueryTable("VmAws").Filter("InstanceId", vm.InstanceId).Exist() {
		return Orm.Insert(&vm)
	} else {
		//update
		err := Orm.QueryTable("VmAws").Filter("InstanceId", vm.InstanceId).One(vmUpdateObject)
		if err == nil {
			vmUpdateObject.Architecture = vm.Architecture
			vmUpdateObject.ImageId = vm.ImageId
			vmUpdateObject.InstanceId = vm.InstanceId
			vmUpdateObject.InstanceLifecycle = vm.InstanceLifecycle
			vmUpdateObject.InstanceType = vm.InstanceType
			vmUpdateObject.Launch = vm.Launch
			vmUpdateObject.Platform = vm.Platform
			vmUpdateObject.PrivateDnsName = vm.PrivateDnsName
			vmUpdateObject.PrivateDnsName = vm.PrivateDnsName
			vmUpdateObject.PublicIpAddress = vm.PublicIpAddress
			vmUpdateObject.VirtualizationType = vm.VirtualizationType
			Orm.Update(vmUpdateObject)
		} else {
			beego.Error(err.Error())
		}
	}
	return vmUpdateObject.Id, nil
}

func (this *VmAws) VmAws(vm VmAws) (int64, error) {
	if !Orm.QueryTable("VmAws").Filter("InstanceId", vm.InstanceId).Exist() {
		return Orm.Insert(&vm)
	} else {
		return int64(0), errors.New("已经存在")
	}
}

func (this *VmAws) GetAwsVm(query map[string]string, sort string, order string, offset int64, limit int64, name string, launch_time string, start_time string, end_time string) (entityArray []interface{}, total int64) {

	var vmArray = make([]VmAws, 0)
	var totalArray = make([]VmAws, 0)

	querySql := fmt.Sprintf(" select vm.* from vm_aws AS vm")
	totalSql := fmt.Sprintf(" select vm.* from vm_aws AS vm")

	v := query["enable"]
	if v !=""{
		querySql = fmt.Sprintf(" %s where vm.enable=%s ",querySql,v)
		totalSql = fmt.Sprintf(" %s where vm.enable=%s ",totalSql,v)
	}else{
		querySql = fmt.Sprintf(" %s where ",querySql)
		totalSql = fmt.Sprintf(" %s where ",totalSql)
	}

	v = query["search"]
	if v != "" {
		querySql = fmt.Sprintf(" %s and vm.architecture like '%%%s%%' ",querySql,v)
		querySql = fmt.Sprintf(" %s or ",querySql)
		querySql = fmt.Sprintf(" %s vm.image_id like '%%%s%%' ",querySql,v)

		totalSql = fmt.Sprintf(" %s and vm.architecture like '%%%s%%' ",totalSql,v)
		totalSql = fmt.Sprintf(" %s or ",totalSql)
		totalSql = fmt.Sprintf(" %s vm.image_id like '%%%s%%' ",totalSql,v)
	}

	if name != "" {
		querySql = fmt.Sprintf(" %s and architecture = '%s' ",querySql,name)
		totalSql = fmt.Sprintf(" %s and architecture = '%s' ",totalSql,name)
	}

	if launch_time != "" {
		querySql = fmt.Sprintf(" %s and launch_time = '%s' ",querySql,launch_time)
		totalSql = fmt.Sprintf(" %s and launch_time = '%s' ",totalSql,launch_time)
	}

	if start_time != "" && end_time != ""{
		querySql = fmt.Sprintf(" %s and createtime >= '%s' and createtime <= '%s' ",querySql,start_time,end_time)
		totalSql = fmt.Sprintf(" %s and createtime >= '%s' and createtime <= '%s' ",totalSql,start_time,end_time)
	}

	if sort != "" {
		querySql = fmt.Sprintf(" %s order by %s ", querySql, sort)
		if order != "" {
			querySql = fmt.Sprintf(" %s %s", querySql, order)
		}
	}

	_,err := Orm.Raw(totalSql).QueryRows(&totalArray)
	if err == nil{
		totalSize := len(totalArray)
		total = int64(totalSize)
	}

	_,err = Orm.Raw(querySql).QueryRows(&vmArray)
	if err == nil{
		for _, v := range vmArray {
			entityArray = append(entityArray, v)
		}
	}
	return entityArray, total
}

func (this *VmAws) CountAwsVm(query map[string]string) (total int64, err error) {
	qs := Orm.QueryTable("VmAws")
	for k, v := range query {
		qs = qs.Filter(k, v)
	}
	num, err := qs.Count()
	if err != nil {
		beego.Error(err.Error())
	} else {
		beego.Debug("Total:", num)
	}
	return num, err
}

func (this *VmAws) CountVmAwsByMonth(query map[string]string) ([]interface{}, error) {
	var numArray = make([]interface{}, 0)
	var querySql string

	now := time.Now()
	lastMonth1 := now.Format("2006-01")
	lastMonth2 := now.AddDate(0, -1, 0).Format("2006-01")
	lastMonth3 := now.AddDate(0, -2, 0).Format("2006-01")
	lastMonth4 := now.AddDate(0, -3, 0).Format("2006-01")
	lastMonth5 := now.AddDate(0, -4, 0).Format("2006-01")
	lastMonth6 := now.AddDate(0, -5, 0).Format("2006-01")
	monthArray := []string{lastMonth1,lastMonth2,lastMonth3,lastMonth4,lastMonth5,lastMonth6}

	for _, monthNum := range monthArray {
		o := orm.NewOrm()
		var maps []orm.Params
		querySql = fmt.Sprintf(" SELECT COUNT(*) AS Num FROM vm_aws WHERE createtime LIKE '%s%%' ",monthNum)
		o.Raw(querySql).Values(&maps)

		num := maps[0]["Num"]
		numArray = append(numArray, num)
	}

	return numArray, nil
}

func checkaws(a *VmAws) error {
	valid := validation.Validation{}
	b, _ := valid.Valid(a)
	if !b {
		for _, err := range valid.Errors {
			log.Println(err.Key, err.Message)
			return errors.New(err.Message)
		}
	}
	return nil
}

func AddAws(a *VmAws) (int64, error) {
	if err := checkaws(a); err != nil {
		beego.Debug("[添加aws,验证aws对象信息,发生错误", err.Error(), "]")
		return 0, err
	}

	exist := Orm.QueryTable("vm_aws").Filter("architecture", a.Architecture).Exist()
	if exist {
		return 0, errors.New(a.Architecture + ".此aws已存在")
	}

	id, err := Orm.Insert(a)
	if err != nil {
		beego.Debug("[添加aws,插入数据库,发生错误", err.Error(), "]")
		_, errorCode := dbErrorParse(err.Error())
		if errorCode == 1062 {
			return 0, errors.New("aws已存在")
		} else {
			return 0, errors.New("添加aws错误")
		}
	}
	return id, err
}

func DelAws(id int64) error {
	_, err := Orm.QueryTable("vm_aws").Filter("id", id).Update(orm.Params{
		"enable": false,
	})
	if err != nil {
		return err
	}
	return nil
}

func HardDelAws(id int64) error {
	_, err := Orm.QueryTable("vm_aws").Filter("id", id).Delete()
	if err != nil {
		return err
	}
	return nil
}

func AwsGetById(id int64) (*VmAws, error) {
	obj := &VmAws{
		Id: id,
	}
	err := Orm.Read(obj)
	if err != nil {
		return nil, err
	}
	return obj, nil
}

func PutAws(m *VmAws) (err error) {
	_, err = Orm.Update(m)
	if err != nil {
		return err
	} else {
		return nil
	}
}
