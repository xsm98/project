<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="Pragma" content="no-cache"> 
<meta http-equiv="Cache-Control" content="no-cache"> 
<meta http-equiv="Expires" content="0"> 
<title>分数页面</title>
<link href="${pageContext.request.contextPath}/login/login.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="login_box">
      <div class="login_l_img"><img src="${pageContext.request.contextPath}/login/images/login-img.png" /></div>
      <div class="login">
          <div class="login_logo"><a href="#"><img src="${pageContext.request.contextPath}/login/images/login_logo.png" /></a></div>
          <div class="login_name">
               <p>考试结束</p>
          </div>
          <div class="login_name">
          	<p>本试卷共有题目:${count} </p>
          	<p>总分为:${zong}</p>
               <p>你所得分数为:${num}</p>
          </div>
      </div>
</div>
</body>
</html>