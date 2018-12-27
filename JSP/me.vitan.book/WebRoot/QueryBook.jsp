<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="inc/check.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<%@ include file="head.jsp"%>
<base href="<%=basePath%>">

<title>查询图书案信息</title>

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
	padding-top: 30px;
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

.head a {
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

.head a:hover {
	background-color: #0000CC;
}
table{
	font-family: verdana,arial,sans-serif;
	font-size:11px;
	color:#333333;
	border-width: 1px;
	border-color: #999999;
	border-collapse: collapse;
}
table th {
	background-color:#c3dde0;
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #a9c6c9;
}
table tr {
	background-color:#d4e3e5;
}
table tr:hover {
	background-color:#ff32;
}
table td {
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #a9c6c9;
}
.input {
	border-radius: 30px;
	height: 25px;
	border: 1px solid #DBDBDB;
	line-height: 35px;
	width: 50px;
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
	width: 70px;
	height: 25px;
	border-radius: 25px;
	background: #3f51b5;
	justify-content: center;
	align-items: center;
	padding: 0 25px;
	transition: all 0.4s;
}
.btn:hover {
	background-color: #333333;
	cursor: pointer;
}
.page{
	padding:20px;
}
.link_class {
  width: 50px;
  height: 30px;
  color: #fff;
  text-align: center;
  display: block;
  border-radius: 3px;
  background: #3f51b5;
  text-decoration: none;
  line-height: 30px;
  }
</style>
</head>

<body>
	<% 
	Connection conn=null;
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		String url="jdbc:mysql://localhost:3306/books";
		String strUser="root";
		String strPassword="";
		conn=DriverManager.getConnection(url,strUser,strPassword);
//out.println("<h2>本地协议纯Java 驱动程序连接MySQL数据库成功!</h2>");
   	Statement stm=conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
	String sql="SELECT ID,Name,birthday,price,kind,status,resume from book";
	ResultSet rs=stm.executeQuery(sql);
%>
	<div class="waper" align="center">
		<h2>图书的基本信息</h2>
	</div>
	<table width="680" border="1" align="center" cellpadding="0"
		cellspacing="0">
		<tr bgcolor="#CCCCCC">
			<th width="15%" height="40" align="center" valign="middle">图书编号</th>
			<th width="15%" align="center" valign="middle">图书名称</th>
			<th width="15%" align="center" valign="middle">出版日期</th>
			<th width="15%" align="center" valign="middle">价格</th>
			<th width="15%" align="center" valign="middle">分类</th>
			<th width="15%" align="center" valign="middle">图书状态</th>
			<th align="center" valign="middle">图书简介</th>
			<th width="15%" align="center" valign="middle">管理</th>
		</tr>

		<% 
		int p;//当前页
		int pagecount=5;//每页显示的记录数
		int rowcount;//总记录数
		int p2=1;//分段记录数
		int intpagecount;//总页数
		String page1=request.getParameter("page");
		if(page1==null||page1==""){//第一次访问页面时
		p=1;
		}
		else{//不是第一次访问页面时
		p=Integer.parseInt(page1);
		}
		rs.last();//游标移动到最后一行
		rowcount=rs.getRow();//获得游标所指向的行号，得到总记录数
		intpagecount=(rowcount%pagecount==0)?(rowcount/pagecount):(rowcount/pagecount+1);//得到总页数
		if(p<1)
		p=1;
		if(p>intpagecount)
		p=intpagecount;
		rs.beforeFirst();//游标移动到初始状态
		while(rs.next()) {
		if(p2>(p-1)*pagecount&&p2<=p*pagecount){
		%>
		<tr>
			<td height="30" align="center" valign="middle"><%=rs.getString("ID") %></td>
			<td align="center" valign="middle"><%=rs.getString("Name") %></td>
			<td align="center" valign="middle"><%=rs.getString("birthday") %></td>
			<td align="center" valign="middle"><%=rs.getString("price") %></td>
			<td align="center" valign="middle"><%=rs.getString("kind") %></td>
			<td align="center" valign="middle"><%=rs.getString("status") %></td>
			<td align="center" valign="middle"><%=rs.getString("resume") %></td>
			<!--  <td align="center" valign="middle"><a href="deleteBook.jsp?id=<%=rs.getString("ID") %>" class="link_class">删除</a></td> -->
			<td align="center" valign="middle"><a
				href="javascript:if(window.confirm('是否确认删除？')){window.location.href='deleteBook.jsp?id=<%=rs.getString("ID") %>';}" class="link_class">删除</a>
				<br>
			<a href="addBook.jsp" class="link_class">添加</a> <br>
			<a href="modebook.jsp?id=<%=rs.getString("id") %>" class="link_class">修改</a></td>
		</tr>
		<% }
		++p2;
		}
		 %>
	</table>
	<div align="center" class="page">
		<form action="QueryBook.jsp" method="post">
		第<%=p %>页 共<%=intpagecount %>页
		<%
      if(p>1){
       %>
			<a href="QueryBook.jsp?page=1">第一页</a> <a href="QueryBook.jsp?page=<%=p-1 %>">上一页</a>
			<%} %>
			<%if(p<intpagecount) {%>
			<a href="QueryBook.jsp?page=<%=p+1 %>">下一页</a> <a
				href="QueryBook.jsp?page=<%=intpagecount %>">最后一页</a>
			<%} %>转到第<input name="page" type="text" id="page" class="input">页 <input
				type="submit" value="GO" class="btn">
		</form>
	</div>
	<% 
  rs.close();
  stm.close();
  conn.close();
}catch(ClassNotFoundException e)
	{
		out.println(e.getMessage());
	}
	catch(SQLException e)
	{
		out.println(e.getMessage());
	}
	finally
	{
		try
		{
			if (conn!=null)
				conn.close();}
		catch(Exception e){}
	}
 %>
</body>
</html>
