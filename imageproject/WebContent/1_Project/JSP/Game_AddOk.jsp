<%@page import="Project_VO.AnswerVO"%>
<%@page import="Project_DAO.AnswerDAO"%>
<%@page import="Project_VO.GameVO"%>
<%@page import="Project_DAO.GameDAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="connection.OracleXEConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="drawChanger.PngFileMaker"%>
<%@page import="drawChanger.Base64Utils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String no = request.getParameter("no");
	int a_no = Integer.parseInt(no); 
	String answer = request.getParameter("answer");
	
	int maxFileSize = 1024 * 1024 * 10; //10MB
	String saveDirDraws = application.getRealPath("1_Project/gameImages");//그린 이미지를 저장할 폴더 경로
	System.out.println("saveDirDraws : "+ saveDirDraws);
	GameDAO dao = new GameDAO();
	int nowSeqNum = dao.getSeqLastNum();
			//dao.getSeqLastNum();//현재 시퀀스 넘버
			
	String title = request.getParameter("title");

	String writer = session.getAttribute("id").toString(); //id를 받아온다 

	String content = request.getParameter("content");// 본문 내용을 받아온다

	//canvas의 그림을 dataURL => byte[] => png로 바꾼다		
	String dataUrl = request.getParameter("canvasUrl");
	byte[] bt = Base64Utils.decodeBase64ToBytes(dataUrl);
	
	String filename = "draw"+nowSeqNum+".png";//파일명
	String pathAndFilename = saveDirDraws + "\\" + filename;//경로+파일명
	System.out.println("pathAndFilename : "+ pathAndFilename);
	new PngFileMaker(pathAndFilename, bt);//(만들파일의 경로와 이름 , 실 데이터(byte[]))

	String draw = "../gameImages/" + filename;
	System.out.println("draw : "+ draw);
	
	// DB에 저장
	GameVO vo = new GameVO();
	vo.setG_title(title);
	vo.setG_writer(writer);
	vo.setG_content(content);
	vo.setG_file(draw);
	vo.setAnswer(answer);
	
	dao.addData(vo);
	
	// 해당 문제 사용 완료값 변경
	AnswerDAO a_dao = new AnswerDAO();
	a_dao.usedAnswer(a_no);
	
	response.sendRedirect("GameList.jsp");
	
%>