package deletefiles;

import java.io.File;
import java.util.ArrayList;

import dao.PostimgDAO;
import vo.PostimgVO;

//DB에 없는 파일 지우기(미완성)
public class deleteFiles {

	public deleteFiles() {
	}

	public void deleteFiles(String path) {
		this.deleteUploadImage(path + "upload");
		this.deleteDrawImage(path + "draws");
	}

	private void deleteUploadImage(String uploadPath) {

		ArrayList<String> fileNamesDB = this.getFileName();
		File imgdir = new File(uploadPath);
		File[] file = imgdir.listFiles();

		for (File f : file) {
			boolean isExistInDB = false;
			
			if (isExistInDB == false) {
				
				for (String fileNameDB : fileNamesDB) {
					if (f.getName().equals( fileNameDB) ) {
						// 실제 폴더 내의 파일 명과 같은 파일명이 DB에 저장되어 있는지 확인
						isExistInDB = true;
						
					} // if
				} // for
			} // if
			
			// 반복문을 돌려서 DB에 있는지 없는지 확인 후 없으면 파일 제거
			if (isExistInDB == false) {
				f.delete();
			} // if

		} // for
	}

	private void deleteDrawImage(String drawPath) {

		ArrayList<String> drawNames = this.getDrawName();

		File drawsDir = new File(drawPath);
		File[] Drawfile = drawsDir.listFiles();

		for (File f : Drawfile) {
			boolean isExistInDB = false;

			if (isExistInDB == false) {
				for (String drawNameDB : drawNames) {
					if (f.getName().equals( drawNameDB ) ) {
						isExistInDB = true;
					}
				}
			} // if

			if (isExistInDB == false) {
				f.delete();
			}
		}

	}

	private ArrayList<String> getDrawName() {
		PostimgDAO dao = new PostimgDAO();
		ArrayList<PostimgVO> voList = dao.getAll();
		ArrayList<String> drawNames = new ArrayList<>();

		for (PostimgVO vo : voList) {
			String pdraw = vo.getPdraw();

			String[] splitPdraw = pdraw.split("/");

			String drawName = splitPdraw[splitPdraw.length - 1];

			drawNames.add(drawName);
		}

		return drawNames;

	}

	// 파일명이 들어있는 ArrayList를 반환해준다
	public ArrayList<String> getFileName() {

		PostimgDAO dao = new PostimgDAO();
		ArrayList<PostimgVO> voList = dao.getAll();
		ArrayList<String> fileNames = new ArrayList<>();

		for (PostimgVO vo : voList) {
			// DB의 p_file에 저장된 이미지 파일의 경로 문자열 전체
			String pfile = vo.getPfile();
			// 경로 문자열을 , 로 나눠서 문자열 배열로 저장 (이미지 하나 하나의 경로)
			if ((pfile == null) == false) {
				String[] pfiles = pfile.split(",");

				for (String splitPfile : pfiles) {// 배열에 들어가 있는 문자열들 변수에 넣는다
					String[] pathes = splitPfile.split("/");// 경로를 분할
					String fileName = pathes[pathes.length - 1];// 경로의 마지막 즉 파일명
					fileNames.add(fileName);
				}
			}
		}

		return fileNames;
	}

}