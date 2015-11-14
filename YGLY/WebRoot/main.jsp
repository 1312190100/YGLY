 <jsp:useBean id="SqlBean" scope="page" class="sm_javabean.SQL"/>
<%@ page language="java" import="java.sql.*"%>
 <% 
 	if(request.getParameter("user")!=null){
 		String user = request.getParameter("user");
 		String pwd = request.getParameter("pwd");
 		int type = Integer.parseInt(request.getParameter("type"));
 		
 		SqlBean.OpenConn();
 		String sql = "";
 		if(type == 0)	sql = "select * from stu where user='"+user+"'and pwd='"+pwd+"'";
 		if(type == 1)	sql = "select * from com where user='"+user+"'and pwd='"+pwd+"'";
		ResultSet rs = SqlBean.executeQuery(sql);
		if(rs.next()){
			session.setAttribute("user", rs.getInt("Id"));
			session.setAttribute("flag", type);
			if(type == 0){
				response.setStatus(HttpServletResponse.SC_MOVED_PERMANENTLY);
				response.setHeader("Location","student/student.jsp");
			}else if(type == 1){
				response.setStatus(HttpServletResponse.SC_MOVED_PERMANENTLY);
				response.setHeader("Location","company/company.jsp");
			}
		}
 	}
 %>
 <%@ page language="java" import="java.util.*" contentType="text/html;charset=gb2312"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>首页</title>

<script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
<link rel="stylesheet" href="style/page.css" />
<link rel="stylesheet" href="style/placeholder.css" />
<script type="text/javascript" src="js/main.js"></script>
</head>

<body>
	<div class="pagehead">
		<span class="pagehead1">创新创业服务交易对接平台</span>
	</div>
	
	<div class="block1">
		<div class="informationblock">
			<p>Welcome to YGLY.</p>
		</div>
		<div class="enterblock">
			<button type="button" id="bt1" class="enterbutton">学生入口</button>
			<button type="button" id="bt2" class="enterbutton">企业入口</button>
		</div>
	</div>

	
	<!--
		学生登录
    -->
	<div class="loginbox1" id="stu">
		<form action="main.jsp" method="post">
			<div class="headrow">
				<p>创新创业服务交易对接平台学生登陆入口</p>
			</div>
			<div class="row">
        	    <input type="text" name="user" id="txtName" placeholder="账号" class="inputBox"/>
       	    	<a href="javascript:void(0)" title="提示" class="warning" id="warn">*</a>
      	 	</div>
        	<div class="row">
            	<input type="password" name="pwd" id="txtPwd" placeholder="密码" class="inputBox"/>
            	<a href="javascript:void(0)" title="提示" class="warning" id="warn2">*</a>
        	</div>
        	<div class="row">
            	<button type="submit" id="bt3" class="loginbutton">登录</button>
        	</div>
			<div class="tailrow">
		  		<span class="deadline" style="text-align:left">
					<input type="checkbox" name="remember" class="rr" >记住我</input>
				</span>
			    <span class="deadline">
					<a href="javascript:void(0)" class="link">密码找回</a>
				</span>
				<span class="deadline" style="text-align:right">
					<a href="register1.jsp" class="link">申请新用户</a>
				</span>
			</div>
			<div class="row" style="margin-top:150px;">
				<button type="button" id="bt5" class="close" style="width:120px;margin-top:-5px;">取消</button>
			</div>
			<input type="hidden" name="type" value="0"/>
		</form>
	</div>
	
	<!--
		企业登录
    -->
	<div class="loginbox1" id="com">
		<form action="main.jsp" method="post">
			<div class="headrow">
				<p>创新创业服务交易对接平台企业登陆入口</p>
			</div>
			<div class="row">
        	    <input type="text" name="user" id="txtName1" placeholder="账号" class="inputBox"/>
       	    	<a href="javascript:void(0)" title="提示" class="warning" id="warn">*</a>
      	 	</div>
        	<div class="row">
            	<input type="password" name="pwd" id="txtPwd1" placeholder="密码" class="inputBox"/>
            	<a href="javascript:void(0)" title="提示" class="warning" id="warn2">*</a>
        	</div>
        	<div class="row">
            	<button type="submit" id="bt4" class="loginbutton">登录</button>
        	</div>
			<div class="tailrow">
		  		<span class="deadline" style="text-align:left">
					<input type="checkbox" class="rr">记住我</input>
				</span>
			    <span class="deadline">
					<a href="javascript:void(0)" class="link">密码找回</a>
				</span>
				<span class="deadline" style="text-align:right">
					<a href="register2.jsp" class="link">申请企业账号</a>
				</span>
			</div>
			<div class="row" style="margin-top:150px;">
				<button type="button" id="bt6" class="close" style="width:120px;margin-top:-5px;">取消</button>
			</div>
			<input type="hidden" name="type" value="1">
		</form>
	</div>
	
</body>
</html>
