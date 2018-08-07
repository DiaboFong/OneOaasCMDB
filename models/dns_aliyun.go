package models

import (
	"errors"
	"fmt"
	"log"
	"reflect"
	"strings"

	"github.com/astaxie/beego/validation"
	"time"
)

/*
功能：
DNS管理

DNS ID         dnsid 是
来源           from   是   Aliyundns aliyun
名称           pr     是
记录类型        type   是
TTL更新时间     ttl    是
记录地址        value 是
优先级          priority 否
是否开启        enabled  否
状态            status  是
更新时间         updated_on 否
备注             comment


/aliyun
RequestId   String  唯一请求识别码
RecordId    String  解析记录的ID
RR          String  主机记录
Type        String  记录类型
Value       String  记录值
TTL         Long    生存时间
Priority    Long    MX记录的优先级
Line        String  解析线路
Status      String  解析记录状态，   Enable/Disable
Locked      Boolean 解析记录锁定状态，true/false

//Aliyundns
records:
id:              记录ID编号
sub_domain:            主机记录
line:            解析线路, 详见 Record.Line 接口
type:            记录类型, 详见 Record.Type 接口
ttl:             记录的 TTL 值
value:           记录值
mx:              记录的 MX 记录值, 非 MX 记录类型，默认为 0
enabled:         记录状态 “0”: 禁用 “1”: 启用
status:          系统内部标识状态, 开发者可忽略
monitor_status:  该记录的D监控状态 “Ok”: 服务器正常 “Warn”: 该记录有报警, 服务器返回 4XX “Down”: 服务器宕机 “”: 该记录未开启D监控
remark:          记录备注
updated_on:      记录最后更新时间
use_aqb:         是否开通网站安全中心   “yes”: 已经开启   “no”: 未开启


            "id": "16158918",
            "name": "www",
            "line": "默认",
            "type": "A",
            "ttl": "600",
            "value": "218.241.99.140",
            "mx": "0",
            "enabled": "1",
            "status": "enabled",
            "monitor_status": "",
            "remark": "",
            "updated_on": "2015-01-18 20:59:25",
            "use_aqb": "no"
*/

type Aliyundns struct {
	Aliyundnsid   int64  `orm:"column(Aliyundnsid);auto"`
	Aliyundnsname string `orm:"column(Aliyundnsname);size(255),unique;null"`
	Status        int64  `orm:"column(status);size(11);null"`
	Aliyundnsno   string `orm:"column(Aliyundnsno);size(255);null"`
	Docpath       string `orm:"column(docpath);size(255);null"`
	Doctype       string `orm:"column(doctype);size(255);null"`
	Comment       string `orm:"column(comment);size(512);null"`
	Enable        bool         `orm:"column(enable);size(1);null"`
	CreateTime    time.Time    `orm:"column(createtime);auto_now_add;type(datetime)"`
	CreateBy      string       `orm:"column(createby);size(100);null"`
	UpdateBy      string       `orm:"column(updateby);size(100);null"`
	UpdateTime    time.Time    `orm:"column(updatetime);auto_now;type(datetime)"`
}

type Aliyundnstoken struct {
}

type Aliyundnsdomain struct {
}

type Aliyundnsrecord struct {
}

// 设置引擎为 INNODB
func (u *Aliyundns) TableEngine() string {
	return "INNODB"
}

func (this *Aliyundns) TableName() string {
	return "Aliyundns"
}

func checkAliyundns(a Aliyundns) error {
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

func AliyundnsAdd(a Aliyundns) (int64, error) {
	if err := checkAliyundns(a); err != nil {
		return 0, err
	}
	id, err := Orm.Insert(&a)
	if err != nil {
		_, errorCode := dbErrorParse(err.Error())
		if errorCode == 1062 {
			return 0, errors.New("Aliyundns已存在")
		} else {
			return 0, errors.New("添加Aliyundns出现异常")
		}
	}

	return id, err
}

func AliyundnsDel(id int64) error {
	rows, err := Orm.QueryTable("Aliyundns").Filter("Aliyundnsid", id).Delete()
	if err != nil {
		return err
	}
	if rows == 0 {
		return errors.New("ERROR_NOT_FOUND")
	}
	return nil
}

//func AliyundnsGet() (*[]Aliyundns, error) {
//    var a *[]Aliyundns = new([]Aliyundns)
//    _, err := Orm.QueryTable("Aliyundns").All(a)
//    return a, err
//}

func GetAliyundns(query map[string]string, fields []string, sort []string, order []string,
	offset int64, limit int64) (ml []interface{}, err error) {
	//o := orm.NewOrm()
	qs := Orm.QueryTable("Aliyundns")
	// query k=v
	for k, v := range query {
		// rewrite dot-notation to Object__Attribute
		k = strings.Replace(k, ".", "__", -1)
		qs = qs.Filter(k, v)
	}
	// order by:
	var sortFields []string
	if len(sort) != 0 {
		if len(sort) == len(order) {
			// 1) for each sort field, there is an associated order
			for i, v := range sort {
				orderby := ""
				if order[i] == "desc" {
					orderby = "-" + v
				} else if order[i] == "asc" {
					orderby = v
				} else {
					orderby = "asc"
					//return nil, errors.New("Error: Invalid order. Must be either [asc|desc]")
				}
				sortFields = append(sortFields, orderby)
			}
			qs = qs.OrderBy(sortFields...)
		} else if len(sort) != len(order) && len(order) == 1 {
			// 2) there is exactly one order, all the sorted fields will be sorted by this order
			for _, v := range sort {
				orderby := ""
				if order[0] == "desc" {
					orderby = "-" + v
				} else if order[0] == "asc" {
					orderby = v
				} else {
					return nil, errors.New("Error: Invalid order. Must be either [asc|desc]")
				}
				sortFields = append(sortFields, orderby)
			}
		} else if len(sort) != len(order) && len(order) == 0 {
			// 3) there is exactly one order, all the sorted fields default asc
			for _, v := range sort {
				orderby := ""
				orderby = v
				sortFields = append(sortFields, orderby)
			}
		} else if len(sort) != len(order) && len(order) != 1 {
			return nil, errors.New("Error: 'sort', 'order' sizes mismatch or 'order' size is not 1")
		}
	} else {
		if len(order) != 0 {
			return nil, errors.New("Error: unused 'order' fields")
		}
	}

	var l []Aliyundns
	qs = qs.OrderBy(sortFields...)
	if _, err := qs.Limit(limit, offset).All(&l, fields...); err == nil {
		if len(fields) == 0 {
			for _, v := range l {
				ml = append(ml, v)
			}
		} else {
			// trim unused fields
			for _, v := range l {
				m := make(map[string]interface{})
				val := reflect.ValueOf(v)
				for _, fname := range fields {
					m[fname] = val.FieldByName(fname).Interface()
				}
				ml = append(ml, m)
			}
		}
		return ml, nil
	}
	return nil, err
}

func UpdateAliyundnsById(m Aliyundns) (err error) {
	if err = Orm.Read(&m); err == nil {
		var num int64
		if num, err = Orm.Update(m); err == nil {
			fmt.Println("Number of records updated in database:", num)
		}
	}
	return
}
