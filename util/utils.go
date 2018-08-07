package util

import (
	"github.com/dgrijalva/jwt-go"
	"crypto/md5"
	"crypto/sha256"
	"encoding/base64"
	"encoding/hex"
	"math/rand"
	"strconv"
	"time"
)

//时间格式化字符串，精确到分钟
const Time_Default_Layout_1 = "2006-01-02 15:04"
//时间格式化字符串，精确到秒
const Time_Default_Layout_2 = "2006-01-02 15:04:05"
//时间格式化字符串，精确到秒,并带有时区
const Time_Default_Layout_3 = "2006-01-02 15:04:05-0700"
//过期时间为10小时
const ExpireTenH  = 36000
//过期时间为一周
const ExpireAweek  = 604800
//过期时间为一个月
const ExpireAmonth  = 2592000
//过期时间为一个年
const ExpireAyear  = 31536000

const (
	Zabbix = "Zabbix"
	VCenter = "VCenter"
	Aliyun = "阿里云"
	Aws = "亚马逊"
)


type Rate struct {
	TimeVal string //报表时间
	RateVal string //报表值
}


func GenerateSalt() string {
	const randomLength = 16
	var salt []byte
	var asciiPad int64
	asciiPad = 32

	for i := 0; i < randomLength; i++ {
		salt = append(salt, byte(rand.Int63n(94)+asciiPad))
	}
	return string(salt)
}

func GenrateHash(salt string, password string) string {
	var hash string
	fullString := salt + password
	sha := sha256.New()
	sha.Write([]byte(fullString))
	hash = base64.URLEncoding.EncodeToString(sha.Sum(nil))

	return hash
}

func Strtomd5(s string) string {
	h := md5.New()
	h.Write([]byte(s))
	rs := hex.EncodeToString(h.Sum(nil))
	return rs
}

//转为64位十进制整数
func StrToInt64(value string) (int64, error) {
	if len(value) == 0 {
		return int64(0), nil
	}
	return strconv.ParseInt(value, 10, 64)
}

//获取当前时间
func NowTimeStr() string {
	return time.Now().Format("2006-01-02 15:04:05")
}

func FormatTime(t time.Time) string {
	return t.Format("2006-01-02 15:04:05")
}

//将字符串时间转为时间对象
func TimeBuild(strTime string) time.Time {
	tm, _ := time.Parse("2006-01-02 15:04:05", strTime)
	return tm
}

//iss: 该JWT的签发者，是否使用是可选的；
//sub: 该JWT所面向的用户，是否使用是可选的；
//aud: 接收该JWT的一方，是否使用是可选的；
//exp(expires): 什么时候过期，这里是一个Unix时间戳，是否使用是可选的；
//iat(issued at): 在什么时候签发的(UNIX时间)，是否使用是可选的；
//nbf (Not Before)：如果当前时间在nbf里的时间之前，则Token不被接受；一般都会留一些余地，比如几分钟；，是否使用是可选的；
//key不能包含 -
const SignedKey = "frontend"
//自身token
const SelfToken = "self"
//第三方token
const OtherToken = "other"

func ClientId(clientId string) string {
	if len(clientId) == 0 {
		return SignedKey
	}
	return clientId
}

func CreateToke(username string,tokenType string, createTime int64, expTime int64, clientId string) string {
	token := jwt.New(jwt.SigningMethodHS256)
	// Set some claims
	token.Claims["username"] = username
	token.Claims["admin"] = true
	token.Claims["exp"] = expTime //过期时间
	token.Claims["iat"] = createTime //发行时间
	token.Claims["type"] = tokenType //token类型
	//加密key
	tokenString, _ := token.SignedString([]byte(clientId))
	return tokenString
}


// 获取时间戳
func MakeTimestamp() int64 {
	//method 1 通过纳秒获取,将纳秒转为秒
	//timestamp := time.Now().UnixNano() / (int64(time.Second)/int64(time.Nanosecond))
	//method 2 通过当前的秒获取
	//与之对应的前端获取方式 Math.floor(Date.now() / 1000)
	now := time.Now()
	secs := now.Unix()
	return secs
}

func MakeAccessKeyId() string {
	text := time.Now().String()
	return Strtomd5(text)
}



