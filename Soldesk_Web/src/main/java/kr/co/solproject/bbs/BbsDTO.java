package kr.co.solproject.bbs;

public class BbsDTO {
  private int bbsno;
  private String subject;
  private String content;
  private String passwd;
  private String regdt;
  private int readcnt;
  
  public BbsDTO(){}

  public int getBbsno() {
    return bbsno;
  }

  public void setBbsno(int bbsno) {
    this.bbsno = bbsno;
  }

  public String getSubject() {
    return subject;
  }

  public void setSubject(String subject) {
    this.subject = subject;
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

  public String getRegdt() {
    return regdt;
  }

  public void setRegdt(String regdt) {
    this.regdt = regdt;
  }

  public int getReadcnt() {
    return readcnt;
  }

  public void setReadcnt(int readcnt) {
    this.readcnt = readcnt;
  }

  @Override
  public String toString() {
    return "BbsDTO [bbsno=" + bbsno + ", subject=" + subject + ", content=" + content + ", passwd=" + passwd
        + ", regdt=" + regdt + ", readcnt=" + readcnt + "]";
  }
  
}
