package controllers

import (
	"crypto/rsa"
	"fmt"
	"crypto/rand"
	"os"
	"encoding/gob"
	"encoding/pem"
	"crypto/x509"
	"github.com/astaxie/beego"
	"time"
	"math/big"
	"crypto/x509/pkix"
)

type LicenceController struct {
	beego.Controller
}

func (c *LicenceController) Prepare() {}

// URLMapping ...
func (c *LicenceController) URLMapping() {
	c.Mapping("GetLicence", c.GetLicence)
	c.Mapping("DeleteLicence", c.DeleteLicence)
}

// @Title 生成 Licence
// @Description 生成系统Licence,默认30天
// @Param    day  query   string  true  "lisence天数"
// @Success 200 {map} map[string]interface{}
// @Failure 400 生成系统Licence失败
// @router /licence [get]
func (c *LicenceController) GetLicence() {

	day, err := c.GetInt64("day",30)
	beego.Info("申请证书时间是:",day,"天")

	random := rand.Reader
	bitSize := 512
	key, err := rsa.GenerateKey(random, bitSize)
	if err != nil{
		beego.Info(err)
		c.Data["json"]="生成证书失败"
		c.ServeJSON()
	}
	//公共key
	publicKey := key.PublicKey
	fmt.Println("Public key modulus", publicKey.N.String())
	fmt.Println("Public key exponent", publicKey.E)

	//保持key为文件
	privateFile :="conf/private.key"
	saveGobKey(privateFile, key)
	var oneoaasKey rsa.PrivateKey
	loadKey(privateFile, &oneoaasKey)

	now := time.Now()
	then := now.Add(60 * 60 * 24 * 60 * 1000 * 1000 * 1000) //试用期为30天
	//then := now.Add(60 * 1 * 1000 * 1000 * 1000) // one day
	template := x509.Certificate{
		SerialNumber: big.NewInt(1),
		Subject: pkix.Name{
			CommonName:   "www.oneoaas.com",
			Organization: []string{"oneoaas"},
		},
		//    NotBefore: time.Unix(now, 0).UTC(),
		//    NotAfter:  time.Unix(now+60*60*24*365, 0).UTC(),
		NotBefore: now,
		NotAfter:  then,

		SubjectKeyId: []byte{1, 2, 3, 4},
		KeyUsage:     x509.KeyUsageCertSign | x509.KeyUsageKeyEncipherment | x509.KeyUsageDigitalSignature,

		BasicConstraintsValid: true,
		IsCA:     true,
		DNSNames: []string{"www.oneoaas.com", "localhost"},
	}
	derBytes, err := x509.CreateCertificate(random, &template, &template, &oneoaasKey.PublicKey, &oneoaasKey)
	if err != nil{
		beego.Info(err)
		c.Data["json"]="生成证书失败"
		c.ServeJSON()
	}

	licenseFile :="conf/cmdb.license"
	_,err =os.Stat(licenseFile)
	if err == nil{
		err = os.Remove(licenseFile)
		if err!=nil{
			beego.Info(err)
			c.Data["json"]="生成证书失败"
			c.ServeJSON()
		}
	}

	certCerFile, err := os.Create(licenseFile)
	if err != nil{
		beego.Info(err)
		c.Data["json"]="生成证书失败"
		c.ServeJSON()
	}

	certCerFile.Write(derBytes)
	certCerFile.Close()

	_,err =os.Stat(privateFile)
	if err == nil{
		err = os.Remove(privateFile)
		if err!=nil{
			beego.Info(err)
		}
	}

	c.Data["json"]="生成证书成功"
	c.ServeJSON()
}

// @Title 删除 Licence
// @Description 删除Licence
// @Success 200 {string} delete success!
// @Failure 403  licence 不存在
// @router /licence [delete]
func (c *LicenceController) DeleteLicence() {

}


func loadKey(fileName string, key interface{}) {
	inFile, err := os.Open(fileName)
	if err != nil{
		beego.Error(err)
	}

	decoder := gob.NewDecoder(inFile)
	err = decoder.Decode(key)

	if err != nil{
		beego.Error(err)
	}

	inFile.Close()
}

//通过key生成证书
func createx509() {
	random := rand.Reader

	var key rsa.PrivateKey
	loadKey("conf/private.key", &key)

	now := time.Now()
	then := now.Add(60 * 60 * 24 * 30 * 1000 * 1000 * 1000) //试用期为30天
	//then := now.Add(60 * 1 * 1000 * 1000 * 1000) // one day
	template := x509.Certificate{
		SerialNumber: big.NewInt(1),
		Subject: pkix.Name{
			CommonName:   "www.oneoaas.com",
			Organization: []string{"oneoaas"},
		},
		//    NotBefore: time.Unix(now, 0).UTC(),
		//    NotAfter:  time.Unix(now+60*60*24*365, 0).UTC(),
		NotBefore: now,
		NotAfter:  then,

		SubjectKeyId: []byte{1, 2, 3, 4},
		KeyUsage:     x509.KeyUsageCertSign | x509.KeyUsageKeyEncipherment | x509.KeyUsageDigitalSignature,

		BasicConstraintsValid: true,
		IsCA:     true,
		DNSNames: []string{"www.oneoaas.com", "localhost"},
	}
	derBytes, err := x509.CreateCertificate(random, &template,
		&template, &key.PublicKey, &key)

	if err != nil{
		fmt.Println(err)
	}

	licenseFile :="conf/cmdb.license"
	err = os.Remove(licenseFile)
	if err!=nil{
		beego.Error(err)
	}

	certCerFile, err := os.Create(licenseFile)

	if err != nil{
		fmt.Println(err)
	}

	certCerFile.Write(derBytes)
	certCerFile.Close()

}

func saveGobKey(fileName string, key interface{}) {

	_,err :=os.Stat(fileName)
	if err == nil{
		err := os.Remove(fileName)
		if err!=nil{
			beego.Error(err)
		}
	}


	outFile, err := os.Create(fileName)
	if err != nil{
		beego.Error(err)
	}

	encoder := gob.NewEncoder(outFile)
	err = encoder.Encode(key)
	if err != nil{
		beego.Error(err)
	}

	outFile.Close()
}

func savePEMKey(fileName string, key *rsa.PrivateKey) {

	outFile, err := os.Create(fileName)
	if err != nil{
		fmt.Println(err)
	}
	var privateKey = &pem.Block{Type: "RSA PRIVATE KEY", Bytes: x509.MarshalPKCS1PrivateKey(key)}
	pem.Encode(outFile, privateKey)
	outFile.Close()
}