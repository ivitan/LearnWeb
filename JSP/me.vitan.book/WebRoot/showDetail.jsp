<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="me.vitan.bean.logins"%>
<%@ page import="java.sql.*"%>
<jsp:useBean id="loginBean" class="me.vitan.bean.logins" scope="session" />
<HEAD><%@ include file="head.jsp"%>
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
	background-color:#fff;
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
	-webkit-transition: all 0.4s;
	-o-transition: all 0.4s;
	-moz-transition: all 0.4s;
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
</HEAD>
<HTML>
<Body >
<div class="waper" align="center">
		<%
			String mobileID = request.getParameter("xijie");
			//out.print("<th>图书编号" + mobileID);
			if (mobileID == null) {
				out.print("没有图书编号，无法查看细节");
				return;
			}
			Connection con;
			Statement sql;
			ResultSet rs;
			try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (Exception e) {
			}
			String uri = "jdbc:mysql://127.0.0.1/books";
			try {
				con = DriverManager.getConnection(uri, "root", "");
				sql = con.createStatement();
				String cdn = "SELECT * FROM book where ID = '"
						+ mobileID + "'";
				rs = sql.executeQuery(cdn);
				out.print("<table border=1>");
				out.print("<tr>");
				out.print("<th>图书编号");
				out.print("<th>图书名称");
				out.print("<th>出版时间");
				out.print("<th>价格");
				out.print("<th><font>借阅</font>");
				out.print("</TR>");
				String picture = "welcome.jpg";
				String detailMess = "";
				while (rs.next()) {
					String ID = rs.getString(1);
					String Name = rs.getString(2);
					String birthday = rs.getString(3);
					String price = rs.getString(4);
					detailMess = rs.getString(5);
					picture = rs.getString(6);
					String book = "(" + ID + "," + Name + "," + birthday
							+ "," + price + ")#" + price;//便于购物车计算价格,尾缀上"#价格值"
					book = book.replaceAll("\\p{Blank}", "");
					String button = "<form  action='putBookServlet' method = 'post'>"
							+ "<input type ='hidden' name='java' value= "
							+ book
							+ ">"
							+ "<input type ='submit'  value='借阅' class='btn'></form>";
					out.print("<tr>");
					out.print("<td>" + ID + "</td>");
					out.print("<td>" + Name + "</td>");
					out.print("<td>" + birthday + "</td>");
					out.print("<td>" + price + "</td>");
					out.print("<td>" + button + "</td>");
					out.print("</tr>");
				}
				out.print("</table>");
				//out.print("产品详情:<br>");
				//out.println("<div align=center>" + detailMess + "<div>");
				String pic = "<img src='image/" + picture
						+ "' width=260 height=200 ></img>";
				//out.print(pic); //产片图片
				con.close();
			} catch (SQLException exp) {
			}
		%>
</div>
</BODY>
</HTML>
