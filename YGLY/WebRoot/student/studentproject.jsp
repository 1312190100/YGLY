<%@page import="sm_javabean.SQL"%>
<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="SqlBean" scope="page" class="sm_javabean.SQL"/>
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
});
</script>
</head>

<body>
<% 
	int id;
	if(request.getParameter("stuid")!=null){
		String stuid = request.getParameter("stuid");
		id = Integer.parseInt(request.getParameter("id"));
		SqlBean.OpenConn();
		String sql = "select * from pro where Id ="+id;
		ResultSet rs = SqlBean.executeQuery(sql);
		rs.next();
		String con = rs.getString("stuId");
		if(con == null) con="";
		con = con+stuid+";";
		String sql1 = "UPDATE `sm`.`pro` SET `stuId`='"+con+"' WHERE `Id`='"+id+"'";
		SqlBean.executeUpdata(sql1);
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
		
		<div class="menu1">
			<%
				id = Integer.parseInt(request.getParameter("id"));
				SqlBean.OpenConn();
				String sql = "select * from pro where Id ="+id;
				ResultSet rs = SqlBean.executeQuery(sql);
				rs.next();
			%>
			<div class="releaserow2">
			</div>
			<div class="releaserow2">
				<% out.println("<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;项目名称："+rs.getString("name")+"</b>");%>
			</div>
			<div class="releaserow2">
				<% out.println("<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;项目内容："+rs.getString("content")+"</p>");%>
			</div>
			<div class="releaserow2">
				<% 
					int comid = rs.getInt("comId");
					String sql2 = "select * from com where Id="+comid;
					ResultSet rs2 = SqlBean.executeQuery(sql2);
					rs2.next();
					out.println("<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;发布企业："+rs2.getString("user")+"</p>");
				%>
			</div>
			<div class="releaserow2">
				<% out.println("<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;联系方式："+rs.getString("tel")+"</p>");%>
			</div>
			<div class="releaserow2">
				<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;项目附件：</p>
			</div>
			<div class="releaserow2">
			<%if(rs.getInt("state")==0){ 
				String sid = rs.getString("stuid");
				if(sid==null) sid="";
				int s=0,e,flag=0;
				String userid = session.getAttribute("user").toString();
				for(e=1;e<=sid.length();e++){
					if(sid.substring(e-1, e).equals(";")){
						String number=sid.substring(s, e-1);
						if(number.equals(userid)){
							flag=1;
							break;
						}
					}
				}
				if(flag == 0){
			%>
			<form action="studentproject.jsp" method="post">
				<input type="hidden" name="stuid" value=<%out.println(session.getAttribute("user"));%>/>
				<input type="hidden" name="id" value=<%out.println(id);%>/>
				<button type="submit" class="confirmbutton">报名项目</button>
			</form>
			<%}
				else {
			%>
				<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;已报名</p>
			<%	
				}
			}
			%>
			<%if(rs.getInt("state")==1){ %>
				<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;已截止报名</p>
			<%} %>
			</div>
		</div>
	</div>
</body>
</html>
