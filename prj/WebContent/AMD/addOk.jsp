
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="drawChanger.PngFileMaker"%>
<%@page import="drawChanger.Base64Utils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript">
	
</script>
</head>
<body>
	<%
		int maxFileSize = 1024 * 1024 * 10; //10MB
		String saveDirUpload = application.getRealPath("upload");//이미지파일을 저장할 폴더 경로
		String saveDirDraws = application.getRealPath("draws");//그린 이미지를 저장할 폴더 경로
		MultipartRequest mr1 = new MultipartRequest(
				request, saveDirUpload, maxFileSize, "UTF-8", new DefaultFileRenamePolicy());

		String title = mr1.getParameter("title");

		String writer = "0"; //현재 id값이 없기에 0으로 하는 중 

		String content = mr1.getParameter("content");

		//canvas의 그림을 dataURL => byte[] => png로 바꾼다		
		String dataUrl = mr1.getParameter("canvasUrl");
		byte[] bt = Base64Utils.decodeBase64ToBytes(dataUrl);
		String filename = "test.png";//파일명
		String pathAndFilename = saveDirDraws + "\\" + filename;//경로+파일명
		new PngFileMaker(pathAndFilename, bt);

		String draw = "../draws/" + filename;
		//String draw = mr.getOriginalFileName(filename);

		String file = "../upload/"+mr1.getOriginalFileName("file");

		/* 
		vo.setPtitle(title);
		vo.setPwriter(writer);
		vo.setPcontent(content);
		vo.setPdraw(draw);
		vo.setPfile(file);
		
		dao.addData(vo);
		*/

		out.println("title : " + title + "<br/>");
		out.println("writer : " + writer + "<br/>");
		out.println("content : " + content + "<br/>");
		out.println("draw : " + draw + "<br/>");
		out.println("file : " + file + "<br/>");
		out.println(pathAndFilename + "<br/>");
	%>

	<img src="<%=draw%>" alt="이미지" />
	<!-- AMD폴더에서 나온후 draws폴더에서 이미지파일을 찾는다 -->
</body>
</html>