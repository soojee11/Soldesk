package kr.co.solproject.member;

public class MemberDTO {
	
	private String id; 		 // -- ���̵�, �ߺ� �ȵ�, ���ڵ带 �����ϴ� �÷�
	private String passwd; 	 // -- �н�����
	private String name; 	 // -- ����
	private String tel; 	 // -- ��ȭ��ȣ
	private String email; 	 // -- ���ڿ��� �ּ�, �ߺ� �ȵ� //unique�����ϱ�ڡڡڡڡڡڡڡڡڡڡڡڡ�
	private String zipcode;  // -- �����ȣ, 101-101
	private String address1; // -- �ּ�
	private String address2; // -- �ּ�
	private String mlevel;	 // -- ȸ�� ���, A, B, D
	private String mdate;    //-- �����
	private String promise;    //-- ���ٴ���
	public MemberDTO() {
			System.out.println("��------MemberDTO()��ü ������...");
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