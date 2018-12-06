<%@page import="Project_DAO.PostimgDAO"%>
<%@page import="Project_VO.PostimgVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    
    	
	    String number = request.getParameter("pnum").trim();
	    if (number == null) {
	    number = "1";
	    }
	    int pagenum = Integer.parseInt(number);
    
    
    	String msg = "";
    	PostimgDAO dao = new PostimgDAO();
    	ArrayList<PostimgVO> list = dao.getPageData(pagenum);
 				
     	for(PostimgVO vo:list)
     	{	
     		msg ="";    		
     		msg +="<div class='write_wrapper'>";
     		msg +="<a href='Detail?pno="+vo.getPno()+"'>";
     		msg +="<img class='pdimg' src='"+vo.getPthumbnail()+"'> <br>";
     		msg +="<div class='hover_txt'>";
     		msg +="제목 : " +vo.getPtitle()+ "<br>";              		
     		msg +="</div> </a> </div>";     	
     		out.println(msg);
     	
     	}
     	
    
    	
    
    %>