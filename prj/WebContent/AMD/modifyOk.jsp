<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.Enumeration"%>
<%@page import="vo.PostimgVO"%>
<%@page import="drawChanger.PngFileMaker"%>
<%@page import="drawChanger.Base64Utils"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="dao.PostimgDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%!//draw 덮어쓰기 메소드
	String saveDrawAndReturnPath(String saveDirDraws, int pno, String dataUrl) {

		//PostimgDAO dao = new PostimgDAO();
		
		byte[] bt = Base64Utils.decodeBase64ToBytes(dataUrl);

		String filename = "draw" + pno + ".png";//파일명 + 현재 시퀀스
		String pathAndFilename = saveDirDraws + "\\" + filename;//경로+파일명
		new PngFileMaker(pathAndFilename, bt);//(만들파일의 경로와 이름 , 실 데이터(byte[]))

		String draw = "../draws/" + filename;//DB에 저장될 정보 상대위치와 파일명
		return draw;
	}

	//canvas dataURL이 여럿 들어올 경우 미실험 미사용 (반복문과 사용 예정)
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
			//초기화
			String files = "";
			ArrayList<String> list = new ArrayList();
		
			if (fileNames != null) {
				//fileNames에 다른 요소들이 남아있는 경우 반복
				while (fileNames.hasMoreElements()) {
					String s3FileName = (String) fileNames.nextElement();//input:file태그의 이름(name)을 받아온다

					String s3ChangedFileName = mr1.getFilesystemName(s3FileName);//저장될 파일명을 받아온다.

					//파일이 있을시에만 경로와 파일명을 추가
					if (s3ChangedFileName != null) {
						//files += "../upload/" + s3ChangedFileName + ",";
						list.add("../upload/" + s3ChangedFileName + ",");
					}
				}
				//list 요소들의 순서를 반전시킨다
				Collections.reverse(list);
				for (String s : list) {
					files += s;//반전시킨 list를 순서대로 files변수에 저장한다
				}
			}
			//리턴
			return files;
		}

	
	//썸네일2
		String getThumbnailPath2(
				MultipartRequest mr1, Enumeration fileNames, String draw, int thumbNum) {
			//초기화
			ArrayList<String> list = new ArrayList();

			if (fileNames != null) {

				while (fileNames.hasMoreElements()) {
					String s3FileName = (String) fileNames.nextElement();//input:file태그의 이름(name)을 받아온다
					String s3ChangedFileName = mr1.getFilesystemName(s3FileName);//저장될 파일명을 받아온다.

					//리스트에 추가 "../upload/null"인 경우도 추가(썸네일 번호가 )
					list.add("../upload/" + s3ChangedFileName);
				}
				//위치 반전
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
	

	int maxFileSize = 1024 * 1024 * 10; //최대 크기 10MB
	String saveDirUpload = application.getRealPath("upload"); //이미지파일을 저장할 폴더 경로
	String saveDirDraws = application.getRealPath("draws"); //그린 이미지를 저장할 폴더 경로
	
	MultipartRequest mr1 = new MultipartRequest(request, saveDirUpload, maxFileSize, "UTF-8",
			new DefaultFileRenamePolicy());
	
	 
	//dao, vo
	PostimgDAO dao = new PostimgDAO();
	//pno로 DB에 조회해서 글 내용을 얻어온다
	int pno = Integer.parseInt( mr1.getParameter("pno") );
	PostimgVO vo = dao.getOne(pno);
	
	//제목과 본문내용 vo에 넣기
	vo.setPtitle(mr1.getParameter("title"));
	vo.setPcontent(mr1.getParameter("content"));
	
	
	//canvas 덮어쓰기
	//canvas의 그림을 dataURL => byte[] => png로 바꾼다		
	String dataUrl = mr1.getParameter("canvasUrl");
	//dataURL을 변환 저장후 (상대)경로를 받아서 저장 후, vo에 저장한다.
	String draw = saveDrawAndReturnPath(saveDirDraws, pno, dataUrl);
	vo.setPdraw(draw);
	
	//이미지파일
	String file = "";
	
	//체크박스에 체크된 요소가 있다면
	if(mr1.getParameterValues("checkBoxes") != null){
		
		String[] keepimg = mr1.getParameterValues("checkBoxes");
		for(String k : keepimg){
			//그 값들을 file변수에 저장한다. 여럿일 때를 위해 ,로 구분
			file += k+",";
		}
	}
	
	//모든 파일 태그의 이름을 저장
	Enumeration names = mr1.getFileNames();
	String files = "";
	
	//파일들의 경로를 저장
	files += filesPath(mr1, names);
//	file += filesPath(mr1, names);

	//체크된 파일이 있는 경우
	if(file != ""){
		files = file + "," + files;
	}
	
	//이미지 파일을 넣은 경우
	/* if(files != ""){
		
	} */
	vo.setPfile(files);
	
	//썸네일
	int thumbNum = -1;
	String thumbnail = vo.getPthumbnail();//원래의 썸네일을 넣는다
//	out.println(thumbNum);
//	out.println(thumbnail);
	//얻어온 thumb이 null이 아니면 실행한다
	if (mr1.getParameter("thumb") != null) {
		//얻어온 thumb을 정수형으로 바꿔서 저장
		thumbNum = Integer.parseInt( mr1.getParameter("thumb") );
		//썸네일 번호가 -1이면 캔버스에 그린 그림을 0이상 이면 그 이미지를 썸네일로 해서 저장
	//	thumbnail = getThumbnailPath(draw, files, thumbNum);
		
 		Enumeration fileNames = mr1.getFileNames();
 		//썸네일 경로를 받아온다
		thumbnail = getThumbnailPath2( mr1, fileNames, draw, thumbNum);
	}
	
	//vo에 썸네일을 넣는다
	vo.setPthumbnail(thumbnail);
	
	//DAO로  테이블 내용 변경시키기
	dao.updateOne(vo); 
	
	/* 
	out.println(thumbNum);
	out.println("<br/>");
	out.println("썸네일"+thumbnail);
	out.println("<br/>");
	out.println(file);
	out.println("<br/>");
	out.println(files); */
	
	//이후 메인이동으로 바꿀 예정
	response.sendRedirect("TempList.jsp");
%>