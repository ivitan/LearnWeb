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
//	              response.sendRedirect("login.jsp");//�ض��򵽵�¼ҳ��
//	            LinkedList<String> car = loginBean.getCar();
//	            car.add(book);
//	            speakSomeMess(request,response,book); 
//	      }
//	      catch(Exception exp){
//	           response.sendRedirect("login.jsp");//�ض��򵽵�¼ҳ��
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
	         out.println("<h2>"+book+"����</h2>") ;
	         out.println("�鿴���ﳵ�򷵻�<br>");
	         out.println("<a href =lookCar.jsp>�鿴���ļ�¼</a>");
	         out.println("<br><a href =byPageShow.jsp>��ҳ</a>");
	         out.println("</body></html>");
	        }
	        catch(IOException exp){}
	   }
	}