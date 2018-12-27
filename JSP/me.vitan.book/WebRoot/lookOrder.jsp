<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:useBean id="loginBean" class="me.vitan.bean.logins" scope="session" />
<%@ page import="java.sql.*"%>
<HTML>
<HTML>
<HEAD><%@ include file="header2.jsp"%>
<style type="text/css">
.head {
	height: 25px;
	width: auto;
}

.waper {
	padding-top: 70px;
	margin: 0 auto 0;
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
<div class="waper" align="center">
	<%
		if (loginBean == null) {
			response.sendRedirect("login.jsp");//重定向到登录页面
		} else {
			boolean b = loginBean.getUsername() == null
					|| loginBean.getUsername().length() == 0;
			if (b)
				response.sendRedirect("login.jsp");//重定向到登录页面
		}
		Connection con;
		Statement sql;
		ResultSet rs;
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (Exception e) {
		}
		try {
			String uri = "jdbc:mysql://127.0.0.1/books";
			String user = "root";
			String password = "";
			con = DriverManager.getConnection(uri, user, password);
			sql = con.createStatement();
			String cdn = "SELECT ID,Name,sum FROM orderform where Username= '"
					+ loginBean.getUsername() + "'";
			rs = sql.executeQuery(cdn);
			out.print("<table border=2>");
			out.print("<tr>");
			out.print("<th width=100>" + "订单号");
			out.print("<th width=100>" + "信息");
			out.print("<th width=100>" + "价格");
			out.print("</TR>");
			while (rs.next()) {
				out.print("<tr>");
				out.print("<td >" + rs.getString(1) + "</td>");
				out.print("<td >" + rs.getString(2) + "</td>");
				out.print("<td >" + rs.getString(3) + "</td>");
				out.print("</tr>");
			}
			out.print("</table>");
			con.close();
		} catch (SQLException e) {
			out.print(e);
		}
	%>
</div>
</body>
</html>
