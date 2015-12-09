package kr.co.solproject.question;

public class QuestionDTO {
	
	private int testno;			//�Ϸù�ȣ	
	private int questno;		//������ȣ	
	private String qtitle;		//��������	
	private String qtype;		//��������(G/J/OX)	
	private String answer;		//��	
	private String comment;		//�ؼ�	
	
	public QuestionDTO() {	}

	public int getTestno() {
		return testno;
	}

	public void setTestno(int testno) {
		this.testno = testno;
	}

	public int getQuestno() {
		return questno;
	}

	public void setQuestno(int questno) {
		this.questno = questno;
	}

	public String getQtitle() {
		return qtitle;
	}

	public void setQtitle(String qtitle) {
		this.qtitle = qtitle;
	}

	public String getQtype() {
		return qtype;
	}

	public void setQtype(String qtype) {
		this.qtype = qtype;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	@Override
	public String toString() {
		return "questionDTO [testno=" + testno + ", questno=" + questno + ", qtitle=" + qtitle + ", qtype=" + qtype
				+ ", answer=" + answer + ", comment=" + comment + ", getTestno()=" + getTestno() + ", getQuestno()="
				+ getQuestno() + ", getQtitle()=" + getQtitle() + ", getQtype()=" + getQtype() + ", getAnswer()="
				+ getAnswer() + ", getComment()=" + getComment() + ", getClass()=" + getClass() + ", hashCode()="
				+ hashCode() + ", toString()=" + super.toString() + "]";
	}
	
}
