package models

import (
	"fmt"
	"net/url"
	"strconv"
	"strings"
	"time"

	"github.com/astaxie/beego"
	"github.com/astaxie/beego/orm"
	"github.com/couchbase/gocb"
	_ "github.com/go-sql-driver/mysql"
)

//定义通用接口
type Operation interface {
	Add() error
	Delete() error
	Update() error
	Query() error
}

//查询参数对象
type QueryParam struct {
	//查询条件
	Query map[string]string
	//列排序条件
	SortColumn map[string]string
	//分页条件
	Offset int64
	Limit  int64
}

//公共常量
var (
	//public
	Bucket *gocb.Bucket
	Orm    orm.Ormer

	//private
	dbtype       string
	dbuser       string
	dbpass       string
	dbhost       string
	dbport       string
	dbname       string
	couchbaseUrl string
	bucketName   string
	dsn          string

	//mysql
	maxIdle int
	maxConn int
)

//注册模型
func setModels() {
	orm.RegisterModel(
		new(Agreement), new(AgreementState), new(App), new(AppLevel),
		new(Datacenter), new(DatacenterRegion), new(DatacenterState),
		new(Dcprofile), new(Hardware), new(HardwareState), new(HardwareType),
		new(Manufacturer), new(NetworkBandwidth), new(NetworkBandwidthState),
		new(InternetServiceProvider),
		//ip管理
		new(IpSubnet), new(IpAddress), new(IpVlan), new(IpVlanDomain),
		//机柜与机房
		new(Rack), new(RackState), new(Room), new(RoomState),
		new(Cpu), new(Memory), new(Harddisk), new(ServerPort),
		new(NetworkAdapter), new(ServerState), new(Host), new(Server), new(Software),
		new(Supplier), new(AccessKey), new(User), new(Virt), new(Virttype), new(Dnspoddomain),
		new(DnspoddomainState), new(DnspoddomainGrade), new(Dnspodrecordsmsg),
		new(Dnspodtoken), new(Menu), new(Role), new(SystemEmail), new(SystemLog), new(ResourcePlatformAccount),
		new(SystemLicence), new(VmAliyun), new(VmAws),
		new(VmVmware), new(Asserts), new(AssertsInstance), new(Province), new(City),
		new(ZabbixHost), new(TopoLine), new(TopoNode), new(TopoView), new(SystemPanel), new(SystemColor),
		new(ResourceReport), new(DevicePerformanceReport), new(SystemApiCall),
	)
}

func setMysql() {
	dbtype = beego.AppConfig.String("dbtype")
	if len(dbtype) == 0 {
		dbtype = "mysql"
	}
	dbuser = beego.AppConfig.String("dbuser")
	if len(dbuser) == 0 {
		dbuser = "oneoaas"
	}
	dbpass = beego.AppConfig.String("dbpass")
	if len(dbpass) == 0 {
		dbpass = "oneoaas@2A"
	}

	dbhost = beego.AppConfig.String("dbhost")
	if len(dbhost) == 0 {
		dbhost = "10.0.2.47"
	}
	dbport = beego.AppConfig.String("dbport")
	if len(dbport) == 0 {
		dbport = "3306"
	}
	dbname = beego.AppConfig.String("dbname")
	if len(dbname) == 0 {
		dbname = "oneoaas_cmdb_6"
	}
	switch dbtype {
	case "mysql":
		dsn = fmt.Sprintf("%s:%s@tcp(%s:%s)/%s?charset=utf8", dbuser, dbpass, dbhost, dbport, dbname) + "&loc=" + url.QueryEscape("Local")
		break
	case "postgres":
		dsn = fmt.Sprintf("postgres://%s:%s@:%s/%s?sslmode=%s&host=%s", url.QueryEscape(dbuser), url.QueryEscape(dbpass), dbport, dbname, "disable", dbhost)
		break
	default:
		beego.Error("不支持此类型数据库")
	}

	maxIdle = 30
	maxConn = 50
}

func setCouchbase() {
	couchbaseUrl = beego.AppConfig.String("couchbaseUrl")
	bucketName = beego.AppConfig.String("bucketName")
	cluster, _ := gocb.Connect(couchbaseUrl)
	Bucket, _ = cluster.OpenBucket(bucketName, "")
}

func setBeego() {
	beego.BConfig.WebConfig.Session.SessionProviderConfig = dsn
}

func createAdminUser() {
	var users []User
	createTime := fmt.Sprintf(time.Now().Format("2006-01-02 15:04:05"))
	insertSql := fmt.Sprintf("INSERT INTO user (name, login_name, email, contact_phone, password, salt, registertime, updatetime) VALUES ('oneoaas', 'admin', '', '', '23d68a0f00ed8614d4e836f20ce018dd', 'xwQQoxl6n7`!@.[#', '%s','%s' )", createTime, createTime)
	selectSql := fmt.Sprintf("SELECT userid, name FROM user ")
	createSql := fmt.Sprintf("CREATE TABLE if not exists  session(session_key CHAR(64) PRIMARY KEY NOT NULL, session_data BLOB, session_expiry INT(11) UNSIGNED NOT NULL)")
	deleteSql := fmt.Sprintf("DELETE FROM session")
	num, err := Orm.Raw(selectSql).QueryRows(&users)
	if err == nil && num == 0 {
		_, err := Orm.Raw(insertSql).Exec()
		if err != nil {
			panic(err.Error())
		}
	}

	_, err = Orm.Raw(createSql).Exec()
	if err != nil {
		panic(err.Error())
	}
	_, err = Orm.Raw(deleteSql).Exec()
	if err != nil {
		panic(err.Error())
	}
}

func init() {
	setMysql()
	setCouchbase()
	setModels()
	setBeego()

	switch dbtype {
	case "mysql":
		orm.RegisterDriver("mysql", orm.DRMySQL)
		break
	case "postgres":
		orm.RegisterDriver("postgres", orm.DRPostgres)
		break
	default:
		beego.Info("不支持", dbtype, "数据库")
	}
	orm.Debug = true
	orm.RegisterDataBase("default", dbtype, dsn, maxIdle, maxConn)
	//force=true 会先删除表,后重建表
	//verbose=true 显示执行信息
	//orm.RunSyncdb("default", false, true)
	Orm = orm.NewOrm()
	Orm.Using("default") // 默认使用 default，你可以指定为其他数据库

	createAdminUser()
}

func dbErrorParse(err string) (string, int64) {
	Parts := strings.Split(err, ":")
	errorMessage := Parts[1]
	Code := strings.Split(Parts[0], "Error ")
	errorCode, _ := strconv.ParseInt(Code[1], 10, 32)
	return errorMessage, errorCode
}

//监控数据中心
func MonitorDatacenter(resource string, enable bool) {
	mysqlBuilder, err := orm.NewQueryBuilder("mysql")
	if err != nil {
		beego.Error(err)
	}

	if enable {
		number, err := Orm.QueryTable(resource).Filter("enable", enable).Count()
		if err != nil {
			beego.Error(err)
		}

		assertsInstance := AssertsInstance{}
		Orm.QueryTable("asserts_instance").Filter("name", resource).One(&assertsInstance)
		assertsInstance.Number = number
		assertsInstance.CreateTime = time.Now()
		assertsInstance.UpdateTime = time.Now()
		assertsInstance.UpdateBy = "admin"
		_, err = Orm.Update(&assertsInstance)
		if err != nil {
			beego.Error(err)
		}
	} else {
		sql := mysqlBuilder.Select("count(*)").From(resource).Where("enable=0").String()
		fmt.Println(sql)
		number, err := Orm.QueryTable(resource).Filter("enable", enable).Count()
		if err != nil {
			beego.Error(err)
		}
		fmt.Println("B:number个数是:", number)
	}
}

//监控机房
func MonitorRoom(resource string, enable bool) {
	mysqlBuilder, err := orm.NewQueryBuilder("mysql")
	if err != nil {
		beego.Error(err)
	}

	if enable {
		number, err := Orm.QueryTable(resource).Filter("enable", enable).Count()
		if err != nil {
			beego.Error(err)
		}

		assertsInstance := AssertsInstance{}
		Orm.QueryTable("asserts_instance").Filter("name", resource).One(&assertsInstance)
		assertsInstance.Number = number
		assertsInstance.CreateTime = time.Now()
		assertsInstance.UpdateTime = time.Now()
		assertsInstance.UpdateBy = "admin"
		_, err = Orm.Update(&assertsInstance)
		if err != nil {
			beego.Error(err)
		}
	} else {
		sql := mysqlBuilder.Select("count(*)").From(resource).Where("enable=0").String()
		fmt.Println(sql)
		number, err := Orm.QueryTable(resource).Filter("enable", enable).Count()
		if err != nil {
			beego.Error(err)
		}
		fmt.Println("B:number个数是:", number)
	}
}

//监控机柜
func MonitorRack(resource string, enable bool) {
	mysqlBuilder, err := orm.NewQueryBuilder("mysql")
	if err != nil {
		beego.Error(err)
	}

	if enable {
		number, err := Orm.QueryTable(resource).Filter("enable", enable).Count()
		if err != nil {
			beego.Error(err)
		}

		assertsInstance := AssertsInstance{}
		Orm.QueryTable("asserts_instance").Filter("name", resource).One(&assertsInstance)
		assertsInstance.Number = number
		assertsInstance.CreateTime = time.Now()
		assertsInstance.UpdateTime = time.Now()
		assertsInstance.UpdateBy = "admin"
		_, err = Orm.Update(&assertsInstance)
		if err != nil {
			beego.Error(err)
		}
	} else {
		sql := mysqlBuilder.Select("count(*)").From(resource).Where("enable=0").String()
		fmt.Println(sql)
		number, err := Orm.QueryTable(resource).Filter("enable", enable).Count()
		if err != nil {
			beego.Error(err)
		}
		fmt.Println("B:number个数是:", number)
	}
}

//监控带宽
func MonitorBandwidth(resource string, enable bool) {
	mysqlBuilder, err := orm.NewQueryBuilder("mysql")
	if err != nil {
		beego.Error(err)
	}

	if enable {
		number, err := Orm.QueryTable(resource).Filter("enable", enable).Count()
		if err != nil {
			beego.Error(err)
		}

		assertsInstance := AssertsInstance{}
		Orm.QueryTable("asserts_instance").Filter("name", "bandwidth").One(&assertsInstance)
		assertsInstance.Number = number
		assertsInstance.CreateTime = time.Now()
		assertsInstance.UpdateTime = time.Now()
		assertsInstance.UpdateBy = "admin"
		_, err = Orm.Update(&assertsInstance)
		if err != nil {
			beego.Error(err)
		}
	} else {
		sql := mysqlBuilder.Select("count(*)").From(resource).Where("enable=0").String()
		fmt.Println(sql)
		number, err := Orm.QueryTable(resource).Filter("enable", enable).Count()
		if err != nil {
			beego.Error(err)
		}
		fmt.Println("B:number个数是:", number)
	}
}

//监控硬件
func MonitorHardware(resource string, enable bool) {
	mysqlBuilder, err := orm.NewQueryBuilder("mysql")
	if err != nil {
		beego.Error(err)
	}

	if enable {
		number, err := Orm.QueryTable(resource).Filter("enable", enable).Count()
		if err != nil {
			beego.Error(err)
		}

		assertsInstance := AssertsInstance{}
		Orm.QueryTable("asserts_instance").Filter("name", resource).One(&assertsInstance)
		assertsInstance.Number = number
		assertsInstance.CreateTime = time.Now()
		assertsInstance.UpdateTime = time.Now()
		assertsInstance.UpdateBy = "admin"
		_, err = Orm.Update(&assertsInstance)
		if err != nil {
			beego.Error(err)
		}
	} else {
		sql := mysqlBuilder.Select("count(*)").From(resource).Where("enable=0").String()
		fmt.Println(sql)
		number, err := Orm.QueryTable(resource).Filter("enable", enable).Count()
		if err != nil {
			beego.Error(err)
		}
		fmt.Println("B:number个数是:", number)
	}
}

//监控服务器
func MonitorServer(resource string, enable bool) {
	mysqlBuilder, err := orm.NewQueryBuilder("mysql")
	if err != nil {
		beego.Error(err)
	}

	if enable {
		number, err := Orm.QueryTable(resource).Filter("enable", enable).Count()
		if err != nil {
			beego.Error(err)
		}

		assertsInstance := AssertsInstance{}
		Orm.QueryTable("asserts_instance").Filter("name", resource).One(&assertsInstance)
		assertsInstance.Number = number
		assertsInstance.CreateTime = time.Now()
		assertsInstance.UpdateTime = time.Now()
		assertsInstance.UpdateBy = "admin"
		_, err = Orm.Update(&assertsInstance)
		if err != nil {
			beego.Error(err)
		}
	} else {
		sql := mysqlBuilder.Select("count(*)").From(resource).Where("enable=0").String()
		fmt.Println(sql)
		number, err := Orm.QueryTable(resource).Filter("enable", enable).Count()
		if err != nil {
			beego.Error(err)
		}
		fmt.Println("B:number个数是:", number)
	}
}

//监控Ip
func MonitorIp(resource string, enable bool) {
	mysqlBuilder, err := orm.NewQueryBuilder("mysql")
	if err != nil {
		beego.Error(err)
	}

	if enable {
		number, err := Orm.QueryTable(resource).Filter("enable", enable).Count()
		if err != nil {
			beego.Error(err)
		}

		assertsInstance := AssertsInstance{}
		Orm.QueryTable("asserts_instance").Filter("name", "ip").One(&assertsInstance)
		assertsInstance.Number = number
		assertsInstance.CreateTime = time.Now()
		assertsInstance.UpdateTime = time.Now()
		assertsInstance.UpdateBy = "admin"
		_, err = Orm.Update(&assertsInstance)
		if err != nil {
			beego.Error(err)
		}
	} else {
		sql := mysqlBuilder.Select("count(*)").From(resource).Where("enable=0").String()
		fmt.Println(sql)
		number, err := Orm.QueryTable(resource).Filter("enable", enable).Count()
		if err != nil {
			beego.Error(err)
		}
		fmt.Println("B:number个数是:", number)
	}
}

func MonitorDomain(resource string, enable bool) {
	mysqlBuilder, err := orm.NewQueryBuilder("mysql")
	if err != nil {
		beego.Error(err)
	}

	if enable {
		number, err := Orm.QueryTable(resource).Filter("enable", enable).Count()
		if err != nil {
			beego.Error(err)
		}

		assertsInstance := AssertsInstance{}
		Orm.QueryTable("asserts_instance").Filter("name", "domain").One(&assertsInstance)
		assertsInstance.Number = number
		assertsInstance.CreateTime = time.Now()
		assertsInstance.UpdateTime = time.Now()
		assertsInstance.UpdateBy = "admin"
		_, err = Orm.Update(&assertsInstance)
		if err != nil {
			beego.Error(err)
		}
	} else {
		sql := mysqlBuilder.Select("count(*)").From(resource).Where("enable=0").String()
		fmt.Println(sql)
		number, err := Orm.QueryTable(resource).Filter("enable", enable).Count()
		if err != nil {
			beego.Error(err)
		}
		fmt.Println("B:number个数是:", number)
	}
}

func MonitorApp(resource string, enable bool) {
	mysqlBuilder, err := orm.NewQueryBuilder("mysql")
	if err != nil {
		beego.Error(err)
	}

	if enable {
		number, err := Orm.QueryTable(resource).Filter("enable", enable).Count()
		if err != nil {
			beego.Error("统计个数", err)
		}

		assertsInstance := AssertsInstance{}
		Orm.QueryTable("asserts_instance").Filter("name", resource).One(&assertsInstance)
		assertsInstance.Number = number
		assertsInstance.CreateTime = time.Now()
		assertsInstance.UpdateTime = time.Now()
		assertsInstance.UpdateBy = "admin"
		_, err = Orm.Update(&assertsInstance)
		if err != nil {
			beego.Error("更新资产实例", err)
		}
	} else {
		sql := mysqlBuilder.Select("count(*)").From(resource).Where("enable=0").String()
		fmt.Println(sql)
		number, err := Orm.QueryTable(resource).Filter("enable", enable).Count()
		if err != nil {
			beego.Error(err)
		}
		fmt.Println("B:number个数是:", number)
	}
}

func MonitorVcenter(resource string, enable bool) {
	mysqlBuilder, err := orm.NewQueryBuilder("mysql")
	if err != nil {
		beego.Error(err)
	}

	if enable {
		number, err := Orm.QueryTable(resource).Filter("enable", enable).Count()
		if err != nil {
			beego.Error(err)
		}

		assertsInstance := AssertsInstance{}
		Orm.QueryTable("asserts_instance").Filter("name", "vcenter").RelatedSel("Asserts").One(&assertsInstance)
		assertsInstance.Number = number
		assertsInstance.CreateTime = time.Now()
		assertsInstance.UpdateTime = time.Now()
		assertsInstance.UpdateBy = "admin"
		_, err = Orm.Update(&assertsInstance)
		if err != nil {
			beego.Error(err)
		}
	} else {
		sql := mysqlBuilder.Select("count(*)").From(resource).Where("enable=0").String()
		fmt.Println(sql)
		number, err := Orm.QueryTable(resource).Filter("enable", enable).Count()
		if err != nil {
			beego.Error(err)
		}
		fmt.Println("B:number个数是:", number)
	}
}

func MonitorAliyun(resource string, enable bool) {
	mysqlBuilder, err := orm.NewQueryBuilder("mysql")
	if err != nil {
		beego.Error(err)
	}

	if enable {
		number, err := Orm.QueryTable(resource).Filter("enable", enable).Count()
		if err != nil {
			beego.Error(err)
		}

		assertsInstance := AssertsInstance{}
		Orm.QueryTable("asserts_instance").Filter("name", "aliyun").One(&assertsInstance)
		assertsInstance.Number = number
		assertsInstance.CreateTime = time.Now()
		assertsInstance.UpdateTime = time.Now()
		assertsInstance.UpdateBy = "admin"
		_, err = Orm.Update(&assertsInstance)
		if err != nil {
			beego.Error(err)
		}
	} else {
		sql := mysqlBuilder.Select("count(*)").From(resource).Where("enable=0").String()
		fmt.Println(sql)
		number, err := Orm.QueryTable(resource).Filter("enable", enable).Count()
		if err != nil {
			beego.Error(err)
		}
		fmt.Println("B:number个数是:", number)
	}
}

func MonitorAws(resource string, enable bool) {
	mysqlBuilder, err := orm.NewQueryBuilder("mysql")
	if err != nil {
		beego.Error(err)
	}

	if enable {
		number, err := Orm.QueryTable(resource).Filter("enable", enable).Count()
		if err != nil {
			beego.Error(err)
		}

		assertsInstance := AssertsInstance{}
		Orm.QueryTable("asserts_instance").Filter("name", "aws").One(&assertsInstance)
		assertsInstance.Number = number
		assertsInstance.CreateTime = time.Now()
		assertsInstance.UpdateTime = time.Now()
		assertsInstance.UpdateBy = "admin"
		_, err = Orm.Update(&assertsInstance)
		if err != nil {
			beego.Error(err)
		}
	} else {
		sql := mysqlBuilder.Select("count(*)").From(resource).Where("enable=0").String()
		fmt.Println(sql)
		number, err := Orm.QueryTable(resource).Filter("enable", enable).Count()
		if err != nil {
			beego.Error(err)
		}
		fmt.Println("B:number个数是:", number)
	}
}

func MonitorSupplier(resource string, enable bool) {
	mysqlBuilder, err := orm.NewQueryBuilder("mysql")
	if err != nil {
		beego.Error(err)
	}

	if enable {
		number, err := Orm.QueryTable(resource).Filter("enable", enable).Count()
		if err != nil {
			beego.Error(err)
		}

		assertsInstance := AssertsInstance{}
		Orm.QueryTable("asserts_instance").Filter("name", resource).One(&assertsInstance)
		assertsInstance.Number = number
		assertsInstance.CreateTime = time.Now()
		assertsInstance.UpdateTime = time.Now()
		assertsInstance.UpdateBy = "admin"
		_, err = Orm.Update(&assertsInstance)
		if err != nil {
			beego.Error(err)
		}
	} else {
		sql := mysqlBuilder.Select("count(*)").From(resource).Where("enable=0").String()
		fmt.Println(sql)
		number, err := Orm.QueryTable(resource).Filter("enable", enable).Count()
		if err != nil {
			beego.Error(err)
		}
		fmt.Println("B:number个数是:", number)
	}
}

func MonitorAgreement(resource string, enable bool) {
	mysqlBuilder, err := orm.NewQueryBuilder("mysql")
	if err != nil {
		beego.Error(err)
	}

	if enable {
		number, err := Orm.QueryTable(resource).Filter("enable", enable).Count()
		if err != nil {
			beego.Error(err)
		}

		assertsInstance := AssertsInstance{}
		Orm.QueryTable("asserts_instance").Filter("name", resource).One(&assertsInstance)
		assertsInstance.Number = number
		assertsInstance.CreateTime = time.Now()
		assertsInstance.UpdateTime = time.Now()
		assertsInstance.UpdateBy = "admin"
		_, err = Orm.Update(&assertsInstance)
		if err != nil {
			beego.Error(err)
		}
	} else {
		sql := mysqlBuilder.Select("count(*)").From(resource).Where("enable=0").String()
		fmt.Println(sql)
		number, err := Orm.QueryTable(resource).Filter("enable", enable).Count()
		if err != nil {
			beego.Error(err)
		}
		fmt.Println("B:number个数是:", number)
	}
}
