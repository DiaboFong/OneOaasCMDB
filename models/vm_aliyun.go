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

type VmAliyun struct {
	Id           int64     `orm:"pk;auto"`
	InstanceName string    `orm:"size(50)"`
	InstanceId   string    `orm:"size(50)"`
	CPU          int       `orm:"size(20)"`
	Memory       int       `orm:"size(20)"`
	CreationTime time.Time `orm:"auto_now;type(datetime)"`
	IpAddress    string    `orm:"size(20)"`
	ExpiredTime  time.Time `orm:"auto_now;type(datetime)"`
	HostName     string    `orm:"size(50)"`
	ImageId      string    `orm:"size(50)"`
	Description  string    `orm:"size(20)"`
	ZoneId       string    `orm:"size(20)"`
	Enable       bool         `orm:"column(enable);size(1);null"`
	CreateTime   time.Time    `orm:"column(createtime);auto_now_add;type(datetime)"`
	CreateBy     string       `orm:"column(createby);size(100);null"`
	UpdateBy     string       `orm:"column(updateby);size(100);null"`
	UpdateTime   time.Time    `orm:"column(updatetime);auto_now;type(datetime)"`
}

func (this *VmAliyun) TableEngine() string {
	return "INNODB"
}

func (this *VmAliyun) AddAliyunVm(vm VmAliyun) (int64, error) {
	var vmUpdateObject = new(VmAliyun)
	if !Orm.QueryTable("VmAliyun").Filter("InstanceId", vm.InstanceId).Exist() {
		return Orm.Insert(&vm)
	} else {
		//update
		err := Orm.QueryTable("VmAliyun").Filter("InstanceId", vm.InstanceId).One(vmUpdateObject)
		if err == nil {
			vmUpdateObject.CPU = vm.CPU
			vmUpdateObject.CreationTime = vm.CreationTime
			vmUpdateObject.Description = vm.Description
			vmUpdateObject.ExpiredTime = vm.ExpiredTime
			vmUpdateObject.HostName = vm.HostName
			vmUpdateObject.ImageId = vm.ImageId
			vmUpdateObject.InstanceId = vm.InstanceId
			vmUpdateObject.Memory = vm.Memory
			vmUpdateObject.IpAddress = vm.IpAddress
			vmUpdateObject.InstanceName = vm.InstanceName
			vmUpdateObject.ZoneId = vm.ZoneId
			Orm.Update(vmUpdateObject)
		} else {
			beego.Error(err.Error())
		}
	}
	return vmUpdateObject.Id, nil
}

func (this *VmAliyun) GetAliyunVm(query map[string]string, sort string, order string, offset int64, limit int64, name string, start_time string, end_time string) (entityArray []interface{}, total int64) {
	var vmArray = make([]VmAliyun, 0)
	var totalArray = make([]VmAliyun, 0)

	querySql := fmt.Sprintf(" select al.* from vm_aliyun AS al")
	totalSql := fmt.Sprintf(" select al.* from vm_aliyun AS al")

	v := query["enable"]
	if v !=""{
		querySql = fmt.Sprintf(" %s where al.enable=%s ",querySql,v)
		totalSql = fmt.Sprintf(" %s where al.enable=%s ",totalSql,v)
	}else{
		querySql = fmt.Sprintf(" %s where ",querySql)
		totalSql = fmt.Sprintf(" %s where ",totalSql)
	}

	v = query["search"]
	if v != "" {
		querySql = fmt.Sprintf(" %s and al.instance_name like '%%%s%%' ",querySql,v)
		querySql = fmt.Sprintf(" %s or ",querySql)
		querySql = fmt.Sprintf(" %s al.host_name like '%%%s%%' ",querySql,v)

		totalSql = fmt.Sprintf(" %s and al.instance_name like '%%%s%%' ",totalSql,v)
		totalSql = fmt.Sprintf(" %s or ",totalSql)
		totalSql = fmt.Sprintf(" %s al.host_name like '%%%s%%' ",totalSql,v)
	}

	if name != "" {
		querySql = fmt.Sprintf(" %s and instance_name = '%s' ",querySql,name)
		totalSql = fmt.Sprintf(" %s and instance_name = '%s' ",totalSql,name)
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

func (this *VmAliyun) CountAliyunVm(query map[string]string) (total int64, err error) {
	qs := Orm.QueryTable(&VmAliyun{})
	for k, v := range query {
		qs = qs.Filter(k, v)
	}
	return qs.Count()
}

func (this *VmAliyun) CountVmAliyunByMonth(query map[string]string) ([]interface{}, error) {
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
		querySql = fmt.Sprintf(" SELECT COUNT(*) AS Num FROM vm_aliyun WHERE createtime LIKE '%s%%' ",monthNum)
		o.Raw(querySql).Values(&maps)

		num := maps[0]["Num"]
		numArray = append(numArray, num)
	}

	return numArray, nil
}

func checkaliyun(a *VmAliyun) error {
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

func AddAliyun(a *VmAliyun) (int64, error) {
	if err := checkaliyun(a); err != nil {
		beego.Debug("[添加aliyun,验证aliyun对象信息,发生错误", err.Error(), "]")
		return 0, err
	}

	exist := Orm.QueryTable("vm_aliyun").Filter("instance_name", a.InstanceName).Exist()
	if exist {
		return 0, errors.New(a.InstanceName + ".此aliyun已存在")
	}

	id, err := Orm.Insert(a)
	if err != nil {
		beego.Debug("[添加aliyun,插入数据库,发生错误", err.Error(), "]")
		_, errorCode := dbErrorParse(err.Error())
		if errorCode == 1062 {
			return 0, errors.New("aliyun已存在")
		} else {
			return 0, errors.New("添加aliyun错误")
		}
	}
	return id, err
}

func DelAliyun(id int64) error {
	_, err := Orm.QueryTable("vm_aliyun").Filter("id", id).Update(orm.Params{
		"enable": false,
	})
	if err != nil {
		return err
	}
	return nil
}

func HardDelAliyun(id int64) error {
	_, err := Orm.QueryTable("vm_aliyun").Filter("id", id).Delete()
	if err != nil {
		return err
	}
	return nil
}

func AliyunGetById(id int64) (*VmAliyun, error) {
	obj := &VmAliyun{
		Id: id,
	}
	err := Orm.Read(obj)
	if err != nil {
		return nil, err
	}
	return obj, nil
}

func PutAliyun(m *VmAliyun) (err error) {
	_, err = Orm.Update(m)
	if err != nil {
		return err
	} else {
		return nil
	}
}
