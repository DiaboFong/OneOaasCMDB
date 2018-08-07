package models

//
//import (
//	"errors"
//	"log"
//	"reflect"
//	"strings"
//
//	"github.com/astaxie/beego/validation"
//	"github.com/astaxie/beego"
//)
//
///*
//功能：
//文档管理
//文档ID    docid
//文档名称    docname
//创建时间    createtime
//修改时间  modfilytime
//备注  comment
//*/
//
//type Docmanage struct {
//	Docmanageid   int64  `orm:"column(docmanageid);auto"`
//	Docmanagename string `orm:"column(docmanagename);size(255),unique;null"`
//	Status        int64  `orm:"column(status);size(11);null"`
//	Docmanageno   string `orm:"column(docmanageno);size(255);null"`
//	Docpath       string `orm:"column(docpath);size(255);null"`
//	Doctype       string `orm:"column(doctype);size(255);null"`
//	Comment       string `orm:"column(comment);size(512);null"`
//}
//
//// 设置引擎为 INNODB
//func (u *Docmanage) TableEngine() string {
//	return "INNODB"
//}
//
//func (this *Docmanage) TableName() string {
//	return "docmanage"
//}
//
//func checkdocmanage(a Docmanage) error {
//	valid := validation.Validation{}
//	b, _ := valid.Valid(a)
//	if !b {
//		for _, err := range valid.Errors {
//			log.Println(err.Key, err.Message)
//			return errors.New(err.Message)
//		}
//	}
//	return nil
//}
//
//func AddDocmanage(a Docmanage) (int64, error) {
//	if err := checkdocmanage(a); err != nil {
//		return 0, err
//	}
//	id, err := Orm.Insert(&a)
//	if err != nil {
//		_, errorCode := dbErrorParse(err.Error())
//		if errorCode == 1062 {
//			return 0, errors.New("Docmanage已存在")
//		} else {
//			return 0, errors.New("添加Docmanage出现异常")
//		}
//	}
//	return id, err
//}
//
//func DelDocmanage(id int64) error {
//	rows, err := Orm.QueryTable("Docmanage").Filter("Docmanageid", id).Delete()
//	if err != nil {
//		return err
//	}
//	beego.Debug("删除后返回值是,", rows)
//	if rows == 0 {
//		return errors.New("ERROR_NOT_FOUND")
//	}
//	return nil
//}
//
////func DocmanageGet() (*[]Docmanage, error) {
////    var a *[]Docmanage = new([]Docmanage)
////    _, err := Orm.QueryTable("Docmanage").All(a)
////    return a, err
////}
//
//func GetDocmanage(query map[string]string, fields []string, sort []string, order []string,
//	offset int64, limit int64) (ml []interface{}, err error) {
//	//o := orm.NewOrm()
//	qs := Orm.QueryTable("docmanage")
//	// query k=v
//	for k, v := range query {
//		// rewrite dot-notation to Object__Attribute
//		k = strings.Replace(k, ".", "__", -1)
//		qs = qs.Filter(k, v)
//	}
//	// order by:
//	var sortFields []string
//	if len(sort) != 0 {
//		if len(sort) == len(order) {
//			// 1) for each sort field, there is an associated order
//			for i, v := range sort {
//				orderby := ""
//				if order[i] == "desc" {
//					orderby = "-" + v
//				} else if order[i] == "asc" {
//					orderby = v
//				} else {
//					orderby = "asc"
//					//return nil, errors.New("Error: Invalid order. Must be either [asc|desc]")
//				}
//				sortFields = append(sortFields, orderby)
//			}
//			qs = qs.OrderBy(sortFields...)
//		} else if len(sort) != len(order) && len(order) == 1 {
//			// 2) there is exactly one order, all the sorted fields will be sorted by this order
//			for _, v := range sort {
//				orderby := ""
//				if order[0] == "desc" {
//					orderby = "-" + v
//				} else if order[0] == "asc" {
//					orderby = v
//				} else {
//					return nil, errors.New("Error: Invalid order. Must be either [asc|desc]")
//				}
//				sortFields = append(sortFields, orderby)
//			}
//		} else if len(sort) != len(order) && len(order) == 0 {
//			// 3) there is exactly one order, all the sorted fields default asc
//			for _, v := range sort {
//				orderby := ""
//				orderby = v
//				sortFields = append(sortFields, orderby)
//			}
//		} else if len(sort) != len(order) && len(order) != 1 {
//			return nil, errors.New("Error: 'sort', 'order' sizes mismatch or 'order' size is not 1")
//		}
//	} else {
//		if len(order) != 0 {
//			return nil, errors.New("Error: unused 'order' fields")
//		}
//	}
//
//	var docArray []Docmanage
//	//执行过滤排序
//	beego.Info("查询合同的排序属性是", sortFields)
//
//	qs = qs.OrderBy(sortFields...)
//	if _, err := qs.Limit(limit, offset).All(&docArray, fields...); err == nil {
//		if len(fields) == 0 {
//			for _, v := range docArray {
//				ml = append(ml, v)
//			}
//		} else {
//			// trim unused fields
//			for _, v := range docArray {
//				m := make(map[string]interface{})
//				val := reflect.ValueOf(v)
//				for _, fname := range fields {
//					m[fname] = val.FieldByName(fname).Interface()
//				}
//				ml = append(ml, m)
//			}
//		}
//		return ml, nil
//	}
//	return nil, err
//}
//
////统计符合条件的数据记录
//func CountDoc(query map[string]string) (total int64, err error) {
//	qs := Orm.QueryTable("docmanage")
//	// query k=v
//	for k, v := range query {
//		k = strings.Replace(k, ".", "__", -1)
//		beego.Info("查询合同的当前key", k, "值是", v)
//		qs = qs.Filter(k, v)
//	}
//	return qs.Count()
//}
//
////func UpdateDocmanageById(m Docmanage) (err error) {
////	if err = Orm.Read(&m); err == nil {
////		var num int64
////		if num, err = Orm.Update(m); err == nil {
////			fmt.Println("Number of records updated in database:", num)
////		}
////	}
////	return
////}
//
//func DocGetById(id int64) (*Docmanage, error) {
//	obj := &Docmanage{
//		Docmanageid: id,
//	}
//	err := Orm.Read(obj)
//	if err != nil {
//		return nil, err
//	}
//	return obj, nil
//}
//
//func PutDoc(m *Docmanage) (err error) {
//	_, err = Orm.Update(m);
//	if err != nil {
//		return err
//	} else {
//		return nil
//	}
//
//}
