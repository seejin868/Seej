<%@page import="java.util.ArrayList"%>
<%@page import="Project_DAO.User1DAO"%>
<%@page import="Project_VO.User1Vo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cmodify.jsp</title>
<link rel="stylesheet" href="./css/cmodify.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
body {
		background-image: url("./game_img_upload/backgroundimg1.jpg");
		background-size: cover;
	}
</style>
<script type="text/javascript" src="./js/httpRequest.js"></script>
		<%
			String id = session.getAttribute("id").toString();
			
			User1DAO dao = new User1DAO();
			User1Vo vo = dao.selectId(id);
			
			
			
		%>
<script type="text/javascript">
	$(function(){
		//수정버튼 눌렀을때
		$("#modify").on('click',function(){
			
		//유효성검사
		if($("#nic").val()==""){
			 	alert("닉네임을 입력해주세요")
			document.frm.nic.focus();
			}else if($("#pw").val()==""){
				alert("비밀번호를 입력해주세요")
				document.frm.pw.focus();
			}else if($("#recheck").val()==""){
				alert("비밀번호확인을 입력해주세요")
				document.frm.recheck.focus();
			}else if($(".radio1:checked").length==0){
				alert("직업을 선택해주세요")
			}
		
			document.frm.action = "cmodifyOk.jsp";
			document.frm.method = "get";
			document.frm.submit();
		
		});//수정버튼 end
		
		//닉네임 중복체크확인
		$("#check_nic").on('click',function()
		{
			
			var txt = $("#nic").val().trim();
			var params = "nic="+encodeURIComponent(txt);
			sendRequest('checknicOk.jsp', params, callback, 'get');

		});//check_nic click end
		
		//비밀번호와 비밀번호 체크 같은지 확인?
		
		$("#modify").click(function(){
			
		if($("#pw").val()!=$("#recheck").val()){
			//alert("비밀번호가 다름니다");
			$("#pw_check").html("<h5>비밀번호가 다릅니다</h5>");
		}
		});//modify click end
		
	
	});//전체function end
	
	function callback() {
		if(xhr.readyState==4 & xhr.status==200){
			var msg1 = xhr.responseText.trim();
			//응답이 true이면 넥네임이 존재합니다 출력
			if(msg1=="true"){
				alert("중복된 닉네임입니다.")
			}else{
				alert("사용가능한 닉네임입니다.")
			}
		}//callback() end
		
	
		
	}
</script>
</head>
<body>
	<div id="regDiv">
		<form action="#" name="frm">
			<input type="hidden" name="cno" value="<%=vo.getCno() %>" />
			<table>
				<tr>
					<th colspan="2">회원정보 수정</th>
					
				</tr>
			
				<tr>
					<th>아이디</th>
					<td>
					
						<label for="id_lb" id="id_lb"><%=vo.getCid() %></label>			
					</td>
				</tr>
				<tr>
					<th>닉네임</th>
					<td>
						<label for="" ><%=vo.getCnic() %></label>
						<input type="text" name="nic" id="nic" autocomplete="off" />
						<input type="button" value="중복체크" id="check_nic" />
						<span id="msg1"></span>
					</td>
				</tr>	
				<tr>
					<th>비밀번호</th>
					<td>
						<input type="password" name="pw" id="pw" class="check_pw" />
					</td>
				</tr>
				<tr>
					<th>비밀번호확인</th>
					<td>
						<input type="password" name="recheck" id="recheck" placeholder=" PW와 똑같이 입력해주세요" class="check_pw"/>
						<span id="pw_check"></span>
					</td>
				</tr>
				<tr>
					<th>성별</th>
					<td><input type="radio" name="gen" id="men" value="1" class="radio1"/>남자
						<input type="radio" name="gen" id="girl" value="2" class="radio1"/>여자
						<input type="radio" name="gen" id="tran" value="3" class="radio1"/>기타
					</td>
				</tr>
				<tr>
					<th>직업</th>
					<td><select name="job" id="job"><option value="-----">----</option>
					<option value="중.고등학생">중.고등학생</option>
					<option value="대학생">대학생</option>
					<option value="주부">주부</option>
					<option value="건물주">건물주</option>
					<option value="기타">기타</option></select>
					
					</td>
				</tr>
				
				<tr>
					<th>전화번호</th>
					<td>
						<input type="text" name="mp0" id="mp0" size="3" disabled="disabled" value="010"/>-
						<input type="text" name="mp1" id="mp1" size="3" />-
						<input type="text" name="mp2" id="mp2" size="3" />	
					</td>
				</tr>
				
				<tr id="botTr">
					<td colspan="2">
						
						<input type="reset" value="리셋" id="reset" /> -->
						<input type="button" value="수정" id="modify"/>
						<a href="main.jsp"><input type="button" value="취소" id="cancel"/> </a>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>