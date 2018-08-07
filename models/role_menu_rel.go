package models

type RoleMenuRel struct {
	Id   int64 `orm:"pk;auto"`
	Menu *Menu `orm:"rel(fk)"`
	Role *Role `orm:"rel(fk)"`
}
