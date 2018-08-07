// 操作系统对象
// todo 将主机改为操作系统
package models

import (
	"errors"
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/validation"
	"log"
	"time"
)

type Host struct {
	Id         int64        `orm:"column(id);pk;auto"`
	Name       string       `orm:"column(name);size(255),unique;"`
	Enable     bool         `orm:"column(enable);size(1);null"`
	CreateTime time.Time    `orm:"column(createtime);auto_now_add;type(datetime);null"`
	CreateBy   string       `orm:"column(createby);size(100);null"`
	UpdateBy   string       `orm:"column(updateby);size(100);null"`
	UpdateTime time.Time    `orm:"column(updatetime);auto_now;type(datetime);null"`
	Server     []*Server    `orm:"reverse(many)"`
	IpAddress  []*IpAddress `orm:"column(user_id);reverse(many)"`
}

func (u *Host) TableEngine() string {
	return "INNODB"
}

func (this *Host) TableName() string {
	return "host"
}

func GetAllHost() []*Host {
	var hosts []*Host
	num, err := Orm.QueryTable("host").All(&hosts)
	if err != nil {
		beego.Debug("【查询主机错误", err.Error(), "]")
	}
	beego.Debug("【查询主机的记录数据是", num, "]条")
	return hosts
}

func GetHostById(id int64) (*Host, error) {
	obj := &Host{
		Id: id,
	}
	err := Orm.Read(obj)
	if err != nil {
		return nil, err
	}
	return obj, nil
}

//查询数据库状态
func GetHost(query map[string]string, sort []string, order []string,
	offset int64, limit int64) (ml []interface{}, err error) {

	//定义存储对象
	var hostArray = make([]Host, 0) //存储返回数据

	//查询主机表
	qs := Orm.QueryTable("host")

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
	if _, err := qs.Limit(limit, offset).All(&hostArray); err == nil {
		for _, v := range hostArray {
			ml = append(ml, v)
		}
		return ml, nil
	}

	return nil, err
}

//统计符合条件的数据记录
func CountHost(query map[string]string) (total int64, err error) {
	qs := Orm.QueryTable("host")
	for k, v := range query {
		qs = qs.Filter(k, v)
	}
	return qs.Count()
}

func DelHost(id int64) error {
	rows, err := Orm.QueryTable("host").Filter("Id", id).Delete()
	if err != nil {
		return err
	}
	beego.Debug("删除后返回值是,", rows)
	if rows == 0 {
		return errors.New("ERROR_NOT_FOUND")
	}
	return nil
}

func PutHost(m *Host) (err error) {
	_, err = Orm.Update(m)
	if err != nil {
		return err
	} else {
		return nil
	}
}

func checkHost(host Host) error {
	valid := validation.Validation{}
	b, _ := valid.Valid(host)
	if !b {
		for _, err := range valid.Errors {
			log.Println(err.Key, err.Message)
			return errors.New(err.Message)
		}
	}
	return nil
}

func AddHost(a Host) (int64, error) {
	if err := checkHost(a); err != nil {
		return 0, err
	}

	exist := Orm.QueryTable("host").Filter("Name", a.Name).Exist()
	if exist {
		return 0, errors.New(a.Name + "主机已存在")
	}

	id, err := Orm.Insert(&a)
	if err != nil {
		return 0, errors.New("添加主机错误" + err.Error())
	}
	return id, err
}
