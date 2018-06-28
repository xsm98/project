<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
 <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap.min.css">
    <link href="css/font-awesome.min.css"  rel="stylesheet">
    <link href="css/animate.min.css" rel="stylesheet">
    <link href="css/style.min_EDT.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/master.css">
    <link rel="stylesheet" type="text/css" href="css/plugins/iCheck/custom.css">
    <link rel="stylesheet" type="text/css" href="css/plugins/chosen/chosen.css">
    <title>添加科目</title>
    <style>
        .well01 {
            min-height: 20px;
            padding: 19px;
            margin-bottom: 20px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 4px;
            -webkit-box-shadow: none;
            box-shadow: none;
        }
    </style>
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>添加科目类型</h5>
                </div>
                <div class="ibox-content">
                    <div class="row">
                        <div class="col-sm-12 ">
                            <form class="form-horizontal" action="../Subject?op=add"  method="post">
                                <div class="well01">
                                    <div class="input-group">
                                    <h5>科目名字</h5>
                                   <input placeholder="请输入科目名字" data-val="true" type="text" name="subjectName">
                                    </div>
                                </div>
                                <div class="col-sm-12 m-t text-center">
                                    <button class="btn btn-primary " id="BtnSave" name="BtnSave" type="submit"><i class="fa fa-floppy-o"></i> 提交</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/plugins/iCheck/icheck.min.js"></script>
<script src="js/plugins/datapicker/bootstrap-datepicker.js"></script>
<script src="js/plugins/chosen/chosen.jquery.js"></script>
<script>
    $(document).ready(function(){
        $(".i-checks").iCheck({
            checkboxClass:"icheckbox_square-green",
            radioClass:"iradio_square-green"
        });
    });
</script>
</body>
</html>