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

<style type="text/css">



</style>

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
			<h6>파일의 왼쪽에 있는 버튼으로 선택한 이미지가 섬네일이 됩니다</h6>
			<div id="fileDiv">
				<input type="button" value=" 파일추가 " id="addTagButton" />
				이미지파일 <br />
				
			</div>
			

			그림그리기 <input type="button" value="캔버스 리셋" id='reset'/><br />
			R <input type="range" class='slider' id="R" min="0" max="255" value="0" />
			G <input type="range" class='slider' id="G" min="0" max="255" value="0" />
			B <input type="range" class='slider' id="B" min="0" max="255" value="0" />
			A <input type="range" class='slider' id="A" min="0" max="1"  step="0.1" value="1" />
			<!-- 컬러박스 -->
			<span id="colorBox" ></span>
			<br />
			
			두께
			<input type="range" class='slider' id="thickRange" min="1" value="1" max="20"/>
			
			
			
			<div id="draw">
				<canvas name="canvas" id="canvas" width="790" height="400"></canvas>
				<script src="canvas.js"></script>
			</div>
			<input type="radio" name="thumb" value="-1" />


			<div id="buttons">
				<input type="button" value="작성" name="ok" id="ok" /> 
				<input type="button" value="취소" name="cancel" id="cancel" />
			</div>
		</form>
	</div>
	

</body>
</html>