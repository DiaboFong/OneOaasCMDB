package models

import (
	"fmt"
	"github.com/astaxie/beego/orm"
	"time"
)

//声明菜单数据结构
type Menu struct {
	MenuId      int64     `orm:"pk;column(menuId);auto"`
	Name        string    `orm:"column(name);size(255),unique;"`
	DisplayName string    `orm:"column(display_name);size(255),unique;"`
	Url         string    `orm:"column(url);size(50);null"`
	ParentId    int64     `orm:"column(parentId);size(50);null"`
	Level       int64     `orm:"column(level);size(5);null"`
	Logo        string    `orm:"column(logo);size(20);null"`
	Class       string    `orm:"column(class);size(10);null"` //表示类别
	Enable      bool      `orm:"column(enable);size(1);null"`
	CreateTime  time.Time `orm:"column(createtime);auto_now_add;type(datetime);null"`
	CreateBy    string    `orm:"column(createby);size(100);null"`
	UpdateBy    string    `orm:"column(updateby);size(100);null"`
	UpdateTime  time.Time `orm:"column(updatetime);auto_now;type(datetime);null"`
	Role        []*Role   `orm:"rel(m2m);"`
	Active      bool
}

//重写设置引擎为方法
func (m *Menu) TableEngine() string {
	return "INNODB"
}

//菜单对象重写表名称方法,此处可以自定义表名称
func (m *Menu) TableName() string {
	return "menu"
}

func AddMenu(m Menu) (int64, error) {
	id, err := Orm.Insert(&m)
	if err == nil {
		fmt.Println(id)
	}
	return id, err
}

func DelMenu(id int64) (int64, error) {
	return Orm.QueryTable("Menu").Filter("MenuId", id).Delete()
}

func PutMenu(m *Menu) (err error) {
	_, err = Orm.Update(m)
	if err != nil {
		return err
	} else {
		return nil
	}
}

func MenuGetById(id int64) (*Menu, error) {
	obj := &Menu{
		MenuId: id,
	}
	err := Orm.Read(obj)
	if err != nil {
		return nil, err
	}
	return obj, nil
}

//查询所有一级菜单
func QueryAllPrimaryMenu() ([]*Menu, int64) {
	list := make([]*Menu, 0)
	query := orm.NewOrm().QueryTable("menu")
	total, _ := query.Filter("parentId", "0").Filter("enable", true).Count()
	query.Filter("parentId", nil).Filter("enable", true).All(&list)
	return list, total
}

//根据一级菜单id查询所有子菜单
func QueryAllSubMenu(parentId int64) ([]*Menu, int64) {
	list := make([]*Menu, 0)
	query := orm.NewOrm().QueryTable("menu")
	total, _ := query.Filter("parentId", parentId).Filter("enable", true).Count()
	query.Filter("parentId", parentId).Filter("enable", true).All(&list)
	return list, total
}
