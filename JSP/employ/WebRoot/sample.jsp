<%@ page contentType="text/html;charset=GB2312" language="java"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.regex.*"%>
<html>
	<head>
		<title>��ҳ���Ա��������Ϣ</title>
<script Language="JavaScript">
function check_input(theForm)
{
  if (theForm.page.value == "")
  {
    alert("ҳ�벻��Ϊ��");
    theForm.page.focus();
    return (false);
  }  
  
    //������������֤���뺯�����ַ����Ƿ�ȫΪ����
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
    alert("ҳ�����������");
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
		String url="jdbc:mysql://localhost:3306/hrms";
		String strUser="root";
		String strPassword="";
		conn=DriverManager.getConnection(url,strUser,strPassword);
		Statement stm=conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
		String strSql="SELECT EmployeeID,UserName,Sex,Birthday,NativePlace,Marriage,IdentityID,Folk FROM employee where Incumbency='��ְ'";
		ResultSet rs=stm.executeQuery(strSql);
		//��ҳ
%>
		<center>
			<h2>
				��ҳ�����ְԱ���Ļ�����Ϣ
			</h2>
		</center>
		<table border="1" align="center" border="0" align="center"
			cellpadding="0" cellspacing="1" bgcolor="#c5d7ed">
			<tr height="30">
				<th>
					Ա�����
				</th>
				<th>
					Ա������
				</th>
				<th>
					Ա���Ա�
				</th>
				<th>
					��������
				</th>
				<th>
					Ա������
				</th>
				<th>
					����״��
				</th>
				<th>
					���֤��
				</th>
				<th>
					����
				</th>
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
				<td><%=rs.getString(8) %></td>
			</tr>
			<%}
                  p2++; 
}
		
 %>
		</table>
		<p align="center" class="STYLE7">
		<form method="POST" action="sample.jsp" onSubmit="return check_input(this) ">
			��<%=p %>ҳ ��<%=intpagecount %>ҳ&nbsp;&nbsp;
			<%if(p>1){ %>
			<a href="sample.jsp?page=1">��һҳ</a>
			<a href="sample.jsp?page=<%=p-1 %>">��һҳ</a>
			<%} %>
			&nbsp;&nbsp;
			<%if(p<intpagecount){ %>

			<a href="sample.jsp?page=<%=p+1 %>">��һҳ</a>
			<a href="sample.jsp?page=<%=intpagecount %>">���һҳ</a>
			<%} %>

			&nbsp;&nbsp;ת����
			<input type="text" name="page" size="4">
			ҳ
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
