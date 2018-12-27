<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
 if(session.getAttribute("flag")==null)
 response.sendRedirect("login/login.jsp");
 %>