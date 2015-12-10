package kr.co.solproject.lecture;

public class LectureDTO {
	private int lectureno;		// 교육번호	
	private String subject;		// 제목
	private String filename;	// 강의파일 
	private String poster;		// 캡쳐화면 
	private String teacher;		// 선생님 이름 
	private String lecturetime;	// 강의시간		
	
	private int categoryno;		// 카테고리번호	
		
	// --------------------------------------- 카테고리 테이블 조인
	
	//private int categoryno;	// 카테고리 번호
	private int grade;		// 학년	
	private String gwamok;	// 과목
	
	
	public LectureDTO() {
		super();
		// TODO Auto-generated constructor stub
	}


	public int getLectureno() {
		return lectureno;
	}


	public void setLectureno(int lectureno) {
		this.lectureno = lectureno;
	}


	public String getSubject() {
		return subject;
	}


	public void setSubject(String subject) {
		this.subject = subject;
	}


	public String getFilename() {
		return filename;
	}


	public void setFilename(String filename) {
		this.filename = filename;
	}


	public String getPoster() {
		return poster;
	}


	public void setPoster(String poster) {
		this.poster = poster;
	}


	public String getTeacher() {
		return teacher;
	}


	public void setTeacher(String teacher) {
		this.teacher = teacher;
	}


	public String getLecturetime() {
		return lecturetime;
	}


	public void setLecturetime(String lecturetime) {
		this.lecturetime = lecturetime;
	}


	public int getCategoryno() {
		return categoryno;
	}

	//------------------------------------------ 카테고리 테이블 조인
	public int getGrade() {
		return grade;
	}


	public void setGrade(int grade) {
		this.grade = grade;
	}


	public String getGwamok() {
		return gwamok;
	}


	public void setGwamok(String gwamok) {
		this.gwamok = gwamok;
	}


	@Override
	public String toString() {
		return "LectureDTO [lectureno=" + lectureno + ", subject=" + subject + ", filename=" + filename
				+ ", poster=" + poster + ", teacher=" + teacher + ", lecturetime=" + lecturetime
				+ ", categoryno=" + categoryno + ", grade=" + grade + ", gwamok=" + gwamok + "]";
	}
	
	
	
}
