<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#canvas{
	border: 1px solid;
	}
	#img{
	width :780px;
	height :400px;
	border: 1px solid;
	}
</style>
<script type="text/javascript">

	function save(){
		var can = document.getElementById("canvas");
		var dataUrl = can.toDataURL();
		var ta = document.getElementById("ta");
		ta.innerHTML = dataUrl;
		
		document.getElementById("img").src=dataUrl;
		
	/* 	var image = new Image();
		image.src = dataUrl;
		image.onload = function(){
			  copyContext.drawImage(image,0,0);
		  } */

	}
</script>
</head>
<body>
<form action="#">
	<canvas id = "canvas" width="780" height="400"></canvas>
	<script src="./AMD/canvas.js"></script>
	<input type="button" value="저장" onclick="save()" />
			
	toDataURL()	
</form>
<textarea rows="20" cols="20" id="ta"></textarea><br />
<img src="" alt="" id="img"/>
</body>
</html>