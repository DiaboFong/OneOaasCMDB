package models

import (
	"errors"
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/validation"
	"time"
	"fmt"
	"encoding/json"
	"oneoaas.com/cmdb/util"
	"github.com/astaxie/beego/orm"
)

type Datacenter struct {
	Dcid       int64             `orm:"column(dcid);auto"`
	Dcname     string            `orm:"column(dcname);size(255),unique"`
	Dcprovince string            `orm:"column(dcprovince);size(255);null"`
	Dccity     string            `orm:"column(dccity);size(255);null"`
	Dccounty   string            `orm:"column(dccounty);size(255);null"`
	Dcaddress  string            `orm:"column(dcaddress);size(255);null"`
	Dcgeo      string            `orm:"column(dcgeo);size(255);null"`
	Comment    string            `orm:"column(comment);size(512);null"`
	Region     *DatacenterRegion `orm:"rel(fk)" json:"Region"`       //一个区域对应多个数据中心
	State      *DatacenterState  `orm:"rel(fk)" json:"State"`       //一个状态对应多个数据中心
	Supplier   *Supplier         `orm:"rel(fk);null" json:"Supplier"`   //一个供应商对应多个数据中心
	Room       []*Room           `orm:"reverse(many)" json:"Room"` //一个数据中心对应多个机房
	Enable     bool         `orm:"column(enable);size(1);null"`
	CreateTime time.Time    `orm:"column(createtime);auto_now_add;type(datetime)"`
	CreateBy   string       `orm:"column(createby);size(100);null"`
	UpdateBy   string       `orm:"column(updateby);size(100);null"`
	UpdateTime time.Time    `orm:"column(updatetime);auto_now;type(datetime)"`
}

//重写对象json格式化
func (this *Datacenter) MarshalJSON() ([]byte, error) {
	type Alias Datacenter
	return json.Marshal(&struct {
		*Alias
		CreateDate string `json:"createDate"`
		UpdateDate string `json:"updateDate"`
	}{
		Alias: (*Alias)(this),
		CreateDate: this.CreateTime.Format(util.Time_Default_Layout_2),
		UpdateDate: this.UpdateTime.Format(util.Time_Default_Layout_2),
	})
}

func (this *Datacenter) TableEngine() string {
	return "INNODB"
}

func (this *Datacenter) TableName() string {
	return "datacenter"
}

func checkdc(dc Datacenter) error {
	valid := validation.Validation{}
	valid.Required(dc.Dcname, "name")
	if valid.HasErrors() {
		for _, err := range valid.Errors {
			return errors.New(err.Message)
		}
	}
	return nil
}

func AddDatacenter(a Datacenter) (int64, error) {
	if err := checkdc(a); err != nil {
		return 0, err
	}

	exist := Orm.QueryTable("datacenter").Filter("Dcname", a.Dcname).Exist()
	if exist {
		return 0, errors.New(a.Dcname + "数据中心已存在")
	}

	id, err := Orm.Insert(&a)
	if err != nil {
		return 0, errors.New("添加数据中心错误" + err.Error())
	}
	return id, nil
}

func DelDatacenter(id int64) error {
	exist := Orm.QueryTable("room").Filter("datacenter_id", id).Exist()
	if exist {
		return errors.New("该数据中心正在使用中")
	}

	_, err := Orm.QueryTable("Datacenter").Filter("dcid", id).Update(orm.Params{
			"enable": false,
	})
	if err != nil {
		beego.Error("删除数据中心错误", err.Error())
		return err
	}
	return nil
}

func HardDelDatacenter(id int64) error {
	_, err := Orm.QueryTable("Datacenter").Filter("dcid", id).Delete()
	if err != nil {
		beego.Error("删除数据中心错误", err.Error())
		return err
	}
	return nil
}

type Region struct {
	Id   int64
	RegionName  string
}

func GetDatacenter(query map[string]string, sort string, order string, offset int64, limit int64, dcname string, state string, region string, supplier string, start_time string, end_time string) (entityArray []interface{}, total int64) {

	var dcArray = make([]Datacenter, 0)
	var totalArray = make([]Datacenter, 0)

	querySql := fmt.Sprintf(" select dc.* from datacenter AS dc")
	totalSql := fmt.Sprintf(" select dc.* from datacenter AS dc")

	v := query["enable"]
	if v !=""{
		querySql = fmt.Sprintf(" %s where dc.enable=%s ",querySql,v)
		totalSql = fmt.Sprintf(" %s where dc.enable=%s ",totalSql,v)
	}else{
		querySql = fmt.Sprintf(" %s where ",querySql)
		totalSql = fmt.Sprintf(" %s where ",totalSql)
	}

	v = query["search"]
	if v != "" {
		querySql = fmt.Sprintf(" %s and dc.dcname like '%%%s%%' ",querySql,v)
		querySql = fmt.Sprintf(" %s or ",querySql)
		querySql = fmt.Sprintf(" %s dc.dcaddress like '%%%s%%' ",querySql,v)

		totalSql = fmt.Sprintf(" %s and dc.dcname like '%%%s%%' ",totalSql,v)
		totalSql = fmt.Sprintf(" %s or ",totalSql)
		totalSql = fmt.Sprintf(" %s dc.dcaddress like '%%%s%%' ",totalSql,v)
	}

	if dcname != "" {
		querySql = fmt.Sprintf(" %s and dcname = '%s' ",querySql,dcname)
		totalSql = fmt.Sprintf(" %s and dcname = '%s' ",totalSql,dcname)
	}

	if state != "" {
		querySql = fmt.Sprintf(" %s and state_id in (%s) ",querySql,state)
		totalSql = fmt.Sprintf(" %s and state_id in (%s) ",totalSql,state)
	}

	if region != "" {
		querySql = fmt.Sprintf(" %s and region_id in (%s) ",querySql,region)
		totalSql = fmt.Sprintf(" %s and region_id in (%s) ",totalSql,region)
	}

	if supplier != "" {
		querySql = fmt.Sprintf(" %s and supplier_id in (%s) ",querySql,supplier)
		totalSql = fmt.Sprintf(" %s and supplier_id in (%s) ",totalSql,supplier)
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

	if limit>=0 && offset >=0{
		querySql = fmt.Sprintf(" %s limit %d offset %d ",querySql,limit,offset)
	}

	_,err = Orm.Raw(querySql).QueryRows(&dcArray)
	if err == nil{
		for _, v := range dcArray {
			state, _ := GetDatacenterStateById(v.State.Id)
			region, _ := GetDatacenterRegionById(v.Region.Id)
			supplier, _ := SupplierGetById(v.Supplier.Id)
			v.State = state
			v.Supplier = supplier
			v.Region = region
			entityArray = append(entityArray, v)
		}
	}
	return entityArray, total
}


//统计符合条件的数据记录
func CountDatacenter(query map[string]string) (total int64, err error) {
	qs := Orm.QueryTable("datacenter")
	for k, v := range query {
		qs = qs.Filter(k, v)
	}
	return qs.Count()
}

func GetDatacenterById(id int64) (*Datacenter, error) {
	obj := &Datacenter{
		Dcid: id,
	}
	err := Orm.Read(obj)
	if err != nil {
		return nil, err
	}
	return obj, nil
}

//根据名称获取数据中心
func GetDatacenterByName(name string) (*Datacenter, error) {
	dc := new(Datacenter)
	err := Orm.QueryTable("datacenter").Filter("dcname",name).One(dc)
	if err != nil{
		return nil,err
	}
	return dc, nil
}

func PutDatacenter(m *Datacenter) (err error) {
	_, err = Orm.Update(m)
	if err != nil {
		return err
	} else {
		return nil
	}
}

func GetAllDatacenter() []*Datacenter {
	var datacenter []*Datacenter
	_, err := Orm.QueryTable("datacenter").All(&datacenter)
	if err != nil {
		beego.Error("【查询所有数据中心错误", err.Error(), "]")
	}
	return datacenter
}

func (this *Datacenter) QueryDatacenterById() Datacenter {
	var mydc Datacenter
	queryError := Orm.QueryTable("datacenter").Filter("enable", 1).Filter("dcid", this.Dcid).RelatedSel().One(&mydc)
	if queryError != nil {
		beego.Error(queryError)
	}
	return mydc
}

func (this *Datacenter) QueryDatacenter() []Datacenter {
	var mydcs []Datacenter
	var queryError error
	if this.Dcid != -1 {
		var mydc Datacenter
		queryError = Orm.QueryTable("datacenter").Filter("enable", 1).Filter("dcid", this.Dcid).RelatedSel().One(&mydc)
		if queryError != nil {
			beego.Error(queryError)
		}
		mydcs = append(mydcs, mydc)
	} else {
		_, queryError = Orm.QueryTable("datacenter").Filter("enable", 1).RelatedSel().All(&mydcs)
		if queryError != nil {
			beego.Error(queryError)
		}

	}

	for index, dc := range mydcs {
		_, queryError = Orm.LoadRelated(&dc, "Room", true, 4)
		for _, room := range dc.Room {
			Orm.LoadRelated(room, "Rack")
			Orm.LoadRelated(room, "Networkip")
		}
		if queryError != nil {
			beego.Error(queryError)
		}
		mydcs[index] = dc
	}
	return mydcs
}

func GetDatacenterReport(reportType string) ([]util.Rate) {
	var reports = make([]util.Rate, 0)
	var ReportTimes = make([]string, 0)
	var ReportNums = make([]string, 0)
	var querySql string
	if reportType == "day" {
		querySql = fmt.Sprintf(" SELECT DATE_FORMAT(createtime,'%%Y%%m%%d') as ReportTime,count(dcid) as ReportNum from datacenter where enable=1 group by ReportTime ")
	} else if reportType == "week" {
		querySql = fmt.Sprintf(" SELECT DATE_FORMAT(createtime,'%%Y%%u')  as ReportTime,count(dcid) as ReportNum from datacenter where enable=1 group by ReportTime ")
	} else if reportType == "month" {
		querySql = fmt.Sprintf(" SELECT DATE_FORMAT(createtime,'%%Y%%m')  as ReportTime,count(dcid) as ReportNum from datacenter where enable=1 group by ReportTime ")
	}
	_, err := Orm.Raw(querySql).QueryRows(&ReportTimes, &ReportNums)
	if err != nil {
		beego.Error(err)
	}

	if len(ReportNums) > 0 && len(ReportTimes) > 0 && (len(ReportNums) == len(ReportTimes)) {
		for index, reportTime := range ReportTimes {
			var rate util.Rate
			rate.RateVal = ReportNums[index]
			rate.TimeVal = reportTime
			reports = append(reports, rate)
		}
	}
	return reports
}