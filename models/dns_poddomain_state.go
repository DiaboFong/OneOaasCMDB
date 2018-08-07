package models

import (
	"errors"
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/validation"
	"log"
	"time"
)

type DnspoddomainState struct {
	Id         int64           `orm:"column(id);auto"`
	State      string          `orm:"column(state);size(255),unique;null"`
	Color      string      	   `orm:"column(color);size(100),unique"`
	Enable     bool            `orm:"column(enable);size(1);null"`
	CreateTime time.Time       `orm:"column(createtime);auto_now_add;type(datetime)"`
	CreateBy   string          `orm:"column(createby);size(100);null"`
	UpdateBy   string          `orm:"column(updateby);size(100);null"`
	UpdateTime time.Time       `orm:"column(updatetime);auto_now;type(datetime)"`
	Domain     []*Dnspoddomain `orm:"reverse(many)"`
}

func (this *DnspoddomainState) TableEngine() string {
	return "INNODB"
}

func (this *DnspoddomainState) TableName() string {
	return "dnspoddomain_state"
}

func GetAllDnspoddomainState() []*DnspoddomainState {
	var state []*DnspoddomainState
	num, err := Orm.QueryTable("dnspoddomain_state").All(&state)
	if err != nil {
		beego.Debug("【查询DNSpod域名状态错误", err.Error(), "]")
	}
	beego.Debug("【查询DNSpod域名的记录数据是", num, "]条")
	return state
}

func GetDnspoddomainStateById(id int64) (*DnspoddomainState, error) {
	obj := &DnspoddomainState{
		Id: id,
	}
	err := Orm.Read(obj)
	if err != nil {
		return nil, err
	}
	return obj, nil
}

//查询数据库状态
func GetDnspoddomainState(query map[string]string, sort []string, order []string,
	offset int64, limit int64) (ml []interface{}, err error) {

	//定义存储对象
	var dnspoddomainStateArray = make([]DnspoddomainState, 0) //存储返回数据

	//查询域名状态表
	qs := Orm.QueryTable("dnspoddomain_state")

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
	if _, err := qs.Limit(limit, offset).All(&dnspoddomainStateArray); err == nil {
		for _, v := range dnspoddomainStateArray {
			ml = append(ml, v)
		}
		return ml, nil
	}

	return nil, err
}

//统计符合条件的数据记录
func CountDnspoddomainState(query map[string]string) (total int64, err error) {
	qs := Orm.QueryTable("dnspoddomain_state")
	for k, v := range query {
		qs = qs.Filter(k, v)
	}
	return qs.Count()
}

func DelDnspoddomainState(id int64) error {
	exist := Orm.QueryTable("dnspoddomain").Filter("state_id", id).Exist()
	if exist {
		return errors.New("该状态正在使用,不能删除")
	}

	rows, err := Orm.QueryTable("Dnspoddomain_state").Filter("Id", id).Delete()
	if err != nil {
		return err
	}
	beego.Debug("删除后返回值是,", rows)
	if rows == 0 {
		return errors.New("ERROR_NOT_FOUND")
	}
	return nil
}

func PutDnspoddomainState(m *DnspoddomainState) (err error) {
	_, err = Orm.Update(m)
	if err != nil {
		return err
	} else {
		return nil
	}
}

func checkDnspoddomainState(dnspoddomainState DnspoddomainState) error {
	valid := validation.Validation{}
	b, _ := valid.Valid(dnspoddomainState)
	if !b {
		for _, err := range valid.Errors {
			log.Println(err.Key, err.Message)
			return errors.New(err.Message)
		}
	}
	return nil
}

func AddDnspoddomainState(a DnspoddomainState) (int64, error) {
	if err := checkDnspoddomainState(a); err != nil {
		return 0, err
	}

	exist := Orm.QueryTable("dnspoddomain_state").Filter("State", a.State).Exist()
	if exist {
		return 0, errors.New(a.State + "域名状态已存在")
	}

	id, err := Orm.Insert(&a)
	if err != nil {
		return 0, errors.New("添加域名状态错误" + err.Error())
	}
	return id, err
}
