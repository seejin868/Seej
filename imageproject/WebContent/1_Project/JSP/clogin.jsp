<%@page import="Project_VO.User1Vo"%>
<%@page import="Project_DAO.User1DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>clogin.jsp</title>
<link rel="stylesheet" href="./css/clogin.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
			//로그인 버튼 눌렀을 때
		 	 $("#log").on('click', function(){
		 		//id, pw 유효성 검사
		 		if($("#id").val()==""){
					$("#err_empty_id").html('<h5>"아이디를 입력하세요"</h5>')
					document.frm.id.focus();
					return;
				
				}else if($("#pw").val()==""){
					$("#err_empty_pw").html('<h5>"비밀번호를 입력하세요"</h5>')
					document.frm.pw.focus();
					return;
				} 
	 		 
				document.frm.action = "cloginOk.jsp";
				document.frm.method = "get";
				document.frm.submit();

			});
			
			// err 문구를 hide()
			$("#err_empty_pw").hide();
			
			var ck = <%=request.getParameter("ck")%>
			if(ck==1){
				$("#err_empty_pw").show();
			}
			
	});	
			
		

</script>
<style>
body {
		background-image: url("./game_img_upload/backgroundimg1.jpg");
		background-size: cover;
	}
</style>
</head>
<body>
	<!-- div#wrap>div#u_skip+div#header+div#container+div#footer -->
	<div id="wrap">
		<form action="#" name="frm"	method="post">
			<div id="u_skip">
			<!-- 스킵네비게이션 : 웹접근성대응 -->
			</div>
			<div id="header">
				<h1>
					<a class="c_logo" href="main.jsp" target="_blank" alt="catch" onclick=""></a>
				</h1>
			</div>
			<div id="container">
				<fildset>
					<legend class="blind">로그인</legend>
						<div class="id_area">
							<div class="input_row" id="id_area">
									<label for="id" id="label_id_area" class="lb1" style="display: block;"></label>
									<input type="text" name="id" id="id" value="" autocomplete="off" placeholder="아이디" maxlength="41" class="int"/>
									<div class="error_id" id="err_empty_id" hidden=""></div>
								
							</div>
						</div>
						<br />
						<div class="pw_area">
							<div class="input_row" id="pw_area">
								<span class="input_box">
									<label for="pw" id="label_pw_area" class="lb1" style="display: block;"></label>
									<input type="password" name="pw" id="pw" value="" autocomplete="off" placeholder="비밀번호" maxlength="16" class="int"/>
								</span>	
							</div>
							<span class="error_pw" id="err_empty_pw">
								<p>"아이디 또는 비밀번호를 다시 확인하세요"
									<br />
									"등록되지 않은 아이디거나, 아이디 또는 비밀번호를 잘못입력 하였습니다."
								</p> 
							</span>
						</div>
						<br /> 
						<div id="botlog">
							<input type="button" title="로그인" alt="로그인" value="로그인" id="log" class="btn_global" />
						</div>
				</fildset>
				<div class="find_info">
					
					<a target="_blank" href="cregister.jsp" onclick="" >회원가입</a>
				</div>
				
				
			</div>
			<div id="footer">
			
			</div>
		</form>
	</div>
</body>
</html>