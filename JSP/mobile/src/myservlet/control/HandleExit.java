package myservlet.control;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class HandleExit extends HttpServlet {   
   public void init(ServletConfig config) throws ServletException{
      super.init(config);
   }
   public  void  doPost(HttpServletRequest request,HttpServletResponse response) 
                        throws ServletException,IOException {
	   //request.setCharacterEncoding("utf-8");
	   response.setContentType("text/html;charset=utf-8");
	   PrintWriter out=response.getWriter();
       HttpSession session=request.getSession(true); 
       session.invalidate();              //�����û���session����
       out.print("<script language='javascript'>window.alert('�˳�ϵͳ')</script>");
       out.print("<script language='javascript'>window.parent.opener=null</script>");
       out.print("<script language='javascript'>window.parent.close()</script>");
      // response.sendRedirect("index.jsp"); //������ҳ 
   }
   public  void  doGet(HttpServletRequest request,HttpServletResponse response) 
                        throws ServletException,IOException {
      doPost(request,response);
   }
}
