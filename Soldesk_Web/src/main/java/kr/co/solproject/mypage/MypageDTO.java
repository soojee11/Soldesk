package kr.co.solproject.mypage;

public class MypageDTO {
	
	private String id; 		     
	private String regdt; 	    
	private String lectureno; 	
	
	public MypageDTO() {
		System.out.println("¢º------MypageDTO()°´Ã¼ »ý¼ºµÊ...");
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRegdt() {
		return regdt;
	}
	public void setRegdt(String regdt) {
		this.regdt = regdt;
	}
	public String getLectureno() {
		return lectureno;
	}
	public void setLectureno(String lectureno) {
		this.lectureno = lectureno;
	}
	
	
}