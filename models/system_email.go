package models

import (
	"errors"
	"github.com/astaxie/beego/validation"
	"log"
	"time"
)

//id      1
//account oneoaas@oneoaas.com
//created
//created_by
//password
//port
//server
//updated_date
//updated_by
type SystemEmail struct {
	Id         int64     `orm:"pk;auto"`
	Account    string    `orm:"size(50);"`
	Password   string    `orm:"size(20);"`
	Port       string    `orm:"size(10);"`
	Server     string    `orm:"size(20);"`
	CreateTime time.Time `orm:"auto_now_add;type(datetime)"`
	CreateBy   string    `orm:"size(100);null"`
	UpdateBy   string    `orm:"size(100);null"`
	UpdateTime time.Time `orm:"auto_now;type(datetime)"`
}

func (this *SystemEmail) TableEngine() string {
	return "INNODB"
}

func checkEmail(email *SystemEmail) error {
	valid := validation.Validation{}
	b, _ := valid.Valid(email)
	if !b {
		for _, err := range valid.Errors {
			log.Println(err.Key, err.Message)
			return errors.New(err.Message)
		}
	}
	return nil
}

func AddEmail(this *SystemEmail) (int64, error) {

	if err := checkEmail(this); err != nil {
		return 0, err
	}

	exist := Orm.QueryTable("system_email").Filter("Account", this.Account).Exist()
	if exist {
		return 0, errors.New(this.Account + "邮件已存在")
	}

	id, err := Orm.Insert(this)
	if err != nil {
		_, errorCode := dbErrorParse(err.Error())
		if errorCode == 1062 {
			return 0, errors.New("邮件已存在")
		} else {
			return 0, errors.New("添加邮件出现异常")
		}
	}
	return id, err
}
