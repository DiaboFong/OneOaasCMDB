package models

import (
	"errors"
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/validation"
	"log"
	"time"
)

type InternetServiceProvider struct {
	Id         int64               `orm:"column(id);pk;auto"`
	Name       string              `orm:"column(name);size(255),unique"`
	Enable     bool                `orm:"column(enable);size(1);null"`
	CreateTime time.Time           `orm:"column(createtime);auto_now_add;type(datetime)"`
	CreateBy   string              `orm:"column(createby);size(100);null"`
	UpdateBy   string              `orm:"column(updateby);size(100);null"`
	UpdateTime time.Time           `orm:"column(updatetime);auto_now;type(dtetime)"`
	Bandwidth  []*NetworkBandwidth `orm:"reverse(many)"`
}

func (this *InternetServiceProvider) TableEngine() string {
	return "INNODB"
}

func (this *InternetServiceProvider) TableName() string {
	return "internet_service_provider"
}

func GetAllInternetServiceProvider() []*InternetServiceProvider {
	var state []*InternetServiceProvider
	num, err := Orm.QueryTable("internet_service_provider").All(&state)
	if err != nil {
		beego.Debug("【查询网络服务提供商错误", err.Error(), "]")
	}
	beego.Debug("【查询网络服务提供商的记录数据是", num, "]条")
	return state
}

func GetInternetServiceProviderById(id int64) (*InternetServiceProvider, error) {
	obj := &InternetServiceProvider{
		Id: id,
	}
	err := Orm.Read(obj)
	if err != nil {
		return nil, err
	}
	return obj, nil
}

//查询数据库状态
func GetIsp(query map[string]string, sort []string, order []string,
	offset int64, limit int64) (ml []interface{}, err error) {

	//定义存储对象
	var ispArray = make([]InternetServiceProvider, 0) //存储返回数据

	//查询网络服务提供商表
	qs := Orm.QueryTable("internet_service_provider")

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
	if _, err := qs.Limit(limit, offset).All(&ispArray); err == nil {
		for _, v := range ispArray {
			ml = append(ml, v)
		}
		return ml, nil
	}

	return nil, err
}

//统计符合条件的数据记录
func CountIsp(query map[string]string) (total int64, err error) {
	qs := Orm.QueryTable("internet_service_provider")
	for k, v := range query {
		qs = qs.Filter(k, v)
	}
	return qs.Count()
}

func DelIsp(id int64) error {
	rows, err := Orm.QueryTable("internet_service_provider").Filter("Id", id).Delete()
	if err != nil {
		return err
	}
	beego.Debug("删除后返回值是,", rows)
	if rows == 0 {
		return errors.New("ERROR_NOT_FOUND")
	}
	return nil
}

func PutIsp(m *InternetServiceProvider) (err error) {
	_, err = Orm.Update(m)
	if err != nil {
		return err
	} else {
		return nil
	}
}

func checkIsp(isp InternetServiceProvider) error {
	valid := validation.Validation{}
	b, _ := valid.Valid(isp)
	if !b {
		for _, err := range valid.Errors {
			log.Println(err.Key, err.Message)
			return errors.New(err.Message)
		}
	}
	return nil
}

func AddIsp(a InternetServiceProvider) (int64, error) {
	if err := checkIsp(a); err != nil {
		return 0, err
	}

	exist := Orm.QueryTable("internet_service_provider").Filter("Name", a.Name).Exist()
	if exist {
		return 0, errors.New(a.Name + "网络服务提供商已存在")
	}

	id, err := Orm.Insert(&a)
	if err != nil {
		return 0, errors.New("添加网络服务提供商错误" + err.Error())
	}
	return id, err
}
