package me.vitan.servlet;
import me.vitan.bean.logins;
import java.util.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class PutBookTo extends HttpServlet {
	   public void init(ServletConfig config) throws ServletException { 
	      super.init(config);
	   }
	   public  void  doPost(HttpServletRequest request,HttpServletResponse response) 
	                        throws ServletException,IOException {
	      request.setCharacterEncoding("utf-8");
	      String book = request.getParameter("java");
	      System.out.println(book);
	      logins loginBean=null;
	      HttpSession session=request.getSession(true);
//	      try{  loginBean=(logins)session.getAttribute("loginBean");
//	            boolean b =loginBean.getUsername()==null||
//	            loginBean.getUsername().length()==0;
//	            if(b)
//	              response.sendRedirect("login.jsp");//重定向到登录页面
//	            LinkedList<String> car = loginBean.getCar();
//	            car.add(book);
//	            speakSomeMess(request,response,book); 
//	      }
//	      catch(Exception exp){
//	           response.sendRedirect("login.jsp");//重定向到登录页面
//	      }
	   }
	   public  void  doGet(HttpServletRequest request,HttpServletResponse response)
	                        throws ServletException,IOException {
	      doPost(request,response);
	   }
	   public void speakSomeMess(HttpServletRequest request,
	                     HttpServletResponse response,String book) {
	       response.setContentType("text/html;charset=utf-8");
	        try {
	         PrintWriter out=response.getWriter();
	         out.print("<%@ include file='head.jsp' %></HEAD>");
	         out.println("<html><body>");
	         out.println("<h2>"+book+"借阅</h2>") ;
	         out.println("查看购物车或返回<br>");
	         out.println("<a href =lookCar.jsp>查看借阅记录</a>");
	         out.println("<br><a href =byPageShow.jsp>主页</a>");
	         out.println("</body></html>");
	        }
	        catch(IOException exp){}
	   }
	}