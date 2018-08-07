package controllers

import (
	"errors"
	"net/http"
	"time"

	"fmt"

	"github.com/astaxie/beego"
	"oneoaas.com/cmdb/models"
)

const (
	//资源作为左边菜单路由的,前置状态
	ROUTER_STATE_PREFIX = "root.manageresources."
)

type MenuState struct {
	Opened   string `json:"opened"`
	Selected string `json:"selected"`
}

type MenuNode struct {
	Id         int64      `json:"id"`
	Text       string     `json:"text"`
	Name       string     `json:"name"`
	Level      int64      `json:"level"`
	Url        string     `json:"url"`
	State      MenuState  `json:"state"`
	Logo       string     `json:"logo"`
	Class      string     `json:"class"`
	Children   []MenuNode `json:"children"`
	Datacenter []MenuNode `json:"datacenter"`
	Cloud      []MenuNode `json:"cloud"`
	Business   []MenuNode `json:"business"`
}

// @Title 获取没有根菜单的菜单数组列表
// @Description 根据类型获取菜单数组
// @Success 200 {array} []controllers.api.MenuNode
// @Param   type     query   int false       "菜单类型"
// @Param   Authorization     header   string true       "认证信息"
// @Param   timestamp         query   string true       "时间戳"
// @Failure 400 get menu error
// @router / [get]
func (this *MenuController) GetMenus() {
	menuType, _ := this.GetInt64("type", 0)
	primaryMenuNodeList := make([]MenuNode, 0)
	if menuType == 1 {
		//默认返回不带跟节点当菜单信息
		primaryMenulist, _ := models.QueryAllPrimaryMenu()
		for _, menuObj := range primaryMenulist {
			if menuObj != nil {
				subMenuNodeList := make([]MenuNode, 0)
				subList, _ := models.QueryAllSubMenu(menuObj.MenuId)
				for _, subMenu := range subList {
					subMenuNode := MenuNode{
						Id:    subMenu.MenuId,
						Text:  subMenu.DisplayName,
						Name:  subMenu.Name,
						Level: subMenu.Level,
						Url:   subMenu.Url,
						State: MenuState{
							Opened:   "true",
							Selected: "true",
						},
						Logo: subMenu.Logo,
					}
					subMenuNodeList = append(subMenuNodeList, subMenuNode)
				}

				primaryMenuNode := MenuNode{
					Id:    menuObj.MenuId,
					Text:  menuObj.DisplayName,
					Name:  menuObj.Name,
					Level: menuObj.Level,
					Url:   menuObj.Url,
					State: MenuState{
						Opened:   "true",
						Selected: "true",
					},
					Logo: menuObj.Logo,
				}

				if len(subMenuNodeList) != 0 {
					primaryMenuNode.Children = subMenuNodeList
				}

				primaryMenuNodeList = append(primaryMenuNodeList, primaryMenuNode)
			}
		}
	} else if menuType == 2 {
		//等于2,表示使用角色获取菜单信息
		user, err := this.SessionUser()
		fmt.Println(this.SessionUser())
		fmt.Println(user, err)
		if err != nil {
			beego.Error(err)
			this.Ctx.Output.Status = http.StatusBadRequest
		}

		if user.Role == nil {
			this.Ctx.Output.Status = http.StatusBadRequest
		}
		fmt.Println(user.Role)
		fmt.Println(user.Role.Id)
		pRole, _ := models.GetRoleById(user.Role.Id)
		if err != nil {
			beego.Error(err)
			this.Ctx.Output.Status = http.StatusBadRequest
		}

		primaryMenuList := make([]*models.Menu, 0)
		childMenuList := make([]*models.Menu, 0)
		for _, menu := range pRole.Menu {
			//如果Enable为false则跳过
			if menu == nil || menu.Enable == false {
				continue
			}
			if menu.Level == 1 { //一级菜单
				primaryMenuList = append(primaryMenuList, menu)
			} else {
				childMenuList = append(childMenuList, menu)
			}
		}

		for _, menuObj := range primaryMenuList {
			if menuObj == nil {
				continue
			}
			subMenuNodeList := make([]MenuNode, 0)
			for _, subMenu := range childMenuList {
				if subMenu.ParentId == menuObj.MenuId {
					subMenuNode := MenuNode{
						Id:    subMenu.MenuId,
						Text:  subMenu.DisplayName,
						Name:  subMenu.Name,
						Level: subMenu.Level,
						Url:   subMenu.Url,
						State: MenuState{
							Opened:   "true",
							Selected: "true",
						},
						Logo: subMenu.Logo,
					}
					subMenuNodeList = append(subMenuNodeList, subMenuNode)
				}
			}

			primaryMenuNode := MenuNode{
				Id:    menuObj.MenuId,
				Text:  menuObj.DisplayName,
				Name:  menuObj.Name,
				Level: menuObj.Level,
				Url:   menuObj.Url,
				State: MenuState{
					Opened:   "true",
					Selected: "true",
				},
				Logo:     menuObj.Logo,
				Children: subMenuNodeList,
			}
			primaryMenuNodeList = append(primaryMenuNodeList, primaryMenuNode)
		}
	}
	this.Data["json"] = primaryMenuNodeList
	this.ServeJSON()
}

// @Title 获取没有根菜单的菜单数组列表
// @Description 根据类型获取菜单数组
// @Success 200 {array} []controllers.api.MenuNode
// @Param   type     query   int false       "菜单类型"
// @Param   Authorization     header   string true       "认证信息"
// @Param   timestamp         query   string true       "时间戳"
// @Failure 400 get menu error
// @router /v2 [get]
func (this *MenuController) GetMenusById() {
	menutype := this.GetString("type")
	menuNodeList := make([]MenuNode, 0)
	if menutype == "system" {
		subList, _ := models.QueryAllSubMenu(3)
		for _, subMenu := range subList {
			subMenuNode := MenuNode{
				Id:    subMenu.MenuId,
				Text:  subMenu.DisplayName,
				Name:  subMenu.Name,
				Level: subMenu.Level,
				Url:   subMenu.Url,
				State: MenuState{
					Opened:   "true",
					Selected: "true",
				},
				Logo: subMenu.Logo,
			}

			subChildList, _ := models.QueryAllSubMenu(subMenu.MenuId)
			if len(subChildList) > 0 {
				childMenuNodeList := make([]MenuNode, 0)
				for _, child := range subChildList {
					childMenuNode := MenuNode{
						Id:    child.MenuId,
						Text:  child.DisplayName,
						Name:  child.Name,
						Level: child.Level,
						Url:   child.Url,
						State: MenuState{
							Opened:   "true",
							Selected: "true",
						},
						Logo: child.Logo,
					}
					childMenuNodeList = append(childMenuNodeList, childMenuNode)
				}
				subMenuNode.Children = childMenuNodeList
			}

			menuNodeList = append(menuNodeList, subMenuNode)
		}
	} else if menutype == "report" {
		subList, _ := models.QueryAllSubMenu(4)
		for _, subMenu := range subList {
			subMenuNode := MenuNode{
				Id:    subMenu.MenuId,
				Text:  subMenu.DisplayName,
				Name:  subMenu.Name,
				Level: subMenu.Level,
				Url:   subMenu.Url,
				State: MenuState{
					Opened:   "true",
					Selected: "true",
				},
				Logo: subMenu.Logo,
			}

			subChildList, _ := models.QueryAllSubMenu(subMenu.MenuId)
			if len(subChildList) > 0 {
				childMenuNodeList := make([]MenuNode, 0)
				for _, child := range subChildList {
					childMenuNode := MenuNode{
						Id:    child.MenuId,
						Text:  child.DisplayName,
						Name:  child.Name,
						Level: child.Level,
						Url:   child.Url,
						State: MenuState{
							Opened:   "true",
							Selected: "true",
						},
						Logo: child.Logo,
					}
					childMenuNodeList = append(childMenuNodeList, childMenuNode)
				}
				subMenuNode.Children = childMenuNodeList
			}

			menuNodeList = append(menuNodeList, subMenuNode)
		}
	} else if menutype == "visualization" {
		subList, _ := models.QueryAllSubMenu(46)
		for _, subMenu := range subList {
			subMenuNode := MenuNode{
				Id:    subMenu.MenuId,
				Text:  subMenu.DisplayName,
				Name:  subMenu.Name,
				Level: subMenu.Level,
				Url:   subMenu.Url,
				State: MenuState{
					Opened:   "true",
					Selected: "true",
				},
				Logo: subMenu.Logo,
			}

			subChildList, _ := models.QueryAllSubMenu(subMenu.MenuId)
			if len(subChildList) > 0 {
				childMenuNodeList := make([]MenuNode, 0)
				for _, child := range subChildList {
					childMenuNode := MenuNode{
						Id:    child.MenuId,
						Text:  child.DisplayName,
						Name:  child.Name,
						Level: child.Level,
						Url:   child.Url,
						State: MenuState{
							Opened:   "true",
							Selected: "true",
						},
						Logo: child.Logo,
					}
					childMenuNodeList = append(childMenuNodeList, childMenuNode)
				}
				subMenuNode.Children = childMenuNodeList
			}

			menuNodeList = append(menuNodeList, subMenuNode)
		}
	} else if menutype == "resource" {
		asserts := new(models.Asserts)
		list := asserts.GetAsserts()
		for _, assert := range list {
			subMenuNode := MenuNode{
				Id:   assert.Id,
				Text: assert.Description,
				Name: assert.Name,
				State: MenuState{
					Opened:   "true",
					Selected: "true",
				},
				Class: assert.Icon,
			}

			subNodeList := make([]MenuNode, 0)
			for _, instance := range assert.AssertsInstance {
				menuNode := MenuNode{
					Id:   instance.Id,
					Text: instance.Description,
					Name: ROUTER_STATE_PREFIX + instance.Name,
					State: MenuState{
						Opened:   "true",
						Selected: "true",
					},
					Logo: instance.Icon,
				}
				subNodeList = append(subNodeList, menuNode)
			}
			subMenuNode.Children = subNodeList
			menuNodeList = append(menuNodeList, subMenuNode)
		}
	}

	this.Data["json"] = menuNodeList
	this.ServeJSON()
}

// @Title 获取带有根菜单的对象
// @Description 获取菜单对象
// @Success 200 {object} controllers.api.MenuNode
// @Param   type     query   int false       "菜单类型"
// @Failure 400 get menu error
// @router /object [get]
func (this *MenuController) GetMenuRootObject() {
	rootMenuNode := MenuNode{
		Id:    int64(0),
		Text:  "菜单管理",
		Level: int64(0),
		Url:   "#",
		State: MenuState{
			Opened:   "true",
			Selected: "true",
		},
	}

	primaryMenuNodeList := make([]MenuNode, 0)
	primaryMenulist, _ := models.QueryAllPrimaryMenu()
	for _, menuObj := range primaryMenulist {
		if menuObj != nil {
			subMenuNodeList := make([]MenuNode, 0)
			subList, _ := models.QueryAllSubMenu(menuObj.MenuId)
			for _, subMenu := range subList {
				subMenuNode := MenuNode{
					Id:    subMenu.MenuId,
					Text:  subMenu.DisplayName,
					Name:  subMenu.Name,
					Level: subMenu.Level,
					Url:   subMenu.Url,
					State: MenuState{
						Opened:   "true",
						Selected: "true",
					},
					Logo: subMenu.Logo,
				}
				subMenuNodeList = append(subMenuNodeList, subMenuNode)
			}

			primaryMenuNode := MenuNode{
				Id:    menuObj.MenuId,
				Text:  menuObj.DisplayName,
				Name:  menuObj.Name,
				Level: menuObj.Level,
				Url:   menuObj.Url,
				State: MenuState{
					Opened:   "true",
					Selected: "true",
				},
				Logo: menuObj.Logo,
			}

			if len(subMenuNodeList) != 0 {
				primaryMenuNode.Children = subMenuNodeList
			}

			primaryMenuNodeList = append(primaryMenuNodeList, primaryMenuNode)
		}
	}
	rootMenuNode.Children = primaryMenuNodeList
	this.Data["json"] = rootMenuNode
	this.ServeJSON()
}

// @Title 添加菜单
// @Description 添加菜单信息
// @Success 200 {map} map[string]interface{}
// @Param   displayName     query   string true       "菜单显示名称"
// @Param   name     	query   	string true       "菜单英文名称"
// @Param   url      	query   	string true       "菜单url"
// @Param   logo     	query   	string true       "菜单logo"
// @Param   level       query   	int true        "菜单级别"
// @Param   parentId    query   	int true        "父级菜单"
// @Failure 400 添加菜单失败
// @router / [put]
func (this *MenuController) AddMenu() {

	this.DbLog("Menu", "菜单", "添加")

	var menu models.Menu

	displayName := this.GetString("displayName", "")
	if displayName == "" {
		beego.Debug("[获取菜单显示名称错误]")
		this.ResponseErrorJSON(http.StatusBadRequest, errorFormat(errors.New("菜单添加失败"), "获取菜单显示名称错误"))
	}

	name := this.GetString("name", "")
	if name == "" {
		beego.Debug("[获取菜单英文简称错误]")
		this.ResponseErrorJSON(http.StatusBadRequest, errorFormat(errors.New("菜单添加失败"), "获取菜单英文简称错误"))
	}

	url := this.GetString("url", "")
	if url == "" {
		beego.Debug("[获取菜单URL错误]")
		this.ResponseErrorJSON(http.StatusBadRequest, errorFormat(errors.New("菜单添加失败"), "获取菜单URL错误"))
	}

	logo := this.GetString("logo", "")
	if logo == "" {
		beego.Debug("[获取菜单图标错误]")
		this.ResponseErrorJSON(http.StatusBadRequest, errorFormat(errors.New("菜单添加失败"), "获取菜单图标错误"))
	}

	level, err := this.GetInt64("level", 0)
	if level == 0 {
		beego.Debug("[获取菜单级别错误]")
		this.ResponseErrorJSON(http.StatusBadRequest, errorFormat(errors.New("菜单添加失败"), "获取菜单级别错误"))
	}

	parentId, err := this.GetInt64("parentId", 0)
	if parentId == 0 {
		beego.Debug("[获取父级菜ID错误]")
		this.ResponseErrorJSON(http.StatusBadRequest, errorFormat(errors.New("菜单添加失败"), "获取父级菜ID错误"))
	}

	menu.DisplayName = displayName
	menu.Name = name
	menu.Level = level
	menu.Active = true
	menu.Url = url
	menu.Logo = logo
	user, err := this.SessionUser()

	if err == nil {
		menu.CreateBy = user.Name
	} else {
		menu.CreateBy = ""
	}
	menu.ParentId = parentId
	menu.CreateTime = time.Now()
	id, err := models.AddMenu(menu)
	if err != nil {
		beego.Debug("[创建菜单错误", err.Error(), "]")
		this.ResponseErrorJSON(http.StatusBadRequest, errorFormat(ErrorBadRequest_400, err.Error()))
	} else {
		beego.Debug("[创建菜单成功,id是", id, "]")
		this.Data["json"] = this.ResponseSuccessJSON(true, "创建菜单成功", id)
	}
	this.ServeJSON()
}

// @Title Delete Menu by Id
// @Description 通过id删除菜单
// @Success 200 {map}
// @Param   menuId     query   int true       "菜单Id"
// @Failure 400 delete menu error
// @router / [delete]
func (this *MenuController) DelMenu() {

	this.DbLog("Menu", "菜单", "删除")
	menuId, err := this.GetInt64("menuId", int64(-1))
	if err != nil {
		beego.Debug("[获取菜单ID错误]")
		this.ResponseErrorJSON(http.StatusBadRequest, errorFormat(errors.New("菜单删除失败"), "获取菜单ID错误"))
	}

	num, err := models.DelMenu(menuId)
	if err != nil {
		beego.Debug("[删除菜单错误", err.Error(), "]")
		this.ResponseErrorJSON(http.StatusBadRequest, errorFormat(ErrorBadRequest_400, err.Error()))
	} else {
		beego.Debug("[删除菜单成功]")
		this.Data["json"] = this.ResponseSuccessJSON(true, "删除菜单成功", num)
	}
	this.ServeJSON()
}

// @Title 通过id更新菜单
// @Description 更新菜单
// @Success 200 {map}
// @Param   menuId     query   int64   true       "菜单Id"
// @Param   displayName     query   string true       "菜单显示名称"
// @Failure 400 delete menu error
// @router / [delete]
func (this *MenuController) PutMenu() {

	this.DbLog("Menu", "菜单", "更新")

	menuId, err := this.GetInt64("menuId", int64(-1))
	if err != nil {
		beego.Debug("[获取菜单ID错误]")
		this.ResponseErrorJSON(http.StatusBadRequest, errorFormat(errors.New("菜单删除失败"), "获取菜单ID错误"))
	}

	displayName := this.GetString("displayName", "")
	if displayName == "" {
		beego.Debug("[获取菜单显示名称错误]")
		this.ResponseErrorJSON(http.StatusBadRequest, errorFormat(errors.New("菜单添加失败"), "获取菜单显示名称错误"))
	}
	menu, err := models.MenuGetById(menuId)
	menu.DisplayName = displayName
	if err := models.PutMenu(menu); err == nil {
		this.Data["json"] = this.ResponseSuccessJSON(true, "重命名成功", 1)
	} else {
		this.Data["json"] = this.ResponseSuccessJSON(false, "重命名失败", -1)
	}
	this.ServeJSON()
}
