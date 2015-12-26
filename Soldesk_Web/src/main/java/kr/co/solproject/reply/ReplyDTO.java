package kr.co.solproject.reply;

public class ReplyDTO {
	private int replyno;
	private String content;
	private String passwd;
	private String rdate;
	private String tablename;
	private int tableno;
	private String updateContent;	//bbs댓글업데이트할내용저장할 변수(db는 없음)
	
	public int getReplyno() {
		return replyno;
	}
	public void setReplyno(int replyno) {
		this.replyno = replyno;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	public String getTablename() {
		return tablename;
	}
	public void setTablename(String tablename) {
		this.tablename = tablename;
	}
	public int getTableno() {
		return tableno;
	}
	public void setTableno(int tableno) {
		this.tableno = tableno;
	}
	public String getUpdateContent() {
		return updateContent;
	}
	public void setUpdateContent(String updateContent) {
		this.updateContent = updateContent;
	}
	
	@Override
	public String toString() {
		return "ReplyDTO [replyno=" + replyno + ", content=" + content + ", passwd=" + passwd + ", rdate=" + rdate
				+ ", tablename=" + tablename + ", tableno=" + tableno + ", updateContent=" + updateContent + "]";
	}
	
}
