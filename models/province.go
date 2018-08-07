package models

type Province struct {
	Id   int64        `orm:"column(id);pk;auto;size(11)"`
	Name string       `orm:"column(name);size(50)"`
	City []*City        `orm:"reverse(many)"`
}

func (u *Province) TableEngine() string {
	return "INNODB"
}
