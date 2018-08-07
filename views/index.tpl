<!DOCTYPE html>
<html ng-app="CmdbApp">
<!--[if IE 8]>
<html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]>
<html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->

<!-- BEGIN HEAD -->
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1.0" name="viewport" user-scalable="no"/>
    <meta content="" name="description"/>
    <meta content="" name="author"/>
    <title>OneOaaS-CMDB</title>
    <base href="/">
    <link rel="shortcut icon" href="assets/img/favicon.ico"/>
    <link rel="stylesheet" type="text/css" href="assets/scripts/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="assets/scripts/bootstrap-datetimepicker/css/datetimepicker.css"/>
    <link rel="stylesheet" type="text/css" href="assets/scripts/bootstrap-table/bootstrap-table.min.css">
    <link rel="stylesheet" type="text/css" href="assets/scripts/vis/dist/vis.css">
    <link rel="stylesheet" type="text/css" href="assets/scripts/notify/notify.css">
    <link rel="stylesheet" type="text/css" href="assets/scripts/bootstrap-treeview/bootstrap-treeview.css">
    <link rel="stylesheet" type="text/css" href="assets/scripts/sweetalert2/sweetalert2.css">
    <link rel="stylesheet" type="text/css" href="assets/scripts/select2/select2.min.css">
    <link rel="stylesheet" type="text/css" href="assets/scripts/uploadify/uploadify.css">
    <link rel="stylesheet" type="text/css" href="assets/css/style.css">
    <link rel="stylesheet" type="text/css" id="cutstyle" href="assets/css/sass/cmdb.css">
</head>
<body>
<div ui-view></div>
<script type="text/javascript" src="assets/scripts/jquery/jquery.min.js"></script>
<script type="text/javascript" src="assets/scripts/angular/angular.js"></script>

<script type="text/javascript" src="assets/scripts/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="assets/scripts/bootstrapValidator/bootstrapValidator.js"></script>
<script type="text/javascript" src="assets/scripts/bootstrap-treeview/bootstrap-treeview.js"></script>
<script type="text/javascript" src="assets/scripts/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js"></script>

<script type="text/javascript" src="assets/scripts/bootstrap-table/bootstrap-table.js"></script>
<script type="text/javascript" src="assets/scripts/bootstrap-table/extensions/export/tableExport.js"></script>
<script type="text/javascript" src="assets/scripts/bootstrap-table/extensions/export/bootstrap-table-export.js"></script>
<script type="text/javascript" src="assets/scripts/bootstrap-table/extensions/editable/bootstrap-table-editable.js"></script>
<script type="text/javascript" src="assets/scripts/bootstrap-table/locale/bootstrap-table-zh-CN.js"></script>

<script type="text/javascript" src="assets/scripts/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script>

<script type="text/javascript" src="assets/scripts/uploadify/jquery.uploadify.js"></script>
<script type="text/javascript" src="assets/scripts/echarts/echarts.min.js"></script>
<script type="text/javascript" src="assets/scripts/echarts/world.js"></script>


<script type="text/javascript" src="assets/scripts/flot/jquery.flot.min.js"></script>
<script type="text/javascript" src="assets/scripts/flot/jquery.flot.spline.js"></script>
<script type="text/javascript" src="assets/scripts/flot/jquery.flot.tooltip.min.js"></script>
<script type="text/javascript" src="assets/scripts/flot/jquery.flot.pie.min.js"></script>
<script type="text/javascript" src="assets/scripts/flot/jquery.flot.resize.js"></script>
<script type="text/javascript" src="assets/scripts/flot/jquery.flot.categories.js"></script>


<script type="text/javascript" src="assets/scripts/notify/pnotify.core.js"></script>
<script type="text/javascript" src="assets/scripts/notify/pnotify.buttons.js"></script>
<script type="text/javascript" src="assets/scripts/notify/pnotify.nonblock.js"></script>
<script type="text/javascript" src="assets/scripts/vis/vis-origin.js"></script>
<script type="text/javascript" src="assets/scripts/select2/select2.js"></script>
<script type="text/javascript" src="assets/scripts/select2/jquery.mask.js"></script>

<script type="text/javascript" src="dest/js/public/app.js"></script>
<script type="text/javascript" src="dest/js/public/bootstrapTableFormat.js"></script>
<script type="text/javascript" src="dest/js/vendors.js"></script>
<script type="text/javascript" src="dest/js/cmdbapp.js"></script>
</body>
<script>
    function change(a){
        var cutstyle=document.getElementById("cutstyle");
        if (a==1){
            cutstyle.setAttribute("href","assets/css/sass/cmdb.css");
        }
        if (a==2){
            cutstyle.setAttribute("href","assets/css/sass/cmdb_black.css");
        }
        if (a==3){
            cutstyle.setAttribute("href","assets/css/sass/cmdb_red.css");
        }
    }
</script>
</html>
