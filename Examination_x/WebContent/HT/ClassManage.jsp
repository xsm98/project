<%@page import="com.x.entity.ClassEntity"%>
<%@page import="java.util.ArrayList"%>
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
    <link href="HT/css/bootstrap.min.css" rel="stylesheet">
    <link href="HT/css/bootstrap.min.css">
    <link href="HT/css/font-awesome.min.css"  rel="stylesheet">
    <link href="HT/css/animate.min.css" rel="stylesheet">
    <link href="HT/css/style.min_EDT.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="HT/css/master.css">
    <link rel="stylesheet" type="text/css" href="HT/css/plugins/iCheck/custom.css">
    <link rel="stylesheet" type="text/css" href="HT/css/plugins/chosen/chosen.css">
    <title>班级信息</title>
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>班级信息</h5>
                </div>
                <div class="ibox-content">
                    <div class="table-responsive">
                        <h5 class="m-b">当前有:<span  class="text-danger">${count}</span>个班级</h5>
                        <table class="table table-striped table-hover" id="ListTB">
                            <thead>
                                <tr>
                                    <th>班级Id</th>
                                    <th>班级名称</th>
                                    <th>班级总人数</th>
                                    <th>描述</th>
                                </tr>
                            </thead>
                            <%ArrayList<ClassEntity> list=(ArrayList<ClassEntity>)request.getAttribute("list");
                            for(int i=0;i<list.size();i++){
                            %>
                            <tbody>
                                <tr>
                                    <td><%=list.get(i).getClass_id() %></td>
                                    <td><%=list.get(i).getClass_name() %></td>
                                    <td><%=list.get(i).getSum() %></td>
                                    <td><a href="#" name="delete" id=<%=list.get(i).getClass_id() %>  onclick="test(this)">删除</a></td>
                                </tr>
                            </tbody>
                            <%} %>
                        </table>
                    </div>
                    <div class="row">
                        <div class="col-sm-3 text-left">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="HT/js/jquery.min.js"></script>
<script src="HT/js/bootstrap.min.js"></script>
<script src="HT/js/plugins/iCheck/icheck.min.js"></script>
<script src="HT/js/plugins/datapicker/bootstrap-datepicker.js"></script>
<script src="HT/js/plugins/chosen/chosen.jquery.js"></script>
<script type="text/javascript" src="layer/layer.js"></script>
<script>
    $(document).ready(function(){
        $(".nav-tab-info li a:eq(0)").addClass("active");
        $(".i-checks").iCheck({
            checkboxClass:"icheckbox_square-green",
            radioClass:"iradio_square-green"
        });
    });
    
    function test(ID){
    	var id=ID.id;
    	layer.confirm('确定是否删除此条班级信息 ', {
  		  btn: ['确定','取消'] 
  		}, function(){
           $.post("${pageContext.request.contextPath}/ClassAjax",{"id":id},function(date){
            	if(date){
            		layer.confirm('该班级存在学生不可以删除',{
            			btn:['确定']
            		}
            	   );
            	}else{
            		/* alert("qwe"); */
            		location.href="ClassServlet?op=delete&id="+ID.id+""; 
            	}
            }); 
  	
  		});
    	
    }
</script>
</body>
</html>