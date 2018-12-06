/**
 * 
 */


//추가해야할 것 들 취소버튼누르면 메인으로 이동

	//스마트 에디터 화면에 띄우기 위한 구문
	var oEditors = [];
	
	//스마트에디터 id설정 경로설정
	$(function(){
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors,
			elPlaceHolder : "content",//id
			sSkinURI : "./se/SmartEditor2Skin.html",//경로
			fCreator : "createSEditor2"
		});
		
	});

	//스마트 에디터 textarea에 작성한 데이터 전달하기
	function submitContents(elClickedObj) {
		// 에디터의 내용이 textarea에 적용된다.
		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);//getById[] []내부에 id변경
		// 에디터의 내용에 대한 값 검증은 이곳에서
		// document.getElementById("ir1").value를 이용해서 처리한다.
		try {
			elClickedObj.form.submit();
		} catch (e) {
		}
	}

	$(function() {
		
		//파일태그 추가
		var fileNumber = 0;
		//파일 추가 버튼 클릭시
		$("#addTagButton").click(function(){
			
			//썸네일 input:radio태그 추가
			var radio = $("<input>").attr('name','thumb');
			radio.attr('type','radio');
			radio.val(fileNumber);//value값을 준다 (0부터)
			
			//파일태그추가
			var fileTag = $("<input>").attr('name','file'+fileNumber);
			fileTag.attr('type','file');
			
			//추가 
			$("#fileDiv").append(radio);
			$("#fileDiv").append(fileTag);
			$("#fileDiv").append("<br/>");
			
			fileNumber++;
		});
		
		//취소버튼을 클릭하면 페이지 이동
		$("#cancel").click(function() {
			//합칠 시 메인 페이지로 변경 (현재는 임시 페이지)
			location.href = "main.jsp";
		});
		
		//ok버튼을 클릭하면
		$("#ok").click(function() {
			
			//타이틀 부분이 없으면 경고창을 띄운다
			if($('#title').val().trim() == "" ){
				//타이틀에 포커스
				$("#title").focus();
				alert("타이틀이 없습니다");
				return;
			}
			//캔버스에서 dataURL을 얻어서 변수에 저장
			var canvasUrl = document.getElementById("canvas").toDataURL();
			
			//input태그의 value에 canvasUrl을 넣는다
			var input = $("<input>").attr('name', 'canvasUrl').val(canvasUrl);
			input.attr('type','hidden');
			
			//canvas에서 얻은 dataURL을 포함해서 전송
			$("#frm").append($(input));
			document.frm.action = "addOk.jsp";
			document.frm.method = "post";
			
			//스마트 에디터값을 전송
			submitContents($('#ok'));
			
			//폼을 전송
			document.frm.submit();

		});
		
		//색변경
		$("#R,#G,#B,#A").change(function() {//rgba를 변경해서
			
			//console.log( $("#colorBox").val() );
			
			//console.log("ok");
			var r = $("#R").val();
			var g = $("#G").val();
			var b = $("#B").val();
			var a = $("#A").val();
			//console.log(a);
			changeColor(r,g,b,a);
			
			//컬러박스
			$("#colorBox").css('background' , "rgba(" +r+ "," +g+ "," +b+ "," +a+ ")");
			
		});
		
		//선 굵기 변경
		$("#thickRange").change(function() {
			var thickness = $(this).val();
			//canvas.js의 함수 실행
			changeThicknessLine(thickness);
		});

		//캔버스 리셋
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
	