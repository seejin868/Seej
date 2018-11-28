
<%@page import="javax.swing.plaf.multi.MultiFileChooserUI"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="check.NameChecker"%>
<%@page import="vo.PostimgVO"%>
<%@page import="dao.PostimgDAO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="drawChanger.PngFileMaker"%>
<%@page import="drawChanger.Base64Utils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%//널값인 경우 설정 하자(일단은 나중에)
		
		PostimgDAO dao = new PostimgDAO();//dao
	
		int maxFileSize = 1024 * 1024 * 10; //최대 크기 10MB
		
		String saveDirUpload = application.getRealPath("upload");//이미지파일을 저장할 폴더 경로
		String saveDirDraws = application.getRealPath("draws");//그린 이미지를 저장할 폴더 경로
		MultipartRequest mr1 = new MultipartRequest(
				request, saveDirUpload, maxFileSize, "UTF-8", new DefaultFileRenamePolicy());

		int nowSeqNum = dao.getSeqLastNum();//현재 시퀀스 넘버
		
		String title = mr1.getParameter("title");

		String writer = mr1.getParameter("id"); //id를 받아온다 

		String content = mr1.getParameter("content");// 본문 내용을 받아온다

		//canvas의 그림을 dataURL => byte[] => png로 바꾼다		
		String dataUrl = mr1.getParameter("canvasUrl");
		byte[] bt = Base64Utils.decodeBase64ToBytes(dataUrl);
		
		String filename = "draw"+nowSeqNum+".png";//파일명 + 현재 시퀀스
		String pathAndFilename = saveDirDraws + "\\" + filename;//경로+파일명
		new PngFileMaker(pathAndFilename, bt);//(만들파일의 경로와 이름 , 실 데이터(byte[]))

		String draw = "../draws/" + filename;
		//String draw = mr.getOriginalFileName(filename);
		
		//파일명이 중복되는지 검사
		/* String file = "";
		if(mr1.getOriginalFileName("file") != null){
			String splitImgFileName = mr1.getOriginalFileName("file");
			NameChecker checker = new NameChecker();
			String imgFileName = checker.fileNameCheck(saveDirUpload, splitImgFileName);
			 
			file = "../upload/"+mr1.getFilesystemName("file");
		} */
		
		//String file = "../upload/"+mr1.getOriginalFileName("file");
		/* 
		vo.setPtitle(title);
		vo.setPwriter(writer);
		vo.setPcontent(content);
		vo.setPdraw(draw);
		vo.setPfile(file);
		dao.addData(vo);
		*/
		
		
		//dao.addData(new PostimgVO(title,writer,content,draw,file));
		
		//실험용
		//String sample = mr1.getOriginalFileName("file");
		//String sample = mr1.getFileNames();
		/* String sample1 = mr1.getFilesystemName("file");
		out.println("sample1 : " + sample1 + "<br/>");
		
		File sample2 = mr1.getFile("file"); */
		
		//파일 다중 추가
		String files="";
		
		Enumeration names = mr1.getFileNames();
		if(names != null){
			out.println("names : ");
			while(names.hasMoreElements()){
				String s3FileName = (String)names.nextElement();//태그이름을 받아온다
				String s3ChangedFileName = mr1.getFilesystemName(s3FileName);//저장될 파일명을 받아온다.
				//파일이 있을시에만 경로와 파일명을 추가
				if(s3ChangedFileName != null){
					files += "../upload/"+s3ChangedFileName + ",";
				}
			}
			out.println(files+"<br/>");
		}
		
		PostimgVO vo = new PostimgVO(title,writer,content,draw,files);
		
		//vo.setPfile(files);
		//dao.updateOne(vo);
		//DB에 추가
		dao.addData(vo);

		out.println("title : " + title + "<br/>");
		out.println("writer : " + writer + "<br/>");
		out.println("content : " + content + "<br/>");
		out.println("draw : " + draw + "<br/>");
		out.println("file : " + files + "<br/>");
		out.println(pathAndFilename + "<br/>");
		out.println(dao.getSeqLastNum() + "<br/>");
	%>

<img src="<%=draw%>" alt="이미지" />
<%-- <img src="<%=file%>" alt="이미지" /> --%>

	<%
		//files에 저장된 경로(,로 구분됨)를 나눠서 반복문으로 그림을 출력
		String[] filePath = files.split(",");
		for(String imgPath : filePath){
	%>
	<img src="<%=imgPath %>" alt="실험기" />
	<%		
		}	
	%>
<!-- AMD폴더에서 나온후 draws폴더에서 이미지파일을 찾는다 -->