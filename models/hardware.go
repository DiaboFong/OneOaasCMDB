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
功能:
统计基本的硬件物理信息状态，如SN,配置型号
ID hardwareid
类型 hardwaretypeid
SN hardwaresn
名称 hardwarename
管理IP managerip
是否在线 isonline
生产厂商 manufacturer
状态 status
所在机柜 rackid
注释 Comment

status:
0 未知
1 监控
2 故障
isonline
0 在线
1 下线

rackid
0 默认
>0 实际所在的机柜

*/

type Hardware struct {
	Id           int64          `orm:"column(id);pk;auto"`
	Online       int64          `orm:"size(11);null"`
	HardwareSn   string         `orm:"size(255);null"`
	HardwareName string         `orm:"size(255),unique;null"`
	ManageIp     string         `orm:"size(255),unique;null"`
	Comment      string         `orm:"size(512);null"`
	Rack         *Rack          `orm:"rel(fk);null"`
	Type         *HardwareType  `orm:"rel(fk)"`
	State        *HardwareState `orm:"rel(fk)"`
	Enable       bool         `orm:"column(enable);size(1);null"`
	CreateTime   time.Time    `orm:"column(createtime);auto_now_add;type(datetime)"`
	CreateBy     string       `orm:"column(createby);size(100);null"`
	UpdateBy     string       `orm:"column(updateby);size(100);null"`
	UpdateTime   time.Time    `orm:"column(updatetime);auto_now;type(datetime)"`
}

// 设置引擎为 INNODB
func (u *Hardware) TableEngine() string {
	return "INNODB"
}

func (this *Hardware) TableName() string {
	return "hardware"
}

func checkhardware(a Hardware) error {
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

func AddHardware(a Hardware) (int64, error) {
	if err := checkhardware(a); err != nil {
		beego.Debug("[添加硬件,验证硬件对象信息,发生错误", err.Error(), "]")
		return 0, err
	}

	exist := Orm.QueryTable("hardware").Filter("HardwareName", a.HardwareName).Exist()
	if exist {
		return 0, errors.New(a.HardwareName + "硬件名称已存在")
	}
	/*exist = Orm.QueryTable("hardware").Filter("HardwareSn", a.HardwareSn).Exist()
	if exist {
		return 0, errors.New(a.HardwareSn + "硬件序列号已存在")
	}*/

	id, err := Orm.Insert(&a)
	if err != nil {
		return 0, errors.New("添加硬件错误" + err.Error())
	}
	return id, err
}

func DelHardware(id int64) error {
	rows, err := Orm.QueryTable("hardware").Filter("Id", id).Update(orm.Params{
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

func HardDelHardware(id int64) error {
	_, err := Orm.QueryTable("hardware").Filter("Id", id).Delete()
	if err != nil {
		return err
	}
	return nil
}

func GetHardware(query map[string]string, sort string, order string,
offset int64, limit int64, name string, state string, hardwaretype string, online int64, start_time string, end_time string) (entityArray []interface{}, total int64) {
	var hardwareArray = make([]Hardware, 0)
	var totalArray = make([]Hardware, 0)

	querySql := fmt.Sprintf(" select hd.* from hardware AS hd")
	totalSql := fmt.Sprintf(" select hd.* from hardware AS hd")

	v := query["enable"]
	if v !=""{
		querySql = fmt.Sprintf(" %s where hd.enable=%s ",querySql,v)
		totalSql = fmt.Sprintf(" %s where hd.enable=%s ",totalSql,v)
	}else{
		querySql = fmt.Sprintf(" %s where 1=1 ",querySql)
		totalSql = fmt.Sprintf(" %s where 1=1 ",totalSql)
	}

	v = query["search"]
	if v != "" {
		querySql = fmt.Sprintf(" %s and hd.hardwarename like '%%%s%%' ",querySql,v)
		querySql = fmt.Sprintf(" %s or ",querySql)
		querySql = fmt.Sprintf(" %s hd.hardwaresn like '%%%s%%' ",querySql,v)

		totalSql = fmt.Sprintf(" %s and hd.hardwarename like '%%%s%%' ",totalSql,v)
		totalSql = fmt.Sprintf(" %s or ",totalSql)
		totalSql = fmt.Sprintf(" %s hd.state like '%%%s%%' ",totalSql,v)
	}

	if name != "" {
		querySql = fmt.Sprintf(" %s and hardware_name = '%s' ",querySql,name)
		totalSql = fmt.Sprintf(" %s and hardware_name = '%s' ",totalSql,name)
	}

	if state != "" {
		querySql = fmt.Sprintf(" %s and state_id in (%s) ",querySql,state)
		totalSql = fmt.Sprintf(" %s and state_id in (%s) ",totalSql,state)
	}

	if hardwaretype != "" {
		querySql = fmt.Sprintf(" %s and supplier_id in (%s) ",querySql,hardwaretype)
		totalSql = fmt.Sprintf(" %s and supplier_id in (%s) ",totalSql,hardwaretype)
	}

	if online == 1 {
		querySql = fmt.Sprintf(" %s and online = %d ",querySql,online)
		totalSql = fmt.Sprintf(" %s and online = %d ",totalSql,online)
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

	//使用前端分页时,不需要加limit
	//querySql = fmt.Sprintf(" %s limit %d offset %d ",querySql,limit,offset)
	_,err = Orm.Raw(querySql).QueryRows(&hardwareArray)
	fmt.Println(querySql)
	if err == nil{
		for _, v := range hardwareArray {
			hardwaretype, _ := GetHardwareTypeById(v.Type.Id)
			state, _ := GetHardwareStateById(v.State.Id)
			rack, _ := RackGetById(v.Rack.RackId)
			v.State = state
			v.Rack = rack
			v.Type = hardwaretype
			entityArray = append(entityArray, v)
		}
	}
	return entityArray, total
}

func CountHardware(query map[string]string) (total int64, err error) {
	qs := Orm.QueryTable("hardware")
	// query k=v
	for k, v := range query {
		k = strings.Replace(k, ".", "__", -1)
		beego.Info("查询硬件的当前key", k, "值是", v)
		qs = qs.Filter(k, v)
	}
	return qs.Count()
}
func HardwareGetById(id int64) (*Hardware, error) {
	obj := &Hardware{
		Id: id,
	}
	err := Orm.Read(obj)
	if err != nil {
		return nil, err
	}
	return obj, nil
}

func PutHardware(m *Hardware) (err error) {
	_, err = Orm.Update(m)
	if err != nil {
		return err
	} else {
		return nil
	}
}
