package models

import (
	"errors"
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/validation"
	"log"
	"time"
)

type HardwareState struct {
	Id         int64       `orm:"column(id);pk;auto"`
	State      string      `orm:"column(state);size(255),unique;"`
	Color      string      `orm:"column(color);size(100),unique"`
	Enable     bool        `orm:"column(enable);size(1);null"`
	CreateTime time.Time   `orm:"column(createtime);auto_now_add;type(datetime);null"`
	CreateBy   string      `orm:"column(createby);size(100);null"`
	UpdateBy   string      `orm:"column(updateby);size(100);null"`
	UpdateTime time.Time   `orm:"column(updatetime);auto_now;type(datetime);null"`
	Hardware   []*Hardware `orm:"reverse(many)"`
}

func (u *HardwareState) TableEngine() string {
	return "INNODB"
}

func (this *HardwareState) TableName() string {
	return "hardware_state"
}

/*func AddHardwareState(this *HardwareState) (*HardwareState, error) {
	id, err := Orm.Insert(this)
	if err != nil {
		return nil, err
	}

	state := &HardwareState{
		Id: id,
	}
	err = Orm.Read(state)
	if err != nil {
		return nil, err
	}

	return state, nil
}*/

func GetAllHardwareState() []*HardwareState {
	var state []*HardwareState
	num, err := Orm.QueryTable("hardware_state").All(&state)
	if err != nil {
		beego.Debug("【查询硬件状态错误", err.Error(), "]")
	}
	beego.Debug("【查询硬件状态的记录数据是", num, "]条")
	return state
}

func GetHardwareStateById(id int64) (*HardwareState, error) {
	obj := &HardwareState{
		Id: id,
	}
	err := Orm.Read(obj)
	if err != nil {
		return nil, err
	}
	return obj, nil
}

//查询数据库状态
func GetHardwareState(query map[string]string, sort []string, order []string,
	offset int64, limit int64) (ml []interface{}, err error) {

	//定义存储对象
	var hardwareStateArray = make([]HardwareState, 0) //存储返回数据

	//查询硬件状态表
	qs := Orm.QueryTable("hardware_state")

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
	if _, err := qs.Limit(limit, offset).All(&hardwareStateArray); err == nil {
		for _, v := range hardwareStateArray {
			ml = append(ml, v)
		}
		return ml, nil
	}

	return nil, err
}

//统计符合条件的数据记录
func CountHardwareState(query map[string]string) (total int64, err error) {
	qs := Orm.QueryTable("hardware_state")
	for k, v := range query {
		qs = qs.Filter(k, v)
	}
	return qs.Count()
}

func DelHardwareState(id int64) error {
	exist := Orm.QueryTable("hardware").Filter("state_id", id).Exist()
	if exist {
		return errors.New("该状态正在使用,不能删除")
	}

	rows, err := Orm.QueryTable("hardware_state").Filter("Id", id).Delete()
	if err != nil {
		return err
	}
	beego.Debug("删除后返回值是,", rows)
	if rows == 0 {
		return errors.New("ERROR_NOT_FOUND")
	}
	return nil
}

func PutHardwareState(m *HardwareState) (err error) {
	_, err = Orm.Update(m)
	if err != nil {
		return err
	} else {
		return nil
	}
}

func checkHardwareState(hardwareState HardwareState) error {
	valid := validation.Validation{}
	b, _ := valid.Valid(hardwareState)
	if !b {
		for _, err := range valid.Errors {
			log.Println(err.Key, err.Message)
			return errors.New(err.Message)
		}
	}
	return nil
}

func AddHardwareState(a HardwareState) (int64, error) {
	if err := checkHardwareState(a); err != nil {
		return 0, err
	}

	exist := Orm.QueryTable("hardware_state").Filter("State", a.State).Exist()
	if exist {
		return 0, errors.New(a.State + "硬件状态已存在")
	}

	id, err := Orm.Insert(&a)
	if err != nil {
		return 0, errors.New("添加硬件状态错误" + err.Error())
	}
	return id, err
}
