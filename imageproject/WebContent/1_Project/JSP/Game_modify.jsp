<%@page import="Project_VO.GameVO"%>
<%@page import="Project_DAO.GameDAO"%>
<%@page import="Project_DAO.AnswerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Game_modify.jsp</title>
<link rel="stylesheet" type="text/css" href="./css/Game_Add.css?dalaazzzzlh">
<style type="text/css">
	#canvas_div {
		border-image: url(./game_img_upload/note.png) 30 round;
		border-radius: 20px;
	}
	input[type="range"] {
		-webkit-appearance: none;
		border: 1px solid;
		height: 10px;
		width: 100px;
	}
	input[type="range"]::-webkit-slider-thumb {
		-webkit-appearance: none;
		appearence: none;
		width: 10px;
		height: 10px;
		border: 1px solid;
	}
</style>
<%
	String gno = request.getParameter("g_no");

	GameDAO dao = new GameDAO();
	AnswerDAO a_dao = new AnswerDAO();
	
	if(gno!=""){
		int g_no = Integer.parseInt(gno);
		GameVO vo = dao.getDetail(g_no);
		
		String tag = a_dao.getTag(vo.getAnswer());
		
%>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		// 파일 호출
		firstDraw();
		
		//ok버튼을 클릭하면
		$("#ok").click(function() {
			if($("#title").val()==""){
				alert("제목을 입력해주세요");
				document.frm.title.focus();
				return;
			}
			if($("#content").val()==""){
				alert("본문을 입력해주세요");
				document.frm.content.focus();
				return;
			}
			
			var canvasUrl = document.getElementById("canvas").toDataURL();
			
			var input = $("<input>").attr('name', 'canvasUrl').val(canvasUrl);
						
			//canvas에서 얻은 dataURL을 포함해서 전송
			$("#frm").append($(input));
			
			document.frm.action = "Game_AddOk.jsp";
			document.frm.method = "post";
			document.frm.submit();
		});
		
		//색변경
		$("#R,#G,#B,#A").change(function() {
			console.log("ok");
			var r = $("#R").val();
			var g = $("#G").val();
			var b = $("#B").val();
			var a = $("#A").val();
			console.log(a);
			changeColor(r,g,b,a);
			
			//컬러박스
			$("#colorBox").css('background' , "rgba(" +r+ "," +g+ "," +b+ "," +a+ ")");
		});
		
		//선 굵기 변경
		$("#thickRange").change(function() {
			var thickness = $(this).val();
			console.log(thickness);
			changeThicknessLine(thickness);
		});
		
		//캔버스 리셋
		$("#reset").click(function(){
			var reset = confirm("정말 지우시겠습니까?");
			if(reset==true){
			    // canvas
			    var cnvs = document.getElementById('canvas');
			    // context
			    var ctx = canvas.getContext('2d');
	
			    // 픽셀 정리
			    ctx.clearRect(0, 0, cnvs.width, cnvs.height);
			    // 컨텍스트 리셋
			    ctx.beginPath();
			}
		});
			
		// 목록으로 돌아가기
		$("#backHome").click(function(){
			location.href = "GameList.jsp";
		});
		
		
		
	});
	
	function firstDraw(){
        //이미지 객체 생성
        var imgClo = new Image();
        imgClo.src= "<%=vo.getG_file() %>";
        
        //페이지 로드후 이미지가 로드 되었을 때 이미지 출력
        imgClo.addEventListener('load', function(){
            //로드된 이미지를 캔버스에 출력
            var cvs = document.getElementById('canvas');
            var ctx = cvs.getContext("2d");

            //canvas.drawImage() 함수를 사용하여 이미지 출력
            //drawImage ( image sx, sy, sWidth, sHeight, dx, dy, dWidth, dHeight)
            ctx.drawImage( imgClo , 0, 0, cvs.width, cvs.height);
       
        },false);
	}
        
	//색변경
	function changeColor( r,g,b,a){
		//ctx.strokeStyle = color;
		ctx.strokeStyle = "rgba(" + r +","+ g +","+ b +"," + a +")";
	}
	
	//선 굵기 변경
	function changeThicknessLine(thick){
		ctx.lineWidth = thick;
	}
</script>
</head>
<body>
	 <%@include file="header_test.jsp" %> 
	<div id="formwrapper">
		<form id="frm" name="frm">
			<!--세션으로 id 받는 부분  -->
			<input type="hidden" value="<%=session.getAttribute("id")%>" name="id" />
			<div id="answer_div">
				<span>문제 :</span><input type="text" name="answer" id="answer" value="<%=vo.getAnswer() %>" readonly="readonly" />
				<span>태그 :</span><input type="text" name="tag" id="tag" value="<%=tag %>" readonly="readonly"/>
			</div>
			<div id="head_div">
				<div id="title_div">
					<span id="title_span">제목</span>&nbsp&nbsp<input type="text" name="title" id="title" value="<%=vo.getG_title() %>"/>
				</div>
				<div id="content_div">
					<span id="content_span">내용</span>&nbsp&nbsp<input type="text" name="content" id="content" value="<%=vo.getG_content() %>" />
				</div>
			</div>
			<div id="draw">
				<div id="colorChange">
					<span id="red">R</span><input type="range" id="R" min="0" max="255" value="0" />
					<span id="green">G</span><input type="range" id="G" min="0" max="255" value="0" />
					<span id="blue">B</span><input type="range" id="B" min="0" max="255" value="0" />
					<br />
					<span>A</span><input type="range" id="A" min="0" max="1"  step="0.1" value="1" />
					<span>두께</span><input type="range" id="thickRange" min="1" value="1" max="20" />
					<div id="colorBox" ></div>
					<input type="button" value="캔버스 리셋" id='reset'/>
				</div>
				<div id="canvas_div">
					<canvas name="canvas" id="canvas" width="400px" height="600px"></canvas>
				</div>
				<script src="./js/canvas.js"></script>
			<div id="buttons">
				<input type="button" value="수정" name="ok" id="ok" /> 
				<input type="button" value="취소" name="cancel" id="cancel" />
			</div>
			</div>
		</form>
	</div>
	<div id="backHome">
		<img src="./game_img_upload/backHome.png" alt="LIST" id="backHome_img"/>
		<br />
		목록
	</div>
	<%
					}
	%>
</body>
</html>