package models

import (
	"errors"
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/validation"
	"log"
	"time"
)

type Role struct {
	Id         int64     `orm:"column(id);auto"`
	Name       string    `orm:"column(name);size(255),unique;null"`
	Enable     bool      `orm:"column(enable);size(1);null"`
	CreateTime time.Time `orm:"column(createtime);auto_now_add;type(datetime)"`
	CreateBy   string    `orm:"column(createby);size(100);null"`
	UpdateBy   string    `orm:"column(updateby);size(100);null"`
	UpdateTime time.Time `orm:"column(updatetime);auto_now;type(datetime)"`
	User       []*User   `orm:"reverse(many)"`
	Menu       []*Menu   `orm:"reverse(many)"`
}

func (this *Role) TableEngine() string {
	return "INNODB"
}

func (this *Role) TableName() string {
	return "role"
}

func GetRole(query map[string]string, sort []string, order []string,
	offset int64, limit int64) (ml []interface{}, err error) {

	var roleArray = make([]Role, 0)

	qs := Orm.QueryTable("role")

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
			sortFields = append(sortFields, orderby)
		}
		qs = qs.OrderBy(sortFields...)
	}

	//执行过滤排序
	for k, v := range query {
		qs = qs.Filter(k, v)
	}

	//构造返回数据
	if _, err := qs.Limit(limit, offset).All(&roleArray); err == nil {
		for _, v := range roleArray {
			ml = append(ml, v)
		}
		return ml, nil
	}

	return nil, err
}

//统计符合条件的数据记录
func CountRole(query map[string]string) (total int64, err error) {
	qs := Orm.QueryTable("role")
	for k, v := range query {
		qs = qs.Filter(k, v)
	}
	return qs.Count()
}

func checkRole(role Role) error {
	valid := validation.Validation{}
	b, _ := valid.Valid(role)
	if !b {
		for _, err := range valid.Errors {
			log.Println(err.Key, err.Message)
			return errors.New(err.Message)
		}
	}
	return nil
}

func AddRole(a Role) (int64, error) {
	exist := Orm.QueryTable("role").Filter("Name", a.Name).Exist()
	if exist {
		return 0, errors.New(a.Name + "角色已存在")
	}

	id, err := Orm.Insert(&a)
	for _, menu := range a.Menu {
		_, err := Orm.Raw("insert menu_roles(menu_id,role_id) values(?,?);", menu.MenuId, id).Exec()
		if err != nil {
			beego.Error("执行sql错误", err.Error())
		}
	}

	if err != nil {
		return 0, errors.New("添加角色错误" + err.Error())
	}
	return id, err
}

func DelRole(id int64) error {
	roleObj, err := GetRoleById(id)
	if len(roleObj.User) > 0 {
		return errors.New("角色正在使用")
	}
	if err != nil {
		return err
	}
	Orm.Raw("delete from menu_roles where role_id=?;", id).Exec()
	if err != nil {
		beego.Error("")
		return err
	}
	_, err = Orm.QueryTable("role").Filter("Id", id).Delete()
	if err != nil {
		return err
	}
	return nil
}

func GetRoleById(id int64) (*Role, error) {
	obj := &Role{
		Id: id,
	}
	err := Orm.Read(obj)
	type RoleMenu struct {
		Id     int64
		MenuId int64
	}
	var roleMenus []RoleMenu
	var menus []*Menu
	_, err = Orm.Raw("select id,menu_id from menu_roles where  role_id = ? ;", obj.Id).QueryRows(&roleMenus)
	for _, roleMenu := range roleMenus {
		menu, err := MenuGetById(roleMenu.MenuId)
		if err != nil {
			beego.Error("查询菜单发生错误", err.Error())
		}
		menus = append(menus, menu)
	}
	_, err = Orm.LoadRelated(obj, "User")
	if err != nil {
		beego.Error("载入角色关联的用户错误", err.Error())
	}
	obj.Menu = menus
	if err != nil {
		beego.Error("获取角色菜单错误", err.Error())
		return nil, err
	}

	return obj, nil
}

func PutRole(m *Role) (err error) {
	_, err = Orm.Raw("delete from menu_roles where role_id=?;", m.Id).Exec()
	if err != nil {
		beego.Error("删除角色与菜单关系错误", err.Error())
		return err
	}
	_, err = Orm.Update(m)
	if err != nil {
		beego.Error("更新角色失败", err.Error())
		return err
	} else {
		for _, menu := range m.Menu {
			Orm.Raw("insert menu_roles(menu_id,role_id) values(?,?);", menu.MenuId, m.Id).Exec()
		}
		return nil
	}
}
