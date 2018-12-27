<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="me.vitan.bean.*"%>
<jsp:useBean id="userBean" class="me.vitan.bean.Register" scope="request" />
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

<title>注册</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<style type="text/css">
table {
	width: 310px;
}

td {
	padding: 10px;
	color: #444;
	text-align: left;
}

.regster.fk{
    text-align: center;
    vertical-align: middle;
    margin: 50px;
    overflow: auto;
    border-radius: 5px;
    width: 1080px;
    height: auto;
    background: #fff;
    margin-top: 115px;
    margin-right: 150px;
    font-family: 'Microsoft YaHei';
    float: right;
    box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
}

.btn {
	font-size: 12px;
	font-family: 'Microsoft YaHei';
	line-height: 1.5;
	color: #fff;
	text-transform: uppercase;
	width: 100px;
	height: 35px;
	border-radius: 25px;
	background: #3f51b5;
	justify-content: center;
	align-items: center;
	padding: 0 25px;
	-webkit-transition: all 0.4s;
	-o-transition: all 0.4s;
	-moz-transition: all 0.4s;
	transition: all 0.4s;
}

.btn:hover {
	background-color: #333333;
	cursor: pointer;
}

.txtbox {
	border-radius: 30px;
    height: 35px;
    border: 1px solid #DBDBDB;
    line-height: 35px;
    width: 250px;
    font-size: 14px;
    outline: none;
    text-align: center;
}
img {
	border-radius: 3px;
	width: 200px;
}
</style>
</head>

<body>

	<div align="center" class="rgister">
	<img src="img/book3.jpg" align="center"> <br><br>
		<FORM action="helpRegister" method="post" name=form>
			<table>
			*注释项必须填
				<tr>
					<td>*用户名称:</td><td><Input type=text name="userName" class="txtbox">
					</td>
				</tr>
				<tr>
					<td>*用户密码:</td><td><Input type=password name="Password" class="txtbox">
					</td>
				</tr>
				<tr>
					<td>*重复密码:</td><td><Input type=password name="again_password"
						class="txtbox"></td>
				</tr>
				<tr>
					<td>  用户邮箱:</td><td><Input type=text name="email" class="txtbox">
					</td>
				</tr>
				<tr>
					<td><Input type=submit name="g" value="确定" class="btn">
					<td><a href="login/login.jsp">返回登陆</a></td>
					</td>
				</tr>
			</table>
		</Form>
	</div>
	<div align="center" class="fk">
		<p>
			注册反馈： <font color="red"> <jsp:getProperty name="userBean"
					property="backNews" /> </font>
		</p>
		<%
			if (!(userBean.getUserName() == null || userBean.getUserName() == "")) {
		%>
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
		<%
			}
		%>
	</div>
</body>
</html>
