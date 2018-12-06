<%@page import="vo.PostimgVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.PostimgDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
	<a href="Add.jsp">글 추가</a><br />
	<%
	
		session.setAttribute("id", "new");
		out.println(request.getRealPath("")+"<br/>");
		out.println("id = "+session.getAttribute("id")+"<br/>");
		
		
		//실험을 위해 만든 임시 리스트
		PostimgDAO dao = new PostimgDAO();
		ArrayList<PostimgVO> list = dao.getAll();

		for (PostimgVO vo : list) {
	%>
		
		<a href="modify.jsp?pno=<%=vo.getPno()%>"><%=vo.getPno() %> 
		<img src="<%=vo.getPthumbnail() %>" height="200" width="400" alt="" />
		</a> <br />
		
	<%
		}
	%>

</body>
</html>