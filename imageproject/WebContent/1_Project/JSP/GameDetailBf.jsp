<%@page import="Project_DAO.GameDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String gno = request.getParameter("g_no");

	if(gno!=""){
		int g_no = Integer.parseInt(gno);
		
		// 조회수 1 증가
		GameDAO dao = new GameDAO();
		dao.raiseHits(g_no);
		
		response.sendRedirect("GameDetail.jsp?g_no="+gno);
	}
%>


