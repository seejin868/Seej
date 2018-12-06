<%@page import="java.util.ArrayList"%>
<%@page import="Project_VO.AnswerVO"%>
<%@page import="Project_DAO.AnswerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Answer_Add.jsp</title>
<link rel="stylesheet" type="text/css" href="./css/Answer_Add.css?adzddad">
<style type="text/css">
	body {
		background-image: url("./game_img_upload/backgroundimg1.jpg");
		background-size: cover;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		// 목록으로 돌아가기
		$("#backHome").click(function(){
			location.href = "GameList.jsp";
		});
		
		// 추가 버튼
		$("#add_btn").click(function(){
			if($("#answer_add").val()==""){
				alert("추가할 정답이 없습니다");
				document.frm.answer_add.focus();
				return;
			}
			if($("#tag_add").val()==""){
				alert("추가할 태그가 없습니다");
				document.frm.tag_add.focus();
				return;
			}
			
			document.frm.action = "Answer_AddOk.jsp";
			document.frm.method = "post";
			document.frm.submit();
		});
		
		// 삭제 버튼 숨기기
		$(".delete").hide();
		
		// 삭제 버튼 호출
		$(".read").click(function(){
			$(this).parent().children(".delete").toggle(500);
		});
	});
	
	// 삭제 버튼
	function Answer_delete(a_no) {
		var flag = confirm("정말 삭제 하시겠습니까?");
		if(flag==true){
			console.log(a_no);
			location.href = "Answer_delete.jsp?a_no="+a_no;
		}
	}
</script>
</head>
<body>
   <%@include file="header_test.jsp" %> 	
	<div id="container">
		<div id="backHome">
		<img src="./game_img_upload/backHome.png" alt="LIST" id="backHome_img"/>
		<br />
		목록
		</div>
		<div id="list">
			<div id="head">
				<div id="a_no_div"><input type="text" name="a_no" value="No" id="a_no" disabled="disabled"/></div>
				<div id="answer_div"><input type="text" name="answer" value="정답" id="answer" disabled="disabled"/></div>
				<div id="tag_div"><input type="text" name="tag" value="태그" id="tag" disabled="disabled"/></div>
				<div id="use_div"><input type="text" name="tag" value="사용여부" id="use" disabled="disabled"/></div>
			</div>	
			<%
				AnswerDAO dao = new AnswerDAO();
				ArrayList<AnswerVO> list = dao.getAllData();
				
				for(AnswerVO vo : list){
					String use = "사용불가";
					if(vo.getUse()==0){
						use = "사용가능";
			%>
			<div class="mom">
				<div class="read">
					<div class="read_ano"><input type="text" class="read_ano_txt" readonly="readonly" value="<%=vo.getA_no() %>" /></div>
					<div class="read_answer"><input type="text" class="read_answer_txt" readonly="readonly" value="<%=vo.getAnswer() %>" /></div>
					<div class="read_tag"><input type="text" class="read_tag_txt" readonly="readonly" value="<%=vo.getTag() %>" /></div>
					<div class="read_use"><input type="text" class="read_use_txt" readonly="readonly" value="<%=use %>" /></div>
				</div>
				<div class="delete">
					<input type="button" value="삭제" class="delete_btn" onclick="Answer_delete(<%=vo.getA_no() %>)" />
				</div>
			</div>
			<%
					}else {
			%>
			<div class="read_done">
				<div class="read_ano"><input type="text" class="read_ano_txt_done" readonly="readonly" value="<%=vo.getA_no() %>" /></div>
				<div class="read_answer"><input type="text" class="read_answer_txt_done" readonly="readonly" value="<%=vo.getAnswer() %>" /></div>
				<div class="read_tag"><input type="text" class="read_tag_txt_done" readonly="readonly" value="<%=vo.getTag() %>" /></div>
				<div class="read_use"><input type="text" class="read_use_txt_done" readonly="readonly" value="<%=use %>" /></div>
			</div>
			<%
					}
				}
			%>
		</div>
		<form name="frm" id="add">
			<div>
				<h2>문제 추가</h2>
				<div id="answer_add_div">
					<input type="text" name="answer_add" id="answer_add" placeholder="추가할 정답"/>
				</div>
				<div id="tag_add_div" >
					<input type="text" name="tag_add" id="tag_add" placeholder="정답의 태그"/>
				</div>
				<br />
				<div id="btn">
					<input type="button" value="등록" class="btns" id="add_btn"/>
					<input type="reset" value="reset" class="btns"/>
				</div>
		</form>
		</div>
	</div>
</body>
</html>