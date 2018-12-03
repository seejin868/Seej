package deletefiles;

import java.io.File;
import java.util.ArrayList;

import dao.PostimgDAO;
import vo.PostimgVO;

public class DeleteTester {
	public static void main(String[] args) {
		String path = "C:/Users/soldesk/web-workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/prj/";
	/*
		String filePath = path+"upload";
		String drawPath = path+"draws";
		
		File f1 = new File(path);
		File f2 = new File(filePath);
		File f3 = new File(drawPath);
		
		
		deleteFiles df = new deleteFiles();
		PostimgDAO dao = new PostimgDAO();
		
		int pno = 19;
		PostimgVO vo = dao.getOne(pno);
		
		String fP = vo.getPfile();//filePath
		String dP = vo.getPdraw();//drawPath
		
		//df.delete(fP, dP);
		ArrayList<PostimgVO> list = dao.getAll();
 		String[] splitPfile = list.get(0).getPfile().split(",");
 		String[] filename = splitPfile[0].split("/");
 		*/
		/*
 		File dir = new File(path+"draws");

 		File[] file = dir.listFiles();
 		file[0].getName();
 		
		System.out.println( file[0].getName() );*/
		
		deleteFiles df = new deleteFiles();
		
		df.deleteFiles(path);
		
	
		
	}
}