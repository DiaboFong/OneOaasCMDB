package models

import (
	"crypto/md5"
	"crypto/sha1"
	"fmt"
	"github.com/astaxie/beego"
	"io"
	"math/rand"
	"time"
)

type AccessKey struct {
	Id              int64     `orm:"pk;auto"`
	User            *User     `orm:"rel(fk);null;on_delete(cascade)"`
	AccessKeyName   string    `orm:"size(50);null"`
	AccessKeyType   string    `orm:"size(50);null"`
	AccessKeyId     string    `orm:"size(50);null"`
	AccessKeySecret string    `orm:"size(50);null"`
	AccessKeyDesc   string    `orm:"size(100);null"`
	IsDisable       int       `orm:"size(1);null"`
	IsDelete        int       `orm:"size(1);null"`
	ExpireTime      int64     `orm:"size(512);type(expiretime)"`
	CreateTime      time.Time `orm:"auto_now_add;type(datetime)"`
}

func (this *AccessKey) TableEngine() string {
	return "INNODB"
}

//对字符串进行MD5哈希
func CreateAccessKeyId(data string) string {
	t := md5.New()
	io.WriteString(t, data)
	return fmt.Sprintf("%x", t.Sum(nil))
}

//对字符串进行SHA1哈希
func CreateAccessKeySecret(data string) string {
	t := sha1.New()
	io.WriteString(t, data)
	return fmt.Sprintf("%x", t.Sum(nil))
}

//产生随机数据
func RandomString(strlen int) string {
	rand.Seed(time.Now().UTC().UnixNano())
	const chars = "abcdefghijklmnopqrstuvwxyz0123456789"
	result := make([]byte, strlen)
	for i := 0; i < strlen; i++ {
		result[i] = chars[rand.Intn(len(chars))]
	}
	return string(result)
}

func (this *AccessKey) AddAccessKey() (int64, error) {
	return Orm.Insert(this)

}

func (this *AccessKey) GetAccessKey(query map[string]string,
	sort []string, order []string, offset int64, limit int64) (list []interface{}, err error) {
	keys := []*AccessKey{}
	var sortFields []string
	qs := Orm.QueryTable(&AccessKey{})
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

	for k, v := range query {
		qs = qs.Filter(k, v)
	}

	_, err = qs.Limit(limit, offset).All(&keys)
	if err == nil {
		for _, key := range keys {
			accesskey, _ := GetUserById(key.User.Userid)
			key.User = accesskey
			list = append(list, key)
		}
		return list, nil
	} else {
		return nil, err
	}
}

func (this *AccessKey) CountAccessKey(query map[string]string) (total int64, err error) {
	qs := Orm.QueryTable(&AccessKey{})
	for k, v := range query {
		qs = qs.Filter(k, v)
	}
	return qs.Count()
}

func (this *AccessKey) UpdateState(id int64) error {
	var key = new(AccessKey)
	err := Orm.QueryTable(&AccessKey{}).Filter("Id", id).One(key)
	if err != nil {
		beego.Error(err.Error())
	}
	//如果启用则禁用
	if key.IsDisable == 0 {
		key.IsDisable = 1
	} else {
		key.IsDisable = 0
	}
	_, err = Orm.Update(key)
	return err
}

func  (this *AccessKey) Update() error{
	_,err := Orm.Update(this)
	return err
}

func  (this *AccessKey) One() error{
	err := Orm.Read(this)
	return err
}

func (this *AccessKey) DeleteAccessKey() (int64, error) {
	return Orm.QueryTable(&AccessKey{}).Filter("Id", this.Id).Delete()
}
