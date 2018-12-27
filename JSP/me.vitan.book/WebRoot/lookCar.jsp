<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="me.vitan.bean.logins"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="loginBean" class="me.vitan.bean.logins" scope="session" />

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>kookCar.jsp</title>
    
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
<font size=2>
		<div align="center">
			<%
				if (loginBean == null) {
					response.sendRedirect("login/login.jsp");//重定向到登录页面
				} else {
					boolean b = (loginBean.getUsername() == null || loginBean.getUsername().length() == 0);
					if (b)
						response.sendRedirect("login/login.jsp");//重定向到登录页面
				}
				LinkedList car = loginBean.getCar();
				if (car == null)
					out.print("<h2> 没有记录.</h2>");
				else {
					Iterator<String> iterator = car.iterator();
					StringBuffer buyGoods = new StringBuffer();
					int n = 0;
					double priceSum = 0;
					out.print("借阅记录：<table border=2>");
					while (iterator.hasNext()) {
						String goods = iterator.next();
						String showGoods = "";
						n++;
						//购车车物品的后缀是“#价格数字"，比如“iPhone手机价格3989 #3989”
						int index = goods.lastIndexOf("#");
						if (index != -1) {
							priceSum += Double.parseDouble(goods
									.substring(index + 1));
							showGoods = goods.substring(0, index);
						}
						buyGoods.append(n + ":" + showGoods);
						String del = "<form  action='deleteServlet' method = 'post'>"
								+ "<input type ='hidden' name='delete' value= "
								+ goods
								+ ">"
								+ "<input type ='submit'  value='删除' ></form>";

						out.print("<tr><td>" + showGoods + "</td>");
						out.print("<td>" + del + "</td></tr>");
					}
					out.print("</table>");
					String orderForm = "<form action='buyServlet' method='post'>"
							+ " <input type ='hidden' name='buy' value= "
							+ buyGoods + " >"
							+ " <input type ='hidden' name='price' value= "
							+ priceSum + " >"
							+ "<input type ='submit'  value='生成'></form>";
					out.print(orderForm);
				}
			%>
		</div>
	</font>
  </body>
</html>
