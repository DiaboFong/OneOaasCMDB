package api

import (
	"testing"
)

func TestGetMemory(t *testing.T) {
	v := GetMemory()
	if v == nil{
		t.Error("获取虚拟内存失败")
	}

	if v.Total == uint64(0){
		t.Error("虚拟总内存等于0")
	}

	if v.Free == uint64(0){
		t.Error("虚拟空闲内存等于0")
	}

	if v.UsedPercent == float64(0){
		t.Error("虚拟使用率等于0")
	}


}

func TestGetMacKernUuid(t *testing.T)  {
	macUuid := GetMacKernUuid()
	if macUuid == ""{
		t.Error("mac kern uuid 为空")
	}else{
		t.Log("mac kern uuid is",macUuid)
	}
}

func TestIsVirtualization(t *testing.T) {
	productSerial,err:= GetSerialNumber()

	if err != nil{
		t.Error("version为空")
	}

	if productSerial == "" {
		t.Error("productSerial为空")
	}else{
		t.Log("productSerial is ",productSerial)
	}

}

