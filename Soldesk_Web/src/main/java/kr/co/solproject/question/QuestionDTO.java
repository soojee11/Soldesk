package kr.co.solproject.question;

public class QuestionDTO {
	
	private int testno;			//일련번호	
	private int questno;		//문제번호	
	private String qtitle;		//문제제목	
	private String qtype;		//문제종류(G/J/OX)	
	private String answer;		//답	
	private String comment;		//해설	
	private String poster;		//첨부파일
	private String example;		//보기
	private String qynshow;		//문제선택(Y/N)
	
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
