<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'userRegisterJQuery.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript" src="js/jquery-2.1.0.js"></script>
<script>
		function checkuser(){
		    var un=$("#username").val();
		 	$.ajax({ 
				type:"post",
				url:"checkUserJQueryServlet",
				data:"username="+un,
				success:function(data){
					$('#hint').html(data);
				} 
			});
		}
	</script>
</head>

<body>
<form>
	<div style="width:1000px;margin:0 auto;background:white;">
		<table width="800px">
			<tr height="60px">
				<td colspan=2><font size=6em color=red><strong>网上商城用户注册</strong>
				</font>
				</td>
			</tr>
			<tr height="5px">
				<td colspan=2><hr />
				</td>
			</tr>
			<tr>
				<td width="40%" height="260px">
				</td>
				<td width="60%" height="260px">
					<table border=0>
						<tr height='40px'>
							<td width="25%"><font size=3>用户名：</font>
							</td>
							<td width="45%" align="left">
							<input type="text" id="username" name="username" value="" style="width:200px;align:left;" onkeyup="checkuser();" />
							</td>
							<td width="30%"><div id="hint" style="color:red;"></div>
							</td>
						</tr>
						<tr height='40px'>
							<td width="25%"><font size=3>密&nbsp;&nbsp;码：</font>
							</td>
							<td width="45%" align="left"><input type="password"
								name="userpassword" value="" style="width:200px;align:left;" />
							</td>
							<td width="30%"></td>
						</tr>
						<tr>
							<td width="25%"></td>
							<td width="45%" align="left"><input type="button" value="注册"
								class="buttontype" onclick="checkuser()" />
							</td>
							<td width="30%"><div id="resstate"></div>
							</td>
						</tr>
					</table></td>
			</tr>
			<tr height="5px">
				<td colspan=2><hr />
				</td>
			</tr>
		</table>
	</div>
    </form>
</body>
</html>
