<%@page import="Project_DAO.User1DAO"%>
<%@page import="Project_VO.User1Vo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
		//cmodify에서 넘어온 값들
		int cno = Integer.parseInt(request.getParameter("cno"));
		String cnic = request.getParameter("nic");
		String cpw = request.getParameter("pw");
		String cgen = request.getParameter("gen");
		String cjob = request.getParameter("job");
		String mp1 = request.getParameter("mp1");
		String mp2 = request.getParameter("mp2");		
		String ctel = "010-" + mp1 + "-" + mp2;
		
		User1Vo vo = new User1Vo();
		
		//vo에 값을 할당
		vo.setCno(cno);
		vo.setCnic(cnic);
		vo.setCpw(cpw);
		int cgen1 = Integer.parseInt(cgen);
		vo.setCgen(cgen1);
		vo.setCjob(cjob);
		vo.setCtel(ctel);
		
		User1DAO dao = new User1DAO();
		
		dao.modifyData(vo);
		
		//DB에 저장되고 다른 페이지로 넘어가는 기능
		response.sendRedirect("main.jsp");
%>
