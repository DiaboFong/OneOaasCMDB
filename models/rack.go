package models

import (
	"errors"
	"log"
	"strings"

	"github.com/astaxie/beego/validation"
	"github.com/astaxie/beego"
	"time"
	"fmt"
	"github.com/astaxie/beego/orm"
)

/*
功能:
机柜信息
机柜ID         RackId
机柜名称        RackName
机柜标准U数     StandardNum 单位(U)
顶部不可用U数   TopNotAvailableNum 单位(U)
底部不可用U数   BottomNotAvailableNum 单位(U)
机柜可用U数     AvaliableNum
托盘数         TaryNum
机柜带宽流量    RackNetflow
是否有UPS      IsUps
是否A/B供电    IsAb
机柜功率       Power
备注           Comment
机柜状态       State
*/

type Rack struct {
	RackId                int64   `orm:"column(rackid);pk;auto"`
	RackName              string  `orm:"size(255),unique;null"`
	StandardNum           int64   `orm:"size(3);null"`
	TopNotAvailableNum    int64   `orm:"size(3);null"`
	BottomNotAvailableNum int64   `orm:"size(3);null"`
	AvaliableNum          int64   `orm:"size(3);null"`
	TaryNum               int64   `orm:"size(3);null"`
	RackNetflow           float64 `orm:"size(11);null"`
	IsUps                 int64   `orm:"size(255);null"`
	IsAb                  int64   `orm:"size(255);null"`
	Power                 int64   `orm:"size(11);null"`
	Comment               string  `orm:"size(512);null"`
	State                 *RackState  `orm:"rel(fk)"` //一个状态对应多个机柜
	Room                  *Room       `orm:"rel(fk)"`
	Hardware              []*Hardware `orm:"reverse(many)"`
	Bandwidth             []*NetworkBandwidth  `orm:"reverse(many)"`
	Server                []*Server   `orm:"reverse(many)"`
	Enable                bool         `orm:"column(enable);size(1);null"`
	CreateTime            time.Time    `orm:"column(createtime);auto_now_add;type(datetime)"`
	CreateBy              string       `orm:"column(createby);size(100);null"`
	UpdateBy              string       `orm:"column(updateby);size(100);null"`
	UpdateTime            time.Time    `orm:"column(updatetime);auto_now;type(datetime)"`
}

// 设置引擎为 INNODB
func (u *Rack) TableEngine() string {
	return "INNODB"
}

func (this *Rack) TableName() string {
	return "rack"
}

func checkrack(a *Rack) error {
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

func AddRack(a *Rack) (int64, error) {
	if err := checkrack(a); err != nil {
		beego.Debug("[添加机柜,验证机柜对象信息,发生错误", err.Error(), "]")
		return 0, err
	}

	exist := Orm.QueryTable("rack").Filter("RackName", a.RackName).Exist()
	if exist {
		return 0, errors.New(a.RackName + "机柜已存在")
	}

	id, err := Orm.Insert(a)
	if err != nil {
		beego.Debug("[添加机柜,插入数据库,发生错误", err.Error(), "]")
		_, errorCode := dbErrorParse(err.Error())
		if errorCode == 1062 {
			return 0, errors.New("机柜已存在")
		} else {
			return 0, errors.New("添加机柜错误")
		}
	}
	return id, err
}

func DelRack(id int64) error {
	exist_bandwidth := Orm.QueryTable("network_bandwidth").Filter("rack_id", id).Exist()
	if exist_bandwidth {
		return errors.New("该机柜正在使用中")
	}
	exist_hardware := Orm.QueryTable("hardware").Filter("rack_id", id).Exist()
	if exist_hardware {
		return errors.New("该机房正在使用中")
	}
	exist_server := Orm.QueryTable("server").Filter("rack_id", id).Exist()
	if exist_server {
		return errors.New("该机房正在使用中")
	}

	rows, err := Orm.QueryTable("Rack").Filter("Rackid", id).Update(orm.Params{
		"enable": false,
	})
	beego.Debug("删除后返回值是,", rows)
	if rows == 0 {
		return errors.New("ERROR_NOT_FOUND")
	}

	if err != nil {
		return err
	}
	return nil
}

func HardDelRack(id int64) error {
	_, err := Orm.QueryTable("Rack").Filter("Rackid", id).Delete()
	if err != nil {
		return err
	}
	return nil
}

func GetRack(query map[string]string, sort string, order string, offset int64, limit int64, rackname string, state string, room string, isab int64, isups int64, start_time string, end_time string) (entityArray []interface{}, total int64) {
	var rackArray = make([]Rack, 0)
	var totalArray = make([]Rack, 0)

	querySql := fmt.Sprintf(" select rk.* from rack AS rk")
	totalSql := fmt.Sprintf(" select rk.* from rack AS rk")

	v := query["enable"]
	if v !=""{
		querySql = fmt.Sprintf(" %s where rk.enable=%s ",querySql,v)
		totalSql = fmt.Sprintf(" %s where rk.enable=%s ",totalSql,v)
	}else{
		querySql = fmt.Sprintf(" %s where 1=1 ",querySql)
		totalSql = fmt.Sprintf(" %s where 1=1 ",totalSql)
	}

	v = query["search"]
	if v != "" {
		querySql = fmt.Sprintf(" %s and rk.rackname like '%%%s%%' ",querySql,v)
		querySql = fmt.Sprintf(" %s or ",querySql)
		querySql = fmt.Sprintf(" %s rm.tary_num like '%%%s%%' ",querySql,v)

		totalSql = fmt.Sprintf(" %s and rk.rackname like '%%%s%%' ",totalSql,v)
		totalSql = fmt.Sprintf(" %s or ",totalSql)
		totalSql = fmt.Sprintf(" %s rm.tary_num like '%%%s%%' ",totalSql,v)
	}

	if rackname != "" {
		querySql = fmt.Sprintf(" %s and rack_name = '%s' ",querySql,rackname)
		totalSql = fmt.Sprintf(" %s and rack_name = '%s' ",totalSql,rackname)
	}

	if state != "" {
		querySql = fmt.Sprintf(" %s and state_id in (%s) ",querySql,state)
		totalSql = fmt.Sprintf(" %s and state_id in (%s) ",totalSql,state)
	}

	if room != "" {
		querySql = fmt.Sprintf(" %s and room_id in (%s) ",querySql,room)
		totalSql = fmt.Sprintf(" %s and room_id in (%s) ",totalSql,room)
	}

	if isups == 1 {
		querySql = fmt.Sprintf(" %s and is_ups = %d ",querySql,isups)
		totalSql = fmt.Sprintf(" %s and is_ups = %d ",totalSql,isups)
	}

	if isab == 1 {
		querySql = fmt.Sprintf(" %s and is_ab = %d ",querySql,isab)
		totalSql = fmt.Sprintf(" %s and is_ab = %d ",totalSql,isab)
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

	_,err = Orm.Raw(querySql).QueryRows(&rackArray)
	if err == nil{
		for _, v := range rackArray {
			state, _ := GetRackStateById(v.State.Id)
			room, _ := GetRoomById(v.Room.RoomId)
			v.State = state
			v.Room = room
			entityArray = append(entityArray, v)
		}
	}
	return entityArray, total
}

func CountRack(query map[string]string) (total int64, err error) {
	qs := Orm.QueryTable("rack")
	// query k=v
	for k, v := range query {
		k = strings.Replace(k, ".", "__", -1)
		beego.Info("查询机柜当前key", k, "值是", v)
		qs = qs.Filter(k, v)
	}

	return qs.Count()
}

func CountRackUNum (query map[string]string) (total interface {}, err error) {
	o := orm.NewOrm()
	var maps []orm.Params
	/*num, err :=*/ o.Raw("select SUM(standard_num) Num from rack").Values(&maps)
	/*if err == nil && num > 0 {
		beego.Error("U位总数:",maps[0]["Num"])
	}*/
	uNum := maps[0]["Num"]

	return uNum,err
}

func CountRackUAvaNum (query map[string]string) (total interface {}, err error) {
	o := orm.NewOrm()
	var maps []orm.Params
	/*num, err :=*/ o.Raw("select SUM(avaliable_num) Num from rack").Values(&maps)
	/*if err == nil && num > 0 {
		beego.Error("U位可使用数:",maps[0]["Num"])
	}*/
	uNum := maps[0]["Num"]

	return uNum,err
}

func RackGetById(id int64) (*Rack, error) {
	obj := &Rack{
		RackId: id,
	}
	err := Orm.Read(obj)
	if err != nil {
		return nil, err
	}
	return obj, nil
}

func PutRack(m *Rack) (err error) {
	_, err = Orm.Update(m);
	if err != nil {
		return err
	} else {
		return nil
	}
}