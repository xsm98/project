<%@page import="com.x.util.PageModel"%>
<%@page import="com.x.entity.QuestionEntity"%>
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
    <link rel="stylesheet" type="text/css" href="HT/js/plugins/layer/skin/layer.css">
    <title>题目录入</title>
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>题目录入</h5>
                </div>
                <div class="ibox-content">
                    <div class="row">
                        <div class="col-sm-12">
                            <form class="form-horizontal">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="col-sm-4">
                                            <div class="input-group" style="width: 100%;">
                                                <input class="form-control" placeholder="" type="text" value="" >
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <button type="submit" class="btn btn-primary m-r"><i class="fa fa-search"></i> 搜索</button>
                                            <a href="HT/QuestionAdd.jsp" class="btn-primary btn"><i class="fa fa-file-text-o"></i> 添加试题</a>
                                        </div>
                                    <!--     <div class="col-sm-4">
                                           <p>根据题目类型显示</p>
                                           <select id="asdf" name="subject_type">
                                              <option>全部</option>
                                           </select>
                                        </div> -->
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="row m-t-lg">
                        <div class="col-sm-12">
                            <div class="table-responsive">
                                <table class="table table-striped table-hover" id="ListTB">
                                    <thead>
                                        <tr>
                                            <th>题目编号</th>
                                            <th>题目内容</th>
                                            <th>答案<i class="fa fa-sort-amount-asc"></i></th>
                                            <th>题目类型 <i class="fa fa-sort-amount-asc"></i></th>
                                            <th>操作</th>
                                        </tr>
                                    </thead>
                                    <% PageModel<QuestionEntity> pm=(PageModel)request.getAttribute("pm");
                                    ArrayList<QuestionEntity> list =pm.getList();
                                    for(int i=0;i<list.size();i++){%>
                                    <tbody>
                                        <tr>
                                            <td><%=list.get(i).getQus_id() %></td>
                                            <td><%=list.get(i).getQus_stion() %></td>
                                            <td><%=list.get(i).getQus_answer() %></td>
                                            <td><%=list.get(i).getSubject_type() %></td>
                                            <td><a href="#" name="delete" id=<%=list.get(i).getQus_id() %>  onclick="test(this)">删除</a></td>
                                            <td><button class="btn btn-primary settings-btn"><i class="fa fa-cog"></i> 查看选项</button></td>
                                        </tr>
                                    </tbody>
                                    <%} %>
                                    <tr> 
                                        <td>
                                           <a href="${pageContext.request.contextPath}/QuestionServlet?op=select&pageNo=<%=pm.getFirst()%>">首页</a>
                                           <a href="${pageContext.request.contextPath}/QuestionServlet?op=select&pageNo=<%=pm.getDow()%>" >上一页</a>
                                           <a href="${pageContext.request.contextPath}/QuestionServlet?op=select&pageNo=<%=pm.getup()%>">下一页</a>
                                           <a href="${pageContext.request.contextPath}/QuestionServlet?op=select&pageNo=<%=pm.getEnd()%>">尾页</a>
                                        </td>
                                    </tr>
                                </table>
                            </div>
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
<script src="HT/js/plugins/layer/layer.min.js"></script>
<script>
    $(document).ready(function(){
        $('.settings-btn').on('click', function(){
            layer.open({
                title: '更改代理商类型',
                type: 1,
                skin: 'layui-layer-rim', //加上边框
                area: ['260px', '220px'],
                shadeClose: true, //点击遮罩关闭
                content: '<div class="form-box"> <div class="input-group"> <label class="checkbox-inline i-checks"> <input type="radio" class="i-checks" name="IDs" style="position: relative;top:2px;margin-right:5px;">'+kl+'普通代理商（当前）</label></div> <div class="input-group m-t-xs"> <label class="checkbox-inline i-checks"> <input type="radio" class="i-checks" name="IDs" style="position: relative;top:2px;margin-right:5px;">高级代理 </label> </div> <div class="col-sm-12 m-t text-center"> <button class="btn btn-primary " id="BtnSave" name="BtnSave" type="button"><i class="fa fa-floppy-o"></i> 保存</button> </div> </div>'
            });
        });
        $(".i-checks").iCheck({
            checkboxClass:"icheckbox_square-green",
            radioClass:"iradio_square-green"
        });
    });
    
    function test(qw){
    	layer.confirm('确定是否删除此条题目', {
    		  btn: ['确定','取消'] 
    		}, function(){
   
    	location.href="QuestionServlet?op=delete&id="+qw.id+"";
    		});
    };
    
/*     $(document).ready(function(){
    	$.ajax({
    	url:"SubjectServlet",
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
    	
    }); */
    
</script>
</body>
</html>