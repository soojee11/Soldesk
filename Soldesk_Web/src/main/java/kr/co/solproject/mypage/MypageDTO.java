package kr.co.solproject.mypage;

public class MypageDTO {
	
	private int calno; //calendar numberÃß°¡µÊ->PK
	private String id; 		     
	private String regdate; 	    
	private int lectureno; 	
	
	public MypageDTO() {
		System.out.println("¢º------MypageDTO()°´Ã¼ »ý¼ºµÊ...");
	}

	
	public int getCalno() {
		return calno;
	}
	public void setCalno(int calno) {
		this.calno = calno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getLectureno() {
		return lectureno;
	}
	public void setLectureno(int lectureno) {
		this.lectureno = lectureno;
	}
	
	
}