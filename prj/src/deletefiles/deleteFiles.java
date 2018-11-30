package deletefiles;

import java.io.File;
import java.util.ArrayList;

import dao.PostimgDAO;
import vo.PostimgVO;

//DB에 없는 파일 지우기(미완성)
public class deleteFiles {

	public deleteFiles() {

	}

	public void delete(String filePath, String drawPath) {
		File draw = new File(drawPath);
		draw.delete();
		
		if(filePath != "null") { // "" , null ,  "null"
			String[] fPath = filePath.split(",");
			for(String deleteFile : fPath) {
				System.out.println(deleteFile);
				File delFile = new File(deleteFile);
				delFile.delete();
			}
		}

	}
}