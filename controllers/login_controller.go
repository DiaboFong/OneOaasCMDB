package controllers

import (
	"oneoaas.com/cmdb/models"
	"oneoaas.com/cmdb/util"
	"strings"
	"encoding/base64"
	"time"
	"strconv"
	"github.com/astaxie/beego"
)

func (this *LoginController) Prepare() {

}

func (this *LoginController) Get() {
	this.TplName = "index.tpl"
}

type LoginResult struct {
	Success bool `json:"success"`
	Message string `json:"message"`
	Token   string `json:"token"`
}

type LoginUser struct {
	Username string `json:"username"`
	Password string `json:"password"`
}

// @Title 用户登录
// @Description 用户登录
// @Success 200 {map} map[string]interface{}
// @Param   user     	      	query     string    true   "用户名"
// @Param   pass     		query     string   false   "用户密码"
// @Param   timestamp           query     string   true    "时间戳"
// @Failure 400 登录用户失败
// @router / [post]
func (this *LoginController) Login() {
	beego.Debug("用户进入登录")
	loginResult := LoginResult{}
	if this.IsPost() {
		loginNameEncoded := strings.TrimSpace(this.GetString("user"))
		passwordEncoded := strings.TrimSpace(this.GetString("pass"))
		if loginNameEncoded != "" && passwordEncoded != "" {
			loginName, err := base64.StdEncoding.DecodeString(loginNameEncoded)
			if err != nil {
				loginResult.Success = false
				loginResult.Message = "登录名或密码错误"
				this.LogError(string(loginName),"LoginController","登录","login",loginResult.Message)
				this.Data["json"] = loginResult
				this.ServeJSON()
			}
			user, err := models.UserGetByName(string(loginName))
			if err != nil {
				loginResult.Success = false
				loginResult.Message = "登录名或密码错误"
				this.LogError(string(loginName),"LoginController","登录","login",loginResult.Message)
				this.Data["json"] = loginResult
				this.ServeJSON()
			}
			salt := user.Salt
			hash := util.GenrateHash(salt, string(passwordEncoded))
			currentPassword := util.Strtomd5(hash)
			if user.Password != currentPassword {
				loginResult.Success = false
				loginResult.Message = "登录名或密码错误"
				this.LogError(string(loginName),"LoginController","登录","login",loginResult.Message)
				this.Data["json"] = loginResult
				this.ServeJSON()
			} else {
				this.StartSession()
				//如果数据库已经存在该用户的token
				loginResult.Success = true
				//默认过期时间是10小时
				createTime := time.Now().Unix()
				//默认一个月过期
				expireTime := createTime + util.ExpireAmonth
				//如果用户时第一次登陆使用，则创建默认token
				if len(user.Token) == 0 {
					beego.Info("用户使用密码登录，系统自动创建私有token")
					loginResult.Token = util.CreateToke(string(loginName),util.SelfToken,createTime,expireTime,util.ClientId(""))
					token := new(models.AccessKey)
					token.User = user
					token.AccessKeyType = util.SelfToken
					token.AccessKeyName = util.ClientId("")
					token.AccessKeyId = util.MakeAccessKeyId()
					token.AccessKeySecret = loginResult.Token
					token.AccessKeyDesc = "system auto generate"
					token.ExpireTime = expireTime
					token.IsDelete = 0
					token.IsDisable = 1
					token.AddAccessKey()

					user.LoginTime = time.Now()
					user.LoginIp = this.Ctx.Input.IP()
					user.Update()
					loginResult.Success = true
					loginResult.Message = "登录成功"
				} else {
					beego.Info("用户使用密码登录，使用已有token")
					timestamp := this.GetString("timestamp")
					timestampInt, _ := strconv.ParseInt(timestamp, 10, 64)
					//选择最近的token
					expireFlag := false
					userToken := new(models.AccessKey)
					for _, token := range  user.Token{
						//IsDisable =0 表示已经禁用 IsDelete=1 表示已经删除
						if (token == nil || token.AccessKeyType == util.OtherToken) ||
							(token.IsDelete == 1 || token.IsDisable == 0) {
							beego.Info("token或删除或禁用或非私有")
							continue
						}
						expTimeInt := token.ExpireTime
						if timestampInt - expTimeInt > util.ExpireAmonth {
							userToken = token
							expireFlag = true
						}else{
							userToken = token
							expireFlag = false
						}
					}

					if expireFlag && userToken !=nil {
						beego.Info("token过期自动更新")
						loginResult.Token = util.CreateToke(string(loginName),util.SelfToken,createTime,expireTime,util.ClientId(""))
						userToken.AccessKeySecret = loginResult.Token
						userToken.Update()
					}else if expireFlag == false  && userToken != nil{
						beego.Info("token还有效")
						loginResult.Token = userToken.AccessKeySecret
					}else{
						beego.Info("用户没有私有token,系统自动分配")
						loginResult.Token = util.CreateToke(string(loginName),util.SelfToken,createTime,expireTime,util.ClientId(""))
						userToken.User = user
						userToken.AccessKeyType = util.SelfToken
						userToken.AccessKeyName = util.ClientId("")
						userToken.AccessKeyId = util.MakeAccessKeyId()
						userToken.AccessKeySecret = loginResult.Token
						userToken.AccessKeyDesc = "system auto generate"
						userToken.ExpireTime = expireTime
						userToken.IsDelete = 0	//表示未删除
						userToken.IsDisable = 1 //表示启用
						userToken.AddAccessKey()
					}

					user.LoginTime = time.Now()
					user.LoginIp = this.Ctx.Input.IP()
					user.Update()
					loginResult.Success = true
					loginResult.Message = "登录成功"
				}

				userinfo := this.GetSession("userinfo")
				if userinfo == nil {
					this.SetSession("userinfo", user)
				}

			}
		} else {
			this.LogError("unkonw","LoginController","登录","login",loginResult.Message)
			loginResult.Success = false
			loginResult.Message = "登录名或密码错误"
		}
	} else {
		this.LogError("unkonw","LoginController","登录","login",loginResult.Message)
		loginResult.Success = false
		loginResult.Message = "登录名或密码错误"
	}
	this.Data["json"] = loginResult
	this.ServeJSON()
}

