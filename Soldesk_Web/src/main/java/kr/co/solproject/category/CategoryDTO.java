package kr.co.solproject.category;

public class CategoryDTO {

	private int categoryno;	      // ī�װ� ��ȣ
	private int grade;		        // �г�	
	private String gwamok;	      // ����
	private String categoryinfo;  // ���� ����

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
