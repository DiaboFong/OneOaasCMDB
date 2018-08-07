package controllers

import (
	"github.com/astaxie/beego"
	_ "github.com/tealeg/xlsx"
	"io"
	"net/http"
	"os"
	"github.com/astaxie/beego/utils"
	"io/ioutil"
)

const docType = "application/vnd.openxmlformats-officedocument.wordprocessingml.document"

func (this *UploadController) Prepare() {

}

//上传合同
func (this *UploadController) UploadAgreement() {
	this.Ctx.Request.ParseMultipartForm(32 << 20)
	file, handler, err := this.Ctx.Request.FormFile("file")
	if err != nil {
		panic(err)
	}
	defer file.Close()


	if !utils.FileExists("www") {
		os.Mkdir("www", os.FileMode(0777))
	}

	filePath := "www/" + handler.Filename
	f, _ := os.OpenFile(filePath, os.O_WRONLY|os.O_CREATE, 0666)
	defer f.Close()

	io.Copy(f, file)
	buff := make([]byte, 512) // why 512 bytes ? see http://golang.org/pkg/net/http/#DetectContentType
	file.Read(buff)
	filetype := http.DetectContentType(buff)
	beego.Info("[上传的文件类型是", filetype, "]")

	this.Data["json"] = this.ResponseSuccessJSONEx(true, "合同上传成功", filePath)
	this.ServeJSON()
}


func (this *UploadController) ReadAgreement() {
	file := this.GetString("path", "")
	byteFile, err := ioutil.ReadFile(file)
	if err != nil{
		beego.Error(err)
	}
	this.Ctx.Output.ContentType("application/pdf")
	this.Ctx.ResponseWriter.Write(byteFile)
	//this.Ctx.Output.Download(file) 下载文件
}

