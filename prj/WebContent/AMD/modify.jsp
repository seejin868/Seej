<%@page import="vo.PostimgVO"%>
<%@page import="dao.PostimgDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modify</title>
<%
//추가해야할 것 들 취소버튼누르면 메인으로 이동
	//pno를 받는다
	String ParaPno = request.getParameter("pno");

	//pno가 없는 경우 메인으로 이동
	if(ParaPno == null){
		response.sendRedirect("TempList.jsp");//나중에 메인페이지로 바꿀 예정
		return;
	}
	
	PostimgDAO dao = new PostimgDAO();
	
	int pno = Integer.parseInt( ParaPno );
	PostimgVO vo =  dao.getOne(pno);//pno로 받아온 vo객체를 받아온다
	
%>
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
		//타이틀
		$("#title").val('<%=vo.getPtitle() %>');
		//본문
		$("#content").val("<%=vo.getPcontent()%>");
		
		//그린 그림 불러오기
		firstDraw();
		
		//파일태그 추가
		var fileNumber = 0;
		$("#addTagButton").click(function(){
			//console.log("ok");
			fileNumber+=1;
			var fileTag = $("<input>").attr('name','file'+fileNumber);
			fileTag.attr('type','file');
			//console.log(fileTag);
			$("#fileDiv").append(fileTag);
			$("#fileDiv").append("<br/>");
		});
		
		//삭제버튼 누르면 deleteOk.jsp로 이동
		$("#del").click(function(){
			//input 추가
			var input2 = $("<input>").attr('name', 'pno').val('<%=vo.getPno()%>');
			//form에 추가
			$("#frm").append($(input2));
			document.frm.action = "deleteOk.jsp";
			document.frm.method = "post";
			//폼을 전송
			document.frm.submit();
		});
		
		//ok버튼을 클릭하면 전송
		$("#ok").click(function() {
			
			//타이틀 부분이 없으면 경고
			if($('#title').val().trim() == "" ){
				
				$("#title").focus();
				alert("타이틀이 없습니다");
				
				return;
			}
			
			var canvasUrl = document.getElementById("canvas").toDataURL();
			
			var input1 = $("<input>").attr('name', 'canvasUrl').val(canvasUrl);
			var input2 = $("<input>").attr('name', 'pno').val('<%=vo.getPno()%>');
			
			//canvas에서 얻은 dataURL을 포함해서 전송
			//form에 추가
			$("#frm").append($(input1));
			$("#frm").append($(input2));
			
			document.frm.action = "modifyOk.jsp";
			document.frm.method = "post";
			
			//스마트 에디터값을 전송
			submitContents($('#ok'));
			//폼을 전송
			document.frm.submit();

		});
		
		//리셋버튼을 누르면 화면지우기
		$("#reset").click( resetCanvas );
		
		$("#init").click(function(){
			resetCanvas();
			firstDraw();
		});
	});
	
	function resetCanvas(){
		// canvas
	    var cnvs = document.getElementById('canvas');
	    // context
	    var ctx = canvas.getContext('2d');

	    // 픽셀 정리
	    ctx.clearRect(0, 0, cnvs.width, cnvs.height);
	    // 컨텍스트 리셋
	    ctx.beginPath();
	}
	
	function firstDraw(){
        //이미지 객체 생성
        var imgClo = new Image();
        imgClo.src= '<%=vo.getPdraw() %>' ;
        
        //페이지 로드후 이미지가 로드 되었을 때 이미지 출력
        imgClo.addEventListener('load', function(){
            //로드된 이미지를 캔버스에 출력
            var cvs = document.getElementById('canvas');
            var ctx = cvs.getContext("2d");

            //canvas.drawImage() 함수를 사용하여 이미지 출력
            //drawImage ( image sx, sy, sWidth, sHeight, dx, dy, dWidth, dHeight)
            ctx.drawImage( imgClo , 0, 0, cvs.width, cvs.height);
       
        },false);

        //이미지 경로 설정
       
   
    }
	
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
#ok, #cancel, #del{
	width : 100px;
	height: 25px;
	background-color: white;
}
#canvas {
	border: 1px solid black;
	margin: auto;
	background-color: white;
}
#addTagButton, #reset, #init{
	background-color: white;
}
</style>

</head>
<body>

	<div id="formwrapper">
		<form action="" id="frm" name="frm" enctype="multipart/form-data">
			<input type="hidden" value='<%=session.getAttribute("id")%>'
				name="id" />
			<!--세션으로 id 받는 부분  -->
			<div>
				제목 <br /> <input type="text" name="title" id="title"/>
			</div>
			<div>
				<!-- 스마트에디터 -->
				본문 <br />
				<textarea rows="25" cols="50" id="content" name="content" ></textarea>
			</div>
			<div id="fileDiv">
				<input type="button" value=" 파일추가 " id="addTagButton" />
				이미지파일 <br /> <input type="file" name="file" id="file" />
			</div>

			그림그리기 <input type="button" value="처음으로" id='init'/>
			<input type="button" value="완전 리셋" id='reset'/>
			<div id="draw">
				<canvas name="canvas" id="canvas" width="790" height="400" ></canvas>
				<script src="canvas.js"></script>
			</div>
			<!-- <input type="hidden" id='canvasUrl' /> -->

			<div id="buttons">
				<input type="button" value="작성" name="ok" id="ok" /> 
				<input type="button" value="취소" name="cancel" id="cancel" />
				<input type="button" value="삭제" name="del" id="del" />
				
			</div>
		</form>
	</div>
	

</body>
</html>