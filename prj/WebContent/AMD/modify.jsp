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

	//id를 받지 못한 경우 메인으로 이동시키기(현재는 임시페이지)
	   	if(session.getAttribute("id") == null){
			response.sendRedirect("TempList.jsp");
			return ;
		}  
	  
	  //out.println(session.getAttribute("id"));
 
	

	//pno를 받는다
	String ParaPno = request.getParameter("pno");
	
	//pno가 없는 경우 메인으로 이동
	if(ParaPno == null){
		response.sendRedirect("TempList.jsp");//나중에 메인페이지로 바꿀 예정
		return;
	}
	
	PostimgDAO dao = new PostimgDAO();
	
	//pno를 정수형으로 변환
	int pno = Integer.parseInt( ParaPno );
	PostimgVO vo =  dao.getOne(pno);//pno로 vo객체를 받아온다
	
	
	//id가 작성자와 다른 경우 메인으로 이동시키기(현재는 임시페이지)
	String id = (String)session.getAttribute("id");
   	if( id.equals( vo.getPwriter() ) ){
	}else{
		response.sendRedirect("TempList.jsp");
		return ;
	}  

	//이미지 파일의 경로를 분리시켜서 배열에 저장
	String[] filePath = null;
	if(vo.getPfile() != null){
		filePath = vo.getPfile().split(",");
	}
	
%>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script type="text/javascript" src="../se/js/HuskyEZCreator.js" charset="utf-8"></script>

<script type="text/javascript" src="modify.js" ></script>

<link rel="stylesheet" href="modify.css">

</head>
<body>

	<div id="formwrapper">
	
		<form action="" id="frm" name="frm" enctype="multipart/form-data">
			<input type="hidden" value='<%=id%>'
				name="id" />
			<!--세션으로 id 받는 부분  -->
			<div>
			<!-- p_no, p_draw -->
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
				//DB에 경로가 들어가 있던 경우만
					if(filePath != null){
					//원래 있던 이미지 표시
						//int i = 0;
						for(String src:filePath){
							out.println("<img src='"+src+"' height='100'>");
							out.println("<input type='checkbox' name='checkBoxes' id='checkBoxes' checked='checked' value='"+src+"' /> <br/>");
						}
					}
				%>
				<h6>파일의 왼쪽에 있는 버튼으로 선택한 이미지가 섬네일이 됩니다(선택하지 않을 시 원래 선택했던 그림이 섬네일이 됩니다)</h6>
				<input type="button" value=" 파일추가 " id="addTagButton" />
				이미지파일 <br />
			</div>

			그림그리기 <input type="button" value="처음으로" id='init'/>
			<input type="button" value="완전 리셋" id='reset'/><br />
			<b id="fontR">R</b> 
			<input type="range" class="slider" id="R" min="0" max="255" value="0" />
			<b id="fontG">G</b> 
			<input type="range" class="slider" id="G" min="0" max="255" value="0" />
			<b id="fontB">B</b> 
			<input type="range" class="slider" id="B" min="0" max="255" value="0" />
			<b id="fontA">A</b> 
			<input type="range" class="slider" id="A" min="0" max="1"  step="0.1" value="1" />
			
			<span id="colorBox" ></span>
			<br />
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