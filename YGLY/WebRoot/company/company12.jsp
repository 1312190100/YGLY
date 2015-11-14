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
<link rel="stylesheet" href="../style/buttons.css"/>

<script type="text/javascript">
var pageSize = 11;//每页显示的记录条数
var curPage=0;
var lastPage;
var direct=0;
var len;
var page;
$(document).ready(function(){    
	len =$("table tr").length;
    page=len % pageSize==0 ? len/pageSize : Math.floor(len/pageSize)+1;//根据记录条数，计算页数
    //  alert("page==="+page);
    	curPage=1;
        displayPage(1);//显示第一页
        $("#btn1").click(function(){
        	curPage=1;
        	displayPage();
     	});
        $("#btn2").click(function(){
        	direct=-1;
        	displayPage();
     	});
        $("#btn3").click(function(){
        	direct=1;
        	displayPage();
     	});
        $("#btn4").click(function(){
        	curPage=page;
        	displayPage();
     	});
});
 
function displayPage(){
	if((curPage <=1 && direct==-1) || (curPage >= page && direct==1)){
		direct=0;
		alert("已经是第一页或者最后一页了");
		return;
	}
	lastPage = curPage;
	curPage = (curPage + direct + len) % len;
	var begin=(curPage-1)*pageSize;//起始记录号
	var end = begin + pageSize;
	if(end > len ) end=len;
	$("table tr").hide();
	$("table tr").each(function(i){
		if(i>=begin && i<end)//显示第page页的记录
			$(this).show();
	});

 }
</script>

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
	$("#dv12").css("background-color","#CCCCCC");
	
	$("tr:odd").css("background-color", "white");
    $("tr:even").css("background-color","#EDEDED");
    $("tr").click(function () {
    	$("tr").each(function(){
    		if($(this).hasClass("highlight")){
    			$(this).removeClass("highlight");
    		}});
    	$(this).addClass("highlight");
    });
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
		
		<div id="of" style="height:100%; overflow:auto" class="menu1">
			<table id="list">
				<thead>
					<tr>
						<th width="10%">项目状态</th>
						<th width="45%">项目名称</th>
						<th width="25%">发布企业</th>
						<th width="20%">发布日期</th>
					</tr>
				</thead>
			<%
				SqlBean.OpenConn();
 				String sql = "select * from pro where comId="+session.getAttribute("user");
				ResultSet rs = SqlBean.executeQuery(sql);
				while(rs.next()){
			%>
					<tr>
						<td></td>
						<td>
							<a href="companyproject.jsp?id=<%out.println(rs.getInt("Id"));%>" class="link-to-project"><%out.print(rs.getString("name"));%></a>
						</td>
						
						<td></td>
						
						<td>
						
						</td>
					</tr>
			<% 
				}
			%>
			</table>
			
			<div class="pagemenu">
				<input type=button id="btn1" value="首页" class="button button-pill button-tiny"/>
				<input type=button id="btn2" value="上一页" class="button button-pill button-tiny"/>
				<input type=button id="btn3" value="下一页" class="button button-pill button-tiny"/>
				<input type=button id="btn4" value="尾页" class="button button-pill button-tiny"/>
			</div>
			
		</div>
		
	</div>
</body>
</html>