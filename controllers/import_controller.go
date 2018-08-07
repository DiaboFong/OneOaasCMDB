package controllers

import (
	"fmt"
	_ "github.com/astaxie/beego"
	"github.com/tealeg/xlsx"
	"io"
	"net/http"
	m "oneoaas.com/cmdb/models"
	"os"
	"strconv"
)

//导入服务器列表
func (this *ImportController) Import() {
	//id := this.Ctx.Request.Form.Get("id")
	//beego.Info("id", id)
	this.Ctx.Request.ParseMultipartForm(32 << 20)
	file, handler, err := this.Ctx.Request.FormFile("uploadfile")
	if err != nil {
		fmt.Println(err)
		return
	}
	defer file.Close()
	filePath := "conf/" + handler.Filename
	f, err := os.OpenFile(filePath, os.O_WRONLY|os.O_CREATE, 0666)
	if err != nil {
		fmt.Println(err)
		return
	}
	defer f.Close()
	io.Copy(f, file)
	buff := make([]byte, 512) // why 512 bytes ? see http://golang.org/pkg/net/http/#DetectContentType
	num, err := file.Read(buff)
	if err != nil {
		fmt.Println(num)
	}

	filetype := http.DetectContentType(buff)
	switch filetype {
	case "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", "application/vnd.openxmlformats-officedocument.spreadsheetml.template":
		fmt.Println(filetype)

	case "application/vnd.ms-excel":
		fmt.Println(filetype)

	case "application/vnd.openxmlformats-officedocument.wordprocessingml.document":
		fmt.Println(filetype)

	case "application/msword": // not image, but application !
		fmt.Println(filetype)
	case "application/zip": // not image, but application !
		fmt.Println(filetype)
	default:
		fmt.Println("不知道文件上传类型")
	}

	var xlsxfile *xlsx.File
	var sheet *xlsx.Sheet
	xlsxfile, err = xlsx.OpenFile(filePath)
	if err != nil {
		this.Data["json"] = this.ResponseSuccessJSON(false, "导入服务器列表失败"+err.Error(), -1)
		this.ServeJSON()
	}

	sheet = xlsxfile.Sheet["import"]
	if sheet == nil {
		this.Data["json"] = this.ResponseSuccessJSON(false, "导入Excel的Sheet名称必须是import", -1)
		this.ServeJSON()
	}

	for index, row := range sheet.Rows {
		if index == 0 {
			continue
		}
		stateid, err := strconv.ParseInt(row.Cells[2].Value, 10, 64)
		ishypervisor, err := strconv.ParseInt(row.Cells[3].Value, 10, 64)
		hostid, err := strconv.ParseInt(row.Cells[4].Value, 10, 64)
		appid, err := strconv.ParseInt(row.Cells[5].Value, 10, 64)
		manufacturerid, err := strconv.ParseInt(row.Cells[8].Value, 10, 64)
		supplierid, err := strconv.ParseInt(row.Cells[9].Value, 10, 64)
		//cpuid, err := strconv.ParseInt(row.Cells[10].Value, 10, 64)
		//memoryid, err := strconv.ParseInt(row.Cells[11].Value, 10, 64)
		//harddiskid, err := strconv.ParseInt(row.Cells[12].Value, 10, 64)
		//adapterid, err := strconv.ParseInt(row.Cells[13].Value, 10, 64)
		rackid, err := strconv.ParseInt(row.Cells[14].Value, 10, 64)
		rackunumber, err := strconv.ParseInt(row.Cells[15].Value, 10, 64)
		isserver, err := strconv.ParseInt(row.Cells[16].Value, 10, 64)
		if err != nil{
			fmt.Println("字符串转换成整数失败")
		}
		
		importServer := m.Server{
			Hostname: row.Cells[0].Value,
			Ipaddress: row.Cells[1].Value,
			Ishypervisor: ishypervisor,
			Sn: row.Cells[6].Value,
			Modle: row.Cells[7].Value,
			RackUNumber: rackunumber,
			IsServer: isserver,
			Comment: row.Cells[17].Value,
			Manufacturer: &m.Manufacturer{
				Id: manufacturerid,
			},
			App: &m.App{
				AppId: appid,
			},
			Rack: &m.Rack{
				RackId: rackid,
			},
			Host: &m.Host{
				Id: hostid,
			},
			//Adapter: &m.NetworkAdapter{
			//	Id: adapterid,
			//},
			//Harddisk: &m.Harddisk{
			//	Id: harddiskid,
			//},
			//Memory: &m.Memory{
			//	Id: memoryid,
			//},
			//Cpu: &m.Cpu{
			//	Id: cpuid,
			//},
			Supplier: &m.Supplier{
				Id: supplierid,
			},
			State: &m.ServerState{
				Id: stateid,
			},
			Enable:true,
		}
		_, err = m.AddServer(importServer)
	}
	err = os.Remove(filePath)
	if err == nil {
		this.Data["json"] = this.ResponseSuccessJSON(true, "导入服务器列表成功", 1)
	} else {
		this.Data["json"] = this.ResponseSuccessJSON(false, "导入服务器列表失败", -1)
	}
	this.ServeJSON()
}

//导入图片
func (this *ImportPhotoController) ImportPhoto() {
	f, h, _ := this.GetFile("image")	//获取上传的文件
	path := this.Input().Get("url")	//存文件的路径
	path = path[7:]
	path = "./static/img/" + path + "/" + h.Filename
	f.Close()	// 关闭上传的文件，不然的话会出现临时文件不能清除的情况
	this.SaveToFile("image", path)	//存文件    WaterMark(path)	//给文件加水印
	this.Redirect("/addphoto", 302)
}
