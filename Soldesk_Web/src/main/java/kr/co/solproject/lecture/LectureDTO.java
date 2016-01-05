package kr.co.solproject.lecture;

public class LectureDTO {
	
	// --------------------------------------- sol_lecture 교육 테이블 컬럼
	private int lectureno;		// 교육번호	
	private String subject;		// 제목
	private String filename;	// 강의파일 
	private String poster;		// 캡쳐화면 
	private String lecturetime;	// 강의시간		
	
	private int categoryno;		// 카테고리번호	
		
	// --------------------------------------- sol_category 카테고리 테이블 컬럼
	//private int categoryno;	// 카테고리 번호
	private int grade;		// 학년	
	private String gwamok;	// 과목
	private String categoryinfo;
	private String teacherName;
	
	// 생성자
	public LectureDTO() {
		super();
		// TODO Auto-generated constructor stub
	}


	// --------------------------------------- sol_lecture get,set method
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

	public String getLecturetime() {
		return lecturetime;
	}


	public void setLecturetime(String lecturetime) {
		this.lecturetime = lecturetime;
	}


	public int getCategoryno() {
		return categoryno;
	}
	
	public void setCategoryno(int categoryno) {
		this.categoryno = categoryno;
	}

	public String getTeacherName() {
		return teacherName;
	}


	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}

	//------------------------------------------ sol_category get, set method
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
	
	
	public String getCategoryinfo() {
		return categoryinfo;
	}
	
	
	public void setCategoryinfo(String categoryinfo) {
		this.categoryinfo = categoryinfo;
	}
		
	
}
