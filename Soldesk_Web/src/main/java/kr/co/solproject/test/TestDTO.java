package kr.co.solproject.test;

public class TestDTO {
	private int testno;			//�Ϸù�ȣ
	private int grade;			//�г�
	private String subject;		//����	
	private String testtitle;	//����������	
	
	public TestDTO() {	}

	public int getTestno() {
		return testno;
	}

	public void setTestno(int testno) {
		this.testno = testno;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getTesttitle() {
		return testtitle;
	}

	public void setTesttitle(String testtitle) {
		this.testtitle = testtitle;
	}

	@Override
	public String toString() {
		return "testDTO [testno=" + testno + ", grade=" + grade + ", subject=" + subject + ", testtitle=" + testtitle
				+ "]";
	}
		
}
