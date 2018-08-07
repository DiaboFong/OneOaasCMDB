package models

import (
	"errors"
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/validation"
	"log"
	"time"
)

type DnspoddomainGrade struct {
	Id         int64           `orm:"column(id);auto"`
	Name       string          `orm:"column(name);size(255),unique;null"`
	Enable     bool            `orm:"column(enable);size(1);null"`
	CreateTime time.Time       `orm:"column(createtime);auto_now_add;type(datetime)"`
	CreateBy   string          `orm:"column(createby);size(100);null"`
	UpdateBy   string          `orm:"column(updateby);size(100);null"`
	UpdateTime time.Time       `orm:"column(updatetime);auto_now;type(datetime)"`
}

func (this *DnspoddomainGrade) TableEngine() string {
	return "INNODB"
}

func (this *DnspoddomainGrade) TableName() string {
	return "dnspoddomain_grade"
}

func GetAllDnspoddomainGrade() []*DnspoddomainGrade {
	var grade []*DnspoddomainGrade
	num, err := Orm.QueryTable("dnspoddomain_grade").All(&grade)
	if err != nil {
		beego.Debug("【查询DNSpod域名等级错误", err.Error(), "]")
	}
	beego.Debug("【查询DNSpod域名等级的记录数据是", num, "]条")
	return grade
}

func GetDnspoddomainGradeById(id int64) (*DnspoddomainGrade, error) {
	obj := &DnspoddomainGrade{
		Id: id,
	}
	err := Orm.Read(obj)
	if err != nil {
		return nil, err
	}
	return obj, nil
}

//查询数据库状态
func GetDnspoddomainGrade(query map[string]string, sort []string, order []string,
	offset int64, limit int64) (ml []interface{}, err error) {

	//定义存储对象
	var dnspoddomainGradeArray = make([]DnspoddomainGrade, 0) //存储返回数据

	//查询域名等级表
	qs := Orm.QueryTable("dnspoddomain_grade")

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
	if _, err := qs.Limit(limit, offset).All(&dnspoddomainGradeArray); err == nil {
		for _, v := range dnspoddomainGradeArray {
			ml = append(ml, v)
		}
		return ml, nil
	}

	return nil, err
}

//统计符合条件的数据记录
func CountDnspoddomainGrade(query map[string]string) (total int64, err error) {
	qs := Orm.QueryTable("dnspoddomain_grade")
	for k, v := range query {
		qs = qs.Filter(k, v)
	}
	return qs.Count()
}

func DelDnspoddomainGrade(id int64) error {
	rows, err := Orm.QueryTable("dnspoddomain_grade").Filter("Id", id).Delete()
	if err != nil {
		return err
	}
	beego.Debug("删除后返回值是,", rows)
	if rows == 0 {
		return errors.New("ERROR_NOT_FOUND")
	}
	return nil
}

func PutDnspoddomainGrade(m *DnspoddomainGrade) (err error) {
	_, err = Orm.Update(m)
	if err != nil {
		return err
	} else {
		return nil
	}
}

func checkDnspoddomainGrade(dnspoddomainGrade DnspoddomainGrade) error {
	valid := validation.Validation{}
	b, _ := valid.Valid(dnspoddomainGrade)
	if !b {
		for _, err := range valid.Errors {
			log.Println(err.Key, err.Message)
			return errors.New(err.Message)
		}
	}
	return nil
}

func AddDnspoddomainGrade(a DnspoddomainGrade) (int64, error) {
	if err := checkDnspoddomainGrade(a); err != nil {
		return 0, err
	}

	exist := Orm.QueryTable("dnspoddomain_grade").Filter("Name", a.Name).Exist()
	if exist {
		return 0, errors.New(a.Name + "域名等级已存在")
	}

	id, err := Orm.Insert(&a)
	if err != nil {
		return 0, errors.New("添加域名等级错误" + err.Error())
	}
	return id, err
}
