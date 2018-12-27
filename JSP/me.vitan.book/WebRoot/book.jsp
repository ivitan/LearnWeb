<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.regex.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
<title>分页浏览图书基本信息</title>
<script Language="JavaScript">
function check_input(theForm)
{
  if (theForm.page.value == "")
  {
    alert("页码不能为空");
    theForm.page.focus();
    return (false);
  }  
  
    //辅助函数，验证传入函数的字符串是否全为数字
    function CheckDigit(str)
    {
    var letters="0123456789";
    for(var i=0;i<str.length;i++)
    {
      if(letters.indexOf(str[i])==-1)
      return false;
    }
    return true ;
    }
    
 function CheckTxt()
    {
      var elementTxt=document.getElementById ("page").value;
     if(!CheckDigit(elementTxt))
     {
    alert("页码必须是数字");
    theForm.page.focus();
    return (false);
     } 
      
    }  
}
</script>

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
		conn = DriverManager.getConnection(url,strUser,strPassword);
		Statement stm=conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
		String strSql="SELECT ID,Name,birthday,price,kind,status,resume FROM book where kind='工具'";
		ResultSet rs=stm.executeQuery(strSql);
		//分页
%>
	<div>
		<h2>分页浏览图书基本信息</h2>
	</div>
		<table border="1" align="center" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#c5d7ed">
			<tr height="30">
			<th>图书编号</th>
			<th>图书名称</th>
			<th>出生版日期</th>
			<th>价格</th>
			<th>分类</th>
			<th>图书状态</th>
			<th>图书简介</th>
		</tr>
			<%
		int p;
	    int pagecount=3;
	    int p2=1;
	    int rowcount;
	    int intpagecount;
	    String page1=request.getParameter("page");
	    Pattern pattern = Pattern.compile("[0-9]+");    
Matcher matcher = pattern.matcher((CharSequence)page1);    
boolean result = matcher.matches();
	    
	    if(page1==null){
	         p=1;	         
	      }   	        
	  else 
	        {	        
 p=Integer.parseInt(page1);   
	         }
	    rs.last();
        rowcount = rs.getRow();
        intpagecount = (rowcount + pagecount - 1)/pagecount;
        if(p>intpagecount) p=intpagecount;
        if(p<1) p=1;
        rs.beforeFirst();
			while(rs.next()){
	if(p2>(p-1)*pagecount&&p2<=p*pagecount){
	%>
		<tr height="30" bgcolor="#ffffff" align="center">
			<td><%=rs.getString(1) %></td>
			<td><%=rs.getString(2) %></td>
			<td><%=rs.getString(3) %></td>
			<td><%=rs.getString(4) %></td>
			<td><%=rs.getString(5) %></td>
			<td><%=rs.getString(6) %></td>
			<td><%=rs.getString(7) %></td>
		</tr>
			<%}
                  p2++; 
}
		
 %>
		</table>
		<p align="center" class="STYLE7">
		<form method="POST" action="booke.jsp" onSubmit="return check_input(this) ">
			第<%=p %>页 共<%=intpagecount %>页&nbsp;&nbsp;
			<%if(p>1){ %>
			<a href="book.jsp?page=1">第一页</a>
			<a href="book.jsp?page=<%=p-1 %>">上一页</a>
			<%} %>
			&nbsp;&nbsp;
			<%if(p<intpagecount){ %>

			<a href="book.jsp?page=<%=p+1 %>">下一页</a>
			<a href="book.jsp?page=<%=intpagecount %>">最后一页</a>
			<%} %>

			&nbsp;&nbsp;转到第
			<input type="text" name="page" size="4">
			页
			<span><input name="Submit" type="submit"
					style="border-style: none; background-color: Transparent; background-image: url(${pageContext.request.contextPath}/images/f2.jpg); width: 20px; height: 19px; vertical-align: top; FONT-SIZE: 12px; COLOR: #666666;"
					value="GO" />
			</span>
		</form>
		
		<% 
		
		
		
rs.close();
		stm.close();
		conn.close();
	}
	catch(ClassNotFoundException e)
	{
		out.println(e.getMessage());
	}
	catch(SQLException e)
	{
		out.println(e.getMessage());
	}
	%>
</body>
</html>
