package kr.co.solproject.lecture;

public class LectureDTO {
	
	// --------------------------------------- sol_lecture ���� ���̺� �÷�
	private int lectureno;		// ������ȣ	
	private String subject;		// ����
	private String filename;	// �������� 
	private String poster;		// ĸ��ȭ�� 
	private String lecturetime;	// ���ǽð�		
	
	private int categoryno;		// ī�װ���ȣ	
		
	// --------------------------------------- sol_category ī�װ� ���̺� �÷�
	//private int categoryno;	// ī�װ� ��ȣ
	private int grade;		// �г�	
	private String gwamok;	// ����
	private String categoryinfo;
	private String teacherName;
	
	// ������
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
