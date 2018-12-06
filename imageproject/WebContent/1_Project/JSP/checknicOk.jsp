<%@page import="Project_DAO.User1DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	 request.setCharacterEncoding("UTF-8");
	
	//nic 불러오기
	String nic = request.getParameter("nic");

	User1DAO dao = new User1DAO();     
	
   	boolean b = dao.checkNic(nic);
	
	out.println(b);
   %>