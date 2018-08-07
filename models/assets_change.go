package models

import (
	"time"
)

//资产变更模型
type AssetsChange struct {
	Id          int64        `orm:"pk;auto"`

	//变更标题
	Title       string       `orm:"size(60)"`

	//变更理由
	Reason	    string	 `orm:"size(255)"`

	//变更日期
	Date        time.Time    `orm:"type(date)"`

	//变更时间
	Time 	    string	 `orm:"size(10)"`

	//变更类型
	Type 	    string	 `orm:"size(20)"`

	//变更前值
	OldValue    string	 `orm:"size(255)"`

	//变更后的值
	NewValue    string	 `orm:"size(255)"`

	//变更属性名称
	AttributeName string 	 `orm:"size(255)"`

}

func (this *AssetsChange) TableEngine() string {
	return "INNODB"
}
