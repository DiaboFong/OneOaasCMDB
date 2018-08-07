package models

import (
	"errors"
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/validation"
	"log"
	"time"
)

//数据中心区域(datacenter_region)
type DatacenterRegion struct {
	Id         int64         `orm:"column(id);auto"`
	RegionName string        `orm:"size(100),unique;null"`
	Enable     bool          `orm:"column(enable);size(1);null"`
	CreateTime time.Time     `orm:"column(createtime);auto_now_add;type(datetime)"`
	CreateBy   string        `orm:"column(createby);size(100);null"`
	UpdateBy   string        `orm:"column(updateby);size(100);null"`
	UpdateTime time.Time     `orm:"column(updatetime);auto_now;type(datetime)"`
	Datacenter []*Datacenter `orm:"reverse(many)"` // fk 的反向关系,区域中有多个数据中心
}

func (this *DatacenterRegion) TableEngine() string {
	return "INNODB"
}

func (this *DatacenterRegion) TableName() string {
	return "datacenter_region"
}

func GetAllDatacenterRegion() []*DatacenterRegion {
	var regions []*DatacenterRegion
	num, err := Orm.QueryTable("datacenter_region").All(&regions)
	if err != nil {
		beego.Debug("【查询区域错误", err.Error(), "]")
	}
	beego.Debug("【查询区域的记录数据是", num, "]条")
	return regions
}

func GetDatacenterRegionById(id int64) (*DatacenterRegion, error) {
	obj := &DatacenterRegion{
		Id: id,
	}
	err := Orm.Read(obj)
	if err != nil {
		return nil, err
	}
	return obj, nil
}

//查询数据库区域
func GetDcRegion(query map[string]string, sort []string, order []string,
	offset int64, limit int64) (ml []interface{}, err error) {

	//定义存储对象
	var dcRegionArray = make([]DatacenterRegion, 0) //存储返回数据

	//查询数据中心区域表
	qs := Orm.QueryTable("datacenter_region")

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
	if _, err := qs.Limit(limit, offset).All(&dcRegionArray); err == nil {
		for _, v := range dcRegionArray {
			ml = append(ml, v)
		}
		return ml, nil
	}

	return nil, err
}

//统计符合条件的数据记录
func CountDcRegion(query map[string]string) (total int64, err error) {
	qs := Orm.QueryTable("datacenter_region")
	for k, v := range query {
		qs = qs.Filter(k, v)
	}
	return qs.Count()
}

func DelDcRegion(id int64) error {
	rows, err := Orm.QueryTable("datacenter_region").Filter("Id", id).Delete()
	if err != nil {
		return err
	}
	beego.Debug("删除后返回值是,", rows)
	if rows == 0 {
		return errors.New("ERROR_NOT_FOUND")
	}
	return nil
}

func PutDcRegion(m *DatacenterRegion) (err error) {
	_, err = Orm.Update(m)
	if err != nil {
		return err
	} else {
		return nil
	}
}

func checkDcRegion(dcRegion DatacenterRegion) error {
	valid := validation.Validation{}
	b, _ := valid.Valid(dcRegion)
	if !b {
		for _, err := range valid.Errors {
			log.Println(err.Key, err.Message)
			return errors.New(err.Message)
		}
	}
	return nil
}

func AddDcRegion(a DatacenterRegion) (int64, error) {
	if err := checkDcRegion(a); err != nil {
		return 0, err
	}

	exist := Orm.QueryTable("datacenter_region").Filter("RegionName", a.RegionName).Exist()
	if exist {
		return 0, errors.New(a.RegionName + "数据中心区域已存在")
	}

	id, err := Orm.Insert(&a)
	if err != nil {
		return 0, errors.New("添加数据中心区域错误" + err.Error())
	}
	return id, err
}
