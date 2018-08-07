package controllers

import (
	"fmt"
	"github.com/tealeg/xlsx"
)

func (this *ExportController) Export() {
	var file *xlsx.File
	var sheet *xlsx.Sheet
	var row *xlsx.Row
	var cell *xlsx.Cell
	var cell2 *xlsx.Cell
	var cell3 *xlsx.Cell
	var cell4 *xlsx.Cell
	var cell5 *xlsx.Cell
	var cell6 *xlsx.Cell
	var cell7 *xlsx.Cell
	var cell8 *xlsx.Cell
	var cell9 *xlsx.Cell
	var cell10 *xlsx.Cell
	var cell11 *xlsx.Cell
	var cell12 *xlsx.Cell
	var cell13 *xlsx.Cell
	var cell14 *xlsx.Cell
	var cell15 *xlsx.Cell
	var cell16 *xlsx.Cell
	var err error

	file = xlsx.NewFile()
	sheet, err = file.AddSheet("Sheet1")
	if err != nil {
		fmt.Printf(err.Error())
	}
	row = sheet.AddRow()
	cell = row.AddCell()
	cell2 = row.AddCell()
	cell3 = row.AddCell()
	cell4 = row.AddCell()
	cell5 = row.AddCell()
	cell6 = row.AddCell()
	cell7 = row.AddCell()
	cell8 = row.AddCell()
	cell9 = row.AddCell()
	cell10 = row.AddCell()
	cell11 = row.AddCell()
	cell12 = row.AddCell()
	cell13 = row.AddCell()
	cell14 = row.AddCell()
	cell15 = row.AddCell()
	cell16 = row.AddCell()
	cell.Value = "1"
	cell2.Value = "使用中"
	cell3.Value = "戴尔"
	cell4.Value = "DELL服务器"
	cell5.Value = "II7S"
	cell6.Value = "Xeon E3"
	cell7.Value = "16GB"
	cell8.Value = "500G"
	cell9.Value = "1000Mbps"
	cell10.Value = "Windows Server2012 R2"
	cell11.Value = "漕河泾机柜"
	cell12.Value = "8U"
	cell13.Value = "门户网站主站A"
	cell14.Value = "是"
	cell15.Value = "是"
	cell16.Value = "I am a server!"
	err = file.Save("a.xlsx")
	if err != nil {
		fmt.Printf(err.Error())
	}

	file, _ = xlsx.OpenFile("a.xlsx")
	sheet = file.Sheet["Sheet1"]
	row = sheet.AddRow()
	cell = row.AddCell()
	cell2 = row.AddCell()
	cell3 = row.AddCell()
	cell4 = row.AddCell()
	cell5 = row.AddCell()
	cell6 = row.AddCell()
	cell7 = row.AddCell()
	cell8 = row.AddCell()
	cell9 = row.AddCell()
	cell10 = row.AddCell()
	cell11 = row.AddCell()
	cell12 = row.AddCell()
	cell13 = row.AddCell()
	cell14 = row.AddCell()
	cell15 = row.AddCell()
	cell16 = row.AddCell()
	cell.Value = "2"
	cell2.Value = "使用中"
	cell3.Value = "戴尔"
	cell4.Value = "DELL服务器"
	cell5.Value = "II7S"
	cell6.Value = "Xeon E3"
	cell7.Value = "16GB"
	cell8.Value = "500G"
	cell9.Value = "1000Mbps"
	cell10.Value = "Windows Server2012 R2"
	cell11.Value = "漕河泾机柜"
	cell12.Value = "8U"
	cell13.Value = "门户网站主站A"
	cell14.Value = "是"
	cell15.Value = "是"
	cell16.Value = "I am a server!"
	err = file.Save("b.xlsx")
	if err != nil {
		fmt.Printf(err.Error())
	}

	file, _ = xlsx.OpenFile("b.xlsx")
	sheet = file.Sheet["Sheet1"]
	row = sheet.AddRow()
	cell = row.AddCell()
	cell2 = row.AddCell()
	cell3 = row.AddCell()
	cell4 = row.AddCell()
	cell5 = row.AddCell()
	cell6 = row.AddCell()
	cell7 = row.AddCell()
	cell8 = row.AddCell()
	cell9 = row.AddCell()
	cell10 = row.AddCell()
	cell11 = row.AddCell()
	cell12 = row.AddCell()
	cell13 = row.AddCell()
	cell14 = row.AddCell()
	cell15 = row.AddCell()
	cell16 = row.AddCell()
	cell.Value = "3"
	cell2.Value = "使用中"
	cell3.Value = "戴尔"
	cell4.Value = "DELL服务器"
	cell5.Value = "II7S"
	cell6.Value = "Xeon E3"
	cell7.Value = "16GB"
	cell8.Value = "500G"
	cell9.Value = "1000Mbps"
	cell10.Value = "Windows Server2012 R2"
	cell11.Value = "漕河泾机柜"
	cell12.Value = "8U"
	cell13.Value = "门户网站主站A"
	cell14.Value = "是"
	cell15.Value = "是"
	cell16.Value = "I am a server!"
	err = file.Save("c.xlsx")
	if err != nil {
		fmt.Printf(err.Error())
	}
}