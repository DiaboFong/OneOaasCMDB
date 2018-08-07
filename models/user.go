package models

import (
	"errors"
	"fmt"
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/orm"
	"github.com/astaxie/beego/validation"
	"log"
	"oneoaas.com/cmdb/util"
	"reflect"
	"regexp"
	"strings"
	"time"
	"encoding/json"
)

type User struct {
	Userid       int64     `orm:"pk;column(userid);auto"`
	Name         string    `orm:"column(name);size(45);null"`
	LoginName    string    `orm:"column(login_name);size(45);null"`
	Email        string    `orm:"column(email);size(128);unique"`
	ContactPhone string    `orm:"column(contact_phone);size(32);unique"`
	Password     string    `json:"-" orm:"column(password);size(32)"`
	Salt         string    `json:"-" orm:"column(salt);size(32)"`
	LoginTime    time.Time 	`orm:"type(datetime);null"`
	RegisterTime time.Time  `orm:"type(datetime);null"`
	UpdateTime   time.Time  `orm:"type(datetime);null"`
	LoginIp	     string  	`orm:"null"`
	Role         *Role      `orm:"rel(fk)"`
	Token        []*AccessKey `orm:"reverse(many)"`
}

func (this *User) MarshalJSON() ([]byte, error) {
	type Alias User
	return json.Marshal(&struct {
		*Alias
		CreateDate string `json:"createDate"`
		UpdateDate string `json:"updateDate"`
	}{
		Alias: (*Alias)(this),
		CreateDate: this.RegisterTime.Format(util.Time_Default_Layout_2),
		UpdateDate: this.UpdateTime.Format(util.Time_Default_Layout_2),
	})
}

func (this *User) TableEngine() string {
	return "INNODB"
}

func checkUser(u User) error {
	valid := validation.Validation{}
	b, _ := valid.Valid(u)
	if !b {
		for _, err := range valid.Errors {
			log.Println(err.Key, err.Message)
			return errors.New(err.Message)
		}
	}
	return nil
}

func AddUser(u User) (int64, error) {

	salt := util.GenerateSalt()
	//密码先md5,在加盐
	hash := util.GenrateHash(salt,util.Strtomd5(u.Password))
	u.Password = util.Strtomd5(hash)
	u.Salt = salt

	if match, _ := regexp.MatchString(`(?i)^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,6}$`, u.Email); !match {
		return 0, errors.New("邮箱非法")
	}
	if len(u.Password) < 6 {
		return 0, errors.New("您输入的密码小于6位")
	}
	if len(u.ContactPhone) == 0 {
		return 0, errors.New("联系电话不能为空")
	}

	id, err := Orm.Insert(&u)
	if err != nil {
		beego.Error("添加用户错误", err.Error())
		errorMessage, errorCode := dbErrorParse(err.Error())
		partsError := strings.Split(errorMessage, " ")
		detailErrorMessage := partsError[3]

		newDetailErrorMessage := strings.Replace(detailErrorMessage,"'","",2)
		if errorCode == 1062 {
			return 0, errors.New(newDetailErrorMessage+"记录已存在")
		} else {
			return 0, errors.New("添加用户错误")
		}
		return 0, err
	}
	return id, nil
}

// no records exist
func GetUsers(query map[string]string, fields []string, sort []string, order []string,
	offset int64, limit int64) (ml []interface{}, err error) {
	qs := Orm.QueryTable("user")
	// query k=v
	for k, v := range query {
		// rewrite dot-notation to Object__Attribute
		k = strings.Replace(k, ".", "__", -1)
		qs = qs.Filter(k, v)
	}
	// order by:
	var sortFields []string
	if len(sort) != 0 {
		if len(sort) == len(order) {
			// 1) for each sort field, there is an associated order
			for i, v := range sort {
				orderby := ""
				if order[i] == "desc" {
					//减号 - 表示 DESC 的排列,不加减号表示ESC排序
					orderby = "-" + v
				} else if order[i] == "asc" {
					orderby = v
				} else {
					return nil, errors.New("Error: Invalid order. Must be either [asc|desc]")
				}
				fmt.Println(orderby)
				sortFields = append(sortFields, orderby)
			}
			qs = qs.OrderBy(sortFields...)
		} else if len(sort) != len(order) && len(order) == 1 {
			// 2) there is exactly one order, all the sorted fields will be sorted by this order
			for _, v := range sort {
				orderby := ""
				if order[0] == "desc" {
					orderby = "-" + v
				} else if order[0] == "asc" {
					orderby = v
				} else {
					return nil, errors.New("Error: Invalid order. Must be either [asc|desc]")
				}
				sortFields = append(sortFields, orderby)
			}
		} else if len(sort) != len(order) && len(order) == 0 {
			// 3) there is exactly one order, all the sorted fields default asc
			for _, v := range sort {
				orderby := ""
				orderby = v
				sortFields = append(sortFields, orderby)
			}
		} else if len(sort) != len(order) && len(order) != 1 {
			return nil, errors.New("Error: 'sort', 'order' sizes mismatch or 'order' size is not 1")
		}
	} else {
		if len(order) != 0 {
			return nil, errors.New("Error: unused 'order' fields")
		}
	}

	//var l []UserSearch
	var l []User
	qs = qs.OrderBy(sortFields...)
	if _, err := qs.Limit(limit, offset).RelatedSel().All(&l, fields...); err == nil {
		if len(fields) == 0 {
			for _, v := range l {
				ml = append(ml, v)
			}
		} else {
			// trim unused fields
			for _, v := range l {
				m := make(map[string]interface{})
				val := reflect.ValueOf(v)
				for _, fname := range fields {
					m[fname] = val.FieldByName(fname).Interface()
				}
				ml = append(ml, m)
			}
		}
		return ml, nil
	}
	return nil, err
}

func DelUser(userId int64) error {
	_, err := Orm.QueryTable("user").Filter("userId", userId).Delete()
	if err != nil {
		return err
	}
	err = DelUserRole(userId)
	return err
}

func UpdateUserById(m User) (err error) {
	// ascertain id exists in the database
	if err = Orm.Read(&m); err == nil {
		var num int64
		if num, err = Orm.Update(m); err == nil {
			fmt.Println("Number of records updated in database:", num)
		}
	}
	return
}

func (u *User) Update(fields ...string) error {
	if _, err := orm.NewOrm().Update(u, fields...); err != nil {
		return err
	}
	return nil
}

func UserAdd(user *User) (int64, error) {
	return orm.NewOrm().Insert(user)
}

func GetUserById(id int64) (*User, error) {
	obj := &User{
		Userid: id,
	}
	err := Orm.Read(obj)
	_, err = Orm.LoadRelated(obj, "Role")
	if err != nil {
		return nil, err
	}
	return obj, nil
}

func UserGetByName(loginName string) (*User, error) {
	user := new(User)
	err := Orm.QueryTable("user").Filter("login_name", loginName).RelatedSel().One(user)
	if err != nil {
		beego.Error(err)
		return nil, err
	}
	_, err = Orm.LoadRelated(user, "Token")
	if err != nil {
		beego.Error(err)
		return nil, err
	}
	return user, err
}

func CountUser(query map[string]string) (total int64, err error) {
	qs := Orm.QueryTable("user")
	for k, v := range query {
		k = strings.Replace(k, ".", "__", -1)
		qs = qs.Filter(k, v)
	}
	return qs.Count()
}

func PutUser(u *User) (err error) {
	_, err = Orm.Update(u)
	if err != nil {
		return err
	} else {
		return nil
	}
}

func AddUserRole(userId int64, roleId int64) (int64, error) {
	sqlResult, err := Orm.Raw("insert user_roles(user_id,role_id) value(?,?)", userId, roleId).Exec()
	if err != nil {
		beego.Debug("插入角色与用户关系错误",err.Error())
	}
	id, err := sqlResult.RowsAffected()
	if err != nil {
		beego.Debug(err.Error())
	}
	return id, err
}

func DelUserRole(userId int64) error {
	beego.Info("删除关联用户与角色,生成ID是", userId)
	_, err := Orm.Raw("delete from user_roles where user_id=? ", userId).Exec()
	return err
}
