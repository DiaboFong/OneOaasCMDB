/**
 * Created by liubin on 2016/5/3.
 * @description 表格格式化相关函数
 */
var selections = [];

function responseHandler(res) {
    $.each(res.rows, function (i, row) {
        row.state = $.inArray(row.id, selections) !== -1;
    });
    return res;
}

//用于显示表格详情
function detailFormatter(index, row) {
    var html = [];
    //过滤ID属性
    $.each(row, function (key, value) {
        if (key !== 0 &&
            key != "Appid" &&
            key != "Dcid" &&
            key != "Roomid" &&
            key != "Rackid" &&
            key != "Networkbandwidthid" &&
            key != "Hardwareid" &&
            key != "Serverid" &&
            key != "DomainId" &&
            key != "Supplierid" &&
            key != "Agreementid" &&
            key != "Serverid" &&
            key != "Networkipid"
        ) {
            html.push('<p><b>' + key + ':</b> ' + value + '</p>');
        }
    });
    return html.join('');
}

function totalNoFormatter(data) {
    return data.length;
}

function totalTextFormatter(data) {
    return 'Total';
}

function totalNameFormatter(data) {
    return data.length;
}

function getHeight() {
    return $(window).height() - $('h1').outerHeight(true);
}

function activaTab(tab) {
    $('.nav-tabs a[href="#' + tab + '"]').tab('show');
}

//设置textarea光标默认为第一行第一个字符
function first(e, a) {
    if (e && e.preventDefault)
        e.preventDefault();
    else
        window.event.returnValue = false;
    a.focus();
}