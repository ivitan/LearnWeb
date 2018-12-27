<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<HTML>
<BODY>
<HEAD>
<%@ include file="header2.jsp"%>
<style type="text/css">
.head{
	height:25px;
    width:auto;
}
.waper{
	padding-top:70px;
	margin:0 auto 0;
}
ul { /*设置导航栏的框框*/
	margin: 30px auto; /*框框整体的位置，30px是指离网页的顶部和下部的距离，auto控制的是左右距离为自动调节*/
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
	background-color: #2f6f4f;
}
</style>
</HEAD>
<title>首页</title>
<div class="waper" align="center">
</div>
</BODY>
</HTML>
