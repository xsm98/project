<%@page import="com.x.entity.AdminEntity"%>
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
    <link href="${pageContext.request.contextPath}/HT/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/HT/css/bootstrap.min.css">
    <link href="${pageContext.request.contextPath}/HT/css/font-awesome.min.css"  rel="stylesheet">
    <link href="${pageContext.request.contextPath}/HT/css/animate.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/HT/css/style.min_EDT.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/HT/css/master.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/HT/css/plugins/iCheck/custom.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/HT/js/plugins/layer/skin/layer.css">
    <title>账号设置</title>
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>账号设置</h5>
                </div>
                <div class="ibox-content" id="tab-box">
                    <div class="row m-b-lg">
                        <div class="col-sm-12">
                            <button type="button" class="btn btn-primary add-btn"><i class="fa fa-plus"></i> 新增</button>
                        </div>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-striped table-hover" id="ListTB">
                            <thead>
                                <tr>
                                    <th>账号名称</th>
                                    <th>登录账号</th>
                                    <th>创建时间</th>
                                    <th>操作</th>
                                </tr>
                            </thead>
                            <% ArrayList<AdminEntity> list=new ArrayList<AdminEntity>();
                            list=(ArrayList)request.getAttribute("list");
                            for(int i=0;i<list.size();i++){
                            %>
                            <tbody>
                                <tr>
                                    <td><%=list.get(i).getId() %></td>
                                    <td><%=list.get(i).getUserName() %></td>
                                    <td>2018.1.13-2018.2.5</td>
                                    <td>
                                        <a href="#"  id="<%=list.get(i).getId() %>">编辑</a>
                                        <a href="#"  id="<%=list.get(i).getId() %>">删除</a>
                                    </td>
                                </tr>
                            </tbody>
                            <%} %>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<form class="form-horizontal" style="display: none;">
    <div class="form-box">
        <div class="form-group">
            <label class="col-sm-2 control-label">名称</label>
            <div class="col-sm-10"> <input type="text" class="form-control"> </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">密码</label>
            <div class="col-sm-10">
                <input type="text" class="form-control">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">账号权限</label>
            <div class="col-sm-10 no-padding">
                <label class="checkbox-inline">
                    <input type="radio" value="option1" style="position: relative;top:3px;margin-right:5px;">admin
                </label>
                <label class="checkbox-inline">
                    <input type="radio" value="option1" style="position: relative;top:3px;margin-right:5px;">ghost
                </label>
            </div>
        </div>
        <div class="col-sm-12 m-t text-center">
            <button class="btn btn-primary " id="BtnSave" name="BtnSave" type="button"><i class="fa fa-floppy-o"></i> 保存</button>
        </div>
    </div>
</form>
<script src="${pageContext.request.contextPath}/HT/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/HT/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/HT/js/plugins/iCheck/icheck.min.js"></script>
<script src="${pageContext.request.contextPath}/HT/js/plugins/datapicker/bootstrap-datepicker.js"></script>
<script src="${pageContext.request.contextPath}/HT/js/plugins/layer/layer.min.js"></script>
<script>
    $(document).ready(function(){
        $(".i-checks").iCheck({
            checkboxClass:"icheckbox_square-green",
            radioClass:"iradio_square-green"
        });
        $('.add-btn').on('click', function(){
            layer.open({
                title: '增加',
                type: 1,
                skin: 'layui-layer-rim', //加上边框
                area: ['420px', '360px'],
                shadeClose: false, //点击遮罩关闭
                content: '<form class="form-horizontal"  method="post" action="${pageContext.request.contextPath}/AdminServlet?op=add"> <div class="form-box"> <div class="form-group">  <div class="col-sm-8 no-padding">  </div> </div> <div class="form-group"> <label class="col-sm-3 control-label">登录账号:</label> <div class="col-sm-8 no-padding"> <input type="text" class="form-control"  name="userName"> </div> </div> <div class="form-group"> <label class="col-sm-3 control-label">登录密码:</label> <div class="col-sm-8 no-padding"> <input type="text" class="form-control" name="userpwd"> </div> </div>  <div class="col-sm-12 m-t text-center"> <button class="btn btn-primary " id="BtnSave" name="BtnSave" type="submit"><i class="fa fa-floppy-o"></i> 保存</button> </div> </div> </form>'
            });
        });
    });
</script>
</body>
</html>