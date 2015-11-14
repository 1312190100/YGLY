<%@page import="sm_javabean.SQL"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:useBean id="SqlBean" scope="page" class="sm_javabean.SQL"/>
<%@ page language="java" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>平台企业方</title>

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
	$("#dv14").css("background-color","#CCCCCC");
});
</script>
</head>


<body>
<%
	if(request.getParameter("name")!=null){
		String name = request.getParameter("name");
		name = new String(name.getBytes("ISO8859_1"),"utf-8");
		String content = request.getParameter("content");
		content = new String(content.getBytes("ISO8859_1"),"utf-8");
		String tel = request.getParameter("tel");
		tel = new String(tel.getBytes("ISO8859_1"),"utf-8");
		int comid = Integer.parseInt(request.getParameter("comid"));
		
		SqlBean.OpenConn();
		String sql = "INSERT INTO `sm`.`pro` (`name`, `comId`, `state`, `content`, `tel`) VALUES ('"+name+"', '"+comid+"', '0', '"+content+"', '"+tel+"')";
		SqlBean.executeUpdata(sql);
		
		//SmartUpload su = new SmartUpload();
		//su.initialize(pageContext);
		//su.setMaxFileSize(100000);
		//su.setTotalMaxFileSize(200000);
		//su.upload();
		//int count = su.save("/upload");
		//for(int i=0;i<su.getFiles().getCount();i++){
		//	com.jspsmart.upload.File file=su.getFiles().getFile(i);
		//	if(file.isMissing())	continue;
		//}
	}
%>
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
				企业项目
			</div>
			<div class="hiddenpanel" id="list">
				<div class="hidden" id="dv11"><a href="company11.jsp" id="h11" class="link">全部项目</a></div>
				<div class="hidden" id="dv12"><a href="company12.jsp" id="h12" class="link">进行中的项目</a></div>
				<div class="hidden" id="dv13"><a href="company13.jsp" id="h13" class="link">结束的项目</a></div>
				<div class="hidden" id="dv14"><a href="company14.jsp" id="h14" class="link">发布新项目</a></div>
			</div>
			<div class="companyhref" id="dv2">
				<a href="company2.jsp" id="h2" class="link">学生推荐</a>
			</div>
			<div class="companyhref" id="dv3">
				<a href="company3.jsp" id="h3" class="link">垃圾箱</a>
			</div>
			<div class="companyhref" id="dv4">
				<a href="company4.jsp" id="h4" class="link">账号管理</a>
			</div>
		</div>
		<div class="menu1">
			<form action="company14.jsp" method="post">
				<div class="releaserow">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;项目名称：
					<input type="text" name="name" class="releasetitle"/>
				</div>
				<div class="releaserow1">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;项目内容：
					<textarea name="content" class="releasecontent">
					</textarea>
				</div>
				<div class="releaserow">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;联系方式：
					<input type="text" name="tel" class="releasetitle"/>
				</div>
				<div class="releaserow">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;项目附件：
					<input type="file" name="file" class="a"/>
				</div>
				<div class="releaserow">
					<button type="submit" class="confirmbutton"/>发布项目</button>
				</div>
				<input type="hidden" name="comid" value=<%out.println(session.getAttribute("user"));%>/>
			</form>
		</div>
	</div>
</body>
</html>