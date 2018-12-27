<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ include file="head.jsp"%>
<base href="<%=basePath%>">

<title>添加书籍</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
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
	text-align: center;
	padding-top: 70px;
	margin: 0 auto 0;
}

ul { /*设置导航栏的框框*/
	margin: 6px auto; /*框框整体的位置，30px是指离网页的顶部和下部的距离，auto控制的是左右距离为自动调节*/
	width: 600px; /*框框的宽度*/
	height: 350px; /*框框的长度*/
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

.input {
	border-radius: 30px;
	height: 35px;
	border: 1px solid #DBDBDB;
	line-height: 35px;
	width: 150px;
	font-size: 14px;
	outline: none;
	text-align: center;
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

img {
	border-radius: 3px;
	width: 100px;
	heigth: 100px;
}
</style>
<script Language="JavaScript">
function check_input(theForm)
{
  if (theForm.ID.value.length != 6 || theForm.employeeid.value == "")
  {
    alert("图书编号必须为6位且不为空。");
    theForm.ID.focus();
    return (false);
  }  
  if (theForm.Name.value == "")
  {
    alert("请输入图书名称");
    theForm.Name.focus();
    return (false);
  }
  if (theForm.birthday.value == "")
  {
    alert("请输入出版日期。");
    theForm.birthday.focus();
    return (false);
  }
  if (theForm.price.value == "")
  {
    alert("请输入价格。");
    theForm.price.focus();
    return (false);
  }  
}
</script>
</head>

<body>
	<div class="warp">
		<div align="center" id="top">
			<h2>添加图书信息</h2>
		</div>
		<br>
		<form name="form1" method="post" action="addBook_action.jsp"
			onSubmit="return check_input(this) ">
			<table width="400" border="0" align="center" cellpadding="5"
				cellspacing="0">
				<tr>
					<td width="35%" height="30" align="right">图书编号：</td>
					<td align="left"><input name="ID" type="text" id="ID"
						size="10" maxlength="6" class="input"> <span class="font1">
							* </span>
					</td>
				</tr>
				<tr>
					<td height="30" align="right">图书名称：</td>
					<td align="left"><input name="Name" type="text" id="Name"
						size="10" maxlength="10" class="input"> <span
						class="font1"> * </span>
					</td>
				</tr>
				<tr>
					<td height="30" align="right">出生版日期：</td>
					<td align="left"><input name="birthday" type="text"
						id="birthday" size="10" maxlength="10" class="input"> <span
						class="font1"> * </span>
					</td>
				</tr>
				<tr>
					<td height="30" align="right">价格：</td>
					<td align="left"><input name="price" type="text" id="price"
						size="10" maxlength="10" class="input"> <span
						class="font1"> * </span>
					</td>
				</tr>
				<tr>
					<td height="30" align="right">分类：</td>
					<td align="left"><select name="kind" id="kind" class="input">
							<option value="经济">经济</option>
							<option value="哲学">哲学</option>
							<option value="工具">工具</option>
							<option value="文化" selected>文化</option>
							<option value="法律">法律</option>
							<option value="文学">文学</option>
					</select></td>
				</tr>
				<tr>
					<td height="30" align="right">图书状态：</td>
					<td align="left"><select name="status" id="status"
						class="input">
							<option value="在库" selected>在库</option>
							<option value="丢失">丢失</option>
							<option value="借出">借出</option>
							<option value="其他">其他</option>
					</select></td>
				</tr>
				<tr>
					<td height="30" align="right">图书简介：</td>
					<td align="left"><textarea name="resume" cols="30" rows="6"
							id="resume" style="margin: 0px; width: 159px; height: 92px;"></textarea>
					</td>
				</tr>
				<tr>
					<td height="30" colspan="2" align="center"><input
						type="submit" name="button" id="button" value="添加" class="btn">
						<input type="reset" name="button2" id="button2" value="取消"
						class="btn">
					</td>
				</tr>
			</table>
		</form>
		<br>
	</div>
</body>
</html>
