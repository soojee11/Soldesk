package kr.co.solproject.question;

public class QuestionDTO {
	
	private int testno;			//�Ϸù�ȣ	
	private int questno;		//������ȣ	
	private String qtitle;		//��������	
	private String qtype;		//��������(G/J/OX)	
	private String answer;		//��	
	private String comment;		//�ؼ�	
	private String poster;		//÷������
	private String example;		//����
	private String qynshow;		//��������(Y/N)
	
	//private MultipartFile posterMF;		// <input type="file" name="posterMF">
	
	
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

	public String getPoster() {
		return poster;
	}

	public void setPoster(String poster) {
		this.poster = poster;
	}
/*
	public MultipartFile getPosterMF() {
		return posterMF;
	}

	public void setPosterMF(MultipartFile posterMF) {
		this.posterMF = posterMF;
	}
*/
	public String getExample() {
		return example;
	}

	public void setExample(String example) {
		this.example = example;
	}

	
	public String getQynshow() {
		return qynshow;
	}

	public void setQynshow(String qynshow) {
		this.qynshow = qynshow;
	}

	@Override
	public String toString() {
		return "QuestionDTO [testno=" + testno + ", questno=" + questno + ", qtitle=" + qtitle + ", qtype=" + qtype
				+ ", answer=" + answer + ", comment=" + comment + ", poster=" + poster + ", example=" + example
				+ ", qynshow=" + qynshow+"]";
	}
	
}
