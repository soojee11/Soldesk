package kr.co.solproject.category;

public class CategoryDTO {

	private int categoryno;	      // 카테고리 번호
	private int grade;		        // 학년	
	private String gwamok;	      // 과목
	private String categoryinfo;  // 강의 설명

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

  public String getcategoryinfo() {
    return categoryinfo;
  }

  public void setcategoryinfo(String categoryinfo) {
    this.categoryinfo = categoryinfo;
  }

}
