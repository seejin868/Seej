package drawChanger;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

public class PngFileMaker {

	
	public PngFileMaker() {
		// TODO Auto-generated constructor stub
	}
	public PngFileMaker(String pathAndFilename, byte[] bytes) {
		
		this.make(pathAndFilename, bytes);
	}
	
	public void make(String path, byte[] bytes) {

		File f = new File(path);
		
		FileOutputStream fos;
		try {
			fos = new FileOutputStream(f);
			fos.write(bytes);
			fos.flush();
			fos.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
