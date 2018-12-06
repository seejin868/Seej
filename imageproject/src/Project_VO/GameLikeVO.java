package Project_VO;

public class GameLikeVO {

	private int gl_no;
	private int gl_like;
	private int g_no;
	private int cno;
	
	public GameLikeVO() {}

	public GameLikeVO(int gl_no, int gl_like, int g_no, int cno) {
		super();
		this.gl_no = gl_no;
		this.gl_like = gl_like;
		this.g_no = g_no;
		this.cno = cno;
	}

	public int getGl_no() {
		return gl_no;
	}

	public void setGl_no(int gl_no) {
		this.gl_no = gl_no;
	}

	public int getGl_like() {
		return gl_like;
	}

	public void setGl_like(int gl_like) {
		this.gl_like = gl_like;
	}

	public int getG_no() {
		return g_no;
	}

	public void setG_no(int g_no) {
		this.g_no = g_no;
	}

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}
	
}
