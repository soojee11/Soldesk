package kr.co.solproject.lecture;

public class LectureDTO {
	private int lectureno;		// ������ȣ	
	private String subject;		// ����
	private String filename;	// �������� 
	private String poster;		// ĸ��ȭ�� 
	private String teacher;		// ������ �̸� 
	private String lecturetime;	// ���ǽð�		
	
	private int categoryno;		// ī�װ���ȣ	
		
	// --------------------------------------- ī�װ� ���̺� ����
	
	//private int categoryno;	// ī�װ� ��ȣ
	private int grade;		// �г�	
	private String gwamok;	// ����
	
	
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

	//------------------------------------------ ī�װ� ���̺� ����
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
