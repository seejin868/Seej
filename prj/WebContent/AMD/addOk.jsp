<%@page import="java.util.Collections"%>
<%@page import="java.util.Collection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="javax.swing.plaf.multi.MultiFileChooserUI"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="vo.PostimgVO"%>
<%@page import="dao.PostimgDAO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="drawChanger.PngFileMaker"%>
<%@page import="drawChanger.Base64Utils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%!//draw 저장 메소드
	String saveDrawAndReturnPath(String saveDirDraws, String dataUrl) {

		PostimgDAO dao = new PostimgDAO();
		int nowSeqNum = dao.getSeqLastNum();

		byte[] bt = Base64Utils.decodeBase64ToBytes(dataUrl);

		String filename = "draw" + nowSeqNum + ".png";//파일명 + 현재 시퀀스
		String pathAndFilename = saveDirDraws + "\\" + filename;//경로+파일명
		new PngFileMaker(pathAndFilename, bt);//(만들파일의 경로와 이름 , 실 데이터(byte[]))

		String draw = "../draws/" + filename;

		return draw;
	}

	//canvas dataURL이 여럿 들어올 경우 미실험 (반복문과 사용 예정)
	String saveDrawAndReturnPath2(String saveDirDraws, int number, String dataUrl) {

		PostimgDAO dao = new PostimgDAO();
		int nowSeqNum = dao.getSeqLastNum();

		byte[] bt = Base64Utils.decodeBase64ToBytes(dataUrl);

		String filename = "draw" + nowSeqNum + "(" + number + ").png";//파일명 + 현재 시퀀스
		String pathAndFilename = saveDirDraws + "\\" + filename;//경로+파일명
		new PngFileMaker(pathAndFilename, bt);//(만들파일의 경로와 이름 , 실 데이터(byte[]))

		String draw = "../draws/" + filename;

		return draw;
	}

	//파일들위치 메소드
	String filesPath(MultipartRequest mr1, Enumeration fileNames) {
		String files = "";
		ArrayList<String> list = new ArrayList();
		if (fileNames != null) {
			while (fileNames.hasMoreElements()) {
				String s3FileName = (String) fileNames.nextElement();//태그이름을 받아온다

				String s3ChangedFileName = mr1.getFilesystemName(s3FileName);//저장될 파일명을 받아온다.

				//파일이 있을시에만 경로와 파일명을 추가
				if (s3ChangedFileName != null) {
					//files += "../upload/" + s3ChangedFileName + ",";
					list.add("../upload/" + s3ChangedFileName + ",");
				}
			}
			Collections.reverse(list);
			for (String s : list) {
				files += s;
			}
		}
		return files;
	}

	//썸네일
	String getThumbnailPath(
			MultipartRequest mr1, Enumeration fileNames, String draw, int thumbNum) {

		ArrayList<String> list = new ArrayList();

		if (fileNames != null) {

			while (fileNames.hasMoreElements()) {
				String s3FileName = (String) fileNames.nextElement();//input:file태그의 이름을 받아온다
				String s3ChangedFileName = mr1.getFilesystemName(s3FileName);//저장될 파일명을 받아온다.

				//리스트에 추가
				list.add("../upload/" + s3ChangedFileName);
			}
			//반전
			Collections.reverse(list);
		}
		//thumbNum이 0이상이면서 list의 thumbNum번째에 저장된 문자열이 "../upload/null"이 아닐 시에만
		if (thumbNum >= 0 && ( false == list.get(thumbNum).equals("../upload/null") ) ) {
			return list.get(thumbNum); //list에서 thumbNum번 요소를 리턴 시킨다
		} else {
			//그 외의 경우 draw를 반환해준다
			return draw;
		}

	}
%>

<%
	//널값인 경우 설정 하자(일단은 나중에)

	PostimgDAO dao = new PostimgDAO();//dao

	int maxFileSize = 1024 * 1024 * 10; //최대 크기 10MB

	String saveDirUpload = application.getRealPath("upload");//이미지파일을 저장할 폴더 경로
	String saveDirDraws = application.getRealPath("draws");//그린 이미지를 저장할 폴더 경로
	MultipartRequest mr1 = new MultipartRequest(request, saveDirUpload, maxFileSize, "UTF-8",
			new DefaultFileRenamePolicy());

	int nowSeqNum = dao.getSeqLastNum();//현재 시퀀스 넘버

	String title = mr1.getParameter("title");

	String writer = mr1.getParameter("id"); //id를 받아온다 

	String content = mr1.getParameter("content");// 본문 내용을 받아온다

	//canvas의 그림을 dataURL => byte[] => png로 바꾼다		
	String dataUrl = mr1.getParameter("canvasUrl");
	String draw = saveDrawAndReturnPath(saveDirDraws, dataUrl);

	//파일 다중 추가
	String files = "";
	Enumeration names = mr1.getFileNames();
	files = filesPath(mr1, names);

	//썸네일
	int thumbNum = -1;
	String thumbnail = draw;

	if (mr1.getParameter("thumb") != null) {
		//thumbNum = -1;
		thumbNum = Integer.parseInt( mr1.getParameter("thumb") );
		//out.println("thumb : " + mr1.getParameter("thumb") + "<br/>");
		thumbnail = getThumbnailPath( mr1, mr1.getFileNames(), draw, thumbNum);
	}

	PostimgVO vo = new PostimgVO(title, writer, content, draw, files, thumbnail);
	vo.setPthumbnail(thumbnail);

	//DB에 추가
	dao.addData(vo);

/* 	out.println("thumbnail : " + thumbnail + "<br/>");
	out.println("thumbNum : " + thumbNum + "<br/>");
	out.println("vo.getpthubnail : " + vo.getPthumbnail() + "<br/>");
	out.println("title : " + title + "<br/>");
	out.println("writer : " + writer + "<br/>");
	out.println("content : " + content + "<br/>");
	out.println("draw : " + draw + "<br/>");
	out.println("files : " + files + "<br/>");
	out.println("P_No" + dao.getSeqLastNum() + "<br/>");
	out.println("PATH" + application.getRealPath("") + "<br/>"); */
%>
<%-- 
<img src="<%=draw%>" alt="이미지" />
 <img src="<%=file%>" alt="이미지" /> 
 --%>
<%
	//files에 저장된 경로(,로 구분됨)를 나눠서 반복문으로 그림을 출력
	/* String[] filePath = files.split(",");
	for (String imgPath : filePath) {

		out.println("<img src='" + imgPath + "' alt='실험기'  />");

	} */
	
	//메인페이지로 이동(현재는 임시 페이지)
	response.sendRedirect("TempList.jsp");
	
%>
<!-- AMD폴더에서 나온후 draws폴더에서 이미지파일을 찾는다 -->