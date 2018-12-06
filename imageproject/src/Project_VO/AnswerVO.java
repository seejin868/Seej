package Project_VO;

public class AnswerVO {
	
	private int a_no;
	private String answer;
	private String tag;
	private int use;
	
	public AnswerVO() {}
	
	public AnswerVO(int a_no, String answer, String tag, int use) {
		super();
		this.a_no = a_no;
		this.answer = answer;
		this.tag = tag;
		this.use = use;
	}

	public AnswerVO(int a_no, String answer, String tag) {
		super();
		this.a_no = a_no;
		this.answer = answer;
		this.tag = tag;
	}

	public AnswerVO(String answer, String tag) {
		super();
		this.answer = answer;
		this.tag = tag;
	}

	public int getA_no() {
		return a_no;
	}

	public void setA_no(int a_no) {
		this.a_no = a_no;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public int getUse() {
		return use;
	}

	public void setUse(int use) {
		this.use = use;
	}
	
}
