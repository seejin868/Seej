<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>add</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

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
/* 	window.onload = function() {
		
	}; */

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
		$("#ok").click(function() {
			//console.log("ok");
			var canvasUrl = document.getElementById("canvas").toDataURL();
			//alert(canvasUrl);
			
			

			var input = $("<input>").attr('name', 'canvasUrl').val(canvasUrl);
			
			//var dataURL = canvas.toDataURL('image/jpeg', 0.5);
			//var canvas = document.getElementById("canvas");
			//var dataURL = canvas.toDataURL('image/png');
			/* 
			var blob = dataURItoBlob(dataURL);
			//var blob = dataURItoBlob(canvasUrl);
			
			var fd = new FormData(document.forms[0]);
			//fd.append("canvasImage", blob);
			 */
			//var input = $("<input>").attr('name', 'canvasUrl').val(blob);
			
			$("#frm").append($(input));
			//$("#frm").append($(input));
			document.frm.action = "addOk.jsp";
			document.frm.method = "post";
			document.frm.submit();

			//});
		});
	});
	
	//그린 그림을 변환
	function dataURItoBlob(dataURI) {
    // convert base64/URLEncoded data component to raw binary data held in a string
    var byteString;
    if (dataURI.split(',')[0].indexOf('base64') >= 0)
        byteString = atob(dataURI.split(',')[1]);
    else
        byteString = unescape(dataURI.split(',')[1]);

    // separate out the mime component
    var mimeString = dataURI.split(',')[0].split(':')[1].split(';')[0];

    // write the bytes of the string to a typed array
    var ia = new Uint8Array(byteString.length);
    for (var i = 0; i < byteString.length; i++) {
        ia[i] = byteString.charCodeAt(i);
    }

    return new Blob([ia], {type:mimeString});
}
//캔버스를 업로드?
	function uploadCanvasData()
	{
	    var canvas = $('#ImageDisplay').get(0);
	    var dataUrl = canvas.toDataURL("image/jpeg");

	    var blob = dataURItoBlob(dataUrl);

	    var formData = new FormData();
	    formData.append("file", blob);

	    var request = new XMLHttpRequest();
	    request.onload = completeRequest;

	    request.open("POST", "IdentifyFood");
	    request.send(formData);
	}
	
	
</script>

<style type="text/css">
#formwrapper {
	/* position: relative; */
	/* padding: auto; */
	border: 1px solid gray;
	margin: auto;
	width: 800px
}

#title, #draw, #file, #content {
	width: 790px;
}

#draw {
	/* width: 790px; */
	/* height: 400px; */
	
}

#buttons {
	text-align: center;
}

#canvas {
	/* left : 20%; */
	border: 1px solid green;
	margin: auto;
	background-color: white;
}
</style>

</head>
<body>

	<div id="formwrapper">
		<form action="" id="frm" name="frm" method="get">
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

			그림그리기
			<div id="draw">
				<canvas name="canvas" id="canvas" width="780" height="400"></canvas>
				<script src="canvas.js"></script>
			</div>
			<!-- <input type="hidden" id='canvasUrl' /> -->

			<div id="buttons">
				<input type="button" value="작성" name="ok" id="ok" /> <input
					type="button" value="취소" name="cancel" id="cancel" />
			</div>
		</form>
	</div>
	

</body>
</html>