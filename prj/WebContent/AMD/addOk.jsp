
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="drawChanger.PngFileMaker"%>
<%@page import="drawChanger.Base64Utils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> </title>
<script type="text/javascript">

</script>
</head>
<body>
<%
	String title = request.getParameter("title");
	
	String writer = "0"; //현재 id값이 없기에 0으로 하는 중 
			//request.getParameter("id");//임시로 id를 writer로
	
	String content = request.getParameter("content");
	
	//canvas의 그림을 dataURL => byte[] => png로 바꾼다
	String dataUrl = request.getParameter("canvasUrl");
	byte[] bt = Base64Utils.decodeBase64ToBytes(dataUrl);
	
	//String pathAndFilename = request.getRealPath("test.png");
	//application.getRealPath("draws\\test.png");//draws폴더 내부에 저장
	String saveDir = application.getRealPath("draws");
	String filename= "test.png";
	String pathAndFilename = saveDir+"\\"+filename;
	
	new PngFileMaker(pathAndFilename, bt);
	
	
	MultipartRequest mr = new MultipartRequest( request, saveDir, maxFileSize, "UTF-8", new DefaultFileRenamePolicy() );

	
	String draw = "draws/"+filename;

	String file = request.getRealPath("file");
	
	
	
	/* 
	vo.setPtitle(title);
	vo.setPwriter(writer);
	vo.setPcontent(content);
	vo.setPdraw(draw);
	vo.setPfile(file);
	
	dao.addData(vo);
	 */
	
 	out.println("title : " + title);
/*	out.println("writer : " + writer);
	out.println("content : " + content);
	out.println("draw : " + draw);
	out.println("file : " + file);
	String url = request.getParameter("canvasUrl");
	out.println(url);*/
	out.println(pathAndFilename);
	//out.println("<img src='test.png' />"); 
%>

<img src="../draws/test.png" alt="이미지" /><!-- AMD폴더에서 나온후 draws폴더에서 이미지파일을 찾는다 -->
</body>
</html>