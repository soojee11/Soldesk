package kr.co.solproject.postscript;

public class PostscriptDTO {
	
	private int postscriptno;	// �ı��ȣ
	private int categoryno;		// ī�װ���ȣ
	private String id;			// �ۼ��� ���̵�
	private String content;		// ����
	private String regdate;		// �ۼ���
	private int postgrade;		// ����
	
	public PostscriptDTO() {
		
	}

	public int getPostscriptno() {
		return postscriptno;
	}

	public void setPostscriptno(int postscriptno) {
		this.postscriptno = postscriptno;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getPostgrade() {
		return postgrade;
	}

	public void setPostgrade(int postgrade) {
		this.postgrade = postgrade;
	}

	@Override
	public String toString() {
		return "PostscriptDTO [postscriptno=" + postscriptno + ", categoryno=" + categoryno + ", id=" + id
				+ ", content=" + content + ", regdate=" + regdate + ", postgrade=" + postgrade + "]";
	}
	
}
