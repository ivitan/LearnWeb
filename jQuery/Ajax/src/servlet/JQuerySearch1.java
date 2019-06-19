package servlet;
import java.io.*;
import java.util.ArrayList;

import javax.servlet.*;
import javax.servlet.http.*;
import javabean.goodsBean;
import javabean.goodsop;

public class JQuerySearch1 extends HttpServlet {

	public JQuerySearch1() {
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
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		String searchname=request.getParameter("searchname").trim();
		//searchname=new String(searchname.getBytes("iso-8859-1"),"utf-8");
		//System.out.println(searchname);
        //JOptionPane.showMessageDialog(null, searchname);
		if(searchname!=null && !searchname.equals(""))	{
			goodsop gop=new goodsop();
			ArrayList<goodsBean> goodslist=new ArrayList<goodsBean>();
			//System.out.println("*****"+searchname);
			goodslist=gop.getgoodsbynamelike("goods",searchname);
			//System.out.println("mmm"+goodslist);
			if(goodslist!=null)	{
				out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
				out.println("<HTML>");
				out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
				out.println("  <BODY>");
				out.println("  <div id='reslist' style='margin:0px'>");
				for(int i=0;i<goodslist.size();i++)	{
					goodsBean gb=new goodsBean();
					gb=(goodsBean)goodslist.get(i);
					out.print("<div id='res_"+String.valueOf(i)+"' onclick='getlist("+String.valueOf(i)+");'>"+gb.getName()+"</div>");
					//System.out.println("<div id='res_"+String.valueOf(i)+"' onclick='getlist("+String.valueOf(i)+");'>"+gb.getName()+"</div>");
				}
				out.println("  </div>");
				out.println("  </BODY>");
				out.println("</HTML>");
				out.flush();
				out.close();
			}
		}
	}

	public void init() throws ServletException {
		// Put your code here
	}

}
