<%@page import="Project_DAO.AnswerDAO"%>
<%@page import="Project_DAO.GameDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String gno = request.getParameter("g_no");
	String answer = request.getParameter("answer");
	int g_no = Integer.parseInt(gno);

	GameDAO dao = new GameDAO();
	AnswerDAO a_dao = new AnswerDAO();
	dao.deleteDate(g_no);
	a_dao.reUse(answer);
	
	response.sendRedirect("GameList.jsp");
%>