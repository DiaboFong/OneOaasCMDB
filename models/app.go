package models

import (
	"errors"
	"log"
	"strings"

	"github.com/astaxie/beego"
	"github.com/astaxie/beego/validation"
	"time"
	"fmt"
	"github.com/astaxie/beego/orm"
)

/*
应用字段app
应用ID 默认为0，表示未知APP
Appid       应用ID
AppName     应用名称
ParentAppid 父应用ID
TeamOwn     团队属主
DevOwn      开发属主
OpsOwn      运维属主
OterhMsg    其他信息
*/

type App struct {
	AppId       int64        `orm:"column(appid);pk;auto"`
	AppName     string       `orm:"size(255),unique"`
	AppParentId int64        `orm:"null"`
	TeamOwn     string       `orm:"column(teamown);size(255);null"`
	AppCode     string       `orm:"size(255);null"`
	AppOwn      string       `orm:"size(255);null"`
	DevOwn      string       `orm:"column(devown);size(255);null"`
	OpsOwn      string       `orm:"column(opsown);size(255);null"`
	Comment     string       `orm:"column(comment);size(255);null"`
	Level       *AppLevel    `orm:"rel(fk)"`
	Server      []*Server    `orm:"reverse(many)"`
	IpAddress   []*IpAddress `orm:"reverse(many)"`
	Enable      bool         `orm:"column(enable);size(1);null"`
	CreateTime  time.Time    `orm:"column(createtime);auto_now;type(datetime)"`
	CreateBy    string       `orm:"column(createby);size(100);null"`
	UpdateBy    string       `orm:"column(updateby);size(100);null"`
	UpdateTime  time.Time    `orm:"column(updatetime);auto_now;type(datetime)"`
}

//type AppParent struct {
//	Appid       int64 `orm:"column(appid)"`
//	Appparentid int64 `orm:"column(appparentid);null"`
//	AppLevel    int64 `orm:"column(applevel);null"`
//}

//type AppAttribute struct {
//	Appid   int64  `orm:"column(Appid)"`
//	Teamown string `orm:column(teamown);size(255);null`
//	Devown  string `orm:column(devown);size(255);null`
//	Opsown  string `orm:column(opsown);size(255);null`
//	Comment string `orm:column(comment);size(255);null`
//}

// 设置引擎为 INNODB
func (u *App) TableEngine() string {
	return "INNODB"
}

func (this *App) TableName() string {
	return "app"
}

func checkapp(a App) error {
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

func AddApp(a App) (int64, error) {
	if err := checkapp(a); err != nil {
		return 0, err
	}

	exist := Orm.QueryTable("app").Filter("AppName", a.AppName).Exist()
	if exist {
		return 0, errors.New(a.AppName + "业务模块已存在")
	}

	id, err := Orm.Insert(&a)
	if err != nil {
		_, errorCode := dbErrorParse(err.Error())
		if errorCode == 1062 {
			return 0, errors.New("APP已存在")
		} else {
			return 0, errors.New("添加APP出现异常")
		}
	}
	return id, err
}

func DelApp(id int64) error {
	exist := Orm.QueryTable("server").Filter("app_id", id).Exist()
	if exist {
		return errors.New("该业务正在使用中")
	}

	rows, err := Orm.QueryTable("App").Filter("Appid", id).Update(orm.Params{
		"enable": false,
	})
	if rows == 0 {
		return errors.New("ERROR_NOT_FOUND")
	}
	if err != nil {
		return err
	}
	return nil
}

func HardDelApp(id int64) error {
	_, err := Orm.QueryTable("App").Filter("Appid", id).Delete()
	if err != nil {
		return err
	}
	return nil
}

func GetApp(query map[string]string, sort string, order string, offset int64, limit int64, name string, level string, start_time string, end_time string) (entityArray []interface{}, total int64) {
	var appArray = make([]App, 0)
	var totalArray = make([]App, 0)

	querySql := fmt.Sprintf(" select app.* from app")
	totalSql := fmt.Sprintf(" select app.* from app")

	v := query["enable"]
	if v !=""{
		querySql = fmt.Sprintf(" %s where app.enable=%s ",querySql,v)
		totalSql = fmt.Sprintf(" %s where app.enable=%s ",totalSql,v)
	}else{
		querySql = fmt.Sprintf(" %s where ",querySql)
		totalSql = fmt.Sprintf(" %s where ",totalSql)
	}

	v = query["search"]
	if v != "" {
		querySql = fmt.Sprintf(" %s and app.app_name like '%%%s%%' ",querySql,v)
		querySql = fmt.Sprintf(" %s or ",querySql)
		querySql = fmt.Sprintf(" %s app.comment like '%%%s%%' ",querySql,v)

		totalSql = fmt.Sprintf(" %s and app.app_name like '%%%s%%' ",totalSql,v)
		totalSql = fmt.Sprintf(" %s or ",totalSql)
		totalSql = fmt.Sprintf(" %s app.comment like '%%%s%%' ",totalSql,v)
	}

	if name != "" {
		querySql = fmt.Sprintf(" %s and app_name = '%s' ",querySql,name)
		totalSql = fmt.Sprintf(" %s and app_name = '%s' ",totalSql,name)
	}

	if level != "" {
		querySql = fmt.Sprintf(" %s and level_id in (%s) ",querySql,level)
		totalSql = fmt.Sprintf(" %s and level_id in (%s) ",totalSql,level)
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

	_,err = Orm.Raw(querySql).QueryRows(&appArray)
	if err == nil{
		for _, v := range appArray {
			applevel, _ := GetAppLevelById(v.Level.Id)
			v.Level = applevel
			entityArray = append(entityArray, v)
		}
	}
	return entityArray, total
}

func CountApp(query map[string]string) (total int64, err error) {
	qs := Orm.QueryTable("app")
	// query k=v
	for k, v := range query {
		k = strings.Replace(k, ".", "__", -1)
		beego.Info("查询业务模块的当前key", k, "值是", v)
		qs = qs.Filter(k, v)
	}
	return qs.Count()
}

func AppGetById(id int64) (*App, error) {
	obj := &App{
		AppId: id,
	}
	err := Orm.Read(obj)
	if err != nil {
		return nil, err
	}
	return obj, nil
}

func PutApp(m *App) (err error) {
	_, err = Orm.Update(m)
	if err != nil {
		return err
	} else {
		return nil
	}
}
