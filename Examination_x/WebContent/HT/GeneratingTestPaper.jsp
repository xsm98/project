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
    <link href="${pageContext.request.contextPath}/HT/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/HT/css/bootstrap.min.css">
    <link href="${pageContext.request.contextPath}/HT/css/font-awesome.min.css"  rel="stylesheet">
    <link href="${pageContext.request.contextPath}/HT/css/animate.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/HT/css/style.min_EDT.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/HT/css/master.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/HT/css/plugins/iCheck/custom.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/HT/js/plugins/layer/skin/layer.css">
    <title>生成试卷</title>
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>生成试卷</h5>
                </div>
                <div class="ibox-content">
                    <form class="form-horizontal m-t" method="post" action="${pageContext.request.contextPath}/PaperServlet">
                        <div class="row">
                            <div class="col-sm-12">
                            <div class="form-group">
                                    <label class="control-label col-sm-2">选择考试班级：</label>
                                    <div class="col-sm-6 input-group">
                                        <select id="class" name="paper_class">
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-2">选择科目：</label>
                                    <div class="col-sm-6 input-group"  id="tishi">
                                        <select id="asdf" name="subject_type">
                                        <option value="q">选择科目</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-2">选择题目数量：</label>
                                    <div class="col-sm-6 input-group">
                                        <input  type="number" min="1" class="form-control" placeholder="" id="count"  name="paper_ti">
                                    </div>
                                </div>
                                     <div class="form-group">
                                    <label class="control-label col-sm-2">试卷名字：</label>
                                    <div class="col-sm-6 input-group">
                                        <input  type="text" class="form-control" name="paper_name">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="text-center m-t">
                            <button  class="btn btn-primary" type="submit"> <i class="fa fa-floppy-o"></i> 生成</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/HT/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/HT/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/HT/js/plugins/iCheck/icheck.min.js"></script>
<script src="${pageContext.request.contextPath}/HT/js/plugins/datapicker/bootstrap-datepicker.js"></script>
<script src="${pageContext.request.contextPath}/HT/js/plugins/layer/layer.min.js"></script>
<script src="${pageContext.request.contextPath}/HT/js/uploadPreview.js"></script>
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
    	url:"${pageContext.request.contextPath}/ClassAjax",	
    	datatype:"json",
    	type:"get",
    	async:"false",
    	success:function(data){
    		var Class;
    		for(var i=0;i<data.length;i++){
    			var user=data[i];
    			Class="<option value='"+user.class_id+"'>"+user.class_name+"</option>";
    			$("#class").append(Class);
    		}
    	}
    	});
    	
    });
    
    
    $(document).ready(function(){
    	$.ajax({
    	url:"${pageContext.request.contextPath}/SubjectServlet",
    	datatype:"json",
    	type:"get",
    	async:"false",
    	success:function(data){
    		var html;
    		for(var i=0; i<=data.length; i++){
    			var user=data[i];
    			html="<option value='"+user.subject_id+"' name='subject' >"+user.subject_name+"</option>";
    			$("#asdf").append(html);
    		}
    	}
    		
    	});
    	
    });
    
    $("#asdf").change(function(){
    	var subject=$("#asdf").val();
    	if(subject=="q"){
    		alert("此项不是科目请重新选择");
    		$("#count").attr("placeholder","");
    	}else{
    	  $.ajax({
    		 url:"${pageContext.request.contextPath}/SubjectServlet",
    	     datatype:"json",	
    	     type:"post",
    	     data:{"data":subject},
    	     async:"true",
    	     success:function(data){
    	    	/*  $("#tishi").append("<p>此科目共有试题"+data+"道</p>") */
    	    	$("#count").attr("placeholder","此科目共有试题"+data+"道");
    	    	
    	     }
    		  
    	  });
    	}
    });
</script>
</body>
</html>