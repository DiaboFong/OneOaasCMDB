package controllers

import (
	"github.com/astaxie/beego"
	m "oneoaas.com/cmdb/models"
	"oneoaas.com/cmdb/util"
	"strings"
)

//查询角色
func (this *RoleController) GetRole() {
	var sort []string
	var order []string
	var query = make(map[string]string, 0) //存储条件
	var roleList = make([]interface{}, 0)  //存储返回数据
	var limit int64 = 10
	var offset int64 = 0

	// limit: 10 (default is 10)
	if v, err := this.GetInt64("limit"); err == nil {
		limit = v
	}
	// offset: 0 (default is 0)
	if v, err := this.GetInt64("offset"); err == nil {
		offset = v
	}

	// sort: col1,col2
	if v := this.GetString("sort"); v != "" {
		sort = strings.Split(v, ",")
	}

	// order: desc,asc
	if v := this.GetString("order"); v != "" {
		order = strings.Split(v, ",")
	}

	//搜索查询,默认按角色查询
	if v := this.GetString("search"); v != "" {
		query["Name__icontains"] = v
		//WHERE Name LIKE '% %'

	}

	roleList, err := m.GetRole(query, sort, order, offset, limit)
	if err != nil {
		beego.Error("[查询角色发生错误", err.Error(), "]")
	}
	if roleList == nil {
		roleList = make([]interface{}, 0)
	}
	if v := this.GetString("format"); v != "" {
		if v == "total" {
			countNum, _ := m.CountRole(query)
			this.TotalRowsPageJSON(countNum, roleList)
		}
	} else {
		this.DataJSON(roleList)
	}
	this.ServeJSON()
}

//添加角色
func (this *RoleController) AddRole() {

	this.DbLog("Role", "角色", "添加")

	var role m.Role
	role.Name = this.GetString("role", "")
	menuIds := this.GetString("menuIds", "")
	var menuObjList = []*m.Menu{}
	var roleObjList = []*m.Role{}
	menuIdArray := strings.Split(menuIds, ",")
	for _, mId := range menuIdArray {
		if len(mId) > 0 {
			id, _ := util.StrToInt64(mId)
			menuObj, _ := m.MenuGetById(id)
			if menuObj != nil {
				menuObjList = append(menuObjList, menuObj)
			}
		}
	}
	role.Menu = menuObjList
	id, err := m.AddRole(role)
	if err != nil {
		beego.Error("[保存角色错误", err.Error(), "]")
		this.ResponseErrorJSON(400, errorFormat(ErrorBadRequest_400, err.Error()))
	} else {
		roleObj, _ := m.GetRoleById(id)
		roleObjList = append(roleObjList, roleObj)
		for _, menuObj := range menuObjList {
			menuObj.Role = roleObjList
			m.PutMenu(menuObj)
		}
		beego.Debug("[保存角色成功,id是", id, "]")
		this.Data["json"] = this.ResponseSuccessJSON(true, "添加角色成功", id)
	}
	this.ServeJSON()
}

//删除角色
func (this *RoleController) DelRole() {

	this.DbLog("Role", "角色", "删除")

	var err error
	v := this.GetStrings("roleId")
	if len(v) > 0 {
		for _, value := range v {
			for _, id := range strings.Split(value, ",") {
				roleId, _ := util.StrToInt64(id)
				err = m.DelRole(roleId)
			}
		}
		if err != nil {
			this.ResponseErrorJSON(400, err.Error())
		} else {
			this.Data["json"] = this.ResponseSuccessJSON(true, "删除角色成功", 1)
		}
	} else {
		this.Data["json"] = this.ResponseSuccessJSON(false, "删除角色失败", -1)
	}
	this.ServeJSON()
}

//更新角色
func (this *RoleController) PutRole() {

	this.DbLog("Role", "角色", "更新")

	roleId, _ := this.GetInt64("roleId", 0)

	if roleId == 8{
		this.ResponseErrorJSON(200,"超级管理员不能修改")
	}

	role, err := m.GetRoleById(roleId)
	if err != nil {
		this.ResponseErrorJSON(200, err.Error())
	}
	name := strings.TrimSpace(this.GetString("role", ""))
	if name == "" {
		this.ResponseErrorJSON(200, "角色名称不能为空")
	}
	role.Name = name
	menuIds := this.GetString("menuIds", "")
	var menuObjList = []*m.Menu{}
	menuIdArray := strings.Split(menuIds, ",")
	for _, mId := range menuIdArray {
		if len(mId) > 0 {
			id, _ := util.StrToInt64(mId)
			menuObj, _ := m.MenuGetById(id)
			if menuObj != nil {
				menuObjList = append(menuObjList, menuObj)
			}
		}
	}
	role.Menu = menuObjList
	if err := m.PutRole(role); err == nil {
		this.Data["json"] = this.ResponseSuccessJSON(true, "更新角色成功", 1)
	} else {
		this.Data["json"] = this.ResponseSuccessJSON(false, "更新角色失败", -1)
	}
	this.ServeJSON()
}
