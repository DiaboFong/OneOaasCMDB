package models

import (
	"errors"
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/validation"
	"log"
	"time"
	"fmt"
	"strings"
	"github.com/astaxie/beego/orm"
)

type VmVmware struct {
	VcenterId               int64  `orm:"pk;auto"`
	Name     		        string `orm:"size(30)"`
	Template            	bool   `orm:"size(1)"`
	VmPathName          	string `orm:"size(50)"`
	MemorySize        	    int32  `orm:"size(10)"`
	CpuReservation      	int32  `orm:"size(10)"`
	MemoryReservation   	int32  `orm:"size(10)"`
	NumCpu              	int32  `orm:"size(10)"`
	NumEthernetCards    	int32  `orm:"size(10)"`
	NumVirtualDisks     	int32  `orm:"size(10)"`
	Uuid                	string `orm:"size(30)"`
	InstanceUuid        	string `orm:"size(30)"`
	GuestId             	string `orm:"size(30)"`
	GuestFullname       	string `orm:"size(30)"`
	Annotation          	string `orm:"size(60)"`
	Enable bool                    `orm:"column(enable);size(1);null"`
	CreateTime time.Time           `orm:"column(createtime);auto_now_add;type(datetime)"`
	CreateBy string                `orm:"column(createby);size(100);null"`
	UpdateBy string                `orm:"column(updateby);size(100);null"`
	UpdateTime time.Time           `orm:"column(updatetime);auto_now;type(datetime)"`
}

func (this *VmVmware) TableEngine() string {
	return "INNODB"
}


func (this *VmVmware) AddVmVmware(vm VmVmware) (int64, error) {
	updateVmObject := new(VmVmware)
	if !Orm.QueryTable("VmVmware").Filter("Uuid", vm.Uuid).Exist() {
		return Orm.Insert(&vm)
	} else {
		err := Orm.QueryTable("VmVmware").Filter("Uuid", vm.Uuid).One(updateVmObject)
		if err == nil {
			updateVmObject.Name = vm.Name
			updateVmObject.Annotation = vm.Annotation
			updateVmObject.CpuReservation = vm.CpuReservation
			updateVmObject.GuestFullname = vm.GuestFullname
			updateVmObject.GuestId = vm.GuestId
			updateVmObject.InstanceUuid = vm.InstanceUuid
			updateVmObject.MemoryReservation = vm.MemoryReservation
			updateVmObject.MemorySize = vm.MemorySize
			updateVmObject.VmPathName = vm.VmPathName
			Orm.Update(updateVmObject)
		}

	}
	return updateVmObject.VcenterId,nil
}

func (this *VmVmware) GetVmwareVm(query map[string]string, sort string, order string, offset int64, limit int64, name string, guest_fullname string, start_time string, end_time string) (entityArray []interface{}, total int64) {

	var vmArray = make([]VmVmware, 0)
	var totalArray = make([]VmVmware, 0)

	querySql := fmt.Sprintf(" select vm.* from vm_vmware AS vm")
	totalSql := fmt.Sprintf(" select vm.* from vm_vmware AS vm")

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
		querySql = fmt.Sprintf(" %s and vm.name like '%%%s%%' ",querySql,v)
		querySql = fmt.Sprintf(" %s or ",querySql)
		querySql = fmt.Sprintf(" %s vm.template like '%%%s%%' ",querySql,v)

		totalSql = fmt.Sprintf(" %s and vm.name like '%%%s%%' ",totalSql,v)
		totalSql = fmt.Sprintf(" %s or ",totalSql)
		totalSql = fmt.Sprintf(" %s vm.template like '%%%s%%' ",totalSql,v)
	}

	if name != "" {
		querySql = fmt.Sprintf(" %s and name = '%s' ",querySql,name)
		totalSql = fmt.Sprintf(" %s and name = '%s' ",totalSql,name)
	}

	if guest_fullname != "" {
		querySql = fmt.Sprintf(" %s and guest_fullname = '%s' ",querySql,guest_fullname)
		totalSql = fmt.Sprintf(" %s and guest_fullname = '%s' ",totalSql,guest_fullname)
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

func (this *VmVmware) CountVmwareVm(query map[string]string) (total int64, err error) {
	qs := Orm.QueryTable("VmVmware")
	for k, v := range query {
		qs = qs.Filter(k, v)
	}
	num, err := qs.Count()
	if err != nil {
		beego.Error(err.Error())
	}else {
		beego.Debug("Total:", num)
	}
	return num, err
}

func (this *VmVmware) CountVmwareByMonth(query map[string]string) ([]interface{}, error) {
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
		querySql = fmt.Sprintf(" SELECT COUNT(*) AS Num FROM vm_vmware WHERE createtime LIKE '%s%%' ",monthNum)
		o.Raw(querySql).Values(&maps)

		num := maps[0]["Num"]
		numArray = append(numArray, num)
	}

	return numArray, nil
}

func checkvcenter(a *VmVmware) error {
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

func AddVcenter(a *VmVmware) (int64, error) {
	if err := checkvcenter(a); err != nil {
		beego.Debug("[添加vcenter,验证vcenter对象信息,发生错误", err.Error(), "]")
		return 0, err
	}

	exist := Orm.QueryTable("vm_vmware").Filter("name", a.Name).Exist()
	if exist {
		return 0, errors.New(a.Name + ".此vcenter已存在")
	}

	id, err := Orm.Insert(a)
	if err != nil {
		beego.Debug("[添加vcenter,插入数据库,发生错误", err.Error(), "]")
		errorMessage, errorCode := dbErrorParse(err.Error())
		partsError := strings.Split(errorMessage, " ")
		detailErrorMessage := partsError[3]

		newDetailErrorMessage := strings.Replace(detailErrorMessage,"'","",2)
		if errorCode == 1062 {
			return 0, errors.New(newDetailErrorMessage+"记录已存在")
		} else {
			return 0, errors.New("添加vcenter错误")
		}
	}
	return id, err
}

func DelVcenter(id int64) error {
	_, err := Orm.QueryTable("vm_vmware").Filter("VcenterId", id).Update(orm.Params{
		"enable": false,
	})
	if err != nil {
		return err
	}
	return nil
}

func HardDelVcenter(id int64) error {
	_, err := Orm.QueryTable("vm_vmware").Filter("VcenterId", id).Delete()
	if err != nil {
		return err
	}
	return nil
}

func VcenterGetById(id int64) (*VmVmware, error) {
	obj := &VmVmware{
		VcenterId: id,
	}
	err := Orm.Read(obj)
	if err != nil {
		return nil, err
	}
	return obj, nil
}

func PutVcenter(m *VmVmware) (err error) {
	_, err = Orm.Update(m);
	if err != nil {
		return err
	} else {
		return nil
	}
}