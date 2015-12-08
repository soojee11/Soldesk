package kr.co.solproject.player;

import org.springframework.web.multipart.MultipartFile;

public class PlayerDTO {
  private int lectureno;
  private String subject;
  private String filename;
  private Long filesize;
  private String poster;
  private String teacher;
  private int lecturetime;
  private int categoryno;
  
//스프링에서 파일 업로드 관련 멘버변수
  private MultipartFile posterMF; //<INPUT type='file' name='posterMF'
  private MultipartFile filenameMF; //<INPUT type='file' name='filenameMF'>
  
  public PlayerDTO(){} // 생성자 
  
  public MultipartFile getPosterMF() {
    return posterMF;
  }

  public void setPosterMF(MultipartFile posterMF) {
    this.posterMF = posterMF;
  }

  public MultipartFile getFilenameMF() {
    return filenameMF;
  }

  public void setFilenameMF(MultipartFile filenameMF) {
    this.filenameMF = filenameMF;
  }
  
  //----------------------
  

  public int getLectureno() {
    return lectureno;
  }

  public void setLectureno(int lectureno) {
    this.lectureno = lectureno;
  }

  public String getSubject() {
    return subject;
  }

  public void setSubject(String subject) {
    this.subject = subject;
  }

  public String getFilename() {
    return filename;
  }

  public void setFilename(String filename) {
    this.filename = filename;
  }

  public Long getFilesize() {
    return filesize;
  }

  public void setFilesize(Long filesize) {
    this.filesize = filesize;
  }

  public String getPoster() {
    return poster;
  }

  public void setPoster(String poster) {
    this.poster = poster;
  }

  public String getTeacher() {
    return teacher;
  }

  public void setTeacher(String teacher) {
    this.teacher = teacher;
  }

  public int getLecturetime() {
    return lecturetime;
  }

  public void setLecturetime(int lecturetime) {
    this.lecturetime = lecturetime;
  }

  public int getCategoryno() {
    return categoryno;
  }

  public void setCategoryno(int categoryno) {
    this.categoryno = categoryno;
  }

  @Override
  public String toString() {
    return "PlayerDTO [lectureno=" + lectureno + ", subject=" + subject + ", filename=" + filename + ", filesize="
        + filesize + ", poster=" + poster + ", teacher=" + teacher + ", lecturetime=" + lecturetime + ", categoryno="
        + categoryno + "]";
  }
  
}
