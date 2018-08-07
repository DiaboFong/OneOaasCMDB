package zabbix

import (
	"testing"
)

func TestNewAPI(t *testing.T) {
	_, err := NewAPI("http://10.0.2.14/api_jsonrpc.php", "Admin", "zabbix")
	if err != nil {
		t.Error("API登录错误")

	}
	t.Log("API测试通过")
}
