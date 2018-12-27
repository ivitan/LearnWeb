<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'modebook_action.jsp' starting page</title>
    
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
		Statement stm=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			//String url = "jdbc:mysql://localhost:3306/hrms1";
			//String strUser = "root";
			//String strPassword = "";
			//conn = DriverManager.getConnection(url, strUser, strPassword);
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/books?user=root&password=&useUnicode=true&characterEncoding=UTF8");
            stm=conn.createStatement();
			String ID = request.getParameter("ID");
			String Name = request.getParameter("Name");
			String birthday = request.getParameter("birthday");
			String price = request.getParameter("price");
			String kind= request.getParameter("kind");
			String status = request.getParameter("status");
			String resume = request.getParameter("resume");

					
			String sql = "update book set Name='" + Name + "',price='" + price + "',birthday='" + birthday + "',kind='" + kind + "',status='" + status + "',resume='" + resume + "'where ID='" + ID + "'";
				

			int n=stm.executeUpdate(sql);
			if (n>=1) {
				out.print("<script Language='javascript'>window.alert('修改成功，返回信息页面！')</script>");
				out.print("<script Language='javascript'>window.location='QueryBook.jsp'</script>");
			} else {
				out.print("<script Language='javascript'>window.alert('修改失败，返回信息页面！')</script>");
				out.print("<script Language='javascript'>window.location='QueryBook.jsp'</script>");
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
