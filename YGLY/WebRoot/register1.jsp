<%@page import="sm_javabean.SQL"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:useBean id="SqlBean" scope="page" class="sm_javabean.SQL"/>
<%@ page language="java" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>学生注册页面</title>

<script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
<link rel="stylesheet" href="style/page.css" />
<link rel="stylesheet" href="style/cpm.css"/>
<link rel="stylesheet" href="style/buttons.css"/>

</head>


<body>
	<div class="companyhead">
		<div class="companyhead1">
			<span class="plogo"><a href="company.jsp" class="logobutton" id="logo"></a></span>
			<span class="ptitle"><label for="logo" class="pname">创新创业服务交易对接平台</label></span>
		</div>
	</div>
	<div class="companycontainer" style="background-color: white;">
		<div class="line1">
			<p style="font-size:25px;margin-left:-30px">注册学生账号</p>
		</div>
		<form action="javascript:void(0)">
			<div class="line2">
				<input type="text" class="inputbox" placeholder="用户账号"/>
			</div>
			<div class="line2">
				<input type="text" class="inputbox" placeholder="用户昵称"/>
			</div>
			<div class="line2">
				<input type="text" class="inputbox" placeholder="账号密码"/>
			</div>
			<div class="line2">
				<input type="text" class="inputbox" placeholder="再次输入密码"/>
			</div>
			<div class="line2">
				<button type="submit" class="registerbutton">注册</button>
			</div>
			<div class="line2">
				<a href="main.jsp" class="to_main">已有账号登陆</a>
			</div>
		</form>
	</div>
</body>
</html>