/**
 * Created by liubin on 2016/5/4.
 * @description 封装CMDB API读取JS
 */
const cmdb={};
cmdb.endpoint = "";
cmdb.uri = {
    /**
     * @description 硬件信息API
     */
    cpu: cmdb.endpoint + "/api/cpu/count",
    harddisk: cmdb.endpoint + "/api/harddisk",
    memory: cmdb.endpoint + "/api/memory/count",
    memorySwap: cmdb.endpoint + "/api/memory/countSwap",
    networkadapter: cmdb.endpoint + "/api/networkadapter",
    cpuByServerId: cmdb.endpoint + "/api/cpu/query",
    memoryByServerId: cmdb.endpoint + "/api/memory/query",
    hardDiskByServerId: cmdb.endpoint + "/api/harddisk/query",
    networkadapterByServerId: cmdb.endpoint + "/api/networkadapter/query",
    portByServerId: cmdb.endpoint + "/api/server/port",
    host: cmdb.endpoint + "/api/server/host",
    login: cmdb.endpoint + "/api/login",
    logout: cmdb.endpoint + "/api/logout",
    user: cmdb.endpoint + "/api/user",
    datacenter: cmdb.endpoint + "/api/datacenter",
    datacenterValidName: cmdb.endpoint + "/api/datacenter/valid",
    datacenterState: cmdb.endpoint + "/api/state/datacenter",
    datacenterRegion: cmdb.endpoint + "/api/datacenter/region",
    roomState: cmdb.endpoint + "/api/state/room",
    roomById: cmdb.endpoint + "/api/room",
    app: cmdb.endpoint + "/api/app",
    appLevel: cmdb.endpoint + "/api/app/level",
    room: cmdb.endpoint + "/api/room",
    rack: cmdb.endpoint + "/api/rack",
    rackState: cmdb.endpoint + "/api/state/rack",
    bandwidth: cmdb.endpoint + "/api/networkbandwidth",
    isp: cmdb.endpoint + "/api/networkbandwidth/isp",
    bandwidthState: cmdb.endpoint + "/api/state/networkbandwidth",
    hardware: cmdb.endpoint + "/api/hardware",
    hardwareState: cmdb.endpoint + "/api/state/hardware",
    hardwareType: cmdb.endpoint + "/api/hardware/type",
    server: cmdb.endpoint + "/api/server",
    serverState: cmdb.endpoint + "/api/state/server",
    serverManufacturer: cmdb.endpoint + "/api/server/manufacturer",
    download: cmdb.endpoint + "/api/download",
    dnspoddomain: cmdb.endpoint + "/api/dnspoddomain",
    dnspoddomainState: cmdb.endpoint + "/api/state/dnspoddomain",
    dnspoddomainGrade: cmdb.endpoint + "/api/dnspoddomain/grade",
    supplier: cmdb.endpoint + "/api/supplier",
    agreement: cmdb.endpoint + "/api/agreement",
    agreementState: cmdb.endpoint + "/api/agreementState",
    role: cmdb.endpoint + "/api/role",
    roleEdit: cmdb.endpoint + "/api/editrolemenus",
    subnet: cmdb.endpoint + "/api/subnet",
    ip_address: cmdb.endpoint + "/api/ip",
    ip_update:cmdb.endpoint + "/api/ip/update",
    ip_monitor:cmdb.endpoint + "/api/ip/monitor",
    import: cmdb.endpoint + "/api/import",
    uploadAgreement: cmdb.endpoint + "/api/uploadagreement",//TODO
    readAgreement: cmdb.endpoint + "/api/uploadagreement",//TODO
    systememail: cmdb.endpoint + "/api/systememail",
    systemlog: cmdb.endpoint + "/api/systemlog",
    systemcloud: cmdb.endpoint + "/api/ResourcePlatformAccount",
    aliyun: cmdb.endpoint + "/api/aliyun",
    aws: cmdb.endpoint + "/api/aws",
    vcenter: cmdb.endpoint + "/api/vcenter",
    syncvcenter: cmdb.endpoint + "/api/SyncVcenter",
    syncaliyun: cmdb.endpoint + "/api/SyncAliyun",
    syncaws: cmdb.endpoint + "/api/SyncAws",
    accesskey: cmdb.endpoint + "/api/accesskey",
    assets:cmdb.endpoint+"/api/assets",//TODO
    assertsQuery: cmdb.endpoint + "/api/asserts/query",
    assertsInstance: cmdb.endpoint + "/api/asserts/instance",
    systemPanel: cmdb.endpoint + "/api/panel",
    ci: cmdb.endpoint + "/api/ci",
    resourcetree: cmdb.endpoint + "/api/resourcetree",
    globalSearch: cmdb.endpoint + "/api/search",
    menu: {
        "v1": cmdb.endpoint + "/api/menus",
        "v2": cmdb.endpoint + "/api/menus/v2",
    },
    menuObject: cmdb.endpoint + "/api/menus/object",
    line: cmdb.endpoint + "/api/topo/line",
    node: cmdb.endpoint + "/api/topo/node",
    view: cmdb.endpoint + "/api/topo/view",
    statecolor: cmdb.endpoint + "/api/statecolor",

    //报表API架构
    report:{
        resource:{
            //数量统计
            statistics:cmdb.endpoint+"/api/report/resource/statistics",
        },
        device:{
            //设备性能
            performance:cmdb.endpoint+"/api/report/device/performance"
        },
        financial:{
            //财务统计
            costDetail:cmdb.endpoint+"/api/report/financial/detail",
            costTrend:cmdb.endpoint+"/api/report/financial/trend",
            //businessCostCompared bCostCompared bcc
            bCostCompared:cmdb.endpoint+"/api/report/financial/bcc",
            //resourcesCostCompared rCostCompared rcc
            rCostCompared:cmdb.endpoint+"/api/report/financial/rcc",
        }
    },
    change:{
        /**
         * 统计变更
         */
        count:cmdb.endpoint + "/api/change",
    },
    apicall:{
        /**
         * 统计api调用次数
         */
        count:cmdb.endpoint + "/api/apicall",
    },
    /**
     * 仪表盘相关API
     */
    dashboard:{
        count:cmdb.endpoint + "/api/dashboard/count",
        usage:cmdb.endpoint + "/api/dashboard/usage",
        uposition:cmdb.endpoint + "/api/dashboard/uposition",
        device:cmdb.endpoint + "/api/dashboard/device",
        countByMonth:cmdb.endpoint + "/api/dashboard/countByMonth"
    }
};
cmdb.v2 = {
    datacenter: cmdb.endpoint + "/api/v2/datacenter",
};
cmdb.requestType = {
    GET: "GET",
    POST: "POST",
    PUT: "PUT",
    DELETE: "DELETE"
};

export {cmdb};


