package kr.co.solproject.myscore;

public class MyscoreDTO {
	private int mytestno;		//max(mytestno)해서 최근본 시험출력
	private String id;			//아이디
	private int testno;			//일련번호
	private int usetime;		//경과시간
	private String answerno;	//문제번호,답
	private String regdt;		//시험일
	
	public MyscoreDTO() { }

	public int getMytestno() {
		return mytestno;
	}

	public void setMytestno(int mytestno) {
		this.mytestno = mytestno;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getTestno() {
		return testno;
	}

	public void setTestno(int testno) {
		this.testno = testno;
	}

	public int getUsetime() {
		return usetime;
	}

	public void setUsetime(int usetime) {
		this.usetime = usetime;
	}

	public String getAnswerno() {
		return answerno;
	}

	public void setAnswerno(String answerno) {
		this.answerno = answerno;
	}

	public String getRegdt() {
		return regdt;
	}

	public void setRegdt(String regdt) {
		this.regdt = regdt;
	}

	@Override
	public String toString() {
		return "myscoreDTO [mytestno=" + mytestno + ", id=" + id + ", testno=" + testno + ", usetime=" + usetime
				+ ", answerno=" + answerno + ", regdt=" + regdt + "]";
	}
	
}