<%@page import="deletefiles.deleteFiles"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="dao.PostimgDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
	
	MultipartRequest mr1 = new MultipartRequest(request, application.getRealPath(""), 1024, "UTF-8",
			new DefaultFileRenamePolicy());

//dao
	PostimgDAO dao = new PostimgDAO();

	int pno = Integer.parseInt(mr1.getParameter("pno"));
	
	//db에서 제거
	dao.deleteOne(pno);
	
	//DB에 없는 파일제거
	deleteFiles delfile = new deleteFiles();
	delfile.deleteFiles(application.getRealPath(""));
	
	
	//이후 메인이동으로 바꿀 예정
	response.sendRedirect("TempList.jsp");
	
	
	
%>