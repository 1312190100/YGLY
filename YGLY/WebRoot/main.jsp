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
<title>��ҳ</title>

<script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
<link rel="stylesheet" href="style/page.css" />
<link rel="stylesheet" href="style/placeholder.css" />
<script type="text/javascript" src="js/main.js"></script>
</head>

<body>
	<div class="pagehead">
		<span class="pagehead1">���´�ҵ�����׶Խ�ƽ̨</span>
	</div>
	
	<div class="block1">
		<div class="informationblock">
			<p>Welcome to YGLY.</p>
		</div>
		<div class="enterblock">
			<button type="button" id="bt1" class="enterbutton">ѧ�����</button>
			<button type="button" id="bt2" class="enterbutton">��ҵ���</button>
		</div>
	</div>

	
	<!--
		ѧ����¼
    -->
	<div class="loginbox1" id="stu">
		<form action="main.jsp" method="post">
			<div class="headrow">
				<p>���´�ҵ�����׶Խ�ƽ̨ѧ����½���</p>
			</div>
			<div class="row">
        	    <input type="text" name="user" id="txtName" placeholder="�˺�" class="inputBox"/>
       	    	<a href="javascript:void(0)" title="��ʾ" class="warning" id="warn">*</a>
      	 	</div>
        	<div class="row">
            	<input type="password" name="pwd" id="txtPwd" placeholder="����" class="inputBox"/>
            	<a href="javascript:void(0)" title="��ʾ" class="warning" id="warn2">*</a>
        	</div>
        	<div class="row">
            	<button type="submit" id="bt3" class="loginbutton">��¼</button>
        	</div>
			<div class="tailrow">
		  		<span class="deadline" style="text-align:left">
					<input type="checkbox" name="remember" class="rr" >��ס��</input>
				</span>
			    <span class="deadline">
					<a href="javascript:void(0)" class="link">�����һ�</a>
				</span>
				<span class="deadline" style="text-align:right">
					<a href="register1.jsp" class="link">�������û�</a>
				</span>
			</div>
			<div class="row" style="margin-top:150px;">
				<button type="button" id="bt5" class="close" style="width:120px;margin-top:-5px;">ȡ��</button>
			</div>
			<input type="hidden" name="type" value="0"/>
		</form>
	</div>
	
	<!--
		��ҵ��¼
    -->
	<div class="loginbox1" id="com">
		<form action="main.jsp" method="post">
			<div class="headrow">
				<p>���´�ҵ�����׶Խ�ƽ̨��ҵ��½���</p>
			</div>
			<div class="row">
        	    <input type="text" name="user" id="txtName1" placeholder="�˺�" class="inputBox"/>
       	    	<a href="javascript:void(0)" title="��ʾ" class="warning" id="warn">*</a>
      	 	</div>
        	<div class="row">
            	<input type="password" name="pwd" id="txtPwd1" placeholder="����" class="inputBox"/>
            	<a href="javascript:void(0)" title="��ʾ" class="warning" id="warn2">*</a>
        	</div>
        	<div class="row">
            	<button type="submit" id="bt4" class="loginbutton">��¼</button>
        	</div>
			<div class="tailrow">
		  		<span class="deadline" style="text-align:left">
					<input type="checkbox" class="rr">��ס��</input>
				</span>
			    <span class="deadline">
					<a href="javascript:void(0)" class="link">�����һ�</a>
				</span>
				<span class="deadline" style="text-align:right">
					<a href="register2.jsp" class="link">������ҵ�˺�</a>
				</span>
			</div>
			<div class="row" style="margin-top:150px;">
				<button type="button" id="bt6" class="close" style="width:120px;margin-top:-5px;">ȡ��</button>
			</div>
			<input type="hidden" name="type" value="1">
		</form>
	</div>
	
</body>
</html>
