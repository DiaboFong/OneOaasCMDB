package util

import (
	"crypto/rand"
	"crypto/rsa"
	"crypto/x509"
	"crypto/x509/pkix"
	"encoding/gob"
	"encoding/pem"
	"fmt"
	"math/big"
	"os"
	"time"
	"github.com/astaxie/beego"
)

//生成key
func GenerateRsaKeys() {
	reader := rand.Reader
	bitSize := 512
	key, err := rsa.GenerateKey(reader, bitSize)
	checkError(err)

	fmt.Println("Private key primes", key.Primes[0].String(), key.Primes[1].String())
	fmt.Println("Private key exponent", key.D.String())

	//公共key
	publicKey := key.PublicKey
	fmt.Println("Public key modulus", publicKey.N.String())
	fmt.Println("Public key exponent", publicKey.E)

	//保持key为文件
	saveGobKey("conf/private.key", key)
	//saveGobKey("public.key", publicKey)
	//存储为pem格式
	savePEMKey("conf/private.pem", key)
}

//通过key生成证书
func Createx509() {
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
	checkError(err)

	certCerFile, err := os.Create("conf/oneoaas.cer")
	checkError(err)
	certCerFile.Write(derBytes)
	certCerFile.Close()

	//certPEMFile, err := os.Create("conf/oneoaas.pem")
	//checkError(err)
	//pem.Encode(certPEMFile, &pem.Block{Type: "CERTIFICATE", Bytes: derBytes})
	//certPEMFile.Close()

	//keyPEMFile, err := os.Create("private.pem")
	//checkError(err)
	//pem.Encode(keyPEMFile, &pem.Block{Type: "RSA PRIVATE KEY",
	//	Bytes: x509.MarshalPKCS1PrivateKey(&key)})
	//keyPEMFile.Close()
}

func loadKey(fileName string, key interface{}) {
	inFile, err := os.Open(fileName)
	checkError(err)
	decoder := gob.NewDecoder(inFile)
	err = decoder.Decode(key)
	checkError(err)
	inFile.Close()
}

func VerificationLisence() bool {
	licenseFile :="conf/cmdb.license"
	_,err :=os.Stat(licenseFile)
	if err !=nil{
		beego.Info("lisence不存在")
		return false
	}
	certCerFile, err := os.Open(licenseFile)
	if err !=nil{
		beego.Info("打开lisence文件错误")
		return false
	}

	derBytes := make([]byte, 1000) // bigger than the file
	count, err := certCerFile.Read(derBytes)
	if err !=nil{
		beego.Info("读取lisence文件错误")
		return false
	}
	certCerFile.Close()

	// trim the bytes to actual length in call
	cert, err := x509.ParseCertificate(derBytes[0:count])
	if err !=nil{
		beego.Info("解析lisence文件错误")
		return false
	}

	//fmt.Printf("名称 %s\n", cert.Subject.CommonName)
	//fmt.Printf("开始时间 %s\n", cert.NotBefore.String())//开始时间
	//fmt.Printf("结束时间 %s\n", cert.NotAfter.String())//结束时间

	afterTime := cert.NotAfter.Unix()
	nowTime := time.Now().Unix()
	//fmt.Println("afterTime :", afterTime)
	//fmt.Println("nowTime :", nowTime, time.Now().Format("2006-01-02 15:04:05.999999999 -0700 MST"))
	//fmt.Println("beforeTime-nowTime :", afterTime - nowTime)

	if afterTime >= nowTime {
		//fmt.Println("没有过期")
		//没有过期
		return true
	} else {
		//没有过期
		beego.Info("lisence已过期")
		return false
	}
}

func saveGobKey(fileName string, key interface{}) {
	outFile, err := os.Create(fileName)
	checkError(err)
	encoder := gob.NewEncoder(outFile)
	err = encoder.Encode(key)
	checkError(err)
	outFile.Close()
}

func savePEMKey(fileName string, key *rsa.PrivateKey) {

	outFile, err := os.Create(fileName)
	checkError(err)
	var privateKey = &pem.Block{Type: "RSA PRIVATE KEY",
		Bytes: x509.MarshalPKCS1PrivateKey(key)}
	pem.Encode(outFile, privateKey)
	outFile.Close()
}

func checkError(err error) {
	if err != nil {
		fmt.Println("Fatal error ", err.Error())
	}
}

//func main() {
//	//生成key
//	//GenerateRsaKeys()
//	//生成证书
//	//Createx509()
//	//验证证书是否过期
//	//VerificationX509Cert()
//}
