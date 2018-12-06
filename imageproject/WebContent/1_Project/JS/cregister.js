$(document).ready(function (){		

		$("#joinmember").on('click', function(){

			//console.log("click");

			/* var id = document.getElementById("id");

			console.log(id); */

			

			/* var id = document.frm.id.value;

			console.log(id); */

			

			if($("#id").val()==""){

				alert("아이디를 입력하세요");

				document.frm.id.focus();

				return;

			}

			else if($("#pw").val()==""){

				alert("패스워드를 입력하세요");

				document.frm.pw.focus();

				return;

			}

			else if($("#recheck").val()==""){

				alert("다시 한 번 입력하세요");

				document.frm.recheck.focus();

				return;

			}

			else if($("#gen").val()==""){

				alert("성별 구분하시오");

				document.frm.gen.focus();

				return;

			}

			else if($("#job").val()==""){

				alert("직업을 입력하시오");

				document.frm.job.focus();

				return;

			}

			else if($("#mp1").val()==""){

				alert("가운데 번호를 입력하세요");

				document.frm.mp1.focus();

				return;

			}

			else if($("#mp2").val()==""){

				alert("마지막 번호를 입력하세요");

				document.frm.mp2.focus();

				return;

			}

			

			

			else if($("#pw").val() != $("#recheck").val()){

				alert("같은 비밀번호가 아닙니다.");

				document.frm.recheck.focus();

				return;

			}

			

			document.frm.action = "cregisterOk.jsp";

			document.frm.method = "post";

			document.frm.submit();

		});

		

		$("#modify").on('click', function(){

			location.href = "cmodify.jsp"

		});

		

		$("#delete").on('click', function(){

			location.href = "cdelete.jsp"

		});

		

		/* $('#checkId').click(function(){

			var id = document.getElementById("id").value;

			alert(id+"사용가능");

		}); */

		

		//ID 중복체크

		$("#id").focus();

		

		// 입력 중에 중복여부를 체크 (실시간 입력값)

		$("#id").on('keyup',checkup);

		

		});//$(function) end

	

	function checkup() {

		//console.log("checkup click");

		var txt = $('#id').val().trim(); // trim() : 공백제거함수

		var params = "id="+encodeURIComponent(txt);

			

		sendRequest('checkidOk.jsp',params,callback,'get');

	}//checkup end

	

	function callback() {

		if(xhr.readyState==4 & xhr.status==200){

			

			var msg = xhr.responseText.trim();

			

			// 응답이 true이면 span에 이이디가 존재합니다 출력

			// 응답이 false면 span에 사용가능한 아이디입니다 출력

			

			if(msg=="true"){

				$("#msg").html('<h5>아이디가 존재합니다</h5>');

			}else {

				$("#msg").html('<h5>사용 가능한 아이디입니다</h5>');

			}

		}

	}//callback end

	

	$(document).ready(function (){	

	$("#nic").focus();

	$("#nic").on('keyup',checkup1);

	});//$(function) end

	 function checkup1() {

		var txt1 = $("#nic").val().trim();

		var params = "nic="+encodeURIComponent(txt1);

		

		sendRequest('checknicOk.jsp', params, callback1, 'get');

	}//checkup1 end

	

	function callback1(){

		if(xhr.readyState==4 & xhr.status==200){

			var msg1 = xhr.responseText.trim();

			//응답이 true이면 span에 아이디가 존재합니다 출력

			if(msg1=="true"){

				$("#msg1").html('<h5>닉네임이 존재합니다</h5>');

			}else {

				$("#msg1").html('<h5>사용 가능한 닉네임입니다</h5>');

			}

		}

	}  