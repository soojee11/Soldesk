package kr.co.solproject.postscript;

public class PostscriptDTO {
	
	private int postscriptno;	// 후기번호
	private int categoryno;		// 카테고리번호
	private String id;			// 작성자 아이디
	private String content;		// 내용
	private String regdate;		// 작성일
	private int postgrade;		// 평점
	
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
