<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="me.vitan.bean.LoginBean"%>
<jsp:useBean id="login" class="me.vitan.bean.LoginBean" />
<jsp:setProperty property="*" name="login" />
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>登录成功</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<link href="css/css1.css" rel="stylesheet" type="text/css">
<style type="text/css">
.head {
	border-radius: 3px;
	left: 0;
	top: 0;
	width: 100%;
	color: #fff;
	height: 60px;
	font-family: 'Microsoft YaHei';
	background: #3f51b5;
}

.waper {
	padding-top: 30px;
	margin: 0 auto 0;
}

ul { /*设置导航栏的框框*/
	margin: 6px auto; /*框框整体的位置，30px是指离网页的顶部和下部的距离，auto控制的是左右距离为自动调节*/
	width: 600px; /*框框的宽度*/
	height: 20px; /*框框的长度*/
	padding: 0px; /*将框框的padding设置为零，不然会导致框框里的内容与框边缘有间隔*/
	border-radius: 5px;
}

li {
	list-style-type: none; /* 去掉li前的点 */
	float: left; /*将li设置成做浮动，变为联动*/
}

a {
	display: block; /*将a变成块状*/
	width: 100px; /*设置块的宽度*/
	height: 50px; /*设置块的长度*/
	font-family: Microsoft Yahei;
	line-height: 50px; /*设置字体在块中的高度*/
	background-color: #3f51b5;
	margin: 0px 0px; /*块里的高宽通过margin设置*/
	color: #fff;
	text-align: center; /*字体居中*/
	text-decoration: none; /*去掉下划线*/
	font-size: 15px;
}

a:hover {
	background-color: #0000CC;
}

table {
	border: 1px solid green;
	box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0
		rgba(0, 0, 0, 0.12);
}

td {
	text-align: center;
	font-size: 15px;
	font-family: 'Microsoft YaHei';
	background: #3f51b5;
	line-height: 1.5;
	color: #fff;
}

th {
	background-color: green;
	color: white;
}

img {
	border-radius: 3px;
}
</style>
</head>

<body>
	<%
		int i = login.check();
		//  System.out.print(i);
		if (request.getParameter("checkCode").equalsIgnoreCase(
				(String) session.getAttribute("randCheckCode"))) {
			if (i == 1) {
				session.setAttribute("flag", i);
	%>
	<div class="head">
		<ul>
			<li><a href="QueryBook.jsp">图书管理</a></li>
			<li><a href="addBook.jsp">添加图书</a></li>
			<li><a href="Sort.jsp">排序查询</a></li>
			<li><a href="SearchBook.jsp">图书搜索</a></li>
			<li><a href="deleteBook.jsp">图书删除</a></li>
			<li><a
				href="javascript:if(window.confirm('是否确认退出系统？')){window.location.href='login/loginout.jsp';}">退出系统</a>
			</li>
		</ul>
		<div class="waper" align="center">
			<h3 color="##28292d">
				<font color="##28292d">欢迎</font><font color="#ff0000"><jsp:getProperty
						name="login" property="username" /></font><font color="##28292d">进入图书管理系统</font>
			</h3>
			<br> <img src="img/book.jpg">
		</div>
	</div>
	<%
		} else {
	%>
	<h3>
		<%
			out.print("<script Language='javascript'>window.alert('登录失败！')</script>");
					out.print("<script Language='javascript'>window.location='login/login.jsp'</script>");
				}
			} else {
				out.print("<script Lanuage='JavaScript'>window.alert('您输入的验证码不正确！即将返回登录页面')</script>");
				out.print("<script Lanuage='JavaScript'>window.location ='login/login.jsp'</script>");
			}
		%>
	</h3>

</body>
</html>
