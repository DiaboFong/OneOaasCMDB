package models

import (
	"errors"
	"fmt"
	"log"

	"github.com/astaxie/beego/validation"
)

/*
功能：
Dnspodtoken管理

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

域名解析记录records:
id:              记录ID编号
sub_domain:            主机记录
line:            解析线路, 详见 Record.Line 接口
type:            记录类型, 详见 Record.Type 接口
ttl:             记录的 TTL 值
value:           记录值
mx:              记录的 MX 记录值, 非 MX 记录类型，默认为 0
enabled:         记录状态 “0”: 禁用 “1”: 启用
status:          系统内部标识状态, 开发者可忽略
monitor_status:  该记录的D监控状态 “Ok”: 服务器正常 “Warn”: 该记录有报警, 服务器返回 4XX “Down”: 服务器宕机 “”: 该记录未开启D监控
remark:          记录备注
updated_on:      记录最后更新时间
use_aqb:         是否开通网站安全中心   “yes”: 已经开启   “no”: 未开启

*/

type Dnspodtoken struct {
	//Id    string `json:"id" orm:"pk"`
	Id    int64  `json:"id" orm:"pk"`
	Token string `json:"token" orm:"column(Token);size(255);null"`
}

// 设置引擎为 INNODB
func (u *Dnspodtoken) TableEngine() string {
	return "INNODB"
}

func (this *Dnspodtoken) TableName() string {
	return "dnspodtoken"
}

func checkDnspodtoken(a Dnspodtoken) error {
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

func AddDnspodtoken(a Dnspodtoken) (int64, error) {
	if err := checkDnspodtoken(a); err != nil {
		return 0, err
	}
	id, err := Orm.Insert(&a)
	if err != nil {
		_, errorCode := dbErrorParse(err.Error())
		if errorCode == 1062 {
			return 0, errors.New("Dnspodtoken已存在")
		} else {
			return 0, errors.New("添加Dnspodtoken出现异常")
		}
	}

	return id, err
}

func DelDnspodtoken(id int64) error {
	rows, err := Orm.QueryTable("Dnspodtoken").Filter("Dnspodtokenid", id).Delete()
	if err != nil {
		return err
	}
	if rows == 0 {
		return errors.New("ERROR_NOT_FOUND")
	}
	return nil
}

//func DnspodtokenGet() (*[]Dnspodtoken, error) {
//    var a *[]Dnspodtoken = new([]Dnspodtoken)
//    _, err := Orm.QueryTable("Dnspodtoken").All(a)
//    return a, err
//}

func GetDnspodtoken() (err error) {
	//o := orm.NewOrm()
	qs := Orm.QueryTable("Dnspodtoken")

	var l []Dnspodtoken
	fmt.Println(l)
	fmt.Println(qs)

	return errors.New("ERROR_NOT_FOUND")
}

func UpdateDnspodtokenById(m Dnspodtoken) (err error) {
	if err = Orm.Read(&m); err == nil {
		var num int64
		if num, err = Orm.Update(m); err == nil {
			fmt.Println("Number of records updated in database:", num)
		}
	}
	return
}
