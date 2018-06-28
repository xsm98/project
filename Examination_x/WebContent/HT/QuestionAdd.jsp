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
    <title>添加试题</title>
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>添加试题</h5>
                </div>
                <div class="ibox-content">
                    <form class="form-horizontal m-t" action="../QuestionServlet?op=add"  method="post">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label class="control-label col-sm-2">题目：</label>
                                    <div class="col-sm-6 input-group">
                                        <input  type="text" class="form-control" name="title">
                                        <span class="input-group-btn">
                                            <button type="button" class="btn btn-primary" onclick="LabelBtn();">
                                                <span class="fa fa-plus"></span>
                                            </button>
                                        </span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-2">选项A：</label>
                                    <div class="col-sm-6 input-group">
                                        <input  type="text" class="form-control" name="qus_A">
                                    </div>
                                </div>
                                 <div class="form-group">
                                    <label class="control-label col-sm-2">选项B：</label>
                                    <div class="col-sm-6 input-group">
                                        <input  type="text" class="form-control" name="qus_B">
                                    </div>
                                </div>
                                 <div class="form-group">
                                    <label class="control-label col-sm-2">选项C：</label>
                                    <div class="col-sm-6 input-group">
                                        <input  type="text" class="form-control" name="qus_C">
                                    </div>
                                </div>
                                 <div class="form-group">
                                    <label class="control-label col-sm-2">选项D：</label>
                                    <div class="col-sm-6 input-group">
                                        <input  type="text" class="form-control" name="qus_D">
                                    </div>
                                </div>
                               <div class="form-group">
                                    <label class="control-label col-sm-2">正确答案：</label>
                                    <div class="col-sm-6 no-padding">
                                        <label class="checkbox-inline i-checks">
                                            <input type="radio" class="i-checks" name="qus_answer"  value="A"  style="position: absolute; opacity: 0;">A
                                        </label>
                                        <label class="checkbox-inline i-checks">
                                            <input type="radio" class="i-checks" name="qus_answer" value="B" style="position: absolute; opacity: 0;">B&nbsp;
                                        </label>
                                        <label class="checkbox-inline i-checks">
                                            <input type="radio" class="i-checks" name="qus_answer" value="C" style="position: absolute; opacity: 0;">C&nbsp;
                                        </label>
                                        <label class="checkbox-inline i-checks">
                                            <input type="radio" class="i-checks" name="qus_answer" value="D" style="position: absolute; opacity: 0;">D&nbsp;
                                        </label>
                                    </div>
                                </div>
                                 <div class="form-group">
                                    <label class="control-label col-sm-2">科目类型</label>
                                    <div class="col-sm-6 input-group" >
                                        <select id="asdf" name="subject_type"></select>
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
    
    $(document).ready(function(){
    	$.ajax({
    	url:"../SubjectServlet",
    	datatype:"json",
    	type:"get",
    	async:"false",
    	success:function(data){
    		var html;
    		for(var i=0; i<=data.length; i++){
    			var user=data[i];
    			html="<option value='"+user.subject_id+"'>"+user.subject_name+"</option>";
    			$("#asdf").append(html);
    		}
    	}
    		
    	});
    	
    });
</script>
</body>
</html>