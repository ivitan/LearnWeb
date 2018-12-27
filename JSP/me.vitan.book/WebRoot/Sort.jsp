<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="inquire"%>
<html>
<head>
<%@ include file="head.jsp"%>
<title>Query.jsp</title>
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

table {
	width: 800px;
	font-family: verdana, arial, sans-serif;
	font-size: 11px;
	color: #333333;
	border-width: 1px;
	border-color: #999999;
	border-collapse: collapse;
}

table th {
	background-color: #c3dde0;
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #a9c6c9;
}

table tr {
	background-color: #d4e3e5;
}

table tr:hover {
	background-color: #ff32;
}

table td {
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #a9c6c9;
}

.waper {
	text-align: center;
	margin: 30px auto;
	width: 400px;
	padding: 30px 50px;
	background: #FFFFFF;
	overflow: hidden;
	font-size: 14px;
	font-family: '微软雅黑', '文泉驿正黑', '黑体';
}

img {
	border-radius: 3px;
	width: 300px;
	heigth: 300px;
}
</style>
</head>

<body>
	<div class="waper">
		<img src="img/book1.png" align="center"> <br><br>
		<FORM action="" method=post name=form>
			排序记录：<INPUT type="radio" name="orderType" value="price">按价格排序
			<INPUT type="radio" name="orderType" value="birthday" checked="true">出版产日期排序
			<Input type=submit name="g" value="提交" class="btn">
		</Form>
		<%
			String orderType = request.getParameter("orderType");
			if (orderType == null)
				orderType = "";
		%>
		<inquire:SortTag orderType="<%=orderType %>" />
		<%=orderType%>
		<BR> <br>
		<%=orderResult%>
		<%-- orderResult是Tag文件返回的对象 --%>
	</div>
</body>
</html>
