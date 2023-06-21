<%@ page language="java" contentType="text/html; charset=utf-8" import = "java.sql.*" 
      pageEncoding="utf-8"%>
<%
	session.invalidate();	//세션 종료
	response.sendRedirect("mainpage.jsp");	// 홈으로
%>