<%@page import="Project_VO.PostimgVO"%>
<%@page import="Project_DAO.PostimgDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Project_VO.GameVO"%>
<%@page import="Project_DAO.GameDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CatchMind.jsp</title>
<link rel="stylesheet" type="text/css" href="./css/GameList.css?dda">
<style type="text/css">
	body {
		background-image: url("./game_img_upload/backgroundimg1.jpg");
		background-size: cover;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
<%
	request.setCharacterEncoding("UTF-8");
	String id="";
	if(session.getAttribute("id")==null)
	{	
		response.sendRedirect("clogin.jsp");
	}
	else
		id = session.getAttribute("id").toString();

%>
	$(function(){
		// 관리자 아이디로 로그인 시 게임 추가
		$("#add_game").click(function()
		{
				location.href = "Add.jsp";
		
	})
	});
		
	
		
</script>
</head>
<body>
	<%@include file="header_test.jsp" %> 	
	<div id="container">
	
		<div id="add">
			<div id="add_game">
				<h3>글쓰기</h3>
			</div>
		</div>
	
		<div id="img_wrapper">
			<%
		
				PostimgDAO dao = new PostimgDAO();
				ArrayList<PostimgVO> list = dao.getAll();
				
				if(list.isEmpty()){
			%>
			<h1>등록된 이미지가 없습니다</h1>
			<%
				}else {
					for(PostimgVO vo : list)
					{
						
			%>
			<a href="Detail?pno=<%=vo.getPno()%>">
				<div class="game_div">
					<div class="game_img">
							<img src="<%=vo.getPthumbnail() %>" alt="<%=vo.getPtitle() %>"/>
					</div>
					<div class="game_title">
						<%=vo.getPtitle() %>
						<div class="game_hit">
							<img src="./game_img_upload/pointer.png" alt="조회수" class="hit_pointer"/> <%=vo.getPhit() %>
						</div>
						<div class="game_like">
							<img src="./game_img_upload/like1.png" alt="좋아요" class="like_thumbsUp"/> <%=vo.getPlike() %>
						</div>
					</div>
				</div>
			</a>
			<%
					}
				}
				 %>
		
		</div>
	</div>
	
</body>
</html>