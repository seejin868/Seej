package check;

import java.io.File;

public class NameChecker {
	
	public NameChecker() {
		// TODO Auto-generated constructor stub
	}
	
	public String fileNameCheck(String dirPath , String fileName) {
		int checknum = 0;
		
		File newfile = new File(dirPath+"\\"+fileName);
		boolean isExist = newfile.exists();
		
		String rtnstr="";
		
		int dotIndex = fileName.indexOf(".");
		String name = fileName.substring(0, dotIndex);
		String ext = fileName.substring(dotIndex, fileName.length());
		
		while (isExist) {
			checknum++;
			File changedName = new File(dirPath+"\\"+name+checknum+ext);
			isExist = changedName.exists();
		}
		checknum--;
		return name+checknum+ext;
	}
}
