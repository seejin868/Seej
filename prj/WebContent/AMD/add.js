/**
 * 
 */


//추가해야할 것 들 취소버튼누르면 메인으로 이동

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
		
		//파일태그 추가
		var fileNumber = 0;
		$("#addTagButton").click(function(){
			fileNumber+=1;
			var fileTag = $("<input>").attr('name','file'+fileNumber);
			fileTag.attr('type','file');
			//console.log(fileTag);
			$("#fileDiv").append(fileTag);
			$("#fileDiv").append("<br/>");
		});
		
		//ok버튼을 클릭하면
		$("#ok").click(function() {
			
			//타이틀 부분이 없으면 경고
			if($('#title').val().trim() == "" ){
				
				$("#title").focus();
				alert("타이틀이 없습니다");
				return;
			}
			
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
		//색변경
		$("#R,#G,#B,#A").change(function() {
			console.log("ok");
			var r = $("#R").val();
			var g = $("#G").val();
			var b = $("#B").val();
			var a = $("#A").val();
			console.log(a);
			changeColor(r,g,b,a);
		});
		
		//선 굵기 변경
		$("#thickRange").change(function() {
			var thickness = $(this).val();
			console.log(thickness);
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
	