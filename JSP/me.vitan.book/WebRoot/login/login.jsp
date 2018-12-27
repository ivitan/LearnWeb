<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:useBean id="loginBean" class="me.vitan.bean.logins" scope="session" />
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

<title>登录</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
table {
	width: 310px;
}

td {
	padding: 10px;
	color: #444;
}

.loginwarrp {
	margin: 120px auto;
	width: 400px;
	padding-top: 10px;
	padding: 0px 50px;
	background: #FFFFFF;
	overflow: hidden;
	font-size: 14px;
	font-family: '微软雅黑', '文泉驿正黑', '黑体';
}

.login_input {
	border-radius: 30px;
	height: 35px;
	border: 1px solid #DBDBDB;
	line-height: 35px;
	width: 250px;
	font-size: 14px;
	outline: none;
	text-align: center;
}

.login {
	width: 100%;
	height: 44px;
	line-height: 44px;
	font-size: 18px;
	text-align: center;
	border-bottom: 1px solid #ddd;
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
</style>
<script language="javascript">
 function check(){
	var username=document.all('username').value;
	var password=document.all('password').value;
	var checkCode=document.all('checkCode').value;
	if(username.length==0)
	{
	alert("用户名不能为空");
	return false;
	}
	else if(password.length==0){
		alert("密码不能为空");
		return false;
		}
		else if(checkCode.length!=4){
		alert("验证码必须为4位");
		return false;
		}
		}

function myReload(){
	document.getElementById("myCheckCode").src=document.getElementById("myCheckCode").src+"?nocache="+new Date().getTime();
 }	
 
 
function login(){ 
if(document.getElementsByName("myradio")[0].checked){
      document.form1.method= "post ";     
      document.form1.action= "<%=basePath%>login/login_action.jsp"; 
      document.form1.submit(); 
      return false; 
      }
if(document.getElementsByName("myradio")[1].checked){
      document.form1.method= "post ";     
      document.form1.action= "loginServlet"; 
      document.form1.submit(); 
      return false; 
	}
} 
</script>
</head>
<body>
	<div align="center" class="loginwarrp">
		<div class="login">
			<h1>登陆</h1>
		</div>
		<form name="form1" method="post"
			action=""
			onSubmit="return check()">
			<table width="400" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td><input name="username" type="text" class="login_input"
						size="15" maxlength="15" placeholder="请输入账号">
					</td>
				</tr>
				<tr>
					<td><input name="password" type="password" class="login_input"
						size="15" maxlength="15" placeholder="请输入密码">
					</td>
				</tr>
				<tr>
					<td height="30" colspan="2" align="center"><img
						src="CheckCode" name="myCheckCode" width="100" height="30"
						border="1" id="myCheckCode" /> <a
						style="cursor:hand; font-size:12px;" onClick="myReload()">&nbsp;看不清?换一个</a>
					</td>
				</tr>
				<tr>
					<td><input name="checkCode" type="text" class="login_input"
						size="4" maxlength="4" placeholder="请输入验证码"></td>
				</tr>
				<tr>
					<td height="30" colspan="2" align="center"><input type="radio"
						name="myradio" value="1" >管理员&nbsp&nbsp<input type="radio"
						name="myradio" value="2" checked="ok" >用户</td>
				</tr>
				<tr>
					<td height="30" colspan="2" align="center"><input
						type="submit" name="button" id="button" value="登录" class="btn"
						onClick="login() "> <input type="reset" name="button2"
						id="button2" value="重置" class="btn">
					</td>
				</tr>
				<tr>
					<td height="30" colspan="2" align="center"><a
						href="${pageContext.request.contextPath}/register.jsp">没有找？注册一个</a>
					</td>
				</tr>
			</table>
		</form>

	</div>
</body>
</html>
