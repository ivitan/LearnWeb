package me.vitan.servlet;

import me.vitan.bean.*;

import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;

public class HandleLogin extends HttpServlet {
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (Exception e) {
		}
	}

	public String handleString(String s) {
		try {
			//byte bb[] = s.getBytes("iso-8859-1");
			//s = new String(bb);
			
				if (s==null) {
					return "";
				}else {
					s=new String(s.getBytes("iso-8859-1"),"utf-8");
					return s;
				}
	
		} catch (Exception ee) {
		}
		return s;
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Connection con;
		Statement sql;
		String Username = request.getParameter("username").trim(), password = request
				.getParameter("password").trim();
		Username = handleString(Username);
		password = handleString(password);
		String uri = "jdbc:mysql://127.0.0.1/books?"
				+ "user=root&password=&characterEncoding=utf-8";
		boolean boo = (Username.length() > 0) && (password.length() > 0);
		try {
			con = DriverManager.getConnection(uri);
			String condition = "select * from users where Username = '" + Username
					+ "' and password ='" + password + "'";
			sql = con.createStatement();
			if (boo) {
				ResultSet rs = sql.executeQuery(condition);
				boolean m = rs.next();
				if (m == true) {
					// 调用登录成功的方法:
					success(request, response, Username, password);
					RequestDispatcher dispatcher = request
							.getRequestDispatcher("login/login.jsp");// 转发
					dispatcher.forward(request, response);
				} else {
					String backNews = "您输入的用户名不存在，或密码不般配";
					// 调用登录失败的方法:
					fail(request, response, Username, backNews);
				}
			} else {
				String backNews = "请输入用户名和密码";
				fail(request, response, Username, backNews);
			}
			con.close();
		} catch (SQLException exp) {
			String backNews = "" + exp;
			fail(request, response, Username, backNews);
		}
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void success(HttpServletRequest request,
			HttpServletResponse response, String Username, String password) {
		logins loginBean = null;
		HttpSession session = request.getSession(true);
		try {
			loginBean = (logins) session.getAttribute("loginBean");
			if (loginBean == null) {
				loginBean = new logins(); // 创建新的数据模型
				session.setAttribute("loginBean", loginBean);
				loginBean = (logins) session.getAttribute("loginBean");
			}
			String name = loginBean.getUsername();
			if (name.equals(Username)) {
				loginBean.setBackNews(Username + "已经登录了");
				loginBean.setUsername(Username);
			} else { // 数据模型存储新的登录用户
				loginBean.setBackNews(Username + "登录成功");
				loginBean.setUsername(Username);
			}
		} catch (Exception ee) {
			loginBean = new logins();
			session.setAttribute("loginBean", loginBean);
			loginBean.setBackNews(Username + "登录成功");
			loginBean.setUsername(Username);
		}
	}

	public void fail(HttpServletRequest request, HttpServletResponse response,
			String Username, String backNews) {
		response.setContentType("text/html;charset=utf-8");
		try {
			PrintWriter out = response.getWriter();
			out.println("<html><body>");
			out.println("<h2>" + Username + "登录反馈结果<br>" + backNews + "</h2>");
			out.println("返回登录页面或主页<br>");
			out.println("<a href =login.jsp>登录页面</a>");
			out.println("<br><a href =index.jsp>主页</a>");
			out.println("</body></html>");
		} catch (IOException exp) {
		}
	}
}