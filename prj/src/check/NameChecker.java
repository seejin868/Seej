package check;

import java.io.File;

public class NameChecker {
	
	public NameChecker() {
		// TODO Auto-generated constructor stub
	}
	
	public String fileNameCheck(String dirPath , String fileName) {
		int checknum = 0;
		
		String strChecknum="";
		
		File newfile = new File(dirPath+"\\"+fileName);
		boolean isExist = newfile.exists();
		
		
		int dotIndex = fileName.indexOf(".");
		String name = fileName.substring(0, dotIndex);
		String ext = fileName.substring(dotIndex, fileName.length());
		
		//String newName=null;
		
		while (isExist) {
			checknum++;
			File changedName = new File(dirPath+"\\"+name+checknum +ext);
			isExist = changedName.exists();
			
			}
		checknum--;
		if(checknum==0) {
			return name+ext;
		}else {
			return name+checknum+ext;
		}
	}
}
