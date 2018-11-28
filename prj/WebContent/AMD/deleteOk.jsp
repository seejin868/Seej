<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="dao.PostimgDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	PostimgDAO dao = new PostimgDAO();
	
MultipartRequest mr1 = new MultipartRequest(request, application.getRealPath(""), 1024, "UTF-8",
		new DefaultFileRenamePolicy());

	int pno = Integer.parseInt( mr1.getParameter("pno") );

	dao.deleteOne(pno);
	
	//이후 메인이동으로 바꿀 예정
	response.sendRedirect("TempList.jsp");
%>