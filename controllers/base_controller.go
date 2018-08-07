//基础服务类
package controllers

import (
	"crypto/md5"
	"encoding/json"
	"errors"
	"fmt"
	"github.com/astaxie/beego"
	"github.com/dgrijalva/jwt-go"
	"oneoaas.com/cmdb/models"
	"regexp"
	"strings"
	"time"
	"oneoaas.com/cmdb/util"
	"strconv"
	"net/http"
)

// 400   Bad Request（错误请求） 服务器不理解请求的语法。
// 401   Unauthorized（未授权） 请求要求身份验证。 对于需要登录的网页，服务器可能返回此响应。
// 403   Forbidden（禁止） 服务器拒绝请求。
// 404   Not Found（未找到） 服务器找不到请求的网页。
//
// 500   Internal Server Error（服务器内部错误）  服务器遇到错误，无法完成请求。
// 501   Not Implemented（尚未实施） 服务器不具备完成请求的功能。
// 502   Bad Gateway（错误网关） 服务器作为网关或代理，从上游服务器收到无效响应。
// 504   Gateway Timeout（网关超时）  服务器作为网关或代理，但是没有及时从上游服务器收到请求。

var (
	Finish_200 = errors.New("请求成功")
	ErrorBadRequest_400 = errors.New("请求不正确")
	ErrorBadJson_400 = errors.New("请求的Json格式不正确")
	ErrorBadParam_400 = errors.New("请求的参数未通过验证")
	ErrorUnauthorized_401 = errors.New("该请求未授权")
	ErrorForbidden_403 = errors.New("该请求被禁止")
	ErrorDataNotFound_404 = errors.New("服务器找不到对应的数据")
	ErrorPageNotFound_404 = errors.New("服务器找不到该请求")
	ErrorInternalServerError_500 = errors.New("服务器内部发生错误，请联系管理员")
	ErrorNotImplemented_501 = errors.New("该功能未实现")
	ErrorBadGateway_502 = errors.New("终端网关未响应")
	ErrorGatewayTimeout_504 = errors.New("终端网关超时")
)

var emailPattern = regexp.MustCompile("[\\w!#$%&'*+/=?^_`{|}~-]+(?:\\.[\\w!#$%&'*+/=?^_`{|}~-]+)*@(?:[\\w](?:[\\w-]*[\\w])?\\.)+[a-zA-Z0-9](?:[\\w-]*[\\w])?")

//控制器公共结构
type BaseController struct {
	beego.Controller
	tokeType string
}

// 系统登录
type LoginController struct {
	BaseController
}

type LogoutController struct {
	BaseController
}

// 业务模块操作
type AppController struct {
	BaseController
}

type AppLevelController struct {
	BaseController
}

// 数据中心操作
type DatacenterController struct {
	BaseController
}

type DcStateController struct {
	BaseController
}

type DcRegionController struct {
	BaseController
}

// 域名操作
type DnspoddomainController struct {
	BaseController
}

type DnspodrecordController struct {
	BaseController
}

type DnspodtokenController struct {
	BaseController
}

// 硬件操作
type HardwareController struct {
	BaseController
}

type ManufacturerController struct {
	BaseController
}

// 带宽操作
type NetworkbandwidthController struct {
	BaseController
}

// IP操作
type IpController struct {
	BaseController
}

//IP子网操作
type IpSubNetController struct {
	BaseController
}

// 机柜操作
type RackController struct {
	BaseController
}

// 机房操作
type RoomController struct {
	BaseController
}

// 服务器操作
type ServerController struct {
	BaseController
}

type SessionController struct {
	BaseController
}

type SoftwareController struct {
	BaseController
}

// 供应商操作
type SupplierController struct {
	BaseController
}

type AccessKeyController struct {
	BaseController
}

type UserController struct {
	BaseController
}

type StatisticalController struct {
	BaseController
}

//变更统计
type ChangeController struct {
	BaseController
}

type RoleController struct {
	BaseController
}

type ApiConfigController struct {
	BaseController
}

//api调用次数
type ApiCallController struct {
	BaseController
}

// 系统配置操作
type MenuController struct {
	BaseController
}

type RoomStateController struct {
	BaseController
}

type RackStateController struct {
	BaseController
}

type NetworkBandwidthStateController struct {
	BaseController
}

type InternetServiceProviderController struct {
	BaseController
}

type HardwareStateController struct {
	BaseController
}

type HardwareTypeController struct {
	BaseController
}

type AgreementController struct {
	BaseController
}

type AgreementStateController struct {
	BaseController
}

type ServerStateController struct {
	BaseController
}

type DnspoddomainStateController struct {
	BaseController
}

type DnspoddomainGradeController struct {
	BaseController
}

type CpuController struct {
	BaseController
}

type MemoryController struct {
	BaseController
}

type HarddiskController struct {
	BaseController
}

type NetworkAdapterController struct {
	BaseController
}

type HostController struct {
	BaseController
}

type DashboardController struct {
	BaseController
}

type UploadController struct {
	BaseController
}

type ImportController struct {
	BaseController
}

type ImportPhotoController struct {
	BaseController
}

type DownloadController struct {
	BaseController
}

type ExportController struct {
	BaseController
}

type AddressController struct {
	BaseController
}

type IpamVlanDomainController struct {
	BaseController
}

type IpamAddressController struct {
	BaseController
}
type IpamSubnetsController struct {
	BaseController
}

type IpamVlanController struct {
	BaseController
}

type IpamVrfsController struct {
	BaseController
}

type SystemEmailController struct {
	BaseController
}

type SystemLogController struct {
	BaseController
}

type ResourcePlatformAccountController struct {
	BaseController
}

type SyncVcenterController struct {
	BaseController
}

type SyncAliyunController struct {
	BaseController
}

type SyncAwsController struct {
	BaseController
}

type SyncZabbixController struct {
	BaseController
}

// Aliyun操作
type AliyunController struct {
	BaseController
}

// Aws操作
type AwsController struct {
	BaseController
}

// Vcenter操作
type VcenterController struct {
	BaseController
}

type AssetsController struct {
	BaseController
}

type CiController struct {
	BaseController
}

// 资产根类型操作
type AssertsController struct {
	BaseController
}

// 资产具体实体根类型操作
type AssertsInstanceController struct {
	BaseController
}


type TopoViewController struct {
	BaseController
}

type TopoNodeController struct {
	BaseController
}

type TopoLineController struct {
	BaseController
}

// 状态颜色操作
type StateColorController struct {
	BaseController
}

func errorFormat(err error, details string) string {
	return fmt.Sprintf("%s,%s\n", err.Error(), details)
}

func (this *BaseController) ResponseErrorJSON(code int, msg string, other ...map[string]interface{}) {
	response := map[string]interface{}{
		"code":  code,
		"msg":   msg,
	}

	if other != nil && len(other) > 0 {
		for k, v := range other[0] {
			if k == "code" || k == "msg" {
				continue
			}
			response[k] = v
		}
	}
	this.Ctx.Output.Status = code
	this.Data["json"] = response
	this.ServeJSON()
}

func (this *BaseController) ResponseSuccessJSON(result bool, msg string, id int64) map[string]interface{} {
	return map[string]interface{}{
		"result": result,
		"msg":    msg,
		"id":     id,
	}
}

func (this *BaseController) ResponseSuccessJSONEx(result bool, msg string, path string) map[string]interface{} {
	return map[string]interface{}{
		"result": result,
		"msg":    msg,
		"path":   path,
	}
}

// 认证结果
type AuthResult struct {
	Success bool `json:"success"`
	Message string `json:"message"`
	AuthType string `json:"authtype"`
}

// 验证结果
type ValidResult struct {
	Valid bool `json:"valid"`
	Message string `json:"message"`
}

func (this *BaseController) Prepare() {
	this.Ctx.Output.Header("Access-Control-Allow-Origin", "*") //允许跨域访问
	authResult := this.Auth()
	if !authResult.Success {
		//401 返回请求认证错误
		this.Ctx.Output.Status = http.StatusUnauthorized
		this.Data["json"] = authResult
		this.ServeJSON()
	}
	//api 调用记录
	beego.Debug("api调用记录",authResult.AuthType,this.Ctx.Request.RequestURI)
	apiNames := strings.Split(this.Ctx.Request.RequestURI,"?")
	recordCallApi := new(models.SystemApiCall)
	recordCallApi.ApiCreateDate = time.Now()
	recordCallApi.ApiCreateTime = fmt.Sprintf("%d:%d",time.Now().Hour(),time.Now().Minute())
	recordCallApi.ApiCallType = authResult.AuthType
	recordCallApi.ApiName = apiNames[0]
	recordCallApi.Add()
}

//处理token认证
func (this *BaseController) Auth() AuthResult {
	authResult := AuthResult{}
	timestamp := this.GetString("timestamp")
	if len(timestamp) ==0  {
		authResult.Success = false
		authResult.Message = "时间戳格式错误"
		return authResult
	}

	var tokenString string
	if this.GetString("access_token") != "" {
		tokenString = this.GetString("access_token")
		if len(tokenString)==0{
			authResult.Success = false
			authResult.Message = "token格式错误"
			return authResult
		}
	} else {
		authorizationString := this.Ctx.Request.Header.Get("Authorization")
		if len(authorizationString) == 0 {
			authResult.Success = false
			authResult.Message = "token格式错误"
			return authResult
		}
		st := strings.Split(authorizationString, " ")
		if ( len(st) > 2 || len(st) == 0 ) {
			authResult.Success = false
			authResult.Message = "token格式错误"
			return authResult
		}
		tokenString = st[1]
	}

	token, err := jwt.Parse(tokenString, func(token *jwt.Token) (interface{}, error) {
		return []byte(util.ClientId("")), nil
	})

	if err != nil {
		beego.Error(err)
		if ve, ok := err.(*jwt.ValidationError); ok {
			if ve.Errors & jwt.ValidationErrorMalformed != 0 {
				authResult.Success = false
				authResult.Message = "token验证未通过"
				return authResult
			} else if ve.Errors & (jwt.ValidationErrorExpired | jwt.ValidationErrorNotValidYet) != 0 {
				authResult.Success = false
				authResult.Message = "token验证未通过"
				return authResult
			} else {
				authResult.Success = false
				authResult.Message = "token验证未通过"
				return authResult
			}
		}
	}
	if !token.Valid {
		authResult.Success = false
		authResult.Message = "token验证未通过"
		return authResult
	}

	username := token.Claims["username"]
	if len(username.(string)) == 0 {
		authResult.Success = false
		authResult.Message = "token验证未通过"
		return authResult
	}

	expTimeFloat := token.Claims["exp"] //获取过期时间

	tokeType := token.Claims["type"] //获取token生成类型
	if tokeType == util.OtherToken {
		this.tokeType = tokeType.(string)
	}

	//转换时间
	expTimeStr := strconv.FormatFloat(expTimeFloat.(float64), 'f', 0, 64)
	expTimeInt, err := strconv.ParseInt(expTimeStr, 10, 64)
	if err != nil {
		authResult.Success = false
		authResult.Message = "token验证未通过"
		return authResult
	}
	timestampInt, err := strconv.ParseInt(timestamp, 10, 64)
	if err != nil {
		authResult.Success = false
		authResult.Message = "请求时间戳错误"
		return authResult
	}
	if timestampInt - expTimeInt > util.ExpireAweek  {
		authResult.Success = false
		authResult.Message = "token已过期"
		return authResult
	}

	authResult.Success = true
	authResult.Message = "token验证通过"
	authResult.AuthType = tokeType.(string)
	return authResult

}

//处理响应JSON格式
func (this *BaseController) TotalRowsJSON(arry []interface{}) {
	response := map[string]interface{}{
		"total": 100,
		"rows":  arry,
	}
	this.Data["json"] = response
	this.ServeJSON()
}

//返回符合条件的rows以及总的记录数据
//total 代表总的符合条件的记录数据
//rows  代表当前期望获取的起始到终止的记录数
func (this *BaseController) TotalRowsPageJSON(count int64, arry []interface{}) {
	var response map[string]interface{}
	response = map[string]interface{}{
		"total": count,
		"rows":  arry,
	}
	this.Data["json"] = response
	this.ServeJSON()
}

func (this *BaseController) DataJSON(arry []interface{}) {
	response := map[string]interface{}{
		"data": arry,
	}
	this.Data["json"] = response
	this.ServeJSON()
}

//渲染模版
func (this *BaseController) Display(tpl ...string) {
	var tplname string
	if len(tpl) > 0 {
		tplname = tpl[0] + ".html"
	} else {
		tplname = "error/error.html"
	}
	this.TplName = tplname
}

//重定向
func (this *BaseController) GoRedirect(url string) {
	this.Redirect(url, 302)
}

// 是否POST提交
func (this *BaseController) IsPost() bool {
	return this.Ctx.Request.Method == "POST"
}

// 输出json
func (this *BaseController) JsonResult(out interface{}) {
	this.Data["json"] = out
	this.ServeJSON()
	this.StopRun()
}

func (this *BaseController) AjaxMsg(msg interface{}, msgno int) {
	out := make(map[string]interface{})
	out["status"] = msgno
	out["msg"] = msg
	this.JsonResult(out)
}

//获取用户IP地址
func (this *BaseController) GetClientIp() string {
	s := strings.Split(this.Ctx.Request.RemoteAddr, ":")
	return s[0]
}

func (this *BaseController) SessionUser() (models.User, error) {
	userinfo := this.GetSession("userinfo")
	var user models.User
	bytes, err := json.Marshal(userinfo)
	if err != nil {
		beego.Error(err.Error())
		this.GoRedirect("/")
	}
	err = json.Unmarshal(bytes, &user)
	if err != nil {
		beego.Error(err.Error())
		this.GoRedirect("/")
	}
	return user, nil
}

func (this *BaseController) TokenUser() (*models.User, error) {
	authorizationString := this.Ctx.Request.Header.Get("Authorization")
	tokenString := strings.Split(authorizationString, " ")
	token, err := jwt.Parse(tokenString[1], func(token *jwt.Token) (interface{}, error) {
		return []byte(util.SignedKey), nil
	})
	username := token.Claims["username"]
	user, err := models.UserGetByName(username.(string))
	return user, err
}

func (this *BaseController) DbLog(moduleName string, moduleDisplayName string, operation string) {

	user, err := this.SessionUser ()
	if err == nil {
		if userName := user.Name; userName != "" {
			sysLog := &models.SystemLog{
				UserName:            userName,
				ModuleName:          moduleName,
				ModuleDisplayName:   moduleDisplayName,
				EntityName:          "",
				EntityDisplayName:   "",
				InstanceId:          "",
				InstanceDisplayName: "",
				Operation:           operation,
				Cause:               "",
				CreateTime:          time.Now(),
				UpdateTime:	     time.Now(),
				CreateBy:            userName,
			}
			sysLog.AddLog()
		}
	}
}

func (this *BaseController) LogError(userName string,moduleName string, moduleDisplayName string, operation string, cause string) {
	sysLog := &models.SystemLog{
		UserName:            userName,
		ModuleName:          moduleName,
		ModuleDisplayName:   moduleDisplayName,
		EntityName:          "",
		EntityDisplayName:   "",
		InstanceId:          "",
		InstanceDisplayName: "",
		Operation:           operation,
		Cause:               cause,
		CreateTime:          time.Now(),
		UpdateTime:	     time.Now(),
		CreateBy:            userName,
	}
	sysLog.AddLog()

}

//Md5加密
func Md5(buf []byte) string {
	hash := md5.New()
	hash.Write(buf)
	return fmt.Sprintf("%x", hash.Sum(nil))
}

func SizeFormat(size float64) string {
	units := []string{"Byte", "KB", "MB", "GB", "TB"}
	n := 0
	for size > 1024 {
		size /= 1024
		n += 1
	}

	return fmt.Sprintf("%.2f %s", size, units[n])
}

func IsEmail(b []byte) bool {
	return emailPattern.Match(b)
}
