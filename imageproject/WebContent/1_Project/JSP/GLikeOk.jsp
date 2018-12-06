<%@page import="Project_DAO.GameLikeDAO"%>
<%@page import="Project_DAO.GameDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String n1 = request.getParameter("g_no");
	String n2 = request.getParameter("cno");
	
	int g_no = Integer.parseInt(n1);
	int cno = Integer.parseInt(n2);
	
	GameDAO dao = new GameDAO();
	
	GameLikeDAO dao1 = new GameLikeDAO();
	
	boolean flag = dao1.likeTF(g_no, cno);
	
	if(flag == false){
		dao1.CheckTo(g_no, cno); // row 생성
		dao1.CheckLike(g_no, cno); // game_like 테이블의 좋아요 증가
		dao.increLike(g_no); // mindgame 해당 게시글 전체 좋아요 +1
	}else if(flag == true){
		dao1.CheckOut(g_no, cno); // 해당 row 삭제
		dao1.CheckLike_Cancel(g_no, cno); // 좋아요 취소
		dao.decreLike(g_no); // 해당 게시글 전체 좋아요 -1
	}
	
%>