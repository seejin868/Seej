package Project_VO;

public class GCommentVO {

	private int gc_no;
	private String gc_writer;
	private String gc_comment;
	private String gc_date;
	private int g_no;
	
	public GCommentVO() {}
	
	public GCommentVO(int gc_no, String gc_writer, String gc_comment, String gc_date, int g_no) {
		super();
		this.gc_no = gc_no;
		this.gc_writer = gc_writer;
		this.gc_comment = gc_comment;
		this.gc_date = gc_date;
		this.g_no = g_no;
	}

	public int getGc_no() {
		return gc_no;
	}

	public void setGc_no(int gc_no) {
		this.gc_no = gc_no;
	}

	public String getGc_writer() {
		return gc_writer;
	}

	public void setGc_writer(String gc_writer) {
		this.gc_writer = gc_writer;
	}

	public String getGc_comment() {
		return gc_comment;
	}

	public void setGc_comment(String gc_comment) {
		this.gc_comment = gc_comment;
	}

	public String getGc_date() {
		return gc_date;
	}

	public void setGc_date(String gc_date) {
		this.gc_date = gc_date;
	}

	public int getG_no() {
		return g_no;
	}

	public void setG_no(int g_no) {
		this.g_no = g_no;
	}
	
}
