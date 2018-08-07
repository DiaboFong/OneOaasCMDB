package models

import (
	"errors"
	"github.com/astaxie/beego"
	"strings"
	"time"
)

//id
//created
//user_id
//user_name
//module_name
//module_display_name
//entity_name
//entity_display_name
//instance_id
//instance_display_name
//operation
//cause
type SystemLog struct {
	Id                  int64     `orm:"pk;auto"`
	UserId              int64     `orm:"null"`
	UserName            string    `orm:"size(20);"`
	ModuleName          string    `orm:"size(20);"`
	ModuleDisplayName   string    `orm:"size(20);"`
	EntityName          string    `orm:"size(20);"`
	EntityDisplayName   string    `orm:"size(20);"`
	InstanceId          string    `orm:"size(20);"`
	InstanceDisplayName string    `orm:"size(20);"`
	Operation           string    `orm:"size(20);"`
	Cause               string    `orm:"size(100);"`
	CreateTime          time.Time `orm:"null;type(datetime)"`
	CreateBy            string    `orm:"size(100);null"`
	UpdateBy            string    `orm:"size(100);null"`
	UpdateTime          time.Time `orm:"null;type(datetime)"`
}

func (this *SystemLog) TableEngine() string {
	return "INNODB"
}

func (this *SystemLog) TableName() string {
	return "system_log"
}

func (this *SystemLog) AddLog() bool {
	_, err := Orm.Insert(this)
	if err != nil {
		beego.Error("添加日志错误", err.Error())
		return false
	}
	return true
}

//func (this *SystemLog) DelLog() bool{
//	_,err := Orm.Delete(this)
//	if err != nil{
//		beego.Error("删除日志错误",err.Error())
//		return false
//	}
//	return true
//}

func DelLog(id int64) error {
	rows, err := Orm.QueryTable("system_log").Filter("Id", id).Delete()
	if err != nil {
		return err
	}

	if rows == 0 {
		return errors.New("ERROR_NOT_FOUND")
	}
	return nil
}

func (this *SystemLog) QueryLog() []SystemLog {
	var allLog []SystemLog
	_, err := Orm.QueryTable("SystemLog").All(&allLog)
	if err != nil {
		beego.Error("查询日志错误", err.Error())
	}
	return allLog
}

func GetLog(query map[string]string, sort []string, order []string, offset int64, limit int64) (ml []interface{}, err error) {
	//定义存储对象
	var logArray = make([]SystemLog, 0) //存储返回数据

	//查询日志表
	qs := Orm.QueryTable("system_log")

	//构造排序字段,默认升序,降序加-号
	var sortFields []string
	if len(sort) >= 0 {
		for _, v := range sort {
			var orderby string
			if order[0] == "desc" {
				orderby = "-" + v
			} else if order[0] == "asc" {
				orderby = v
			}
			sortFields = append(sortFields, orderby)
		}
		qs = qs.OrderBy(sortFields...)
	}

	//执行过滤排序
	for k, v := range query {
		qs = qs.Filter(k, v)
	}

	//构造返回数据
	if limit >=0 && offset >=0{
		if _, err := qs.Limit(limit, offset).All(&logArray); err == nil {
			for _, v := range logArray {
				ml = append(ml, v)
			}
			return ml, nil
		}
	}else{
		if _, err := qs.All(&logArray); err == nil {
			for _, v := range logArray {
				ml = append(ml, v)
			}
			return ml, nil
		}
	}


	return nil, err
}

func CountLog(query map[string]string) (total int64, err error) {
	qs := Orm.QueryTable("system_log")
	// query k=v
	for k, v := range query {
		k = strings.Replace(k, ".", "__", -1)
		beego.Info("查询日志的当前key", k, "值是", v)
		qs = qs.Filter(k, v)
	}
	return qs.Count()
}
