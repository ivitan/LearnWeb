<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="me.vitan.bean.DataByPage"%>
<%@ page import="com.sun.rowset.*"%>
<jsp:useBean id="dataBean" class="me.vitan.bean.DataByPage"
	scope="session" />
<head><%@ include file="head.jsp"%>
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
</style>
</HEAD>
<html>
<body>
	<div class="waper">
		<table border='1' align="center">
			<tr>
				<th>图书编号</th>
				<th>图书名称</th>
				<th>出版时间</th>
				<th>图书价格</th>
				<th>查看详情</th>
				<td><font color=blue>借阅</font></td>
			</tr>
			<jsp:setProperty name="dataBean" property="pageSize" param="pageSize" />
			<jsp:setProperty name="dataBean" property="currentPage"
				param="currentPage" />
			<%
				CachedRowSetImpl rowSet = dataBean.getRowSet();
				if (rowSet == null) {
					out.print("没有查询到结果，无法浏览");
					return;
				}
				rowSet.last();
				int totalRecord = rowSet.getRow();
				//out.println("全部记录数" + totalRecord); //全部记录数
				int pageSize = dataBean.getPageSize(); //每页显示的记录数
				int totalPages = dataBean.getTotalPages();
				if (totalRecord % pageSize == 0)
					totalPages = totalRecord / pageSize;//总页数
				else
					totalPages = totalRecord / pageSize + 1;
				dataBean.setPageSize(pageSize);
				dataBean.setTotalPages(totalPages);
				if (totalPages >= 1) {
					if (dataBean.getCurrentPage() < 1)
						dataBean.setCurrentPage(dataBean.getTotalPages());
					if (dataBean.getCurrentPage() > dataBean.getTotalPages())
						dataBean.setCurrentPage(1);
					int index = (dataBean.getCurrentPage() - 1) * pageSize + 1;
					rowSet.absolute(index); //查询位置移动到currentPage页起始位置
					boolean boo = true;
					for (int i = 1; i <= pageSize && boo; i++) {
						String ID = rowSet.getString(1);
						String Name = rowSet.getString(2);
						String birthday = rowSet.getString(3);
						String price = rowSet.getString(4);
						String book = "(" + ID + "," + Name + "," + birthday + ","
								+ price + ")#" + price;//便于购物车计算价格,尾缀上"#价格值"
						book = book.replaceAll("\\p{Blank}", "");
						String button = "<form  action='putBookServlet' method = 'post'>"
								+ "<input type ='hidden' name='java' value= "
								+ book
								+ ">"
								+ "<input type ='submit'  value='借阅书籍' class='btn'></form>";
						String detail = "<form  action='showDetail.jsp' method = 'post'>"
								+ "<input type ='hidden' name='xijie' value= "
								+ ID
								+ ">"
								+ "<input type ='submit'  value='查看细节' class='btn'></form>";
						out.print("<tr>");
						out.print("<td>" + ID + "</td>");
						out.print("<td>" + Name + "</td>");
						out.print("<td>" + birthday + "</td>");
						out.print("<td>" + price + "</td>");
						out.print("<td>" + detail + "</td>");
						out.print("<td>" + button + "</td>");
						out.print("</tr>");
						boo = rowSet.next();
					}
				}
			%>
		</table>
		<br> <br>
		<Table align="center">
			<tr>
				<td><FORM action="" method=post>
						<Input type=hidden name="currentPage"
							value="<%=dataBean.getCurrentPage() - 1%>"> <Input
							type=submit name="g" value="上一页" class="btn">
					</FORM></td>
				<td>第 <Font color=blue> <jsp:getProperty name="dataBean"
							property="currentPage" /> </Font>页 共 <Font color=blue><jsp:getProperty
							name="dataBean" property="totalPages" /> </Font>页。</td>
				<td><FORM action="" method=post>
						<Input type=hidden name="currentPage"
							value="<%=dataBean.getCurrentPage() + 1%>"> <Input
							type=submit name="g" value="下一页" class="btn">
					</FORM></td>
			</tr>
		</Table>
	</div>
</body>
</html>
