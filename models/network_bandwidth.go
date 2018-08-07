package models

import (
	"errors"
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/validation"
	"log"
	"strings"
	"time"
	"fmt"
	"github.com/astaxie/beego/orm"
)

//唯一标识 Id
//名称    Name
//最大采购带宽 MaxBandwidth
//保底带宽    MinBandwidth
//保底费用    MinCost
//单位成本    UnitCost
//所属机房
//所属机柜
//备注

type NetworkBandwidth struct {
	Id           int64                    `orm:"pk;auto"`
	Name         string                   `orm:"size(255),unique"`
	MaxBandwidth float64                  `orm:"size(64)"`
	MinBandwidth float64                  `orm:"size(64)"`
	MinCost      float64                  `orm:"size(11)"`
	UnitCost     float64                  `orm:"size(11);null"`
	Comment      string                   `orm:"size(512);null"`
	Isp          *InternetServiceProvider `orm:"rel(fk)"`
	State        *NetworkBandwidthState   `orm:"rel(fk)"`
	Room         *Room                    `orm:"rel(fk);null"`
	Rack         *Rack                    `orm:"rel(fk);null"`

	Enable       bool         `orm:"column(enable);size(1);null"`
	CreateTime   time.Time    `orm:"column(createtime);auto_now_add;type(datetime)"`
	CreateBy     string       `orm:"column(createby);size(100);null"`
	UpdateBy     string       `orm:"column(updateby);size(100);null"`
	UpdateTime   time.Time    `orm:"column(updatetime);auto_now;type(datetime)"`
}

// 设置引擎为 INNODB
func (u *NetworkBandwidth) TableEngine() string {
	return "INNODB"
}

func checknetworkband(a NetworkBandwidth) error {
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

func AddNetworkbandwidth(a NetworkBandwidth) (int64, error) {
	if err := checknetworkband(a); err != nil {
		return 0, err
	}

	exist := Orm.QueryTable("network_bandwidth").Filter("Name", a.Name).Exist()
	if exist {
		return 0, errors.New(a.Name + "带宽已存在")
	}

	id, err := Orm.Insert(&a)
	if err != nil {
		beego.Debug("[添加带宽,插入数据库,发生错误", err.Error(), "]")
		_, errorCode := dbErrorParse(err.Error())
		if errorCode == 1062 {
			return 0, errors.New("带宽已存在")
		} else {
			return 0, errors.New("添加带宽出现异常")
		}
	}
	return id, err
}

func DelNetworkbandwidth(id int64) error {
	rows, err := Orm.QueryTable("network_bandwidth").Filter("Id", id).Update(orm.Params{
		"enable": false,
	})
	if rows == 0 {
		return errors.New("找不到该带宽")
	}
	if err != nil {
		return err
	}
	return nil
}

func HardDelNetworkbandwidth(id int64) error {
	_, err := Orm.QueryTable("network_bandwidth").Filter("Id", id).Delete()
	if err != nil {
		return err
	}
	return nil
}

func GetNetworkbandwidth(query map[string]string, sort string, order string, offset int64, limit int64, name string, state string, isp string, start_time string, end_time string) (entityArray []interface{}, total int64) {
	var bandwidthArray = make([]NetworkBandwidth, 0)
	var totalArray = make([]NetworkBandwidth, 0)

	querySql := fmt.Sprintf(" select bh.* from network_bandwidth AS bh")
	totalSql := fmt.Sprintf(" select bh.* from network_bandwidth AS bh")

	v := query["enable"]
	if v !=""{
		querySql = fmt.Sprintf(" %s where bh.enable=%s ",querySql,v)
		totalSql = fmt.Sprintf(" %s where bh.enable=%s ",totalSql,v)
	}else{
		querySql = fmt.Sprintf(" %s where 1=1 ",querySql)
		totalSql = fmt.Sprintf(" %s where 1=1 ",totalSql)
	}

	v = query["search"]
	if v != "" {
		querySql = fmt.Sprintf(" %s and bh.name like '%%%s%%' ",querySql,v)
		querySql = fmt.Sprintf(" %s or ",querySql)

		totalSql = fmt.Sprintf(" %s and bh.name like '%%%s%%' ",totalSql,v)
		totalSql = fmt.Sprintf(" %s or ",totalSql)
	}

	if name != "" {
		querySql = fmt.Sprintf(" %s and name = '%s' ",querySql, name)
		totalSql = fmt.Sprintf(" %s and name = '%s' ",totalSql, name)
	}

	if state != "" {
		querySql = fmt.Sprintf(" %s and state_id in (%s) ",querySql, state)
		totalSql = fmt.Sprintf(" %s and state_id in (%s) ",totalSql, state)
	}

	if isp != "" {
		querySql = fmt.Sprintf(" %s and isp_id in (%s) ",querySql, isp)
		totalSql = fmt.Sprintf(" %s and isp_id in (%s) ",totalSql, isp)
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
	//totalSql = `select count(*) from network_bandwidth AS  a left outer join internet_service_provider AS  b ON a.isp_id = b.id left outer join network_bandwidth_state AS c ON a.state_id = c.id left outer join room AS d ON a.room_id = d.roomid left outer join rack AS e ON a.rack_id = e.rackid;`
	_,err := Orm.Raw(totalSql).QueryRows(&totalArray)
	if err == nil{
		totalSize := len(totalArray)
		total = int64(totalSize)
	}

	//querySql = `select a.*,b.*,c.*,d.* from network_bandwidth AS  a left outer join internet_service_provider AS  b ON a.isp_id = b.id left outer join network_bandwidth_state AS c ON a.state_id = c.id left outer join room AS d ON a.room_id = d.roomid left outer join rack AS e ON a.rack_id = e.rackid;`
	//var internetServiceProviders = make([]InternetServiceProvider, 0)
	//var networkBandwidthStates = make([]NetworkBandwidthState, 0)
	//var rooms = make([]Room, 0)
	//var racks = make([]Rack, 0)

	//var maps []orm.Params
	_,err = Orm.Raw(querySql).QueryRows(&bandwidthArray)
	//_,err = Orm.Raw(querySql).Values(&maps)
	//for _, v := range maps {
	//	fmt.Println(v)
	//}
	if err == nil{
		for _, v := range bandwidthArray {
			state, _ := GetNetworkBandwidthStateById(v.State.Id)
			isp, _ := GetInternetServiceProviderById(v.Isp.Id)
			room, _ := GetRoomById(v.Room.RoomId)
			rack, _ := RackGetById(v.Rack.RackId)
			v.State = state
			v.Isp = isp
			v.Room = room
			v.Rack = rack
			entityArray = append(entityArray, v)
		}
	}
	return entityArray, total
}

//统计符合条件的数据记录
func CountNetworkbandwidth(query map[string]string) (total int64, err error) {
	qs := Orm.QueryTable("network_bandwidth")
	// query k=v
	for k, v := range query {
		k = strings.Replace(k, ".", "__", -1)
		beego.Info("查网络带宽柜当前key", k, "值是", v)
		qs = qs.Filter(k, v)
	}

	return qs.Count()
}

func BandwidthGetById(id int64) (*NetworkBandwidth, error) {
	obj := &NetworkBandwidth{
		Id: id,
	}
	err := Orm.Read(obj)
	if err != nil {
		return nil, err
	}
	return obj, nil
}

func PutBandwidth(m *NetworkBandwidth) (err error) {
	_, err = Orm.Update(m)
	if err != nil {
		return err
	} else {
		return nil
	}
}
