<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'deleteBook.jsp' starting page</title>
    
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
	Connection conn=null;
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		String url="jdbc:mysql://localhost:3306/books";
		String strUser="root";
		String strPassword="";
		conn=DriverManager.getConnection(url,strUser,strPassword);
//out.println("<h2>本地协议纯Java 驱动程序连接MySQL数据库成功!</h2>");
   Statement stm=conn.createStatement();
   String id1="";
   id1=request.getParameter("id");//获得从index.jsp页面传过来的id值
 String sql2="delete from book where ID='"+id1 +"'";
 int n=stm.executeUpdate(sql2);//执行删除语句，n表示所影响的行数
 if(n>=1){
 out.print("<script Language='javascript'>window.alert('删除成功，返回信息页面！')</script>");
 out.print("<script Language='javascript'>window.location='index.jsp'</script>");
 
 }else{
  out.print("<script Language='javascript'>window.alert('删除失败，返回信息页面！')</script>");
 out.print("<script Language='javascript'>window.location='QueryBook.jsp'</script>");
 
 }
%>
	
	<% 
  
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
