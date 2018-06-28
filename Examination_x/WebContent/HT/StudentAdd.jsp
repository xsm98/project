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
    <link rel="stylesheet" type="text/css" href="js/plugins/layer/skin/layer.css">
    <title>学生信息</title>
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>学生信息添加</h5>
                </div>
                <div class="ibox-content">
                    <form class="form-horizontal m-t" action="../StudentServlet?op=add"  method="post">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label class="control-label col-sm-2">名字：</label>
                                    <div class="col-sm-6 input-group">
                                        <input  type="text" class="form-control" name="user">
                                        <span class="input-group-btn">
                                            <button type="button" class="btn btn-primary" onclick="LabelBtn();">
                                                <span class="fa fa-plus"></span>
                                            </button>
                                        </span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-2">年龄：</label>
                                    <div class="col-sm-6 input-group">
                                        <input  type="number" class="form-control" name="age">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-2">学生密码：</label>
                                    <div class="col-sm-6 input-group">
                                        <input  type="text" class="form-control" name="stu_pwd">
                                    </div>
                                </div>
                               <div class="form-group">
                                    <label class="control-label col-sm-2">性别：</label>
                                    <div class="col-sm-6 no-padding">
                                        <label class="checkbox-inline i-checks">
                                            <input type="radio" class="i-checks" name="sex"  value="男"  style="position: absolute; opacity: 0;">男
                                        </label>
                                        <label class="checkbox-inline i-checks">
                                            <input type="radio" class="i-checks" name="sex" value="女" style="position: absolute; opacity: 0;">女&nbsp;
                                        </label>
                                    </div>
                                </div>
                                 <div class="form-group">
                                    <label class="control-label col-sm-2">班级：</label>
                                    <div class="col-sm-6 input-group">
                                        <input  type="number" class="form-control" name="class">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="row">
                            <div class="col-sm-12">
                              <div class="form-group">
                                    <label class="control-label col-sm-2">联系方式：</label>
                                    <div class="input-group col-sm-6">
                                        <input class="form-control"  name="phone" placeholder="联系方式" type="number" value="">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-2">地址：</label>
                                    <div class="input-group col-sm-6">
                                        <input class="form-control"  name="addres" placeholder="地址" type="text" value="">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="text-center m-t">
                            <button  class="btn btn-primary"  type="submit"> <i class="fa fa-floppy-o"></i> 保存</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/plugins/iCheck/icheck.min.js"></script>
<script src="js/plugins/datapicker/bootstrap-datepicker.js"></script>
<script src="js/plugins/layer/layer.min.js"></script>
<script src="js/uploadPreview.js"></script>
<script>
    function LabelBtn(){
        layer.open({
            type: 2,
            title: '标签',
            shadeClose: true,
            shade: 0.8,
            area: ['50%', '50%'],
            content: 'http://localhost:63342/CarShopMange.web/label.html' //iframe的url
        });
    }
    $(document).ready(function(){
        $(".i-checks").iCheck({
            checkboxClass:"icheckbox_square-green",
            radioClass:"iradio_square-green"
        });
    });
</script>
</body>
</html>