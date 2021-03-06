package kr.co.solproject.test;

public class TestDTO {
	private int testno;			//일련번호
	private int grade;			//학년
	private String subject;		//과목	
	private String testtitle;	//문제지제목
	private String testshow;
	
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

	public String getTestshow() {
		return testshow;
	}

	public void setTestshow(String testshow) {
		this.testshow = testshow;
	}

	@Override
	public String toString() {
		return "TestDTO [testno=" + testno + ", grade=" + grade + ", subject=" + subject + ", testtitle=" + testtitle
				+ ", testshow=" + testshow + "]";
	}
		
}
