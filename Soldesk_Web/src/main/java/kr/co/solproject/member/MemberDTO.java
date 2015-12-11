package kr.co.solproject.member;

public class MemberDTO {
	
	private String id; 		 // -- 아이디, 중복 안됨, 레코드를 구분하는 컬럼
	private String passwd; 	 // -- 패스워드
	private String name; 	 // -- 성명
	private String tel; 	 // -- 전화번호
	private String email; 	 // -- 전자우편 주소, 중복 안됨 //unique설정하기★★★★★★★★★★★★★
	private String zipcode;  // -- 우편번호, 101-101
	private String address1; // -- 주소
	private String address2; // -- 주소
	private String mlevel;	 // -- 회원 등급, A, B, D
	private String mdate;    //-- 등록일
	private String promise;    //-- 한줄다짐
	public MemberDTO() {
			System.out.println("▶------MemberDTO()객체 생성됨...");
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getMlevel() {
		return mlevel;
	}
	public void setMlevel(String mlevel) {
		this.mlevel = mlevel;
	}
	public String getMdate() {
		return mdate;
	}
	public void setMdate(String mdate) {
		this.mdate = mdate;
	}
	public String getPromise() {
		return promise;
	}
	public void setPromise(String promise) {
		this.promise = promise;
	}
	@Override
	public String toString() {
		return "MemberDTO [id=" + id + ", passwd=" + passwd + ", name=" + name + ", tel=" + tel + ", email=" + email
				+ ", zipcode=" + zipcode + ", address1=" + address1 + ", address2=" + address2 + ", mlevel=" + mlevel
				+ ", mdate=" + mdate + ", promise=" + promise + "]";
	}
	
	
}