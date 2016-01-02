package kr.co.solproject.lectureqna;

public class LectureQnADTO {

	private int lectureqnano;	//���� ���� ��ȣ
	private int categoryno;		// ī�װ���ȣ
	private String id;		 	// ���̵�
	private String subject;		// ����
	private String content;		// ����
	private int readcnt;		// ��ȸ��
	private String regdate;		// �ۼ���
	private String filename;	// ÷������
	
	public LectureQnADTO() {
		
	}

	public int getLectureqnano() {
		return lectureqnano;
	}

	public void setLectureqnano(int lectureqnano) {
		this.lectureqnano = lectureqnano;
	}

	public int getCategoryno() {
		return categoryno;
	}

	public void setCategoryno(int categoryno) {
		this.categoryno = categoryno;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getReadcnt() {
		return readcnt;
	}

	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	@Override
	public String toString() {
		return "LectureQnADTO [lectureqnano=" + lectureqnano + ", categoryno=" + categoryno + ", id=" + id
				+ ", subject=" + subject + ", content=" + content + ", readcnt=" + readcnt + ", regdate=" + regdate
				+ ", filename=" + filename + "]";
	}
	
	
}
