package models

import (
	"errors"
	"log"
	"strings"
	"time"

	"github.com/astaxie/beego"
	"github.com/astaxie/beego/validation"
	"fmt"
	"github.com/astaxie/beego/orm"
)

/*
ID  agreementid
合同名称 AgreementName
合同编号 Agreementno
合同金额 AgreementPrice
合同签署日期 AgreementSignDate
合同开始日期 AgreementStartDate
合同结束日期 AgreementStopDate
合同状态    State
供应商 		Supplier
签署人 		AgreementSigner
合同文件路径 	AgreementPath
备注  comment
*/

type Agreement struct {
	AgreementId        int64           `orm:"column(agreementid);pk;auto"`
	AgreementName      string          `orm:"size(100);unique;"`
	AgreementNo        string          `orm:"size(100);unique;"`
	AgreementPrice     int64           `orm:"size(11);null"`
	AgreementSignDate  time.Time       `orm:"type(datetime);null"`
	AgreementStartDate time.Time       `orm:"type(datetime);null"`
	AgreementStopDate  time.Time       `orm:"type(datetime);null"`
	AgreementSigner    string          `orm:"size(100);null"`
	AgreementPath      string          `orm:"size(100);null"`
	Comment            string          `orm:"size(200);null"`
	Supplier           *Supplier       `orm:"rel(fk)"` //一个供应商可以对应多个合同
	State              *AgreementState `orm:"rel(fk)"` //一个合同对应一种状态,一个合同状态可以对应多个合同
	Enable             bool         `orm:"column(enable);size(1);null"`
	CreateTime         time.Time    `orm:"column(createtime);auto_now_add;type(datetime)"`
	CreateBy           string       `orm:"column(createby);size(100);null"`
	UpdateBy           string       `orm:"column(updateby);size(100);null"`
	UpdateTime         time.Time    `orm:"column(updatetime);auto_now;type(datetime)"`
}

// 设置引擎为 INNODB
func (u *Agreement) TableEngine() string {
	return "INNODB"
}

func (this *Agreement) TableName() string {
	return "agreement"
}

func checkAgreement(a Agreement) error {
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

func AddAgreement(a Agreement) (int64, error) {
	if err := checkAgreement(a); err != nil {
		return 0, err
	}

	exist := Orm.QueryTable("agreement").Filter("AgreementName", a.AgreementName).Exist()
	if exist {
		return 0, errors.New(a.AgreementName + "合同已存在")
	}

	id, err := Orm.Insert(&a)
	if err != nil {
		return 0, errors.New("添加合同错误" + err.Error())
	}
	return id, nil
}

func DelAgreement(id int64) error {
	_, err := Orm.QueryTable("agreement").Filter("agreementId", id).Update(orm.Params{
		"enable": false,
	})
	if err != nil {
		beego.Error("删除合同错误", err.Error())
		return err
	}
	return nil
}

func HardDelAgreement(id int64) error {
	_, err := Orm.QueryTable("agreement").Filter("agreementId", id).Delete()
	if err != nil {
		beego.Error("删除合同错误", err.Error())
		return err
	}
	return nil
}

func GetAgreement(query map[string]string, sort string, order string, offset int64, limit int64) (entityArray []interface{}, total int64) {

	var agreementArray = make([]Agreement, 0)
	var totalArray = make([]Agreement, 0)

	querySql := fmt.Sprintf(" select am.* from agreement AS am")
	totalSql := fmt.Sprintf(" select am.* from agreement AS am")

	v := query["enable"]
	if v !=""{
		querySql = fmt.Sprintf(" %s where am.enable=%s ",querySql,v)
		totalSql = fmt.Sprintf(" %s where am.enable=%s ",totalSql,v)
	}else{
		querySql = fmt.Sprintf(" %s where ",querySql)
		totalSql = fmt.Sprintf(" %s where ",totalSql)
	}

	v = query["search"]
	if v != "" {
		querySql = fmt.Sprintf(" %s and am.agreement_name like '%%%s%%' ",querySql,v)
		querySql = fmt.Sprintf(" %s or ",querySql)
		querySql = fmt.Sprintf(" %s am.agreement_no like '%%%s%%' ",querySql,v)

		totalSql = fmt.Sprintf(" %s and am.agreement_name like '%%%s%%' ",totalSql,v)
		totalSql = fmt.Sprintf(" %s or ",totalSql)
		totalSql = fmt.Sprintf(" %s am.agreement_no like '%%%s%%' ",totalSql,v)
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

	if limit>=0 && offset >=0{
		querySql = fmt.Sprintf(" %s limit %d offset %d ",querySql,limit,offset)
	}

	_,err = Orm.Raw(querySql).QueryRows(&agreementArray)
	if err == nil{
		for _, v := range agreementArray {
			state, _ := GetAgreementStateById(v.State.Id)
			supplier, _ := SupplierGetById(v.Supplier.Id)
			v.State = state
			v.Supplier = supplier
			entityArray = append(entityArray, v)
		}
	}
	return entityArray, total
}

func CountAgreement(query map[string]string) (total int64, err error) {
	qs := Orm.QueryTable("agreement")
	// query k=v
	for k, v := range query {
		k = strings.Replace(k, ".", "__", -1)
		beego.Info("查询合同的当前key", k, "值是", v)
		qs = qs.Filter(k, v)
	}
	return qs.Count()
}

func AgreementGetById(id int64) (*Agreement, error) {
	obj := &Agreement{
		AgreementId: id,
	}
	err := Orm.Read(obj)
	if err != nil {
		return nil, err
	}
	return obj, nil
}

func PutAgreement(m *Agreement) (err error) {
	_, err = Orm.Update(m)
	if err != nil {
		return err
	} else {
		return nil
	}
}
