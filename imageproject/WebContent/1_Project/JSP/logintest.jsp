<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	
//if 로그인 성공시
	if( request.getParameter("id").equals("1") )
	{
		String id = "김시진";
		session.setAttribute("id", id);
	}
	else
	{
		String id = "김진열";
		session.setAttribute("id", id);
	}
	
	response.sendRedirect("main.jsp");

%>


