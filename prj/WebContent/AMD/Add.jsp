<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>add</title>

<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script type="text/javascript" src="../se/js/HuskyEZCreator.js" charset="utf-8"></script>

<script type="text/javascript">
	//스마트 에디터 화면에 띄우기 위한 구문
	var oEditors = [];
	
	$(function(){
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors,
			elPlaceHolder : "content",
			sSkinURI : "../se/SmartEditor2Skin.html",
			fCreator : "createSEditor2"
		});
		
	});

	//스마트 에디터 textarea에 작성한 데이터 전달하기
	function submitContents(elClickedObj) {
		// 에디터의 내용이 textarea에 적용된다.
		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
		// 에디터의 내용에 대한 값 검증은 이곳에서
		// document.getElementById("ir1").value를 이용해서 처리한다.
		try {
			elClickedObj.form.submit();
		} catch (e) {
		}
	}

	$(function() {
		//ok버튼을 클릭하면
		$("#ok").click(function() {
			
			var canvasUrl = document.getElementById("canvas").toDataURL();
			
			var input = $("<input>").attr('name', 'canvasUrl').val(canvasUrl);
			
			//canvas에서 얻은 dataURL을 포함해서 전송
			$("#frm").append($(input));
			document.frm.action = "addOk.jsp";
			document.frm.method = "post";
			
			//스마트 에디터값을 전송
			submitContents($('#ok'));
			//폼을 전송
			document.frm.submit();

		});
		$("#reset").click(function(){
			    // canvas
			    var cnvs = document.getElementById('canvas');
			    // context
			    var ctx = canvas.getContext('2d');

			    // 픽셀 정리
			    ctx.clearRect(0, 0, cnvs.width, cnvs.height);
			    // 컨텍스트 리셋
			    ctx.beginPath();

		});
	});
	
</script>

<style type="text/css">
*{
	margin: 0;
	padding: 0;
}
div{
	margin: auto;
}
#formwrapper {
	border: 1px solid gray;
	margin: auto;
	width: 800px
}

#title, #draw, #file, #content {
	width: 790px;
}

#buttons {
	text-align: center;
}
#ok, #cancel{
	width : 100px;
	height: 25px;
	background-color: white;
}
#canvas {
	border: 1px solid black;
	margin: auto;
	background-color: white;
}
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
			<div>
				이미지파일 <br /> <input type="file" name="file" id="file" />
			</div>

			그림그리기 <input type="button" value="캔버스 리셋" id='reset'/>
			<div id="draw">
				<canvas name="canvas" id="canvas" width="790" height="400"></canvas>
				<script src="canvas.js"></script>
			</div>
			<!-- <input type="hidden" id='canvasUrl' /> -->

			<div id="buttons">
				<input type="button" value="작성" name="ok" id="ok" /> 
				<input type="button" value="취소" name="cancel" id="cancel" />
			</div>
		</form>
	</div>
	

</body>
</html>