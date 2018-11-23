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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script type="text/javascript">

	function save(){
		var can = document.getElementById("canvas");
		var dataUrl = can.toDataURL("image/png");
		var ta = document.getElementById("ta");
		ta.innerHTML = dataUrl;
		
		document.getElementById("img").src=dataUrl;
		
		document.frm.action="practiceReceiver.jsp"
		document.frm.method="POST";
		document.frm.submit();
		
		/* xhttp.open("POST", "drawURLinfo.txt", true);
		xhttp.send(); */
	/* 	var image = new Image();
		image.src = dataUrl;
		image.onload = function(){
			  copyContext.drawImage(image,0,0);
		  } */

	}
	
	/* 
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
	} */
	//캔버스를 업로드?
		/* function uploadCanvasData()
		{
		    var canvas = $('#canvas').get(0);
		    var dataUrl = canvas.toDataURL("image/jpeg");

		    var blob = dataURItoBlob(dataUrl);

		    var formData = new FormData();
		    formData.append("file", blob);

		    var request = new XMLHttpRequest();
		  //  request.onload = completeRequest;

		    request.open("POST", "practiceReceiver.jsp");
		    request.send(formData);
		} */
	
</script>
</head>
<body>
<form action="#" name='frm'>
	<canvas id = "canvas" width="780" height="400"></canvas>
	<script src="./AMD/canvas.js"></script>
	<input type="button" value="저장" onclick="save()" />
		
	<textarea rows="20" cols="20" id="ta" name="ta"></textarea><br />
	<%=application.getRealPath("") %>
</form>
<img src="" alt="" id="img"/>
</body>
</html>