/**
 * 
 */

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
		
		//그린 그림 불러오기
		firstDraw();
		
		//파일태그 추가
		var fileNumber = 0;
		$("#addTagButton").click(function(){
			
			//썸네일 태그 추가
			var radio = $("<input>").attr('name','thumb');
			radio.attr('type','radio');
			radio.val(fileNumber);
			
			//파일태그추가
			var fileTag = $("<input>").attr('name','file'+fileNumber);
			fileTag.attr('type','file');
			
			//추가 
			$("#fileDiv").append(radio);
			$("#fileDiv").append(fileTag);
			$("#fileDiv").append("<br/>");
			
			fileNumber+=1;
		});
		
		//삭제버튼 누르면 deleteOk.jsp로 이동
		$("#del").click(function(){
			
			document.frm.action = "deleteOk.jsp";
			document.frm.method = "post";
			//폼을 전송
			document.frm.submit();
		});
		
		//취소버튼을 클릭하면 페이지 이동
		$("#cancel").click(function() {
			//합칠 시 메인 페이지로 변경 (현재는 임시 페이지)
			location.href = "TempList.jsp";
		});
		
		//ok버튼을 클릭하면 전송
		$("#ok").click(function() {
			console.log(ok);
			
			//타이틀 부분이 없으면 경고
			if($('#title').val().trim() == "" ){
				$("#title").focus();
				alert("타이틀이 없습니다");
				return;
			}
			
			var canvasUrl = document.getElementById("canvas").toDataURL();
			var input1 = $("<input>").attr('name', 'canvasUrl').val(canvasUrl);
			input1.attr('type', 'hidden');
			
			//canvas에서 얻은 dataURL을 포함해서 전송
			//form에 추가
			$("#frm").append($(input1));
			
			document.frm.action = "modifyOk.jsp";
			document.frm.method = "post";
			
			//스마트 에디터값을 전송
			submitContents($('#ok'));
			//폼을 전송
			document.frm.submit();

		});
		
		//색변경
		$("#R,#G,#B,#A").change(function() {
		//	console.log("ok");
			var r = $("#R").val();
			var g = $("#G").val();
			var b = $("#B").val();
			var a = $("#A").val();
		//	console.log(a);
			changeColor(r,g,b,a);
			
			$("#colorBox").css('background' , "rgba(" +r+ "," +g+ "," +b+ "," +a+ ")");
			
		});
		
		//선 굵기 변경
		$("#thickRange").change(function() {
			var thickness = $(this).val();
			//console.log(thickness);
			changeThicknessLine(thickness);
		});
		
		//리셋버튼을 누르면 화면지우기
		$("#reset").click( resetCanvas );
		
		//처음으로 버튼 누를시 맨처음 그림을 다시 불러온다
		$("#init").click(function(){
			resetCanvas();
			firstDraw();
		});
	});
	//canvas 리셋
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
        //이미지 불러오기(jsp파일에 hidden으로 넣어놓은 것을 불러옴)
        imgClo.src= $("#drawPath").val();
        
        //페이지 로드후 이미지가 로드 되었을 때 이미지 출력
        imgClo.addEventListener('load', function(){
            //로드된 이미지를 캔버스에 출력
            var cvs = document.getElementById('canvas');
            var ctx = cvs.getContext("2d");

            ctx.drawImage( imgClo , 0, 0, cvs.width, cvs.height);
       
        },false);

       
   
    }
	