package kr.co.solproject.admin;

public class CategoryDTO {
	private int categoryno;
	private int grade;
	private String gwamok;
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
	@Override
	public String toString() {
		return "CategoryDTO [categoryno=" + categoryno + ", grade=" + grade + ", gwamok=" + gwamok + "]";
	}
	
	

}
