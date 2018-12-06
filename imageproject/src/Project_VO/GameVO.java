package Project_VO;

public class GameVO {
	
	private int g_no;
	private String g_title;
	private String g_writer;
	private String g_content;
	private String g_file;
	private int g_like;
	private int g_hit;
	private String g_date;
	private String answer;
	private int currect;
	
	public GameVO() {}
	
	public GameVO(String g_title, String g_writer, String g_content, String g_file) {
		super();
		this.g_title = g_title;
		this.g_writer = g_writer;
		this.g_content = g_content;
		this.g_file = g_file;
	}

	public GameVO(int g_no, String g_title, String g_writer, String g_content, String g_file, int g_like, int g_hit,
			String g_date) {
		super();
		this.g_no = g_no;
		this.g_title = g_title;
		this.g_writer = g_writer;
		this.g_content = g_content;
		this.g_file = g_file;
		this.g_like = g_like;
		this.g_hit = g_hit;
		this.g_date = g_date;
	}
	
	public GameVO(int g_no, String g_title, String g_writer, String g_content, String g_file, int g_like, int g_hit,
			String g_date, String answer) {
		super();
		this.g_no = g_no;
		this.g_title = g_title;
		this.g_writer = g_writer;
		this.g_content = g_content;
		this.g_file = g_file;
		this.g_like = g_like;
		this.g_hit = g_hit;
		this.g_date = g_date;
		this.answer = answer;
	}

	public GameVO(int g_no, String g_title, String g_writer, String g_content, String g_file, int g_like, int g_hit,
			String g_date, String answer, int currect) {
		super();
		this.g_no = g_no;
		this.g_title = g_title;
		this.g_writer = g_writer;
		this.g_content = g_content;
		this.g_file = g_file;
		this.g_like = g_like;
		this.g_hit = g_hit;
		this.g_date = g_date;
		this.answer = answer;
		this.currect = currect;
	}

	public int getCurrect() {
		return currect;
	}

	public void setCurrect(int currect) {
		this.currect = currect;
	}

	public int getG_no() {
		return g_no;
	}

	public void setG_no(int g_no) {
		this.g_no = g_no;
	}

	public String getG_title() {
		return g_title;
	}

	public void setG_title(String g_title) {
		this.g_title = g_title;
	}

	public String getG_writer() {
		return g_writer;
	}

	public void setG_writer(String g_writer) {
		this.g_writer = g_writer;
	}

	public String getG_content() {
		return g_content;
	}

	public void setG_content(String g_content) {
		this.g_content = g_content;
	}

	public String getG_file() {
		return g_file;
	}

	public void setG_file(String g_file) {
		this.g_file = g_file;
	}

	public int getG_like() {
		return g_like;
	}

	public void setG_like(int g_like) {
		this.g_like = g_like;
	}

	public int getG_hit() {
		return g_hit;
	}

	public void setG_hit(int g_hit) {
		this.g_hit = g_hit;
	}

	public String getG_date() {
		return g_date;
	}

	public void setG_date(String g_date) {
		this.g_date = g_date;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}
	
}
