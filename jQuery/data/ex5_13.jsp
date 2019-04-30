<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="css/jquery.dataTables.css">
	<script type="text/javascript" language="javascript" src="js/jquery.js"></script>
	<script type="text/javascript" language="javascript" src="js/jquery.dataTables.js" charset="utf-8"></script>
	<script type="text/javascript" language="javascript">
		$(document).ready(function() {
            $('#example').dataTable();
        } );
</script>
    </head>
    <body>
<% Connection con;
    Statement sql; 
    ResultSet rs;
    try{  Class.forName("com.mysql.jdbc.Driver");
    }
    catch(Exception e){}
    try { String uri= "jdbc:mysql://127.0.0.1/warehouse";
          String user="root";
          String password="";
          con=DriverManager.getConnection(uri,user,password);
          //也可以写成con=DriverManager.getConnection(uri+"?user=root&password=");
          sql=con.createStatement();
          rs=sql.executeQuery("SELECT * FROM product ");
          out.print("<table border=2 id='example' class='display'>");
          out.print("<thead>");
          out.print("<tr>");
            out.print("<th width=100>"+"产品号"+"</th>");
            out.print("<th width=100>"+"名称"+"</th>");
            out.print("<th width=50>"+"生产日期"+"</th>");
            out.print("<th width=50>"+"价格"+"</th>");
          out.print("</TR>");
          out.print("</thead>");
             out.print("<tbody>");
          while(rs.next()){
            out.print("<tr>");
              out.print("<td >"+rs.getString(1)+"</td>"); 
              out.print("<td >"+rs.getString(2)+"</td>");
              out.print("<td >"+rs.getDate("madeTime")+"</td>"); 
              out.print("<td >"+rs.getFloat("price")+"</td>");
            out.print("</tr>") ; 
          }
           out.print("</tbody>");
          out.print("</table>");
          con.close();
    }
    catch(SQLException e){ 
          out.print(e);
    }
 %>
 	</body>
</html>