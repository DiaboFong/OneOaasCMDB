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
ID   Virttypeid
虚拟化类型 virttype
备注  comment

1 VMware
2 KVM
3 XEN
4 Hyper-V
5 Promox

*/

type Virttype struct {
	Virttypeid int    `orm:"column(virttypeid);auto"`
	Virttype   string `orm:"column(virttype);"`
	Comment    string `orm:"column(comment);size(512);null"`

	Enable     bool         `orm:"column(enable);size(1);null"`
	CreateTime time.Time    `orm:"column(createtime);auto_now_add;type(datetime)"`
	CreateBy   string       `orm:"column(createby);size(100);null"`
	UpdateBy   string       `orm:"column(updateby);size(100);null"`
	UpdateTime time.Time    `orm:"column(updatetime);auto_now;type(datetime)"`
}

// 设置引擎为 INNODB
func (u *Virttype) TableEngine() string {
	return "INNODB"
}

func (this *Virttype) TableName() string {
	return "virttype"
}

func checkVirttype(a Virttype) error {
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

func AddVirttype(a Virttype) (int64, error) {
	if err := checkVirttype(a); err != nil {
		return 0, err
	}
	id, err := Orm.Insert(&a)
	if err != nil {
		_, errorCode := dbErrorParse(err.Error())
		if errorCode == 1062 {
			return 0, errors.New("Virttype已存在")
		} else {
			return 0, errors.New("添加Virttype出现异常")
		}
	}
	return id, err
}

func DelVirttype(id int64) error {
	rows, err := Orm.QueryTable("Virttype").Filter("Virttypeid", id).Delete()
	if err != nil {
		return err
	}
	if rows == 0 {
		return errors.New("ERROR_NOT_FOUND")
	}
	return nil
}

//func VirttypeGet() (*[]Virttype, error) {
//    var a *[]Virttype = new([]Virttype)
//    _, err := Orm.QueryTable("Virttype").All(a)
//    return a, err
//}

func GetVirttype(query map[string]string, fields []string, sort []string, order []string,
	offset int64, limit int64) (ml []interface{}, err error) {
	//o := orm.NewOrm()
	qs := Orm.QueryTable("virttype")
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

	var l []Virttype
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

func UpdateVirttypeById(m Virttype) (err error) {
	if err = Orm.Read(&m); err == nil {
		var num int64
		if num, err = Orm.Update(m); err == nil {
			fmt.Println("Number of records updated in database:", num)
		}
	}
	return
}
