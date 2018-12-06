<%@page import="Project_DAO.User1DAO"%>
<%@page import="Project_VO.User1Vo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%
	String cid = request.getParameter("id");
	String cpw = request.getParameter("pw");
	
/* 	request.setAttribute("id", "김시진");
	 김시진 ==	request.getParameter("id"); */
	 
	 
	User1DAO dao = new User1DAO();
	boolean check = dao.checkIdPw(cid, cpw);
	
	if(check==true){
		session.setAttribute("id", cid);
		response.sendRedirect("main.jsp"); 
	}else{
		response.sendRedirect("clogin.jsp?ck=1");
	}
	
	%>