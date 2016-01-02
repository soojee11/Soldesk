package kr.co.solproject.lectureqna;

public class LectureQnADTO {

	private int lectureqnano;	//강의 질문 번호
	private int categoryno;		// 카테고리번호
	private String id;		 	// 아이디
	private String subject;		// 제목
	private String content;		// 내용
	private int readcnt;		// 조회수
	private String regdate;		// 작성일
	private String filename;	// 첨부파일
	
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
