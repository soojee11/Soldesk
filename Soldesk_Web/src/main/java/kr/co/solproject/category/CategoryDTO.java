package kr.co.solproject.category;

public class CategoryDTO {

	private int categoryno;	      // ī�װ� ��ȣ
	private int grade;		        // �г�	
	private String gwamok;	      // ����
	private String categoryInfo;  // ���� ����

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

  public String getcategoryInfo() {
    return categoryInfo;
  }

  public void setcategoryInfo(String categoryInfo) {
    this.categoryInfo = categoryInfo;
  }

}
