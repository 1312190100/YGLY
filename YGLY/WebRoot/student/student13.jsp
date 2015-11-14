<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>平台学生方</title>

<script type="text/javascript" src="../js/jquery-2.1.1.min.js"></script>
<link rel="stylesheet" href="../style/page.css" />
<link rel="stylesheet" href="../style/cpm.css"/>

<script type="text/javascript">
$(document).ready(function(){
	$(".link").hover(function(){
		$(this).css("color","orange");
	},function(){
		$(this).css("color","black");
	});
	$("#dv1").hover(function(){
		$(this).css("color","orange");
		$(this).css({cursor:"url(),pointer"});
	},function(){
		$(this).css("color","black");
		$(this).css({cursor:"url(),auto"});
	});
	$("#dv1").click(function(){
		$("#list").slideToggle("slow");
	});
	$(".hiddenpanel").css("display","block");
	$("#dv13").css("background-color","#CCCCCC");
});
</script>
</head>

<body>
	<div class="companyhead">
		<div class="companyhead1">
			<a href="company.jsp" class="to-welcome">创新创业服务交易对接平台</a>
		</div>
		<div class="companyhead2">
			<a href="../main.jsp" class="log-out">退出</a>
		</div>
	</div>
	<div class="companycontainer">
		<div class="companymenu">
			<div class="companyhref" id="dv1">
				项目管理
			</div>
			<div class="hiddenpanel" id="list">
				<div class="hidden" id="dv11"><a href="student11.jsp" id="h11" class="link">全部项目</a></div>
				<div class="hidden" id="dv12"><a href="student12.jsp" id="h12" class="link">我的项目</a></div>
				<div class="hidden" id="dv13"><a href="student13.jsp" id="h13" class="link">消息通知</a></div>
			</div>
			<div class="companyhref" id="dv2">
				<a href="student2.jsp" id="h2" class="link">项目推荐</a>
			</div>
			<div class="companyhref" id="dv3">
				<a href="student3.jsp" id="h3" class="link">垃圾箱</a>
			</div>
			<div class="companyhref" id="dv4">
				<a href="student4.jsp" id="h4" class="link">账号管理</a>
			</div>
			
			<div class="companyhref" id="dv5">
				<a href="admin1.jsp" id="h5" class="link">标签管理</a>
			</div>
		</div>
	</div>
</body>
</html>
