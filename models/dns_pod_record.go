package models

import (
	"encoding/json"
	"errors"
	"fmt"
	"io/ioutil"
	"log"
	"net/http"
	"net/url"
	"reflect"
	"strconv"
	"strings"

	"github.com/astaxie/beego/validation"
)

type Domainrecord struct {
	Status     Statusmsg
	Domutilain domainmsg
	Info       Infomsg
	Records    []Dnspodrecordsmsg
}

type Statusmsg struct {
	Code       string `json:"code"`
	Message    string `json:"message"`
	Created_at string `json:"created_at"`
}

type domainmsg struct {
	grade    string `json:"grade"`
	Id       int    `json:"id"`
	Name     string `json:"name"`
	Owner    string `json:"owner"`
	Punycode string `json:"punycode"`
}

type Infomsg struct {
	Sub_domains  string `json:"sub_domains"`
	Record_total string `json:"record_total"`
}

type Dnspodrecordsmsg struct {
	Id             string `json:"id" orm:"pk"`
	Enabled        string `json:"enabled"`
	Line           string `json:"line"`
	Monitor_status string `json:"monitor_status"`
	Mx             string `json:"mx"`
	Name           string `json:"name"`
	Remark         string `json:"remark"`
	Status         string `json:"status"`
	Ttl            string `json:"ttl"`
	Type           string `json:"type"`
	Updated_on     string `json:"updated_on"`
	Use_aqb        string `json:"user_aqb"`
	Value          string `json:"value"`
	Weight         string `json:"weight"`
	Token_Id       int64  `orm:"column(token_id);size(255);null"`
}

// 设置引擎为 INNODB
func (u *Dnspodrecordsmsg) TableEngine() string {
	return "INNODB"
}

func (this *Dnspodrecordsmsg) TableName() string {
	return "dnspodrecord"
}

func checkDnspod(a Dnspodrecordsmsg) error {
	valid := validation.Validation{}
	b, _ := valid.Valid(a)
	if !b {
		for _, err := range valid.Errors {
			log.Println(err.Key, err.Message)
			return errors.New(err.Message)
		}
	}
	return nil
}

func AddDnspodrecord(a Dnspodrecordsmsg) (int64, error) {
	/*
		var dnspodrecord m.Domainrecord
		t := "12966,f463dbad16efcad6447929a5a8b86102"
		domainID := "24775445"
		data := url.Values{}
		data.Set("login_token", t)
		data.Set("domain_id", domainID)
		data.Set("format", "json")
		resp, err := http.PostForm("https://dnsapi.cn/Record.List", data)
		defer resp.Body.Close()
		body, err := ioutil.ReadAll(resp.Body)
		if err != nil {
			fmt.Printf("{\"code\":1,\"msg\":\"Connect Error\"}")
		}
		//var domain omainrecord
		err = json.Unmarshal([]byte(body), &dnspodrecord)
		if err != nil {
			this.ResponseErrorJSON(400, errorFormat(ErrorBadRequest_400, err.Error()))
		}
		recordmsg := dnspodrecord.Records
		for _, record := range recordmsg {
			m.AddDnspodrecord(record)
		}
		if err != nil {
			this.ResponseErrorJSON(400, errorFormat(ErrorBadRequest_400, err.Error()))
		} else {
			this.Data["json"] = "OK"
		}
		this.ServeJSON()
	*/
	var dnspodtoken Dnspodtoken
	var dnspoddomain []*Dnspoddomain
	var domainrecord Domainrecord

	_, err := Orm.QueryTable("dnspoddomain").All(&dnspoddomain)
	for i := 0; i < len(dnspoddomain); i++ {
		domainidint := dnspoddomain[i].Id
		tokenidint := dnspoddomain[i].TokenId
		_, err := Orm.QueryTable("dnspodtoken").Filter("id", tokenidint).All(&dnspodtoken)
		token := dnspodtoken.Token

		tokenid := strconv.FormatInt(int64(tokenidint), 10)
		domainid := strconv.FormatInt(int64(domainidint), 10)

		t := fmt.Sprintf("%s,%s", tokenid, token)
		//t := "12966,f463dbad16efcad6447929a5a8b86102"
		data := url.Values{}
		data.Set("login_token", t)
		data.Set("domain_id", domainid)
		data.Set("format", "json")
		fmt.Println(t)
		resp, err := http.PostForm("https://dnsapi.cn/Record.List", data)
		defer resp.Body.Close()
		body, err := ioutil.ReadAll(resp.Body)
		fmt.Println(body)
		if err != nil {
			fmt.Printf("{\"code\":1,\"msg\":\"Connect Error\"}")
		}
		err = json.Unmarshal([]byte(body), &domainrecord)
		records := domainrecord.Records
		var dnspodrecord Dnspodrecordsmsg
		for _, r := range records {
			//dns = d
			r.Token_Id = tokenidint
			dnspodrecord = r
			fmt.Println(r.Token_Id)
			Orm.Insert(&dnspodrecord)
		}
	}
	//if err := checkDnspod(a); err != nil {
	//	return 0, err
	//}
	//id, err := Orm.Insert(&a)
	//if err != nil {
	//	_, errorCode := dbErrorParse(err.Error())
	//	if errorCode == 1062 {
	//		return 0, errors.New("Dnspod已存在")
	//	} else {
	//		return 0, errors.New("添加Dnspod出现异常")
	//	}
	//}

	return 0, err
}

func DelDnspodrecord(id int64) error {
	rows, err := Orm.QueryTable("domainrecord").Filter("id", id).Delete()
	if err != nil {
		return err
	}
	if rows == 0 {
		return errors.New("ERROR_NOT_FOUND")
	}
	return nil
}

func GetDnspodrecord(query map[string]string, fields []string, sort []string, order []string,
	offset int64, limit int64) (ml []interface{}, err error) {
	//o := orm.NewOrm()
	qs := Orm.QueryTable("dnspodrecord")
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
					orderby = "-" + v
				} else if order[i] == "asc" {
					orderby = v
				} else {
					orderby = "asc"
					//return nil, errors.New("Error: Invalid order. Must be either [asc|desc]")
				}
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

	var l []Dnspodrecordsmsg
	qs = qs.OrderBy(sortFields...)
	if _, err := qs.Limit(limit, offset).All(&l, fields...); err == nil {
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

func UpdateDnspodrecordById(m Dnspodrecordsmsg) (err error) {
	if err = Orm.Read(&m); err == nil {
		var num int64
		if num, err = Orm.Update(m); err == nil {
			fmt.Println("Number of records updated in database:", num)
		}
	}
	return
}
