<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>add</title>

<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script type="text/javascript" src="../se/js/HuskyEZCreator.js" charset="utf-8"></script>

<script type="text/javascript" src="add.js" ></script>

<link rel="stylesheet" href="add.css">

<%
//임시id 생성
	//session.setAttribute("id", "id");
	
//id를 받지 못한 경우 메인으로 이동시키기(현재는 임시페이지)
	 if(session.getAttribute("id") == null){
		response.sendRedirect("TempList.jsp");
		return ;
	}

%>

</head>
<body>

	<div id="formwrapper">
		<form action="" id="frm" name="frm" enctype="multipart/form-data">
			<input type="hidden" value="<%=session.getAttribute("id")%>"
				name="id" />
			<!--세션으로 id 받는 부분  -->
			<div>
				제목 <br /> <input type="text" name="title" id="title" />
			</div>
			<div>
				<!-- 스마트에디터 -->
				본문 <br />
				<textarea rows="25" cols="50" id="content" name="content"></textarea>
			</div>
			
			<h6>파일의 왼쪽에 있는 버튼으로 선택한 이미지가 섬네일이 됩니다(선택하지 않을시 캔버스에 그린 그림이 섬네일이 됩니다.)</h6>
			<!-- 이미지 파일 추가, 섬네일 -->
			<div id="fileDiv">
				<input type="button" value=" 파일추가 " id="addTagButton" />
				이미지파일 <br />
				
			</div>
			
			<!-- Red, Green, Blue, Alpha 슬라이더 -->
			그림그리기 <input type="button" value="캔버스 리셋" id='reset'/><br />
			<b id="fontR">R</b> <!-- 붉은색 조절 -->
			<input type="range" class='slider' id="R" min="0" max="255" value="0" />
			<b id="fontG">G</b> <!-- 녹색조절 -->
			<input type="range" class='slider' id="G" min="0" max="255" value="0" />
			<b id="fontB">B</b> <!-- 파란색조절 --> 
			<input type="range" class='slider' id="B" min="0" max="255" value="0" />
			<b id="fontA">A</b> <!-- 투명도 조절 -->
			 <input type="range" class='slider' id="A" min="0" max="1"  step="0.1" value="1" />
			<!-- 컬러박스 : 현재 색을 표시 -->
			<span id="colorBox" ></span>
			<br />
			
			<!-- 선의 두께설정--> 두께
			<input type="range" class='slider' id="thickRange" min="1" value="1" max="20"/>
			
			<div id="draw">
			<!-- 그림을 그릴 캔버스 -->
				<canvas name="canvas" id="canvas" width="790" height="400"></canvas>
				<script src="canvas.js"></script>
			</div>
			<!-- 썸네일을 자신이 그린 그림으로 받고 싶은 경우  -->
			<input type="radio" name="thumb" value="-1" />

			<!-- 작성버튼 취소버튼 -->
			<div id="buttons">
				<input type="button" value="작성" name="ok" id="ok" /> 
				<input type="button" value="취소" name="cancel" id="cancel" />
			</div>
		</form>
	</div>
	

</body>
</html>