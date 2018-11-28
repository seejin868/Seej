<%@page import="java.util.Enumeration"%>
<%@page import="vo.PostimgVO"%>
<%@page import="check.NameChecker"%>
<%@page import="drawChanger.PngFileMaker"%>
<%@page import="drawChanger.Base64Utils"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="dao.PostimgDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
	//dao, vo
	PostimgDAO dao = new PostimgDAO();
	//dao.getOne( Integer.parseInt( request.getParameter("pno") ) );

	int maxFileSize = 1024 * 1024 * 10; //최대 크기 10MB

	String saveDirUpload = application.getRealPath("upload");//이미지파일을 저장할 폴더 경로
	String saveDirDraws = application.getRealPath("draws");//그린 이미지를 저장할 폴더 경로
	MultipartRequest mr1 = new MultipartRequest(request, saveDirUpload, maxFileSize, "UTF-8",
			new DefaultFileRenamePolicy());
	
	int pno = Integer.parseInt( mr1.getParameter("pno") );

	
	PostimgVO vo = dao.getOne(pno);
	
	//파일이름
	String imgFileName =null;
	//파일
	String file = null;
	
	//제목과 본문내용 vo에 넣기
	vo.setPtitle(mr1.getParameter("title"));
	vo.setPcontent(mr1.getParameter("content"));
	
	
	//canvas 덮어쓰기
	//canvas의 그림을 dataURL => byte[] => png로 바꾼다		
	String dataUrl = mr1.getParameter("canvasUrl");
	byte[] bt = Base64Utils.decodeBase64ToBytes(dataUrl);
	
	String filename = "draw"+pno+".png";//파일명 + 현재 p_no
	String pathAndFilename = saveDirDraws + "\\" + filename;//경로+파일명
	new PngFileMaker(pathAndFilename, bt);//(만들파일의 경로와 이름 , 실 데이터(byte[]))

	String draw = "../draws/" + filename;
	
	String splitImgFileName = mr1.getOriginalFileName("file");
	
	//파일명을 받지않은 경우( 파일을 변경하지 않는 경우)
	/* if(splitImgFileName!=null){
	NameChecker checker = new NameChecker();
	imgFileName = checker.fileNameCheck(saveDirUpload, splitImgFileName);
	
	file = "../upload/"+imgFileName;
	
	vo.setPfile(file);
	
	}else{
		file = "";
	} */
	
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
	
	if(files != ""){
		vo.setPfile(files);
	}
	
	//DAO로 (pno를 사용해서) 테이블 내용 변경시키기
	dao.updateOne(vo); 
	
	out.println(mr1.getParameter("pno"));
	
	//이후 메인이동으로 바꿀 예정
	response.sendRedirect("TempList.jsp");
%>