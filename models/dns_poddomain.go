package models

import (
	"errors"
	"log"
	"strings"

	"github.com/astaxie/beego"
	"github.com/astaxie/beego/validation"
	"time"
	"fmt"
	"github.com/astaxie/beego/orm"
)

/*
功能：
Dnspoddomain管理

域名列表
id: 域名 ID, 即为 domain_id
status: 域名状态   “enable”: 正常   “pause”: 已暂停解析   “spam”: 已被封禁   “lock”: 已被锁定
grade: 域名等级    “D_Free”: 旧免费套餐 (旧套餐)  “D_Plus”: 个人豪华套餐 (旧套餐)  “D_Extra”: 企业Ⅰ (旧套餐)  “D_Expert” 企业Ⅱ (旧套餐)  “D_Ultra”: 企业Ⅲ (旧套餐)  “DP_Free” 免费套餐  “DP_Plus”: 个人专业版  “DP_Extra”: 企业创业版  “DP_Expert”: 企业标准版  “DP_Ultra”: 企业旗舰版
group_id: 域名分组 ID
searchengine_push: 是否开启搜索引擎推送功能    “yes”: 已开启    “no”: 未开启
is_mark: 是否设置域名星标   “yes”: 已设置   “no”: 未设置
ttl: 域名默认的 TTL 值
cname_speedup: CNAME 加速状态  “enable”: 已启用  “disable”: 已禁用
remark: 域名备注
created_on: 添加域名的时间
updated_on: 域名最后修改时间
punycode: 使用 punycode 转码之后的域名
ext_status: 域名扩展的状态   “notexist”: 域名没有注册   “dnserror”: DNS 设置错误   “”: 正常
name: 域名
grade_title: 域名等级(中文说明)
is_vip: 是否是VIP 等级   “yes”: 是 VIP   “no”: 不是 VIP
owner: 域名所有者
records: 域名下记录总条数
*/

type Domain struct {
	Domains []Dnspoddomain
	Info    DomainInfo
	Status  DomainStatus
}

//curl -s -X POST https://dnsapi.cn/Domain.List -d 'login_token=12966,f463dbad16efcad6447929a5a8b86102&format=json'|python -mjson.tool
type Dnspoddomain struct {
	Id               int64              `orm:"pk;auto"`
	CnameSpeedup     string             `orm:"size(255);null"`
	CreatedOn        string             `orm:"size(255);null"`
	ExtStatus        string             `orm:"size(255);null"`
	GroupId          string             `orm:"size(255);null"`
	IsMark           int64              `orm:"size(255);null"`
	IsVip            int64              `orm:"size(255);null"`
	Name             string             `orm:"size(255);null"`
	Owner            string             `orm:"size(255);null"`
	Punycode         string             `orm:"size(255);null"`
	Records          string             `orm:"size(255);null"`
	Remark           string             `orm:"size(255);null"`
	SearchenginePush int64              `orm:"size(255);null"`
	Ttl              string             `orm:"size(255);null"`
	UpdatedOn        string             `orm:"size(255);null"`
	TokenId          int64              `orm:"size(255);null"`
	State            *DnspoddomainState `orm:"rel(fk)"` //一个DNSPOD域名对应一种状态,一个域名状态可以对应多个DNSPOD域名
	Enable           bool         `orm:"column(enable);size(1);null"`
	CreateTime       time.Time    `orm:"column(createtime);auto_now_add;type(datetime)"`
	CreateBy         string       `orm:"column(createby);size(100);null"`
	UpdateBy         string       `orm:"column(updateby);size(100);null"`
	UpdateTime       time.Time    `orm:"column(updatetime);auto_now;type(datetime)"`
}

type DomainInfo struct {
	All_total       int `orm:"column(all_total);size(255);null"`
	Domain_total    int `orm:"column(domain_total);size(255);null"`
	Error_total     int `orm:"column(error_total);size(255);null"`
	Ismark_total    int `orm:"column(ismark_total);size(255);null"`
	Lock_total      int `orm:"column(lock_total);size(255);null"`
	Mine_total      int `orm:"column(mine_total);size(255);null"`
	Pause_total     int `orm:"column(pause_total);size(255);null"`
	Share_out_total int `orm:"column(share_out_total);size(255);null"`
	Share_total     int `orm:"column(share_total);size(255);null"`
	Spam_total      int `orm:"column(spam_total);size(255);null"`
	Vip_expire      int `orm:"column(vip_expire);size(255);null"`
	Vip_total       int `orm:"column(vip_total);size(255);null"`
}

type DomainStatus struct {
	Code       string `orm:"column(code);size(255);null"`
	Created_at string `orm:"column(created_at);size(255);null"`
	Message    string `orm:"column(message);size(255);null"`
}

// 设置引擎为 INNODB
func (u *Dnspoddomain) TableEngine() string {
	return "INNODB"
}

func (this *Dnspoddomain) TableName() string {
	return "dnspoddomain"
}

func checkdnspoddomain(a Dnspoddomain) error {
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

func AddDnspoddomain(a Dnspoddomain) (int64, error) {
	if err := checkdnspoddomain(a); err != nil {
		return 0, err
	}

	exist := Orm.QueryTable("dnspoddomain").Filter("Name", a.Name).Exist()
	if exist {
		return 0, errors.New(a.Name + "域名已存在")
	}

	id, err := Orm.Insert(&a)
	if err != nil {
		_, errorCode := dbErrorParse(err.Error())
		if errorCode == 1062 {
			return 0, errors.New("Dnspoddomain已存在")
		} else {
			return 0, errors.New("添加Dnspoddomain出现异常")
		}
	}
	return id, err
}

func DelDnspoddomain(id int64) error {
	_, err := Orm.QueryTable("Dnspoddomain").Filter("id", id).Update(orm.Params{
		"enable": false,
	})
	if err != nil {
		return err
	}
	return nil
}

func HardDelDnspoddomain(id int64) error {
	_, err := Orm.QueryTable("Dnspoddomain").Filter("id", id).Delete()
	if err != nil {
		return err
	}
	return nil
}

func GetDnspoddomain(query map[string]string, sort string, order string, offset int64, limit int64, name string, state string, grade string, start_time string, end_time string)(entityArray []interface{}, total int64) {
	var dnspoddomainArray = make([]Dnspoddomain, 0)
	var totalArray = make([]Dnspoddomain, 0)

	querySql := fmt.Sprintf(" select dn.* from dnspoddomain AS dn")
	totalSql := fmt.Sprintf(" select dn.* from dnspoddomain AS dn")

	v := query["enable"]
	if v !=""{
		querySql = fmt.Sprintf(" %s where dn.enable=%s ",querySql,v)
		totalSql = fmt.Sprintf(" %s where dn.enable=%s ",totalSql,v)
	}else{
		querySql = fmt.Sprintf(" %s where ",querySql)
		totalSql = fmt.Sprintf(" %s where ",totalSql)
	}

	v = query["search"]
	if v != "" {
		querySql = fmt.Sprintf(" %s and dn.name like '%%%s%%' ",querySql,v)
		querySql = fmt.Sprintf(" %s or ",querySql)
		querySql = fmt.Sprintf(" %s dn.owner like '%%%s%%' ",querySql,v)

		totalSql = fmt.Sprintf(" %s and dc.name like '%%%s%%' ",totalSql,v)
		totalSql = fmt.Sprintf(" %s or ",totalSql)
		totalSql = fmt.Sprintf(" %s dn.owner like '%%%s%%' ",totalSql,v)
	}

	if name != "" {
		querySql = fmt.Sprintf(" %s and name = '%s' ",querySql,name)
		totalSql = fmt.Sprintf(" %s and name = '%s' ",totalSql,name)
	}

	if state != "" {
		querySql = fmt.Sprintf(" %s and state_id in (%s) ",querySql,state)
		totalSql = fmt.Sprintf(" %s and state_id in (%s) ",totalSql,state)
	}

	if grade != "" {
		querySql = fmt.Sprintf(" %s and grade_id in (%s) ",querySql,grade)
		totalSql = fmt.Sprintf(" %s and grade_id in (%s) ",totalSql,grade)
	}

	if start_time != "" && end_time != ""{
		querySql = fmt.Sprintf(" %s and createtime >= '%s' and createtime <= '%s' ",querySql,start_time,end_time)
		totalSql = fmt.Sprintf(" %s and createtime >= '%s' and createtime <= '%s' ",totalSql,start_time,end_time)
	}

	if sort != "" {
		querySql = fmt.Sprintf(" %s order by %s ", querySql, sort)
		if order != "" {
			querySql = fmt.Sprintf(" %s %s", querySql, order)
		}
	}

	_,err := Orm.Raw(totalSql).QueryRows(&totalArray)
	if err == nil{
		totalSize := len(totalArray)
		total = int64(totalSize)
	}
	fmt.Println(querySql)
	//querySql = fmt.Sprintf(" %s limit %d offset %d ",querySql,limit,offset)
	_,err = Orm.Raw(querySql).QueryRows(&dnspoddomainArray)
	if err == nil{
		for _, v := range dnspoddomainArray {
			state, _ := GetDnspoddomainStateById(v.State.Id)
			v.State = state
			entityArray = append(entityArray, v)
		}
	}
	return entityArray, total
}

//统计符合条件的数据记录
func CountDnspoddomain(query map[string]string) (total int64, err error) {
	qs := Orm.QueryTable("dnspoddomain")
	// query k=v
	for k, v := range query {
		k = strings.Replace(k, ".", "__", -1)
		beego.Info("查询域名的当前key", k, "值是", v)
		qs = qs.Filter(k, v)
	}

	return qs.Count()
}

func DnspoddomainGetById(id int64) (*Dnspoddomain, error) {
	obj := &Dnspoddomain{
		Id: id,
	}
	err := Orm.Read(obj)
	if err != nil {
		return nil, err
	}
	return obj, nil
}

func PutDnspoddomain(m *Dnspoddomain) (err error) {
	_, err = Orm.Update(m)
	if err != nil {
		return err
	} else {
		return nil
	}
}
