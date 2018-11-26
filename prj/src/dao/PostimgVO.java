package dao;

public class PostimgVO {
	
	int pno;
	String ptitle;
	String pwriter;
	String pcontent;
	String pdraw;
	String pfile;
	int plike;
	int phit;
	String pdate;
	
	public PostimgVO() {}


	
	
	
	
	
	public int getPno() {
		return pno;
	}
	
	//게시물 select
	public PostimgVO(int pno, String ptitle, String pwriter, String pcontent, String pdraw, String pfile, int plike,
			int phit, String pdate) {
		super();
		this.pno = pno;
		this.ptitle = ptitle;
		this.pwriter = pwriter;
		this.pcontent = pcontent;
		this.pdraw = pdraw;
		this.pfile = pfile;
		this.plike = plike;
		this.phit = phit;
		this.pdate = pdate;
	}


	//게시물 추가시
	public PostimgVO(String ptitle, String pwriter, String pcontent, String pdraw, String pfile, int plike) {
		super();
		this.ptitle = ptitle;
		this.pwriter = pwriter;
		this.pcontent = pcontent;
		this.pdraw = pdraw;
		this.pfile = pfile;
		this.plike = plike;
	}

	
	
	
	

	public PostimgVO(String ptitle, String pwriter, String pcontent, String pdraw, String pfile) {
		super();
		this.ptitle = ptitle;
		this.pwriter = pwriter;
		this.pcontent = pcontent;
		this.pdraw = pdraw;
		this.pfile = pfile;
	}







	public void setPno(int pno) {
		this.pno = pno;
	}

	public String getPtitle() {
		return ptitle;
	}

	public void setPtitle(String ptitle) {
		this.ptitle = ptitle;
	}

	public String getPwriter() {
		return pwriter;
	}

	public void setPwriter(String pwriter) {
		this.pwriter = pwriter;
	}

	public String getPcontent() {
		return pcontent;
	}

	public void setPcontent(String pcontent) {
		this.pcontent = pcontent;
	}

	public String getPdraw() {
		return pdraw;
	}

	public void setPdraw(String pdraw) {
		this.pdraw = pdraw;
	}

	public String getPfile() {
		return pfile;
	}

	public void setPfile(String pfile) {
		this.pfile = pfile;
	}

	public int getPlike() {
		return plike;
	}

	public void setPlike(int plike) {
		this.plike = plike;
	}

	public int getPhit() {
		return phit;
	}

	public void setPhit(int phit) {
		this.phit = phit;
	}

	public String getPdate() {
		return pdate;
	}

	public void setPdate(String pdate) {
		this.pdate = pdate;
	}
	
	
	
	
	

}
