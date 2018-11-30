package vo;

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
	String pthumbnail;
		
	public PostimgVO() {
		// TODO Auto-generated constructor stub
	}
	//추가시
	public PostimgVO(String ptitle, String pwriter, String pcontent, String pdraw, String pfile,String pthumbnail) {
		super();
		this.ptitle = ptitle;
		this.pwriter = pwriter;
		this.pcontent = pcontent;
		this.pdraw = pdraw;
		this.pfile = pfile;
		this.pthumbnail = pthumbnail;
	}
	
	//select
	public PostimgVO(int pno, String ptitle, String pwriter, String pcontent, String pdraw, String pfile, int plike,
			int phit, String pdate, String pthumbnail) {
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
		this.pthumbnail = pthumbnail;
	}
	
	public int getPno() {
		return pno;
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
	public String getPthumbnail() {
		return pthumbnail;
	}
	public void setPthumbnail(String pthumbnail) {
		this.pthumbnail = pthumbnail;
	}
	
	
	
}
