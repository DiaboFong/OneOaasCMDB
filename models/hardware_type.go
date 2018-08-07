package models

import (
	"errors"
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/validation"
	"log"
	"time"
)

/*
功能：
 硬件类型
硬件ID    Hardwaretypeid
硬件名称    Hardwaretypename
硬件类型   Hardwaretypetype
备注     comment
Hardwaretypeid
1: 交换机
2: 路由器
3: 防火墙
4: WAF
5: 负载均衡
6以后 用户自定义，ID自增
*/

type HardwareType struct {
	Id         int64       `orm:"pk;auto"`
	Name       string      `orm:"size(255),unique;null"`
	Enable     bool        `orm:"column(enable);size(1);null"`
	CreateTime time.Time   `orm:"column(createtime);auto_now_add;type(datetime)"`
	CreateBy   string      `orm:"column(createby);size(100);null"`
	UpdateBy   string      `orm:"column(updateby);size(100);null"`
	UpdateTime time.Time   `orm:"column(updatetime);auto_now;type(dtetime)"`
	Hardware   []*Hardware `orm:"reverse(many)"`
}

// 设置引擎为 INNODB
func (u *HardwareType) TableEngine() string {
	return "INNODB"
}

func (this *HardwareType) TableName() string {
	return "hardware_type"
}

func GetHardwareTypeById(id int64) (*HardwareType, error) {
	obj := &HardwareType{
		Id: id,
	}
	err := Orm.Read(obj)
	if err != nil {
		return nil, err
	}
	return obj, nil
}

func GetAllHardwareType() []*HardwareType {
	var state []*HardwareType
	num, err := Orm.QueryTable("hardware_type").All(&state)
	if err != nil {
		beego.Debug("[查询硬件状态错误", err.Error(), "]")
	}
	beego.Debug("[查询硬件状态的记录数据是", num, "]条")
	return state
}

//查询数据库状态
func GetHardwareType(query map[string]string, sort []string, order []string,
	offset int64, limit int64) (ml []interface{}, err error) {

	//定义存储对象
	var hardwareTypeArray = make([]HardwareType, 0) //存储返回数据

	//查询业务类型表
	qs := Orm.QueryTable("hardware_type")

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
	if _, err := qs.Limit(limit, offset).All(&hardwareTypeArray); err == nil {
		for _, v := range hardwareTypeArray {
			ml = append(ml, v)
		}
		return ml, nil
	}

	return nil, err
}

//统计符合条件的数据记录
func CountHardwareType(query map[string]string) (total int64, err error) {
	qs := Orm.QueryTable("hardware_type")
	for k, v := range query {
		qs = qs.Filter(k, v)
	}
	return qs.Count()
}

func DelHardwareType(id int64) error {
	rows, err := Orm.QueryTable("hardware_type").Filter("Id", id).Delete()
	if err != nil {
		return err
	}
	beego.Debug("删除后返回值是,", rows)
	if rows == 0 {
		return errors.New("ERROR_NOT_FOUND")
	}
	return nil
}

func PutHardwareType(m *HardwareType) (err error) {
	_, err = Orm.Update(m)
	if err != nil {
		return err
	} else {
		return nil
	}
}

func checkHardwareType(hardwareType HardwareType) error {
	valid := validation.Validation{}
	b, _ := valid.Valid(hardwareType)
	if !b {
		for _, err := range valid.Errors {
			log.Println(err.Key, err.Message)
			return errors.New(err.Message)
		}
	}
	return nil
}

func AddHardwareType(a HardwareType) (int64, error) {
	if err := checkHardwareType(a); err != nil {
		return 0, err
	}

	exist := Orm.QueryTable("hardware_type").Filter("Name", a.Name).Exist()
	if exist {
		return 0, errors.New(a.Name + "业务类型已存在")
	}

	id, err := Orm.Insert(&a)
	if err != nil {
		return 0, errors.New("添加业务类型错误" + err.Error())
	}
	return id, err
}
