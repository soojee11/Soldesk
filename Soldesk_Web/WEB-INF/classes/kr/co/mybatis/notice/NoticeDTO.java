package kr.co.mybatis.notice;

public class NoticeDTO {
	private int noticeno;
	private String title;
	private String rdate;
	
	public NoticeDTO() {}
	
	public NoticeDTO(String title) {
		this.title = title;
	}
		
	public NoticeDTO(int noticeno, String title) {
		this.noticeno = noticeno;
		this.title = title;
	}

	public int getNoticeno() {
		return noticeno;
	}

	public void setNoticeno(int noticeno) {
		this.noticeno = noticeno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getRdate() {
		return rdate;
	}

	public void setRdate(String rdate) {
		this.rdate = rdate;
	}

	@Override
	public String toString() {
		return "NoticeDTO [noticeno=" + noticeno + ", title=" + title + ", rdate=" + rdate + "]";
	}
	
}
