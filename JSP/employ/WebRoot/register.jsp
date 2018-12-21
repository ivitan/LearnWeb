<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="mybean.*"%>
<jsp:useBean id="userBean" class="mybean.Register" scope="request" />
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

<title>My JSP 'register.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body>
	<div align="center">
		<FORM action="helpRegister" method="post" name=form>
			<table>
				用户名由字母、数字、下划线构成，*注释的项必须填写。
				<tr>
					<td>*用户名称:</td>
					<td><Input type=text name="userName">
					</td>
					<td>*用户密码:</td>
					<td><Input type=password name="Password"></td>
				</tr>
				<tr>
					<td>*重复密码:</td>
					<td><Input type=password name="again_password">
					</td>
					<td>email:</td>
					<td><Input type=text name="email">
					</td>
				</tr>
				<tr>
					<td><Input type=submit name="g" value="提交">
					</td>
				</tr>
			</table>
		</Form>
	</div>
	<div align="center">
		<p>
			注册反馈：
			<font color="red">
			<jsp:getProperty name="userBean" property="backNews" />
			</font>
			</p>
			<%if(!(userBean.getUserName()==null||userBean.getUserName()=="")) {%>
		<table border=3>
			<tr>
				<td>会员名称:</td>
				<td><jsp:getProperty name="userBean" property="userName" /></td>
			</tr>
			<tr>
				<td>email地址:</td>
				<td><jsp:getProperty name="userBean" property="email" /></td>
			</tr>
		</table>
		<%} %>
	</div>
</body>
</html>
