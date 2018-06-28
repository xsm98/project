<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="Pragma" content="no-cache"> 
<meta http-equiv="Cache-Control" content="no-cache"> 
<meta http-equiv="Expires" content="0"> 
<title>在线考试系统</title>
<link href="${pageContext.request.contextPath}/login/login.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="login_box">
      <div class="login_l_img">
      	<div class="login">
          <div class="login_logo"><a href="#"></a></div>
          <div class="login_name">
               <p>后台管理登录</p>
          </div>
          <form method="post"  action="${pageContext.request.contextPath}/AdminServlet?op=yz">
              <input name="userName" type="text"  placeholder="用户名" >
             <input name="userpwd" type="password" id="password"  placeholder="密码" />
              <input value="登录" style="width:100%;" type="submit" name="admin">
          </form>
      </div>
      	
      </div>
      <div class="login">
          <div class="login_logo"><a href="#"><img src="${pageContext.request.contextPath}/login/images/login_logo.png" /></a></div>
          <div class="login_name">
               <p>学生考试</p>
          </div>
          <form method="post"  action="${pageContext.request.contextPath}/AdminServlet?op=stuyz">
             <input  type="text"  placeholder="学生学号"  name="stuId" >
             <input  type="password" id="password"  placeholder="密码" name="stuPwd"/>
              <input value="登录" style="width:100%;" type="submit"  id="student">
          </form>
      </div>
     
</div>
<script type="text/javascript">
             $("#student").click(function(){
            	 $.ajax({
            		url:"",
            		datatype:"json",
                	type:"get",
                	async:"false",
                	success:function(data){
                		
                		
                	}
            	 });
            	 
            	 
             });
          
</script>
</body>
</html>