<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
 <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <link href="${pageContext.request.contextPath}/HT/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/HT/css/font-awesome.css"  rel="stylesheet">
    <link href="${pageContext.request.contextPath}/HT/css/animate.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/HT/css/master.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/HT/css/style.min_EDT.css" rel="stylesheet">
    <title>在线考试系统后台</title>
</head>
<body class="fixed-sidebar full-height-layout gray-bg">
    <div id="wrapper">
        <!--左侧导航开始-->
        <nav class="navbar-default navbar-static-side" role="navigation">
            <div class="nav-close"><i class="fa fa-times-circle"></i></div>
            <div class="sidebar-collapse">
                <ul class="nav nav_L" id="side-menu">
                    <li class="nav-header">
                        <div class="profile-element">
                            <div class="index_logo"></div>
                            <div class="logo-element">在线考试系统</div>
                        </div>
                        <div class="logo-element">H+</div>
                    </li>
                    <li>
                        <a href="#">
                            <i class="fa fa-home"></i>
                            <span class="nav-label">主页</span>
                        </a>
                    </li>
                    <li>
                        <a class="J_menuItem" href="">
                            <i class="fa fa-sitemap"></i>
                            <span class="nav-label">学生信息管理</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a class="J_menuItem" href="${pageContext.request.contextPath}/StudentServlet?op=select&pageNo=1">学生管理</a>
                            </li>
                            <li>
                                <%-- <a class="J_menuItem" href="${pageContext.request.contextPath}/HT/StoreRevenueRecord.html">学生考试成绩列表</a> --%>
                            </li>
                        </ul>
                    </li>
                   
                    <li>
                        <a href="">
                            <i class="fa fa-flag"></i>
                            <span class="nav-label">班级管理</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                            <li><a class="J_menuItem" href="${pageContext.request.contextPath}/ClassServlet?op=class">班级信息</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">
                            <i class="fa fa-pie-chart"></i>
                            <span class="nav-label">出题管理</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                            <li> <a class="J_menuItem" href="${pageContext.request.contextPath}/Subject?op=select" >添加科目类型</a></li>
                            <li><a class="J_menuItem" href="${pageContext.request.contextPath}/QuestionServlet?op=select&pageNo=1">题目录入</a></li>
                        </ul>
                    </li>
              
                    <li>
                        <a href="#">
                            <i class="fa fa-indent"></i>
                            <span class="nav-label">试卷管理</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                            <li><a class="J_menuItem" href="${pageContext.request.contextPath}/HT/GeneratingTestPaper.jsp">生成试卷</a></li>
                           <%--  <li><a class="J_menuItem" href="${pageContext.request.contextPath}/HT/TemplateSetting.html">试卷题目及答案</a></li> --%>
                        </ul>
                    </li>
                    <li>
                        <a href="#">
                            <i class="fa fa-gear"></i>
                            <span class="nav-label">管理员</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                            <li><a class="J_menuItem" href="${pageContext.request.contextPath}/AdminServlet?op=select">账号设置</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </nav>
        <!--左侧导航结束-->
        <!--右侧部分开始-->
        <div id="page-wrapper" class="gray-bg dashbard-1">
            <div class="row border-bottom">
                <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                    <div class="navbar-header">
                        <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#">
                            <i class="fa fa-bars"></i> 
                        </a>
                    </div>
                    <ul class="nav nav_r navbar-top-links navbar-right">
                        <li>
                            <div class="versionBar">网页版</div>
                        </li>
                        <li class="">
                            <a data-toggle="dropdown" class="dropdown-toggle" href="javascript:;" aria-expanded="false">
                                <i class="fa fa-user"></i>
                             信息管理后台<b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu animated fadeInRight m-t-xs">
                                <li>
                                    <a href="javascript:;" onclick="CustShift('/Account/CustShift')">交班</a>
                                </li>
                                <li>
                                    <a class="J_menuItem" href="#">修改资料</a>
                                </li>
                                <li>
                                    <a class="J_menuItem" href="#">修改密码</a>
                                </li>
                                <li class="dropdown-submenu toLeft">
                                    <a data-toggle="dropdown" class="dropdown-toggle" href="javascript:;">
                                        帮助
                                    </a>
                                    <ul class="dropdown-menu  animated  fadeInRight m-t-xs">
                                        <li>
                                            <a target="_blank" onclick="window.open('http://help.51autoshop.com/','_blank');return false;" href="#">在线帮助</a>
                                        </li>
                                        <li>
                                            <a target="_blank" onclick="window.open('https://mp.weixin.qq.com/s/ZSo0Pm10oz_LFc5ZFrh0sQ','_blank');return false;" href="#">掌上车店通操作视频</a>
                                        </li>
                                        <li>
                                            <a target="_blank" onclick="window.open('https://mp.weixin.qq.com/s/yMBIAFhBAi-aEOAQm2szLg','_blank');return false;" href="#">车店通ERP操作视频</a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="login/demo.jsp"><i class="fa fa fa-sign-out"></i>退出</a>
                        </li>
                    </ul>
                </nav>
            </div>
            <div class="row content-tabs">
                <button class="roll-nav roll-left J_tabLeft"><i class="fa fa-angle-double-left"></i>
                </button>
                <nav class="page-tabs J_menuTabs">
                    <div class="page-tabs-content">
                        <a href="javascript:;" class="active J_menuTab" >首页</a>
                    </div>
                </nav>
                <button class="roll-nav roll-right J_tabRight"><i class="fa fa-angle-double-right"></i></button>
                <div class="btn-group roll-nav roll-right">
                    <button data-toggle="dropdown" class="dropdown J_tabClose" aria-expanded="false">
                        操作<span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu dropdown-menu-right" role="menu">
                        <li class="J_tabShowActive">
                            <a>定位当前选项卡</a>
                        </li>
                        <li class="divider"></li>
                        <li class="J_tabCloseAll">
                            <a>关闭全部选项卡</a>
                        </li>
                        <li class="J_tabCloseOther">
                            <a>关闭其他选项卡</a>
                        </li>
                    </ul>
                </div>
                <a class="roll-nav roll-right J_tabExit" href="javascript:;"><i class="fa fa fa-refresh"></i></a>
            </div>
            <div class="row J_mainContent" id="content-main">
                <iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="${pageContext.request.contextPath}/login/images/login-img.png" frameborder="0" data-id="" seamless> </iframe>
            </div>
            <div class="footer">
                <div class="pull-right">
                   在线考试系统
                </div>
            </div>
        </div>
        <!--右侧部分结束-->
    </div>
    <!-- 全局js -->
    <script src="${pageContext.request.contextPath}/HT/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/HT/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/HT/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="${pageContext.request.contextPath}/HT/js/plugins/slimscroll/jquery.slimscroll.min.js"></script> 
    <script src="${pageContext.request.contextPath}/HT/js/plugins/layer/layer.min.js"></script>
    <!-- 自定义js -->
    <script src="${pageContext.request.contextPath}/HT/js/hplus.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/HT/js/contabs.min.js"></script>
    <!-- 第三方插件 -->
    <script src="${pageContext.request.contextPath}/HT/js/plugins/pace/pace.min.js"></script>
    <script type="text/javascript">
    </script>
</body>
</html>