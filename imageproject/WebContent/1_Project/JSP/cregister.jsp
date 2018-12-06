<%@page import="Project_VO.User1Vo"%>
<%@page import="Project_DAO.User1DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cregister.jsp</title>
<link rel="stylesheet" href="./css/cregister.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="../JS/httpRequest.js"></script>
<script type="text/javascript" src="../JS/cregister.js">

</script>
<style>
body {
		background-image: url("./game_img_upload/backgroundimg1.jpg");
		background-size: cover;
	}
</style>
</head>
<body>
	<!-- div#regDiv>form>table>(tr>th+td>input:text)*7 -->
	
	<div id="regDiv">
		<form action="#" name="frm">
			<table>
				<tr>
					<th>회원가입</th>
					<td></td>
				</tr>
			
				<tr>
					<th>아이디</th>
					<td>
						<%
							User1DAO dao = new User1DAO();
							User1Vo vo = new User1Vo();
							
						%>
						<input type="text" name="id" id="id" autocomplete="off" />								
					
						<span id="msg"></span>
											
					</td>
				</tr>
				<tr>
					<th>닉네임</th>
					<td>
						<input type="text" name="nic" id="nic" autocomplete="off" />
						<span id="msg1"></span>
					</td>
				</tr>	
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="pw" id="pw"  /></td>
				</tr>
				<tr>
					<th>비밀번호확인</th>
					<td><input type="password" name="recheck" id="recheck" placeholder=" PW와 똑같이 입력해주세요"/></td>
				</tr>
				<tr>
					<th>성별</th>
					<td><input type="radio" name="gen" id="men" value="1"/>남자
						<input type="radio" name="gen" id="girl" value="2"/>여자
						<input type="radio" name="gen" id="tran" value="3"/>기타
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
						<input type="text" name="mp1" id="mp1" size="3" autocomplete="off"/>-
						<input type="text" name="mp2" id="mp2" size="3"  autocomplete="off"/>	
					</td>
				</tr>
				
				<tr id="botTr">
					<td colspan="2">
						<input type="button" value="가입" id="joinmember"/>
						<input type="reset" value="리셋" id="reset" />
						<!-- <input type="button" value="수정" id="modify"/>
						<input type="button" value="삭제" id="delete"/> -->
					</td>
				</tr>
			</table>
		</form>
	</div>
	
	
</body>
</html>