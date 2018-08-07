package models

import (
	"errors"
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/validation"
	"log"
	"time"
)

//制造商
//ID   Manufacturerid
//生产厂商 manufacturer
//邮件 Email
//电话 Telphone
//备注  comment
type Manufacturer struct {
	Id           int64     `orm:"column(id);pk;auto"`
	Manufacturer string    `orm:"column(manufacturer);size(255),unique;null"`
	Email        string    `orm:"column(email);size(11);null"`
	Telphone     string    `orm:"column(telphone);size(11);null"`
	Comment      string    `orm:"column(comment);size(512);null"`
	Server       []*Server `orm:"reverse(many)"`

	Enable       bool         `orm:"column(enable);size(1);null"`
	CreateTime   time.Time    `orm:"column(createtime);auto_now_add;type(datetime)"`
	CreateBy     string       `orm:"column(createby);size(100);null"`
	UpdateBy     string       `orm:"column(updateby);size(100);null"`
	UpdateTime   time.Time    `orm:"column(updatetime);auto_now;type(datetime)"`
}

// 设置引擎为 INNODB
func (u *Manufacturer) TableEngine() string {
	return "INNODB"
}

func (this *Manufacturer) TableName() string {
	return "manufacturer"
}

func checkManufacturer(a Manufacturer) error {
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

func AddManufacturer(a Manufacturer) (int64, error) {
	if err := checkManufacturer(a); err != nil {
		return 0, err
	}
	exist := Orm.QueryTable("manufacturer").Filter("Manufacturer", a.Manufacturer).Exist()
	if exist {
		return 0, errors.New(a.Manufacturer + "制造商已存在")
	}

	id, err := Orm.Insert(&a)
	if err != nil {
		return 0, errors.New("制造商状态错误" + err.Error())
	}
	return id, err
}

func DelManufacturer(id int64) error {
	rows, err := Orm.QueryTable("manufacturer").Filter("Id", id).Delete()
	if err != nil {
		return err
	}
	if rows == 0 {
		return errors.New("ERROR_NOT_FOUND")
	}
	return nil
}

func GetManufacturer(query map[string]string, sort []string, order []string,
	offset int64, limit int64) (ml []interface{}, err error) {
	//定义存储对象
	var manufacturerArray = make([]Manufacturer, 0) //存储返回数据

	//查询制造商表
	qs := Orm.QueryTable("manufacturer")

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
			beego.Debug("排序字段是", orderby)
			sortFields = append(sortFields, orderby)
		}
		qs = qs.OrderBy(sortFields...)
	}

	//执行过滤排序
	for k, v := range query {
		qs = qs.Filter(k, v)
	}

	//构造返回数据
	if _, err := qs.Limit(limit, offset).All(&manufacturerArray); err == nil {
		for _, v := range manufacturerArray {
			ml = append(ml, v)
		}
		return ml, nil
	}

	return nil, err
}

//统计符合条件的数据记录
func CountManufacturer(query map[string]string) (total int64, err error) {
	qs := Orm.QueryTable("manufacturer")
	for k, v := range query {
		qs = qs.Filter(k, v)
	}
	return qs.Count()
}

func PutManufacturer(m *Manufacturer) (err error) {
	_, err = Orm.Update(m)
	if err != nil {
		return err
	} else {
		return nil
	}
}

func GetAllManufacturer() []*Manufacturer {
	var manufacturer []*Manufacturer
	num, err := Orm.QueryTable("manufacturer").All(&manufacturer)
	if err != nil {
		beego.Debug("【查询制造商状态错误", err.Error(), "]")
	}
	beego.Debug("【查询制造商状态的记录数据是", num, "]条")
	return manufacturer
}

func GetManufacturerById(id int64) (*Manufacturer, error) {
	obj := &Manufacturer{
		Id: id,
	}
	err := Orm.Read(obj)
	if err != nil {
		return nil, err
	}
	return obj, nil
}
