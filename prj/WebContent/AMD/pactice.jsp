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
<style>

#wrapper{
	width: 600px;
	height: 1000px;
}

.imgdiv{
	width: 100px;
	float: left;
}
img{
	width: 100px;
}

</style>

<script type="text/javascript">



</script>
<div id="wrapper">
<%
PostimgDAO dao = new PostimgDAO();
 ArrayList<PostimgVO> list = dao.getAll();
 int i = 1;
 	for(PostimgVO vo : list){
 	
 		out.println("<div class='imgdiv"+i+"'>");
 	
 			out.println("<img src='"+vo.getPthumbnail()+"' alt='' />");
 			
 		out.println("</div>");
 		if(i==4){
 			out.println("<br/>");
 			i=1;
 		}
 	}
	
%>


</div>

</body>
</html>