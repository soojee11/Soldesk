package kr.co.solproject.myscore;

public class MyscoreDTO {
	private int mytestno;		//max(mytestno)�ؼ� �ֱٺ� �������
	private String id;			//���̵�
	private int testno;			//�Ϸù�ȣ
	private String usetime;		//����ð�
	private String answerno;	//������ȣ,��
	private String regdt;		//������
	private String myscore;		//��������
	
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

	public String getUsetime() {
		return usetime;
	}

	public void setUsetime(String usetime) {
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

	
	public String getMyscore() {
		return myscore;
	}

	public void setMyscore(String myscore) {
		this.myscore = myscore;
	}

	@Override
	public String toString() {
		return "MyscoreDTO [mytestno=" + mytestno + ", id=" + id + ", testno=" + testno + ", usetime=" + usetime
				+ ", answerno=" + answerno + ", regdt=" + regdt + ", myscore=" + myscore + "]";
	}
	
}