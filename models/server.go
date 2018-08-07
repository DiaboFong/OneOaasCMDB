package models

import (
	"errors"
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/validation"
	"log"
	"strings"
	"time"
	"fmt"
	"oneoaas.com/cmdb/util"
	"github.com/astaxie/beego/orm"
	"github.com/pborman/uuid"
)

type Server struct {
	ServerId     int64           `orm:"column(serverid);auto"`
	ServerUuid   string  	     `orm:"column(server_uuid);size(32),unique;"`
	Sn           string          `orm:"column(sn);size(255),unique;null"`
	Modle        string          `orm:"column(modle);size(255);null"`
	Ishypervisor int64           `orm:"column(isHpervisor);size(255)"`
	IsServer     int64           `orm:"column(isServer);size(255);null"`
	Ipaddress    string          `orm:"column(ipaddress);size(512)"`
	Hostname     string          `orm:"column(hostname);size(512)"`
	Comment      string          `orm:"column(comment);size(512);null"`
	RackUNumber  int64           `orm:"size(512);null"`
	Manufacturer *Manufacturer   `orm:"rel(fk);null"`
	App          *App            `orm:"rel(fk);null"`
	Rack         *Rack           `orm:"rel(fk);null"`
	Host         *Host           `orm:"rel(fk)"`

	Adapter      []*NetworkAdapter 	      `orm:"reverse(many)"`
	Harddisk     []*Harddisk       	      `orm:"reverse(many)"`
	Memory       []*Memory         	      `orm:"reverse(many)"`
	Cpu          []*Cpu            	      `orm:"reverse(many)"`
	ServerPort   []*ServerPort            `orm:"reverse(many)"`

	Supplier     *Supplier       `orm:"rel(fk);null"` //一个供应商对应多个服务器
	State        *ServerState    `orm:"rel(fk)"`

	Enable       bool         `orm:"column(enable);size(1);null"`
	CreateTime   time.Time    `orm:"column(createtime);auto_now_add;type(datetime)"`
	CreateBy     string       `orm:"column(createby);size(100);null"`
	UpdateBy     string       `orm:"column(updateby);size(100);null"`
	UpdateTime   time.Time    `orm:"column(updatetime);auto_now;type(datetime)"`
}

func (u *Server) TableEngine() string {
	return "INNODB"
}

func checkserver(a Server) error {
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

func AddServer(a Server) (int64, error) {
	exist := Orm.QueryTable("server").Filter("hostname", a.Sn).Exist()
	if exist {
		return 0, errors.New(a.Hostname + "服务器已存在")
	}
	//设置uuid
	a.ServerUuid = uuid.New()
	id, err := Orm.Insert(&a)

	return id, err
}

func DelServer(id int64) error {
	rows, err := Orm.QueryTable("server").Filter("ServerId", id).Update(orm.Params{
		"enable": false,
	})
	beego.Debug("删除后返回值是,", rows)
	if rows == 0 {
		return errors.New("ERROR_NOT_FOUND")
	}
	if err != nil {
		return err
	}
	return nil
}

func HardDelServer(id int64) error {
	_, err := Orm.QueryTable("server").Filter("ServerId", id).Delete()
	if err != nil {
		return err
	}
	return nil
}

func GetServer(query map[string]string, sort string, order string, offset int64, limit int64, sn string, state string, manufacturer string, supplier string, rack string, start_time string, end_time string) (entityArray []interface{}, total int64) {
	var serverArray = make([]Server, 0)
	var totalArray = make([]Server, 0)

	querySql := fmt.Sprintf(" select sr.* from server AS sr")
	totalSql := fmt.Sprintf(" select sr.* from server AS sr")

	v := query["enable"]
	if v !=""{
		querySql = fmt.Sprintf(" %s where sr.enable=%s ",querySql,v)
		totalSql = fmt.Sprintf(" %s where sr.enable=%s ",totalSql,v)
	}else{
		querySql = fmt.Sprintf(" %s where ",querySql)
		totalSql = fmt.Sprintf(" %s where ",totalSql)
	}

	v = query["search"]
	if v != "" {
		querySql = fmt.Sprintf(" %s and sr.Sn like '%%%s%%' ",querySql,v)
		querySql = fmt.Sprintf(" %s or ",querySql)
		querySql = fmt.Sprintf(" %s sr.Comment like '%%%s%%' ",querySql,v)

		totalSql = fmt.Sprintf(" %s and sr.Sn like '%%%s%%' ",totalSql,v)
		totalSql = fmt.Sprintf(" %s or ",totalSql)
		totalSql = fmt.Sprintf(" %s sr.Comment like '%%%s%%' ",totalSql,v)
	}

	for key,value := range query{
		fmt.Println("key:",key)
		fmt.Println("val:",value)
	}

	if sn != "" {
		querySql = fmt.Sprintf(" %s and sn = '%s' ",querySql,sn)
		totalSql = fmt.Sprintf(" %s and sn = '%s' ",totalSql,sn)
	}

	if state != "" {
		querySql = fmt.Sprintf(" %s and state_id in (%s) ",querySql,state)
		totalSql = fmt.Sprintf(" %s and state_id in (%s) ",totalSql,state)
	}

	if manufacturer != "" {
		querySql = fmt.Sprintf(" %s and manufacturer_id in (%s) ",querySql,manufacturer)
		totalSql = fmt.Sprintf(" %s and manufacturer_id in (%s) ",totalSql,manufacturer)
	}

	if supplier != "" {
		querySql = fmt.Sprintf(" %s and supplier_id in (%s) ",querySql,supplier)
		totalSql = fmt.Sprintf(" %s and supplier_id in (%s) ",totalSql,supplier)
	}

	if rack != "" {
		querySql = fmt.Sprintf(" %s and rack_id in (%s) ",querySql,rack)
		totalSql = fmt.Sprintf(" %s and rack_id in (%s) ",totalSql,rack)
	}

	if start_time != "" && end_time != ""{
		querySql = fmt.Sprintf(" %s and createtime >= '%s' and createtime <= '%s' ",querySql,start_time,end_time)
		totalSql = fmt.Sprintf(" %s and createtime >= '%s' and createtime <= '%s' ",totalSql,start_time,end_time)
	}

	if limit>=0 && offset >=0{
		querySql = fmt.Sprintf(" %s limit %d offset %d ",querySql,limit,offset)
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

	_,err = Orm.Raw(querySql).QueryRows(&serverArray)
	if err == nil{
		for _, v := range serverArray {
			state, _ := GetServerStateById(v.State.Id)
			manufacturer, _ := GetManufacturerById(v.Manufacturer.Id)
			supplier, _ := SupplierGetById(v.Supplier.Id)

			//cpu, _ := GetCpuById(v.Cpu.Id)
			//memory, _ := GetMemoryById(v.Memory.Id)
			//harddisk, _ := GetHarddiskById(v.Harddisk.Id)
			//adapter, _ := GetNetworkAdapterById(v.Adapter.Id)

			host, _ := GetHostById(v.Host.Id)
			rack, _ := RackGetById(v.Rack.RackId)
			app, _ := AppGetById(v.App.AppId)
			v.State = state
			v.Manufacturer = manufacturer
			v.Supplier = supplier

			//v.Cpu = cpu
			//v.Memory = memory
			//v.Harddisk = harddisk
			//v.Adapter = adapter

			v.Host = host
			v.Rack = rack
			v.App = app
			entityArray = append(entityArray, v)
		}
	}

	return entityArray, total
}

func PullServer() ([]*Server,error) {
	serverList := make([]*Server,0)
	_,err := Orm.QueryTable("server").All(&serverList)
	if err != nil{
		return nil,err
	}else{
		return serverList,nil
	}
}

func CountServer(query map[string]string) (total int64, err error) {
	qs := Orm.QueryTable("server")
	// query k=v
	for k, v := range query {
		k = strings.Replace(k, ".", "__", -1)
		qs = qs.Filter(k, v)
	}

	return qs.Count()
}

func (this *Server) CountServerByMonth(query map[string]string) ([]interface{}, error) {
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
		querySql = fmt.Sprintf(" SELECT COUNT(*) AS Num FROM server WHERE createtime LIKE '%s%%' ",monthNum)
		o.Raw(querySql).Values(&maps)

		num := maps[0]["Num"]
		numArray = append(numArray, num)
	}

	return numArray, nil
}

func ServerGetById(id int64) (*Server, error) {
	if id <= 0 {
		return nil,errors.New("请求资源无效")
	}
	obj := &Server{
		ServerId: id,
	}
	err := Orm.Read(obj)
	if err != nil {
		return nil, err
	}
	return obj, nil
}

func ServerGetByuuId(uuid string) (*Server, error) {
	if len(uuid) == 0 {
		return nil,errors.New("请求资源无效")
	}
	pServerObj := new(Server)
	err := Orm.QueryTable("server").Filter("server_uuid",uuid).One(pServerObj)
	if err != nil {
		return nil, err
	}
	return pServerObj, nil
}

func PutServer(m *Server) (err error) {
	if m == nil{
		beego.Error("更新服务器，对象为空")
		return errors.New("更新对象错误")
	}
	_, err = Orm.Update(m)
	if err != nil {
		return err
	} else {
		return nil
	}
}

func (this *Server) UpdateServer() (err error) {
	if this == nil{
		beego.Error("更新服务器，对象为空")
		return errors.New("更新对象错误")
	}
	_, err = Orm.Update(this)
	if err != nil {
		return err
	} else {
		return nil
	}
}

func GetServerReport(reportType string) ([]util.Rate) {
	var reports = make([]util.Rate, 0)
	var ReportTimes = make([]string, 0)
	var ReportNums = make([]string, 0)
	var querySql string
	if reportType == "day" {
		querySql = fmt.Sprintf(" SELECT DATE_FORMAT(createtime,'%%Y%%m%%d') as ReportTime,count(serverid) as ReportNum from server where enable=1 group by ReportTime ")
	} else if reportType == "week" {
		querySql = fmt.Sprintf(" SELECT DATE_FORMAT(createtime,'%%Y%%u')  as ReportTime,count(serverid) as ReportNum from server where enable=1 group by ReportTime ")
	} else if reportType == "month" {
		querySql = fmt.Sprintf(" SELECT DATE_FORMAT(createtime,'%%Y%%m')  as ReportTime,count(serverid) as ReportNum from server where enable=1 group by ReportTime ")
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
	fmt.Printf("%#v\n", reports)
	return reports
}
