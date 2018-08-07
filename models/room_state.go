package models

import (
	"errors"
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/validation"
	"log"
	"time"
)

type RoomState struct {
	Id         int64     `orm:"column(id);auto"`
	State      string    `orm:"column(state);size(255),unique;"`
	Color      string    `orm:"column(color);size(100),unique"`
	Enable     bool      `orm:"column(enable);size(1);null"`
	CreateTime time.Time `orm:"column(createtime);auto_now_add;type(datetime);null"`
	CreateBy   string    `orm:"column(createby);size(100);null"`
	UpdateBy   string    `orm:"column(updateby);size(100);null"`
	UpdateTime time.Time `orm:"column(updatetime);auto_now;type(datetime);null"`
	Room       []*Room   `orm:"reverse(many)"` // fk 的反向关系,一个机房状态可以对应多个机房
}

func (u *RoomState) TableEngine() string {
	return "INNODB"
}

func (this *RoomState) TableName() string {
	return "room_state"
}

func GetAllRoomState() []*RoomState {
	var state []*RoomState
	num, err := Orm.QueryTable("room_state").Filter("Enable",true).All(&state)
	if err != nil {
		beego.Debug("【查询机房状态错误", err.Error(), "]")
	}
	beego.Debug("【查询机房状态的记录数据是", num, "]条")
	return state
}

func GetRoomStateById(id int64) (*RoomState, error) {
	obj := &RoomState{
		Id: id,
	}
	err := Orm.Read(obj)
	if err != nil {
		return nil, err
	}
	return obj, nil
}

//查询数据库状态
func GetRoomState(query map[string]string, sort []string, order []string,
	offset int64, limit int64) (ml []interface{}, err error) {

	/*var state []*RoomState
	num, err := Orm.QueryTable("room_state").Filter("Enable",true).All(&state)
	if err != nil {
		beego.Debug("【查询机房状态错误", err.Error(), "]")
	}
	beego.Debug("【查询机房状态的记录数据是", num, "]条")
*/
	//定义存储对象
	var roomStateArray = make([]RoomState, 0) //存储返回数据

	//查询机房状态表
	qs := Orm.QueryTable("room_state")

	//构造排序字段,默认升序,降序加-号
	var sortFields []string
	if len(sort) >= 0 {
		for _, v := range sort {
			var orderby string
			if order[0] == "desc" {
				orderby = "-" + v
			} else if order[0] == "asc" {
				orderby = v
			}
			beego.Debug("排序字段是", orderby)
			sortFields = append(sortFields, orderby)
		}
		qs = qs.OrderBy(sortFields...)
	}

	//执行过滤排序
	for k, v := range query {
		qs = qs.Filter(k, v)
	}

	//构造返回数据
	if _, err := qs.Limit(limit, offset).All(&roomStateArray); err == nil {
		for _, v := range roomStateArray {
			ml = append(ml, v)
		}
		return ml, nil
	}

	return nil, err
}

//统计符合条件的数据记录
func CountRoomState(query map[string]string) (total int64, err error) {
	qs := Orm.QueryTable("room_state")
	for k, v := range query {
		qs = qs.Filter(k, v)
	}
	return qs.Count()
}

func DelRoomState(id int64) error {
	exist := Orm.QueryTable("room").Filter("state_id", id).Exist()
	if exist {
		return errors.New("该状态正在使用,不能删除")
	}

	rows, err := Orm.QueryTable("room_state").Filter("Id", id).Delete()
	if err != nil {
		return err
	}
	beego.Debug("删除后返回值是,", rows)
	if rows == 0 {
		return errors.New("ERROR_NOT_FOUND")
	}
	return nil
}

func PutRoomState(m *RoomState) (err error) {
	_, err = Orm.Update(m)
	if err != nil {
		return err
	} else {
		return nil
	}
}

func checkRoomState(roomState RoomState) error {
	valid := validation.Validation{}
	b, _ := valid.Valid(roomState)
	if !b {
		for _, err := range valid.Errors {
			log.Println(err.Key, err.Message)
			return errors.New(err.Message)
		}
	}
	return nil
}

func AddRoomState(roomState RoomState) (int64, error) {
	if err := checkRoomState(roomState); err != nil {
		return 0, err
	}

	exist := Orm.QueryTable("room_state").Filter("State", roomState.State).Exist()
	if exist {
		return 0, errors.New(roomState.State + "机房状态已存在")
	}

	id, err := Orm.Insert(&roomState)
	if err != nil {
		return 0, errors.New("添加机房状态错误" + err.Error())
	}
	return id, err
}
