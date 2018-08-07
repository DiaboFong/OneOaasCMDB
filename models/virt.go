package models

import (
	"errors"
	"fmt"
	"github.com/astaxie/beego/validation"
	"log"
	"reflect"
	"strings"
	"time"
)

/*
ID   Virtid
序列号  UUID
虚拟化类型 virttype
CPU  cpu
内存  memory
硬盘  harddisk
网卡  networkcrad
宿主机 hypervisorid
主机名 Hostname
业务名称 Appid
备注  comment

*/

type Virt struct {
	Virtid       int64  `orm:"column(virtid);auto"`
	Uuid         string `orm:"column(sn);size(255),unique;null"`
	Virttypeid   int    `orm:"column(virttypeid);"`
	Cpu          string `orm:"column(cpu);size(255)"`
	Memory       string `orm:"column(memory);size(255)"`
	Harddisk     string `orm:"column(harddisk);size(255)"`
	Networkcard  string `orm:"column(networkcard);size(255)"`
	Hypervisorid string `orm:"column(ishypervisor);size(255)"`
	Hostname     string `orm:"column(hostname);size(255)"`
	Appid        string `orm:"column(appid);size(255)"`
	Comment      string `orm:"column(comment);size(512);null"`

	Enable       bool         `orm:"column(enable);size(1);null"`
	CreateTime   time.Time    `orm:"column(createtime);auto_now_add;type(datetime)"`
	CreateBy     string       `orm:"column(createby);size(100);null"`
	UpdateBy     string       `orm:"column(updateby);size(100);null"`
	UpdateTime   time.Time    `orm:"column(updatetime);auto_now;type(datetime)"`
}

// 设置引擎为 INNODB
func (u *Virt) TableEngine() string {
	return "INNODB"
}

func (this *Virt) TableName() string {
	return "virt"
}

func checkVirt(a Virt) error {
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

func AddVirt(a Virt) (int64, error) {
	if err := checkVirt(a); err != nil {
		return 0, err
	}
	id, err := Orm.Insert(&a)
	if err != nil {
		_, errorCode := dbErrorParse(err.Error())
		if errorCode == 1062 {
			return 0, errors.New("Virt已存在")
		} else {
			return 0, errors.New("添加Virt出现异常")
		}
	}
	return id, err
}

func DelVirt(id int64) error {
	rows, err := Orm.QueryTable("Virt").Filter("Virtid", id).Delete()
	if err != nil {
		return err
	}
	if rows == 0 {
		return errors.New("ERROR_NOT_FOUND")
	}
	return nil
}

//func VirtGet() (*[]Virt, error) {
//    var a *[]Virt = new([]Virt)
//    _, err := Orm.QueryTable("Virt").All(a)
//    return a, err
//}

func GetVirt(query map[string]string, fields []string, sort []string, order []string,
	offset int64, limit int64) (ml []interface{}, err error) {
	//o := orm.NewOrm()
	qs := Orm.QueryTable("virt")
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
			// 2) there is exactly one order, all the sorted fields will be sorted by this order
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

	var l []Virt
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

func UpdateVirtById(m Virt) (err error) {
	if err = Orm.Read(&m); err == nil {
		var num int64
		if num, err = Orm.Update(m); err == nil {
			fmt.Println("Number of records updated in database:", num)
		}
	}
	return
}
