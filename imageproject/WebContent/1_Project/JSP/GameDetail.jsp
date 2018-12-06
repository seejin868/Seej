<%@page import="Project_VO.GCommentVO"%>
<%@page import="Project_DAO.GCommentDAO"%>
<%@page import="Project_VO.GameVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Project_DAO.GameDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GameDetail.jsp</title>
<link rel="stylesheet" type="text/css" href="./css/GameDetail.css?dddddda">
<style type="text/css">
	body {
		background-image: url("./game_img_upload/backgroundimg4.jpg");
		background-size: cover;
	}
</style>
<%
	String gno = request.getParameter("g_no");
		if(gno!=""){
			int g_no = Integer.parseInt(gno);
			
			GameDAO dao = new GameDAO();
			GameVO vo = dao.getDetail(g_no);
			
			/* User1DAO u_dao = new User1DAO(); */
			/* boolean flag = u_dao.메소드이름(session.getAttribute("id").toString()); */
			boolean flag = true; // 임시 해당 계정이 관리자
%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="./js/httpRequest.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		// 댓글 등록
		$("input:button[value='등록']").click(insertComment);
		// 추천 하기 / 추천 취소
		$("input:button[value='LIKE']").click(checkLike);
		// 목록으로 돌아가기
		$("#backHome").click(function(){
			location.href = "GameList.jsp";
		});
		// 수정 하기
		$("#edit").click(function(){
			var flag = <%=flag %>;
			
			if(flag==ture){
				location.href = "Game_modify.jsp?g_no="+<%=gno %>;
			}else {
				alert("해당 기능의 권한이 없습니다");
			}
		});
		// 삭제 하기
		$("#delete").click(function(){
			var flag = <%=flag %>;
			
			if(flag==true){
				var flag1 = confirm("정말 삭제 하시겠습니까?");
				if(flag1==true){
					var answer = "<%=vo.getAnswer() %>";
					location.href = "Game_delete.jsp?g_no="+<%=gno %>+"&answer="+encodeURIComponent(answer);
				}
			}else {
				alert("해당 기능의 권한이 없습니다");
			}
		});
		// information_txt 숨기기
		$("#information_txt").hide();
		
		// information_txt 호출
		$("#information_img").click(function(){
			$("#information_txt").toggle(400);
		});
		$("#information_txt").click(function(){
			$(this).toggle(400);
		});
	});
	
	
	// 파라미터 값 보내기
	function insertComment(){
		var txt = $('#comment_txt').val().trim();
		var answer = "<%=vo.getAnswer() %>";

		var params = "text="+encodeURIComponent(txt)+"&g_no="+<%=gno %>+"&answer="+encodeURIComponent(answer);

		sendRequest('GCommentOk.jsp', params, callback, 'GET');
	}
	
	// 추천 누르기
	function checkLike(){
		var params = "g_no="+<%=gno %> +"&cno=1"; // 임의의 멤버 번호
		console.log("ddd");
		
		sendRequest('GLikeOk.jsp', params, callback, 'GET');
	}
	
	function callback(){
		if(xhr.readyState==4 & xhr.status==200){

			location.reload();
		}
	}
</script>
</head>
<body>
	   <%@include file="header_test.jsp" %> 	
	<div id="container">
	<%
		if(flag==true){
	%>
		<div id="edit_box">
			<div id="edit">수정</div>
			<div id="delete">삭제</div>
		</div>
		<%
		}
		%>
		<div id="detail_div">
			<img src="<%=vo.getG_file() %>" alt="<%=vo.getG_title() %>" id="detail_img"/>
		</div>
		<br />
		<div id="content">
			<h3><%=vo.getG_content() %></h3> &nbsp &nbsp
			<img src="./game_img_upload/pointer.png" alt="조회수" class="hit_pointer"/> <span> <%=vo.getG_hit() %></span>
			&nbsp
			<img src="./game_img_upload/like1.png" alt="좋아요" class="like_thumbsUp"/> <span> <%=vo.getG_like() %></span>
			&nbsp &nbsp
			<input type="button" value="LIKE" id="like"/>
		</div>
		<br />
		<hr />
		<div id="add_comment">
		<%
			GCommentDAO dao1 = new GCommentDAO();
			ArrayList<GCommentVO> list1 = dao1.getAllData(g_no);
			
			if(dao.isCurrect(g_no)==false){
				
		%>
			<div id="add_comment_box">
				<input type="text" name="comment_txt" id="comment_txt" placeholder="  정답은 '[]' 안에 작성 해주세요"/>
				<input type="button" value="등록" />
			</div>
		<%
			}else {
		%>
			<h3>이미 정답을 마췄습니다</h3>
		<%
			}//if end
		%>
		</div>
		<div class="comments">
		<%
			if(list1.isEmpty()){
		%>
		<h4>등록된 댓글이 없습니다</h4>
		<%
			}else{
				for(GCommentVO vo2 : list1) {
				
		%>
			<div class="c_writer"><%=vo2.getGc_writer() %></div>
			<div class="c_comment"><%=vo2.getGc_comment() %></div>
			<br />
		<%
				}//for end
			}// if/else end
		%>
		</div>
		<br />
		<hr />
		<%
			ArrayList<GameVO> list = dao.getAllData2(g_no);
			
			for(GameVO vo1 : list) {
				if(vo1.getCurrect()==0){
					
		%>
		<a href="GameDetailBf.jsp?g_no=<%=vo1.getG_no() %>">
			<div class="other_div">
				<div class="other_img">
					<img src="<%=vo1.getG_file() %>" alt="<%=vo1.getG_title() %>" class="images"/>
				</div>
				<div class="game_title">
					<span class="other_title"><%=vo1.getG_title() %></span>
					<div class="game_hit">
						<img src="./game_img_upload/pointer.png" alt="조회수" class="hit_pointer"/> <%=vo1.getG_hit() %>
					</div>
					<div class="game_like">
						<img src="./game_img_upload/like1.png" alt="좋아요" class="like_thumbsUp"/> <%=vo1.getG_like() %>
					</div>
				</div>
			</div>
		</a>
		<%
				}else {
		%>
		<a href="GameDetailBf.jsp?g_no=<%=vo1.getG_no() %>">
			<div class="other_div">
				<div class="other_img_done">
					<img src="<%=vo1.getG_file() %>" alt="<%=vo1.getG_title() %>" class="images"/>
				</div>
				<div class="game_title">
					<span class="other_title"><%=vo1.getG_title() %></span>
					<div class="game_hit">
						<img src="./game_img_upload/pointer.png" alt="조회수" class="hit_pointer"/> <%=vo1.getG_hit() %>
					</div>
					<div class="game_like">
						<img src="./game_img_upload/like1.png" alt="좋아요" class="like_thumbsUp"/> <%=vo1.getG_like() %>
					</div>
				</div>
			</div>
		</a>
		<%
				}
			}// for end
		}
		%>
	</div>
	<div id="backHome">
		<img src="./game_img_upload/backHome.png" alt="LIST" id="backHome_img"/>
		<br />
		목록
	</div>
	<div id="information_div">
		<img src="./game_img_upload/information.png" alt="information" id="information_img" />
		<div id="information_txt">
			<p>게시판의 그림을 보고 댓글에 정답을 같이 적어 등록 하시면 됩니다</p>
			<h4>정답 입력 요령</h4>
			<p>댓글 입력란에 대괄호 [] 안에 정답을 입력해 해야지 정답으로 인정됩니다</p>
		</div>
	</div>
</body>
</html>