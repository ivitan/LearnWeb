<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
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
<title>修改员图书信息</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<style type="text/css">
.warp{
	padding:30px;
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
</style>
</head>

<body>
	<%
		String id = request.getParameter("id");
		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/books";
			String strUser = "root";
			String strPassword = "";
			conn = DriverManager.getConnection(url, strUser, strPassword);
			//out.println("<h2>本地协议纯Java 驱动程序连接MySQL数据库成功!</h2>");
			Statement stm = conn.createStatement();
			String sql = "select ID,Name,birthday,price,kind,status,Resume from book where ID='" + id + "'";
			ResultSet rs = stm.executeQuery(sql);
			while (rs.next()) {
				String ID= rs.getString("ID");
				String Name = rs.getString("Name");
				String birthday = rs.getString("birthday");
				String price = rs.getString("price");
				String kind = rs.getString("kind");
				String status = rs.getString("status");
				String resume = rs.getString("resume");
	%>

	<div align="center" id="top">修改图书信息</div>

	<form name="form1" method="post" action="modebook_action.jsp">
		<table width="400" border="0" align="center" cellpadding="5"
			cellspacing="0">
			<tr>
				<td width="35%" height="30" align="right">图书编号：</td>
				<td align="left"><input name="ID" type="text"
					id="ID" size="10" maxlength="6" class="input"> <span
					class="font1"> * </span></td>
			</tr>
			<tr>
				<td height="30" align="right">图书名称：</td>
				<td align="left"><input name="Name" type="text"
					id="Name" size="10" maxlength="10" class="input"> <span class="font1">
						* </span></td>
			</tr>
			<tr>
				<td height="30" align="right">出生版日期：</td>
				<td align="left"><input name="birthday" type="text"
					id="birthday" size="10" maxlength="10" class="input"> <span class="font1">
						* </span></td>
			</tr>
			<tr>
				<td height="30" align="right">价格：</td>
				<td align="left"><input name="price" type="text" id="price"
					size="10" maxlength="10" class="input"> <span class="font1"> * </span></td>
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
				</select>
				</td>
			</tr>
			<tr>
				<td height="30" align="right">图书状态：</td>
				<td align="left"><select name="status" id="status" class="input">
						<option value="在库" selected>在库</option>
						<option value="丢失">丢失</option>
						<option value="借出">借出</option>
						<option value="其他">其他</option>
				</select>
				</td>
			</tr>
			<tr>
				<td height="30" align="right">图书简介：</td>
				<td align="left"><textarea name="resume" cols="30" rows="6"
						id="resume" style="margin: 0px; width: 159px; height: 92px;"></textarea></td>
			</tr>
			<tr>
				<td height="30" colspan="2" align="center"><input type="submit"
					name="button" id="button" value="修改" class="btn"> <input type="reset"
					name="button2" id="button2" value="取消" class="btn"></td>
			</tr>
		</table>
	</form>
	<br>
	<%
		}
			rs.close();
			stm.close();
			conn.close();
		} catch (ClassNotFoundException e) {
			out.println(e.getMessage());
		} catch (SQLException e) {
			out.println(e.getMessage());
		} finally {
			try {
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
	%>
</body>
</html>