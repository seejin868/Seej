<%@page import="drawChanger.PngFileMaker"%>
<%@page import="java.io.File"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="java.io.ByteArrayInputStream"%>
<%@page import="drawChanger.Base64Utils"%>
<%@page import="java.io.FileOutputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>


<%
	String imgUrl = request.getParameter("ta");

	
	/* File f = new File("C:\\draw.png");
	FileWriter fw = new FileWriter(f,false);
	
	fw.write(imgUrl);
	fw.flush();
	
	fw.close(); */
	
	byte[] bytes = Base64Utils.decodeBase64ToBytes(imgUrl);
	
	/* File f = File("test.png");
	
//	FileOutputStream fos = new FileOutputStream("test.png");
	FileOutputStream fos = new FileOutputStream(f);
	//fos.write(Base64Utils.decodeBase64ToBytes(imgUrl));
	
	fos.write(bytes);
	fos.flush();
	fos.close(); */
	
	PngFileMaker pfm = new PngFileMaker();
	String path = application.getRealPath("")+"test.png";
	pfm.make(path,bytes);
	 
	
	

%>
aaa

<img src="test.png" alt="이미지" />

</body>
</html>