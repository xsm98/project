<%@page import="com.x.entity.TiEntity"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<title>在线考试系统</title>
<link href="${pageContext.request.contextPath}/OnlineExaminationSystem/main.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/OnlineExaminationSystem/iconfont.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/OnlineExaminationSystem/test.css" rel="stylesheet" type="text/css" />

<style>
.hasBeenAnswer {
	background: #5d9cec;
	color:#fff;
}

</style>
</head>
<body>
<% ArrayList<TiEntity> list=new ArrayList<TiEntity>();
								     list=(ArrayList)request.getAttribute("list");%>
	<div class="main">
		<!--nr start-->
		<div class="test_main">
			<div class="nr_left">
				<div class="test">
					<form action="${pageContext.request.contextPath}/ScoreServlet?count=<%=list.size()%>" method="post">
						<div class="test_title">
							<p class="test_time">
								<i class="icon iconfont">&#xe6fb;</i><b class="alt-1">00:40</b>
							</p>
							<font><input type="submit" name="test_jiaojuan" value="交卷"></font>
						</div>
						
							<div class="test_content">
								<div class="test_content_title">
									<h2>单选题</h2>
									<p>
										<span>共</span><i class="content_lit" id="zxc"><%=list.size() %></i><span>题，</span><span>合计</span><i class="content_fs" id="zongfen"></i><span>分</span>
									</p>
								</div>
							</div>
							<div class="test_content_nr">
								<ul>
								     
								     
								    <% for(int i=0;i<list.size();i++){
								     %>
										<li id="<%=i+1 %>">
											<div class="test_content_nr_tt">
												<i><%=i+1 %></i><span>(2分)</span><font>题目:<%=list.get(i).getTi_stion()%><input name="qusid<%=i+1%>"  value="<%=list.get(i).getQus_id() %>" style="display:none;" ></font><b class="icon iconfont">&#xe881;</b>
											</div>

											<div class="test_content_nr_main">
												<ul>
													
														<li class="option">
															
																<input type="radio" class="radioOrCheck" name="answer1<%=i+1 %>"
																	id="0_answer_<%=i+1 %>_option_1"  value="A"
																/>
															
															
															<label for="0_answer_<%=i+1 %>_option_1">
																A.
																<p class="ue" style="display: inline;"><%=list.get(i).getTi_A() %></p>
															</label>
														</li>
													
														<li class="option">
															
																<input type="radio" class="radioOrCheck" name="answer1<%=i+1 %>"
																	id="0_answer_<%=i+1 %>_option_2"   value="B"
																/>
															
															
															<label for="0_answer_<%=i+1 %>_option_2">
																B.
																<p class="ue" style="display: inline;"><%=list.get(i).getTi_B() %></p>
															</label>
														</li>
													
														<li class="option">
															
																<input type="radio" class="radioOrCheck" name="answer1<%=i+1 %>"
																	id="0_answer_<%=i+1 %>_option_3"   value="C"
																/>
															
															
															<label for="0_answer_<%=i+1 %>_option_3">
																C.
																<p class="ue" style="display: inline;"><%=list.get(i).getTi_C() %></p>
															</label>
														</li>
													
														<li class="option">
															
																<input type="radio" class="radioOrCheck" name="answer1<%=i+1 %>"
																	id="0_answer_<%=i+1 %>_option_4"  value="D"
																/>
															
															
															<label for="0_answer_<%=i+1 %>_option_4">
																D.
																<p class="ue" style="display: inline;"><%=list.get(i).getTi_D() %></p>
															</label>
														</li>
													
												</ul>
											</div>
										</li>
										<%} %>
								</ul>
							</div>
					</form>
				</div>

			</div>
			<div class="nr_right">
				<div class="nr_rt_main">
					<div class="rt_nr1">
						<div class="rt_nr1_title">
							<h1>
								<i class="icon iconfont">&#xe692;</i>答题卡
							</h1>
							<p class="test_time">
								<i class="icon iconfont">&#xe6fb;</i><b class="alt-1">00:40</b>
							</p>
						</div>
						
							<div class="rt_content">
								<div class="rt_content_tt">
									<h2>单选题</h2>
									<p>
										<span>共</span><i class="content_lit" id="sheet"></i><span>题</span>
									</p>
								</div>
								<div class="rt_content_nr answerSheet">
									<ul>
										<!-- 答题卡 -->
										<%for(int j=0;j<list.size();j++){ %>
											<li><a href="#<%=j+1%>"><%=j+1 %></a></li>
										<%} %>
									</ul>
								</div>
							</div>
					</div>

				</div>
			</div>
		</div>
		<!--nr end-->
		<div class="foot"></div>
	</div>

	<script src="${pageContext.request.contextPath}/OnlineExaminationSystem/jquery-1.11.3.min.js"></script>
	<script src="${pageContext.request.contextPath}/OnlineExaminationSystem/jquery.easy-pie-chart.js"></script>
	<!--时间js-->
	<script src="${pageContext.request.contextPath}/OnlineExaminationSystem/time/jquery.countdown.js"></script>
	<script>
		window.jQuery(function($) {
			"use strict";
			
			$('time').countDown({
				with_separators : false
			});
			$('.alt-1').countDown({
				css_class : 'countdown-alt-1'
			});
			$('.alt-2').countDown({
				css_class : 'countdown-alt-2'
			});
			
		});
		
		
		$(function() {
			$('li.option label').click(function() {
			/* debugger; */
				var examId = $(this).closest('.test_content_nr_main').closest('li').attr('id'); // 得到题目ID
				var cardLi = $('a[href=#' + examId + ']'); // 根据题目ID找到对应答题卡
				// 设置已答题
				if(!cardLi.hasClass('hasBeenAnswer')){
					cardLi.addClass('hasBeenAnswer');
				}
				
			});
		});
		
		$(document).ready(function(){
			var zxc=$("#zxc").text();
			var zongfen=zxc*2;
		  $("#zongfen").text(zongfen);
		  $("#sheet").text(zxc);
			
		});
	</script>


</body>
</html>