<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<HTML>
<HEAD><%@ include file="head.jsp"%>
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
<BODY>
	<font size=2>
		<div class="waper" align="center">
			<h2>
				选择某类图书显示这类图书
			</h2>
			<%
				try {
					Class.forName("com.mysql.jdbc.Driver");
				} catch (Exception e) {
				}
				String uri = "jdbc:mysql://127.0.0.1/books?"
						+ "user=root&password=&characterEncoding=gb2312";
				Connection con;
				Statement sql;
				ResultSet rs;
				try {
					con = DriverManager.getConnection(uri);
					sql = con.createStatement();
					//读取mobileClassify表，获得分类：  
					rs = sql.executeQuery("SELECT * FROM classify");
					out.print("<form action='queryServlet' method ='post'>");
					out.print("<select name='fenleiNumber'>");
					while (rs.next()) {
						int id = rs.getInt(1);
						String Category = rs.getString(2);
						out.print("<option value =" + id + ">" + Category
								+ "</option>");
					}
					out.print("</select>");
					out.print("<input type ='submit' value ='提交'>");
					out.print("</form>");
					con.close();
				} catch (SQLException e) {
					out.print(e);
				}
			%>
		</div> </font>
</BODY>
</HTML>
