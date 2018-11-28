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

	<%
		//실험을 위해 만든 임시 리스트
		PostimgDAO dao = new PostimgDAO();
		ArrayList<PostimgVO> list = dao.getAll();

		for (PostimgVO vo : list) {
	%>
		
		<a href="modify.jsp?pno=<%=vo.getPno()%>"><%=vo.getPno() %> 번</a> <br />
		
	<%
		}
	%>

</body>
</html>