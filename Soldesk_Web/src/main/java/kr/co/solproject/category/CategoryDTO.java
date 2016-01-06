package kr.co.solproject.category;

import org.springframework.web.multipart.MultipartFile;

public class CategoryDTO {

	private int categoryno;	      	// ī�װ� ��ȣ
	private int grade;		        // �г�	
	private String gwamok;	    	// ����
	private String teacherName; 	// ������ �̸�
	private String teacherPhoto; 	// ������ ����
	private String teacherCareer; 	// ������ �̷�
	private String categoryinfo;  	// ���� ����
	private String bookInfo; 		// å ����
	private String bookPhoto;		// å ����
	
	// ������ ���� ���ε� ����
	private MultipartFile teacherMF; //<INPUT type='file' name='teacherMF'>
	// ���� ���� ���ε� ����
	private MultipartFile bookMF; //<INPUT type='file' name='bookMF'>
	
	public CategoryDTO() {
	}

	public int getCategoryno() {
		return categoryno;
	}

	public void setCategoryno(int categoryno) {
		this.categoryno = categoryno;
	}

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

	public String getTeacherName() {
		return teacherName;
	}

	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}

	public String getTeacherPhoto() {
		return teacherPhoto;
	}

	public void setTeacherPhoto(String teacherPhoto) {
		this.teacherPhoto = teacherPhoto;
	}

	public String getTeacherCareer() {
		return teacherCareer;
	}

	public void setTeacherCareer(String teacherCareer) {
		this.teacherCareer = teacherCareer;
	}

	public String getCategoryinfo() {
		return categoryinfo;
	}

	public void setCategoryinfo(String categoryinfo) {
		this.categoryinfo = categoryinfo;
	}

	public String getBookInfo() {
		return bookInfo;
	}

	public void setBookInfo(String bookInfo) {
		this.bookInfo = bookInfo;
	}

	public MultipartFile getTeacherMF() {
		return teacherMF;
	}

	public void setTeacherMF(MultipartFile teacherMF) {
		this.teacherMF = teacherMF;
	}

	public String getBookPhoto() {
		return bookPhoto;
	}

	public void setBookPhoto(String bookPhoto) {
		this.bookPhoto = bookPhoto;
	}

	public MultipartFile getBookMF() {
		return bookMF;
	}

	public void setBookMF(MultipartFile bookMF) {
		this.bookMF = bookMF;
	}
	
	
	
	
}
