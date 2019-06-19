package servlet;
import java.io.*;
import javabean.userop;
import javax.servlet.*;
import javax.servlet.http.*;


public class checkUserJQueryServlet extends HttpServlet {

	public checkUserJQueryServlet() {
		super();
	}


	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
         doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String searchname=request.getParameter("username");
		System.out.println(searchname);
		if(searchname!=null && !searchname.equals("")){
			userop uop=new userop();
			boolean rescheck=uop.checkusername(searchname);
			out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
			out.println("<HTML>");
			out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
			out.println("  <BODY>");
			if(rescheck)	{
				out.println("用户名已存在！");
			}else{
				out.println("可以新建用户。");
			}
			out.println("  </BODY>");
			out.println("</HTML>");
			out.flush();
			out.close();
		}
	}


	public String getServletInfo() {
		return "This is my default servlet created by Eclipse";
	}


	public void init() throws ServletException {
		// Put your code here
	}

}
