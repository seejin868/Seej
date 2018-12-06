<%@page import="Project_DAO.User1DAO"%>
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
		$("#add_game").click(function(){
			
				location.href = "Game_Add.jsp";
			
		});
		
		// 관리자 아이디로 로그인 시 정답 추가
		$("#add_answer").click(function(){
			
				location.href = "Answer_Add.jsp";
			
		});
		
	});
</script>
</head>
<body>
	   <%@include file="header_test.jsp" %> 	
	<div id="container">

<%
	 User1DAO u_dao = new User1DAO(); 
	 boolean flag = u_dao.god(id); 
	
	if(flag)
	{
%>



		<div id="add">
			<div id="add_game">
				<h3>문제 +</h3>
			</div>
			<div id="add_answer">
				<h3>정답 +</h3>
			</div>
		</div>
	<%
	}
	%>
		<div id="img_wrapper">
			<%
				GameDAO dao = new GameDAO();
				ArrayList<GameVO> list = dao.getAllData();
				
				if(list.isEmpty()){
			%>
			<h1>등록된 문제가 없습니다</h1>
			<%
				}else {
					for(GameVO vo : list){
						if(vo.getCurrect()==0) {
			%>
			<a href="GameDetailBf.jsp?g_no=<%=vo.getG_no() %>">
				<div class="game_div">
					<div class="game_img">
							<img src="<%=vo.getG_file() %>" alt="<%=vo.getG_title() %>"/>
					</div>
					<div class="game_title">
						<%=vo.getG_title() %>
						<div class="game_hit">
							<img src="./game_img_upload/pointer.png" alt="조회수" class="hit_pointer"/> <%=vo.getG_hit() %>
						</div>
						<div class="game_like">
							<img src="./game_img_upload/like1.png" alt="좋아요" class="like_thumbsUp"/> <%=vo.getG_like() %>
						</div>
					</div>
				</div>
			</a>
			<%
						}else {
			%>
			<a href="GameDetailBf.jsp?g_no=<%=vo.getG_no() %>">
				<div class="game_div_done">
					<div class="game_img_done">
							<img src="<%=vo.getG_file() %>" alt="<%=vo.getG_title() %>"/>
					</div>
					<div class="game_title">
						<%=vo.getG_title() %>
						<div class="game_hit">
							<img src="./game_img_upload/pointer.png" alt="조회수" class="hit_pointer"/> <%=vo.getG_hit() %>
						</div>
						<div class="game_like">
							<img src="./game_img_upload/like1.png" alt="좋아요" class="like_thumbsUp"/> <%=vo.getG_like() %>
						</div>
					</div>
				</div>
			</a>
			<%
						}
					}
				}
			%>
		</div>
	</div>
</body>
</html>