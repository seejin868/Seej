package Project_VO;

public class User1Vo {
	private int cno;
	private String cid;
	private String cnic;
	private String cpw;
	private int cgen;
	private String cjob;
	private int cpo;
	private String ctel;
	private int cgrade;
	
	
	public User1Vo() {}


	public User1Vo(String cid, String cnic, String cpw, int cgen, String cjob, int cpo, String ctel, int cgrade) {
		super();
		this.cid = cid;
		this.cnic = cnic;
		this.cpw = cpw;
		this.cgen = cgen;
		this.cjob = cjob;
		this.cpo = cpo;
		this.ctel = ctel;
		this.cgrade = cgrade;
	}


	public User1Vo(int cno, String cid, String cnic, String cpw, int cgen, String cjob, int cpo, String ctel,
			int cgrade) {
		super();
		this.cno = cno;
		this.cid = cid;
		this.cnic = cnic;
		this.cpw = cpw;
		this.cgen = cgen;
		this.cjob = cjob;
		this.cpo = cpo;
		this.ctel = ctel;
		this.cgrade = cgrade;
	}


	public int getCno() {
		return cno;
	}


	public void setCno(int cno) {
		this.cno = cno;
	}


	public String getCid() {
		return cid;
	}


	public void setCid(String cid) {
		this.cid = cid;
	}


	public String getCnic() {
		return cnic;
	}


	public void setCnic(String cnic) {
		this.cnic = cnic;
	}


	public String getCpw() {
		return cpw;
	}


	public void setCpw(String cpw) {
		this.cpw = cpw;
	}


	public int getCgen() {
		return cgen;
	}


	public void setCgen(int cgen) {
		this.cgen = cgen;
	}


	public String getCjob() {
		return cjob;
	}


	public void setCjob(String cjob) {
		this.cjob = cjob;
	}


	public int getCpo() {
		return cpo;
	}


	public void setCpo(int cpo) {
		this.cpo = cpo;
	}


	public String getCtel() {
		return ctel;
	}


	public void setCtel(String ctel) {
		this.ctel = ctel;
	}


	public int getCgrade() {
		return cgrade;
	}


	public void setCgrade(int cgrade) {
		this.cgrade = cgrade;
	}

	
	
}
	