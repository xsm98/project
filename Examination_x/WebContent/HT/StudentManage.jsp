
<%@page import="com.x.util.PageModel"%>
<%@page import="com.x.entity.StudentEntity"%>
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
    <title>学生管理</title>
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>学生管理</h5>
                </div>
                <div class="ibox-content">
                   <div class="hr-line-dashed"></div>
                    <div class="row m-b-lg m-t-lg">
                        <div class="col-sm-4"></div>
                        <div class="col-sm-4 text-center">
                            <div class="form-group">
                                <div class="input-group">
                                    <input class="form-control" id="zi" name="Keywords" placeholder="姓名" type="text" value="">
                                    <span class="input-group-btn">
                                        <button type="submit" class="btn btn-primary" id="stu">
                                            <i class="fa fa-search"></i> 搜索
                                        </button>
                                    </span>&nbsp; &nbsp;
                                    <span class="input-group-btn">
                                    	<button class="btn btn-primary " id="addBtn"  name="BtnSave" type="button"><i class="fa fa-floppy-o"></i>添加学生</button>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-striped table-hover" id="ListTB">
                            <thead>
                                <tr>
                                    <th><input type="checkbox" class="i-checks" name="IDs" style="position: absolute; opacity: 0;"></th>
                                    <th>学生学号</th>
                                    <th>名字 <i class="fa fa-sort"></i></th>
                                    <th>年龄<i class="fa fa-sort"></i></th>
                                    <th>性别</th>
                                    <th>班级 <i class="fa fa-sort"></i></th>
                                    <th>电话 <i class="fa fa-sort"></i></th>
                                    <th>地址</th>
                                    <th>详情</th>
                                </tr>
                            </thead>
                            <% PageModel<StudentEntity> pm=(PageModel)request.getAttribute("pm");
                            ArrayList<StudentEntity> list =pm.getList();
                            for(int i=0;i<list.size();i++){ %>
                            <tbody>
                                <tr>
                                    <td>
                                        <input type="checkbox" class="i-checks" name="IDs" style="position: absolute; opacity: 0;">
                                    </td>
                                     <td><%=list.get(i).getStu_id()%></td>
                                    <td ><%=list.get(i).getStu_name()%></td>
                                    <td><%=list.get(i).getStu_age() %></td>
                                    <td><%=list.get(i).getStu_sex() %></td>
                                    <td><%=list.get(i).getStu_classId()%></td>
                                    <td><%=list.get(i).getStu_phone() %></td>
                                    <td><%=list.get(i).getStu_addres() %></td>
                                    <td><a href="HT/StudentUpdate.jsp?id=<%=list.get(i).getStu_id() %>">修改</a></td>
                                    <td><a href="#" name="delete" id=<%=list.get(i).getStu_id() %>  onclick="test(this)">删除</a></td>
                                </tr>           
                            </tbody>
                            <%} %>
                            <tr> 
                                      <td>
                                           <a href="${pageContext.request.contextPath}/StudentServlet?op=select&pageNo=<%=pm.getFirst()%>">首页</a>
                                           <a href="${pageContext.request.contextPath}/StudentServlet?op=select&pageNo=<%=pm.getDow()%>" >上一页</a>
                                           <a href="${pageContext.request.contextPath}/StudentServlet?op=select&pageNo=<%=pm.getup()%>">下一页</a>
                                           <a href="${pageContext.request.contextPath}/StudentServlet?op=select&pageNo=<%=pm.getEnd()%>">尾页</a>
                                        </td>
                                    </tr>
                        </table>
                    </div>
                    <div class="row">
                       <!--  <div class="col-sm-3 text-right">
                            <div data-toggle="buttons" class="btn-group" id="PageSizeRG">
                                <label class="btn btn-sm btn-white active">
                                    <input type="radio" name="PageSizeR" value="10">10</label>
                                <label class="btn btn-sm btn-white">
                                    <input type="radio" name="PageSizeR" value="20">20</label>
                                <label class="btn btn-sm btn-white">
                                    <input type="radio" name="PageSizeR" value="50">50</label>
                            </div>
                            <div class="clearfix"></div>
                        </div> -->

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
<script type="text/javascript" src="layer/layer.js"></script>
<script>
    $(document).ready(function(){
        $(".nav-tab-info li a:eq(0)").addClass("active");
        $(".i-checks").iCheck({
            checkboxClass:"icheckbox_square-green",
            radioClass:"iradio_square-green"
        })
    });
    
    $("#addBtn").click(function(){
    	window.location.replace("HT/StudentAdd.jsp");
    	
    	
    });
    
    $("#stu").click(function(){
    	
    	/* location.href="StudentServlet?op=stu"; */
    	
    });

   
        /* $("a[name='delete']").click(function(){  */ 
        	function test(qw){
        	layer.confirm('确定是否删除此条学生信息', {
        		  btn: ['确定','取消'] 
        		}, function(){
       
        	location.href="StudentServlet?op=delete&id="+qw.id+"";
        		});
        }
   /*      }); */
</script>
</body>
</html>