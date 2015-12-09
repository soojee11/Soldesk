package kr.co.solproject.example;

public class ExampleDTO {
	private int examno;		//일련번호
	private int questno;	//문제번호
	private String example;	//보기
	
	public ExampleDTO() { }

	public int getExamno() {
		return examno;
	}

	public void setExamno(int examno) {
		this.examno = examno;
	}

	public int getQuestno() {
		return questno;
	}

	public void setQuestno(int questno) {
		this.questno = questno;
	}

	public String getExample() {
		return example;
	}

	public void setExample(String example) {
		this.example = example;
	}

	@Override
	public String toString() {
		return "exampleDTO [examno=" + examno + ", questno=" + questno + ", example=" + example + "]";
	}
	
}
