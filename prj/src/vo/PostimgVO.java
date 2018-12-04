package vo;

public class PostimgVO {
	
	
	int pno;			// 게시글 번호 primary key
	String ptitle;		// 제목
	String pwriter;		// 작성자(id)
	String pcontent;	// 글 내용
	String pdraw;		// 캔버스 그림 위치
	String pfile;		// 이미지 파일 위치 ,로 구분
	int plike;			// 추천수
	int phit;			// 조회수
	String pdate;		// 작성일
	String pthumbnail;	// 썸네일
	
	//생성자	
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
	
	//select시
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
	
	
	//get, set
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
