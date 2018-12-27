<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="me.vitan.bean.*" %>
<jsp:useBean id="code1" class="me.vitan.bean.CodeConv" scope="page"/>
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

<title>addBook_action</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body>
	<%
		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/books?user=root&password=&useUnicode=true&characterEncoding=UTF8");

			String username = code1.toUTF8(request.getParameter("username"));
			String ID = code1.toUTF8(request.getParameter("ID"));
			String Name = code1.toUTF8(request.getParameter("Name"));
			String birthday = code1.toUTF8(request.getParameter("birthday"));
			String price = code1.toUTF8(request.getParameter("price"));
			String kind = code1.toUTF8(request.getParameter("kind"));
			String status = code1.toUTF8(request.getParameter("status"));
			String resume = code1.toUTF8(request.getParameter("resume"));

			String sql = "insert into book value(?,?,?,?,?,?,?)";
			PreparedStatement stm = conn.prepareStatement(sql);
			stm.setString(1, ID);
			stm.setString(2, Name);
			stm.setString(3, birthday);
			stm.setString(4, price);
			stm.setString(5, kind);
			stm.setString(6, status);
			stm.setString(7, resume);

			//ResultSet rs=stm.executeQuery(sql);
			int n = stm.executeUpdate();//n表示所影响的行数
			if (n >= 1) {
				out.print("<script Language='javascript'>window.alert('添加成功，返回信息页面！')</script>");
				out.print("<script Language='javascript'>window.location='addBook.jsp'</script>");
			} else {
				out.print("<script Language='javascript'>window.alert('添加失败，返回信息页面！')</script>");
				out.print("<script Language='javascript'>window.location='addBook.jsp'</script>");
			}
	%>

	<%
		//rs.close();
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
