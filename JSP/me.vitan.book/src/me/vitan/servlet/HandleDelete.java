package me.vitan.servlet;
import me.vitan.bean.logins;
import java.util.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class HandleDelete extends HttpServlet {
   public void init(ServletConfig config) throws ServletException { 
      super.init(config);
   }
   public  void  doPost(HttpServletRequest request,HttpServletResponse response) 
                        throws ServletException,IOException {
      request.setCharacterEncoding("utf-8");
      String delete = request.getParameter("delete");
      logins loginBean=null;
      HttpSession session=request.getSession(true);
      try{  loginBean=(logins)session.getAttribute("loginBean");
            boolean b =loginBean.getUsername()==null||
            loginBean.getUsername().length()==0;
            if(b)
              response.sendRedirect("login/login.jsp");//�ض��򵽵�¼ҳ��
            LinkedList<String> car = loginBean.getCar();
            car.remove(delete);
      }
      catch(Exception exp){
           response.sendRedirect("login/login.jsp");//�ض��򵽵�¼ҳ��
      }
      RequestDispatcher dispatcher= 
      request.getRequestDispatcher("lookCar.jsp");
      dispatcher.forward(request, response);//ת�� 
   }
   public  void  doGet(HttpServletRequest request,HttpServletResponse response)
                        throws ServletException,IOException {
      doPost(request,response);
   }
}