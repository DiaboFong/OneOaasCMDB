package models

type City struct {
	Id        int64        `orm:"column(id);pk;auto;size(11)"`
	CityIndex int64        `orm:"size(11)"`
	Province  *Province    `orm:"rel(fk);size(11)"`
	Name      string       `orm:"column(name);size(100)"`
}

func (u *City) TableEngine() string {
	return "INNODB"
}
