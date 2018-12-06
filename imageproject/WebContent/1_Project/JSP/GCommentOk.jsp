<%@page import="Project_DAO.GameDAO"%>
<%@page import="Project_VO.GCommentVO"%>
<%@page import="Project_DAO.GCommentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	
	// 전달 받은 파라미터 값
	String gc_comment = request.getParameter("text");
	String gno = request.getParameter("g_no");
	String answer = request.getParameter("answer");
	
	
	// 세션에서 id 값 받기
	String gc_writer = session.getAttribute("id").toString();
	
	int g_no = Integer.parseInt(gno);
	
	GCommentDAO dao = new GCommentDAO();
	GCommentVO vo = new GCommentVO();
	
	GameDAO dao1 = new GameDAO();
	
	// vo에 담기
	vo.setGc_comment(gc_comment);
	vo.setGc_writer(gc_writer);
	
	// 댓글등록 메소드 호출
	dao.addData(vo, g_no);
	
	// 댓글 []안에 정답 추출
	String uAnswer = dao.userAnswer(gc_comment);
	
	// 댓글 []와 정답이 같을 경우 currect 1 로 활성화 (정답을 마췄음)
	if(answer.equals(uAnswer)){
		dao1.currect(g_no);
	}

%>
