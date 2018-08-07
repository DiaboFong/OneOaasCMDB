package controllers

import (
	"fmt"
	"os"
	"github.com/astaxie/beego"
	"net/http"
)

func (this *DownloadController) Prepare(){

}

//下载服务器列表模板
func (this *DownloadController) Download() {
	template := this.GetString("template", "")
	rawURL := fmt.Sprintf("conf/%s.xlsx",template)

	_, err := os.Stat(rawURL)
	if err == nil {
		this.Ctx.Output.Download(rawURL)
	}
	if os.IsNotExist(err) {
		beego.Debug("[文件不存在", err.Error(), "]")
		this.ResponseErrorJSON(http.StatusOK, err.Error())
	}
}
