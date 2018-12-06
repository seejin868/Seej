<%@page import="java.net.URLDecoder"%>
<%@page import="Project_VO.AnswerVO"%>
<%@page import="Project_DAO.AnswerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");

	String answer = request.getParameter("answer_add");
	String tag = request.getParameter("tag_add");
	
	AnswerDAO dao = new AnswerDAO();
	dao.addAnswer(answer, tag);
	
	response.sendRedirect("Answer_Add.jsp");
	
%>

