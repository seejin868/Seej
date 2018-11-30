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
	String[] filePath = vo.getPfile().split(",");
	
%>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script type="text/javascript" src="../se/js/HuskyEZCreator.js" charset="utf-8"></script>

<script type="text/javascript" src="modify.js" ></script>

<link rel="stylesheet" href="add.css">

</head>
<body>

	<div id="formwrapper">
		<form action="" id="frm" name="frm" enctype="multipart/form-data">
			<input type="hidden" value='<%=session.getAttribute("id")%>'
				name="id" />
			<!--세션으로 id 받는 부분  -->
			<div>
				<input type="hidden" name="pno" value="<%=vo.getPno() %>" />
				<input type="hidden" id="drawPath" value="<%=vo.getPdraw() %>" />
				제목 <br /> <input type="text" name="title" id="title" value="<%=vo.getPtitle() %>"/>
			</div>
			<div>
				<!-- 스마트에디터 -->
				본문 <br />
				<textarea rows="25" cols="50" id="content" name="content" ><%=vo.getPcontent() %></textarea>
			</div>
			<div id="fileDiv">
			체크 해제시 DB에서 삭제 <br />
				<%
					int i = 0;
					for(String src:filePath){
						out.println("<img src='"+src+"' height='100'>");
						out.println("<input type='checkbox' name='checkBoxes' id='checkBoxes' checked='checked' value='"+src+"' /> <br/>");
					}
				%>
				<input type="button" value=" 파일추가 " id="addTagButton" />
				이미지파일 <br />
			</div>

			그림그리기 <input type="button" value="처음으로" id='init'/>
			<input type="button" value="완전 리셋" id='reset'/><br />
			R <input type="range" class="slider" id="R" min="0" max="255" value="0" />
			G <input type="range" class="slider" id="G" min="0" max="255" value="0" />
			B <input type="range" class="slider" id="B" min="0" max="255" value="0" />
			A <input type="range" class="slider" id="A" min="0" max="1"  step="0.1" value="1" /><br />
			두께
			<input type="range" class="slider" id="thickRange" min="1" value="1" max="20"/>
			<div id="draw">
				<canvas name="canvas" id="canvas" width="790" height="400" ></canvas>
				<script src="canvas.js"></script>
			</div>
			<input type="radio" name="thumb" value="-1" />

			<div id="buttons">
				<input type="button" value="작성" name="ok" id="ok" /> 
				<input type="button" value="취소" name="cancel" id="cancel" />
				<input type="button" value="삭제" name="del" id="del" />
				
			</div>
		</form>
	</div>
	

</body>
</html>