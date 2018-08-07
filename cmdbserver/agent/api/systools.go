//获取系统信息工具
package api

import (
	"fmt"
	cpu "github.com/shirou/gopsutil/cpu"
	"github.com/shirou/gopsutil/disk"
	host "github.com/shirou/gopsutil/host"
	"github.com/shirou/gopsutil/load"
	mem "github.com/shirou/gopsutil/mem"
	"github.com/shirou/gopsutil/net"
	"os"
	"path/filepath"
	"runtime"
	"bufio"
	"strings"
	"os/exec"
	"github.com/shirou/gopsutil/process"
)

const (
	MAC  = "darwin"
	WINDOWS = "windows"
	LINUX = "linux"
	OPEN_BSD = "openbsd"
	VMWARE_VM="vcenter"
)

type SystemPort struct {
	Ip   	   string   `json:"ip"`
	Port       uint32    `json:"port"`
	Proccess   string   `json:"proccess"`
}

func GetMemory() *mem.VirtualMemoryStat {
	v, err := mem.VirtualMemory()
	if err == nil {
		return v
	} else {
		return nil
	}
}

func GetSwap() *mem.SwapMemoryStat {
	v, err := mem.SwapMemory()
	if err == nil {
		return v
	} else {
		return nil
	}
}

func GetCpuInfo() []cpu.InfoStat {
	v, err := cpu.Info()
	if err == nil {
		return v
	} else {
		return nil
	}

}

func GetCpuCount() string {
	cpuNum, err := cpu.Counts(true)
	if err == nil {
		return fmt.Sprintf("%v", cpuNum)
	} else {
		return fmt.Sprintf("0")
	}
}

func GetCpuUsage() string {
	v, err := cpu.Times(false)
	format := "{\"user\":\"%.2f%%\", \"system\": \"%.2f%%\", \"idle\": \"%.2f%%\", \"nice\": \"%.2f%%\", \"iowait\": \"%.2f%%\", \"irq\": \"%.2f%%\", \"soft_irq\": \"%.2f%%\", \"steal\": \"%.2f%%\", \"guest\": \"%.2f%%\", \"guest_nice\": \"%.2f%%\", \"stolen\":\"%.2f%%\"}"
	if err == nil {
		c := v[0]
		total := c.User + c.System + c.Nice + c.Iowait + c.Irq + c.Softirq + c.Steal + c.Guest + c.GuestNice + c.Idle + c.Stolen
		return fmt.Sprintf(format, 100*c.User/total, 100*c.System/total, 100*c.Idle/total, 100*c.Nice/total, 100*c.Iowait/total, 100*c.Irq/total, 100*c.Softirq/total, 100*c.Steal,
			100*c.Guest/total, 100*c.GuestNice/total, 100*c.Stolen)
	} else {
		return fmt.Sprintf(format, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
	}
}

func GetCpuLoad() *load.AvgStat {
	v, err := load.Avg()
	if err == nil {
		return v
	} else {
		return nil
	}

}

func GetHost() *host.InfoStat {
	v, err := host.Info()
	if err == nil {
		return v
	} else {
		return v
	}
}

func GetDiskPartitions() []disk.PartitionStat {
	v, err := disk.Partitions(false)
	if err == nil {
		return v
	} else {
		return nil
	}
}

func Getinterface() []net.InterfaceStat {
	v, err := net.Interfaces()
	if err == nil {
		return v
	} else {
		return nil
	}
}

func GetEnv(key string, dfault string, combineWith ...string) string {
	value := os.Getenv(key)
	if value == "" {
		value = dfault
	}

	switch len(combineWith) {
	case 0:
		return value
	case 1:
		return filepath.Join(value, combineWith[0])
	default:
		all := make([]string, len(combineWith)+1)
		all[0] = value
		copy(all[1:], combineWith)
		return filepath.Join(all...)
	}
	panic("invalid switch case")
}

//构造系统文件路径
func HostSys(combineWith ...string) string {
	return GetEnv("HOST_SYS", "/sys", combineWith...)
}

//判断系统文件是否存在
func PathExists(filename string) bool {
	if _, err := os.Stat(filename); err == nil {
		return true
	}
	return false
}

//读取系统文件函数
func ReadLines(filename string) ([]string, error) {
	return ReadLinesOffsetN(filename, 0, -1)
}

// ReadLines reads contents from file and splits them by new line.
// The offset tells at which line number to start.
// The count determines the number of lines to read (starting from offset):
//   n >= 0: at most n lines
//   n < 0: whole file
func ReadLinesOffsetN(filename string, offset uint, n int) ([]string, error) {
	f, err := os.Open(filename)
	if err != nil {
		return []string{""}, err
	}
	defer f.Close()

	var ret []string

	r := bufio.NewReader(f)
	for i := 0; i < n+int(offset) || n < 0; i++ {
		line, err := r.ReadString('\n')
		if err != nil {
			break
		}
		if i < int(offset) {
			continue
		}
		ret = append(ret, strings.Trim(line, "\n"))
	}

	return ret, nil
}

func DoSysctrl(mib string) ([]string, error) {
	err := os.Setenv("LC_ALL", "C")
	if err != nil {
		return []string{}, err
	}

	sysctl, err := exec.LookPath("/usr/sbin/sysctl")
	if err != nil {
		return []string{}, err
	}
	out, err := exec.Command(sysctl, "-n", mib).Output()
	if err != nil {
		return []string{}, err
	}
	v := strings.Replace(string(out), "{ ", "", 1)
	v = strings.Replace(string(v), " }", "", 1)
	values := strings.Fields(string(v))

	return values, nil
}

//获取mac的uuid
func GetMacKernUuid() string {
	values, err := DoSysctrl("kern.uuid")
	if err == nil && len(values) == 1 && values[0] != "" {
		return strings.ToLower(values[0])
	}
	return ""
}

func IsVirtualization() bool{
	system, role, _ := host.Virtualization()
	if system != "" && role != ""{
		return true
	}
	return false
}

func IsVmwareGuest() bool {
	system, role, _ := host.Virtualization()
	if system == "vmware" && role == "guest"{
		return true
	}
	return false
}

func IsXenGuest() bool {
	system, role, _ := host.Virtualization()
	if system == "xen" && role == "guest"{
		return true
	}
	return false
}

func IsKvmGuest() bool {
	system, role, _ := host.Virtualization()
	if system == "kvm" && role == "guest"{
		return true
	}
	return false
}

func IsKvmHost() bool {
	system, role, _ := host.Virtualization()
	if system == "kvm" && role == "host"{
		return true
	}
	return false
}

//获取序列号sn
func GetSerialNumber() (string ,error){

	var productSerial,productUuid string
	var productSerialConfigFile string
	var productUuidConfigFile string
	osName := runtime.GOOS

	//判断OS类型
	if osName == MAC{
		productSerial = GetMacKernUuid()
		productUuid = productSerial
	}else if( osName == LINUX){

		if IsVirtualization(){
			//如果是虚拟化机器
			if IsKvmGuest(){
				//todo
			}else if(IsKvmHost()){
				//todo
			}else if( IsVmwareGuest() || IsXenGuest()){
				productSerialConfigFile = HostSys("devices/virtual/dmi/id/product_serial")
				productUuidConfigFile = HostSys("devices/virtual/dmi/id/product_uuid")
			}else if( IsXenGuest()){
				//vmware sys/devices/virtual/dmi/id/product_uuid
				///xen sys/devices/virtual/dmi/id/product_uuid
				//phy sys/devices/virtual/dmi/id/product_uuid
				productSerialConfigFile = HostSys("devices/virtual/dmi/id/product_serial")
			}else{
				productUuidConfigFile = ""

			}
		}

		switch {
		case PathExists(productSerialConfigFile):
			lines, err := ReadLines(productSerialConfigFile)
			if err == nil && len(lines) > 0 && lines[0] != "" {
				productSerial = strings.ToLower(lines[0])
				break
			}
			fallthrough
		default:
			productSerial = ""
		}

		switch {
		case PathExists(productUuidConfigFile):
			lines, err := ReadLines(productUuidConfigFile)
			if err == nil && len(lines) > 0 && lines[0] != "" {
				productUuid = strings.ToLower(lines[0])
				break
			}
			fallthrough
		default:
			productUuid = ""
		}
	}else if( osName == WINDOWS){
		//todo
		productSerial = ""
		productUuid = ""
	}else {
		//todo
		productSerial = ""
		productUuid = ""
	}
	fmt.Println(productUuid)
	return productSerial,nil
}

//获取系统端口
func GetSystemPort() ([]SystemPort ,error){
	connectionStats, error := net.Connections("all")
	if error != nil{
		panic(error)
	}
	portList := make([]SystemPort,0)
	for _,connectionStat := range  connectionStats{
		//过滤ip
		if connectionStat.Laddr.Port == 0 || len(connectionStat.Laddr.IP) == 0{
			continue
		}

		//只获取处理LISTEN状态的网络连接
		if connectionStat.Status != "LISTEN" {
			continue
		}

		proc, err := process.NewProcess(connectionStat.Pid)
		if err != nil{
			continue
		}
		procName,err := proc.Name()
		if err != nil{
			continue
		}
		port := SystemPort{
			Ip:connectionStat.Laddr.IP,
			Port:connectionStat.Laddr.Port,
			Proccess:procName,
		}
		portList = append(portList,port)
	}
	return portList,nil
}
