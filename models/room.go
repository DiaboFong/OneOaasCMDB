package models

import (
	"errors"
	"log"
	"strings"

	"github.com/astaxie/beego"
	"github.com/astaxie/beego/validation"
	"time"
	"fmt"
	"encoding/json"
	"oneoaas.com/cmdb/util"
	"github.com/astaxie/beego/orm"
)

type Room struct {
	RoomId             int64        `orm:"column(roomid);auto"`
	RoomName           string       `orm:"column(roomname);size(255),unique;null"`
	Floor              string       `orm:"column(floor);size(255);null"`
	RoomNo             string       `orm:"column(roomno);size(255);null"`
	Comment            string       `orm:"column(comment);size(512);null"`
	BusinessContact    string       `orm:"size(255);null"`
	TechnicalContact   string       `orm:"size(255);null"`
	ReceivingContact   string       `orm:"size(255);null"`
	MaintenanceContact string       `orm:"size(255);null"`
	Datacenter         *Datacenter  `orm:"rel(fk)"`       //一个数据中心对应多个机房,一个机房对应一个数据中心
	State              *RoomState   `orm:"rel(fk)"`       //一个机房对应一种状态,一个机房状态可以对应多个机房
	IpAddress          []*IpAddress `orm:"reverse(many)"`
	Rack               []*Rack      `orm:"reverse(many)"` //一个机房有多个机柜
	Bandwidth          []*NetworkBandwidth  `orm:"reverse(many)"` //一个机房有多个带宽
	Enable             bool         `orm:"column(enable);size(1);null"`
	CreateTime         time.Time    `orm:"column(createtime);auto_now_add;type(datetime)"`
	CreateBy           string       `orm:"column(createby);size(100);null"`
	UpdateBy           string       `orm:"column(updateby);size(100);null"`
	UpdateTime         time.Time    `orm:"column(updatetime);auto_now;type(datetime)"`
}

//重写对象json格式化
func (this *Room) MarshalJSON() ([]byte, error) {
	type Alias Room
	return json.Marshal(&struct {
		*Alias
		CreateDate string `json:"createDate"`
		UpdateDate string `json:"updateDate"`
	}{
		Alias: (*Alias)(this),
		CreateDate: this.CreateTime.Format(util.Time_Default_Layout_2),
		UpdateDate: this.UpdateTime.Format(util.Time_Default_Layout_2),
	})
}

// 设置引擎为 INNODB
func (u *Room) TableEngine() string {
	return "INNODB"
}

func (this *Room) TableName() string {
	return "room"
}

func checkroom(a *Room) error {
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

func AddRoom(a *Room) (int64, error) {
	if err := checkroom(a); err != nil {
		return 0, err
	}

	exist := Orm.QueryTable("Room").Filter("RoomName", a.RoomName).Exist()
	if exist {
		return 0, errors.New(a.RoomName + "机房已存在")
	}

	id, err := Orm.Insert(a)
	if err != nil {
		_, errorCode := dbErrorParse(err.Error())
		if errorCode == 1062 {
			return 0, errors.New("Room已存在")
		} else {
			return 0, errors.New("添加Room出现异常")
		}
	}
	return id, err
}

func DelRoom(id int64) error {
	exist_rack := Orm.QueryTable("rack").Filter("room_id", id).Exist()
	if exist_rack {
		return errors.New("该机房正在使用中")
	}
	exist_bandwidth := Orm.QueryTable("network_bandwidth").Filter("room_id", id).Exist()
	if exist_bandwidth {
		return errors.New("该机房正在使用中")
	}

	rows, err := Orm.QueryTable("Room").Filter("Roomid", id).Update(orm.Params{
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

func HardDelRoom(id int64) error {
	_, err := Orm.QueryTable("Room").Filter("Roomid", id).Delete()
	if err != nil {
		return err
	}
	return nil
}

func GetRoom(query map[string]string, sort string, order string, offset int64, limit int64, roomname string, state string, datacenter string, start_time string, end_time string) (entityArray []interface{}, total int64) {
	var roomArray = make([]Room, 0)
	var totalArray = make([]Room, 0)

	querySql := fmt.Sprintf(" select rm.* from room AS rm")
	totalSql := fmt.Sprintf(" select rm.* from room AS rm")

	v := query["enable"]
	if v !=""{
		querySql = fmt.Sprintf(" %s where rm.enable=%s ",querySql,v)
		totalSql = fmt.Sprintf(" %s where rm.enable=%s ",totalSql,v)
	}else{
		querySql = fmt.Sprintf(" %s where 1=1 ",querySql)
		totalSql = fmt.Sprintf(" %s where 1=1 ",totalSql)
	}

	v = query["search"]
	if v != "" {
		querySql = fmt.Sprintf(" %s and rm.roomname like '%%%s%%' ",querySql,v)
		querySql = fmt.Sprintf(" %s or ",querySql)
		querySql = fmt.Sprintf(" %s rm.business_contact like '%%%s%%' ",querySql,v)

		totalSql = fmt.Sprintf(" %s and rm.roomname like '%%%s%%' ",totalSql,v)
		totalSql = fmt.Sprintf(" %s or ",totalSql)
		totalSql = fmt.Sprintf(" %s rm.business_contact like '%%%s%%' ",totalSql,v)
	}

	if roomname != "" {
		querySql = fmt.Sprintf(" %s and roomname = '%s' ",querySql,roomname)
		totalSql = fmt.Sprintf(" %s and roomname = '%s' ",totalSql,roomname)
	}

	if state != "" {
		querySql = fmt.Sprintf(" %s and state_id in (%s) ",querySql,state)
		totalSql = fmt.Sprintf(" %s and state_id in (%s) ",totalSql,state)
	}

	if datacenter != "" {
		querySql = fmt.Sprintf(" %s and datacenter_id in (%s) ",querySql,datacenter)
		totalSql = fmt.Sprintf(" %s and datacenter_id in (%s) ",totalSql,datacenter)
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

	_,err = Orm.Raw(querySql).QueryRows(&roomArray)
	if err == nil{
		for _, v := range roomArray {
			state, _ := GetRoomStateById(v.State.Id)
			dc, _ := GetDatacenterById(v.Datacenter.Dcid)
			v.State = state
			v.Datacenter = dc
			entityArray = append(entityArray, v)
		}
	}

	return entityArray, total
}

func CountRoom(query map[string]string) (total int64, err error) {
	qs := Orm.QueryTable("room")
	// query k=v
	for k, v := range query {
		k = strings.Replace(k, ".", "__", -1)
		beego.Info("查询机房的当前key", k, "值是", v)
		qs = qs.Filter(k, v)
	}

	return qs.Count()
}

func GetRoomById(id int64) (*Room, error) {
	obj := &Room{
		RoomId: id,
	}
	err := Orm.Read(obj)
	if err != nil {
		return nil, err
	}
	return obj, nil
}

func PutRoom(m *Room) (err error) {
	_, err = Orm.Update(m)
	if err != nil {
		return err
	} else {
		return nil
	}
}
