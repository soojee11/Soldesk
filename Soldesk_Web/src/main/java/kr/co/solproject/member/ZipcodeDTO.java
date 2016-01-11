package kr.co.solproject.member;

public class ZipcodeDTO {
	private String zipcode;	// -- 우편번호
	private String sido;	// -- 시, 도
	private String gugun;	// -- 구, 군
	private String dong;	// -- 동
	private String li;		// -- 리
	private String bunji; 	// -- 번지
	private String etc; 	// -- 세부 주소
	
	public ZipcodeDTO() {
	}
	public String getZipcode() {
		return zipcode;
	}
	public String getSido() {
		return sido;
	}
	public String getGugun() {
		return gugun;
	}
	public String getDong() {
		return dong;
	}
	public String getLi() {
		return li;
	}
	public String getBunji() {
		return bunji;
	}
	public String getEtc() {
		return etc;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public void setSido(String sido) {
		this.sido = sido;
	}
	public void setGugun(String gugun) {
		this.gugun = gugun;
	}
	public void setDong(String dong) {
		this.dong = dong;
	}
	public void setLi(String li) {
		this.li = li;
	}
	public void setBunji(String bunji) {
		this.bunji = bunji;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	@Override
	public String toString() {
		return "ZipcodeDTO [zipcode=" + zipcode + ", sido=" + sido + ", gugun="
				+ gugun + ", dong=" + dong + ", li=" + li + ", bunji=" + bunji
				+ ", etc=" + etc + "]";
	}

	
	
	
}
