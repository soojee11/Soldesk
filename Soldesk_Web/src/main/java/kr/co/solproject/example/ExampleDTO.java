package kr.co.solproject.example;

public class ExampleDTO {
	private int examno;		//�Ϸù�ȣ
	private int questno;	//������ȣ
	private String example;	//����
	
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
