package controllers

import (
	"github.com/astaxie/beego"
	"oneoaas.com/cmdb/models"
	m "oneoaas.com/cmdb/models"
	"oneoaas.com/cmdb/util"
	"strings"
	"time"
	/*"fmt"
	"github.com/mingzhehao/goutils/filetool"
	"github.com/ulricqin/beego-blog/g"*/
	"net/http"
)

/*const (
	CATALOG_IMG_DIR = "static/img"
)*/

func (this *UserController) GetEditRoleMenus() {

	roleId, _ := this.GetInt64("role", 0)
	type RoleMenu struct {
		Id     int64
		MenuId int64
	}
	var roleMenus []RoleMenu
	_, err := models.Orm.Raw("select id,menu_id from menu_roles where role_id = ? ;", roleId).QueryRows(&roleMenus)
	if err != nil {
		beego.Error("查询角色菜单错误", err.Error())
	}
	primaryMenuNodeList := make([]MenuNode, 0)
	primaryMenulist, _ := models.QueryAllPrimaryMenu()
	for _, menuObj := range primaryMenulist {
		if menuObj != nil {
			subMenuNodeList := make([]MenuNode, 0)
			newSubMenuNodeList := make([]MenuNode, 0)
			subList, _ := models.QueryAllSubMenu(menuObj.MenuId)
			for _, subMenu := range subList {
				var subMenuNode MenuNode
				subMenuNode = MenuNode{
					Id:    subMenu.MenuId,
					Text:  subMenu.DisplayName,
					Level: subMenu.Level,
					Url:   subMenu.Url,
					State: MenuState{
						Opened:   "true",
						Selected: "false",
					},
				}
				subMenuNodeList = append(subMenuNodeList, subMenuNode)
			}

			primaryMenuNode := MenuNode{
				Id:    menuObj.MenuId,
				Text:  menuObj.DisplayName,
				Level: menuObj.Level,
				Url:   menuObj.Url,
				State: MenuState{
					Opened:   "true",
					Selected: "false",
				},
			}

			for _, subMenuNode := range subMenuNodeList {
				for _, roleMenu := range roleMenus {
					if roleMenu.MenuId == subMenuNode.Id {
						subMenuNode.State.Selected = "true"
					}else if(roleMenu.MenuId == primaryMenuNode.Id ){
						primaryMenuNode.State.Selected = "true"
					}
				}
				newSubMenuNodeList = append(newSubMenuNodeList, subMenuNode)
			}
			primaryMenuNode.Children = newSubMenuNodeList
			primaryMenuNodeList = append(primaryMenuNodeList, primaryMenuNode)
		}
	}

	this.Data["json"] = primaryMenuNodeList
	this.ServeJSON()
}

// @Title 查询用户
// @Description GetUser
//查询用户
func (this *UserController) GetUser() {
	var fields []string
	var sort []string
	var order []string
	//存储条件,查询记录信息
	var query map[string]string = make(map[string]string)
	//存储条件,查询记录总量
	var countQuery map[string]string = make(map[string]string)
	var limit int64 = -1
	var offset int64 = -1
	if v, err := this.GetInt64("limit"); err == nil {
		limit = v
	}
	if v, err := this.GetInt64("offset"); err == nil {
		offset = v
	}
	if v := this.GetString("sort"); v != "" {
		sort = strings.Split(v, ",")
	}
	if v := this.GetString("order"); v != "" {
		order = strings.Split(v, ",")
	}
	if v := this.GetString("query"); v != "" {
		for _, cond := range strings.Split(v, ",") {
			kv := strings.Split(cond, ":")
			if len(kv) != 2 {
				continue
			}
			k, v := kv[0], kv[1]
			if len(v) == 0 {
				continue
			}
			query[k] = v
			countQuery[k] = v
		}
	}

	userList, err := m.GetUsers(query, fields, sort, order, offset, limit)
	if err != nil {
		beego.Error(err)
	}
	if v := this.GetString("format"); v != "" {
		if v == "total" {
			countNum, _ := m.CountUser(countQuery)
			this.TotalRowsPageJSON(countNum, userList)
		}
	} else {
		this.DataJSON(userList)
	}
}

//添加用户
func (this *UserController) AddUser() {

	this.DbLog("User", "用户", "添加")

	var user m.User
	roleId, err := this.GetInt64("roleId", 0)
	user.LoginName = this.GetString("login", "")
	user.Password = this.GetString("password", "")
	user.Name = this.GetString("username", "")
	user.ContactPhone = this.GetString("contactphone", "")
	user.Email = this.GetString("email", "")
	user.RegisterTime = time.Now()

	roleObj, err := m.GetRoleById(roleId)
	if err != nil {
		this.ResponseErrorJSON(http.StatusOK, err.Error())
	}
	user.Role = roleObj
	userId, err := m.AddUser(user)
	if err != nil{
		beego.Debug("[添加用户错误", err.Error(), "]")
		this.ResponseErrorJSON(http.StatusOK, err.Error())
	}
	_, err = m.AddUserRole(userId, roleId)
	if err == nil {
		this.Data["json"] = this.ResponseSuccessJSON(true, "添加用户成功", userId)
	}else{
		this.ResponseErrorJSON(http.StatusOK, err.Error())
	}
	this.ServeJSON()
}

//删除用户
func (this *UserController) DelUser() {

	this.DbLog("User", "用户", "删除")

	var err error
	v := this.GetStrings("userId")
	if len(v) > 0 {
		for _, value := range v {
			for _, id := range strings.Split(value, ",") {
				userId, _ := util.StrToInt64(id)
				if userId == 1{
					this.Data["json"] = this.ResponseSuccessJSON(false, "管理员不能删除", -1)
					this.ServeJSON()
				}else {
					err = m.DelUser(userId)
				}
			}
		}
		if err != nil {
			this.ResponseErrorJSON(http.StatusOK, err.Error())
		} else {
			this.Data["json"] = this.ResponseSuccessJSON(true, "删除用户成功", 1)
		}
	} else {
		this.Data["json"] = this.ResponseSuccessJSON(false, "删除用户失败", -1)
	}
	this.ServeJSON()
}

//更新用户
func (this *UserController) PutUser() {

	this.DbLog("User", "用户", "更新")

	Userid, _ := this.GetInt64("userid", 0)
	user, err := m.GetUserById(Userid)
	if err != nil {
		this.ResponseErrorJSON(http.StatusOK, err.Error())
	}

	user.Name = strings.TrimSpace(this.GetString("user", ""))
	beego.Debug("[用户Id是", user.Userid, "用户是", user.Name, "]")

	if updateBy := this.GetString("loginname", ""); updateBy != "" {
		user.LoginName = updateBy
	}

	if updateBy := this.GetString("username", ""); updateBy != "" {
		user.Name = updateBy
	}

	if updateBy := this.GetString("contactphone", ""); updateBy != "" {
		user.ContactPhone = updateBy
	}

	if updateBy := this.GetString("email", ""); updateBy != "" {
		user.Email = updateBy
	}

	//密码更改
	if password := this.GetString("password", ""); password != "" {
		//如果当前输入与原来密码不一致，表示修改密码
		if password != user.Password {
			hash := util.GenrateHash(user.Salt,util.Strtomd5(password))
			user.Password = util.Strtomd5(hash)
		}
	}

	user.UpdateTime = time.Now()

	if err := m.PutUser(user); err == nil {
		this.Data["json"] = this.ResponseSuccessJSON(true, "更新用户成功", 1)
	} else {
		this.Data["json"] = this.ResponseSuccessJSON(false, "更新用户失败", -1)
	}
	this.ServeJSON()
}

func (this *UserController) Fnish() {

}
