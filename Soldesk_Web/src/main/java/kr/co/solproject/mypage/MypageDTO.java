package kr.co.solproject.mypage;

public class MypageDTO {
	
	private int calno; //calendar numberÃß°¡µÊ->PK
	private String id; 		     
	private String regdate; 	    
	private int lectureno; 	
	
	//------------------------------------------------------
    private String memo;
    private String memodate; // memo µî·ÏÀÏ 
	
    public String getMemo() {
		return memo;
	}


	public void setMemo(String memo) {
		this.memo = memo;
	}


	public String getMemodate() {
		return memodate;
	}


	public void setMemodate(String memodate) {
		this.memodate = memodate;
	}

	//--------------------------------------------------------
	public MypageDTO() {
		//System.out.println("¢º------MypageDTO()°´Ã¼ »ý¼ºµÊ...");
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
	@Override
	public String toString() {
		return "MypageDTO [calno=" + calno + ", id=" + id + ", regdate=" + regdate + ", lectureno=" + lectureno
				+ ", memo=" + memo + ", memodate=" + memodate + "]";
	}
	
}