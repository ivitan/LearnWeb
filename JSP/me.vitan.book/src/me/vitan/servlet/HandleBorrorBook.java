package me.vitan.servlet;

import me.vitan.bean.logins;
import java.sql.*;
import java.util.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class HandleBorrorBook extends HttpServlet {
   public void init(ServletConfig config) throws ServletException { 
      super.init(config);
      try{ 
           Class.forName("com.mysql.jdbc.Driver");
      }
      catch(Exception e){} 
   }
   public  void  doPost(HttpServletRequest request,HttpServletResponse response) 
                        throws ServletException,IOException {
      request.setCharacterEncoding("utf-8");
      String buyGoodsMess = request.getParameter("buy");
      if(buyGoodsMess==null||buyGoodsMess.length()==0) {
         fail(request,response,"���ﳵû����Ʒ���޷����ɶ���");  
         return;
      }
      String price = request.getParameter("price");
      if(price==null||price.length()==0) {
         fail(request,response,"û�м���۸�ͣ��޷����ɶ���");  
         return;
      }
      float sum = Float.parseFloat(price);
      logins loginBean=null;
      HttpSession session=request.getSession(true);
      try{  loginBean=(logins)session.getAttribute("loginBean");
            boolean b =loginBean.getUsername()==null||
            loginBean.getUsername().length()==0;
            if(b)
              response.sendRedirect("login.jsp");//�ض��򵽵�¼ҳ��
      }
      catch(Exception exp){
           response.sendRedirect("login.jsp");//�ض��򵽵�¼ҳ��
      }
      String uri="jdbc:mysql://127.0.0.1/books?"+
                             "user=root&password=71017&characterEncoding=utf-8";
      Connection con; 
      PreparedStatement sql;
      try{ con=DriverManager.getConnection(uri);
           String insertCondition="INSERT INTO orderform VALUES (?,?,?,?)";
           sql=con.prepareStatement(insertCondition);
           sql.setInt(1,0); //������Ż��Զ�����
           sql.setString(2,loginBean.getUsername());
           sql.setString(3,buyGoodsMess);
           sql.setFloat(4,sum);
           sql.executeUpdate();
           LinkedList car=loginBean.getCar();
           car.clear();  //��չ��ﳵ
           success(request,response,"�ɹ�");
      }
      catch(SQLException exp){
           fail(request,response,"ʧ��"+exp);
      }
   }
   public  void  doGet(HttpServletRequest request,HttpServletResponse response)
                        throws ServletException,IOException {
      doPost(request,response);
   }
   public void success(HttpServletRequest request,HttpServletResponse response,
                      String backNews) {
        response.setContentType("text/html;charset=utf-8");
        try {
         PrintWriter out=response.getWriter();
         out.println("<html><body>");
         out.println("<h2>"+backNews+"</h2>") ;
         out.println("������ҳ<br>");
         out.println("<br><a href =index.jsp>��ҳ</a>");
         out.println("�鿴����<br>");
         out.println("<br><a href =lookOrderForm.jsp>�鿴����</a>");
         out.println("</body></html>");
        }
        catch(IOException exp){}
    }
   public void fail(HttpServletRequest request,HttpServletResponse response,
                      String backNews) {
        response.setContentType("text/html;charset=utf-8");
        try {
         PrintWriter out=response.getWriter();
         out.println("<html><body>");
         out.println("<h2>"+backNews+"</h2>") ;
         out.println("������ҳ��");
         out.println("<a href =index.jsp>��ҳ</a>");
         out.println("</body></html>");
        }
        catch(IOException exp){}
    }
}