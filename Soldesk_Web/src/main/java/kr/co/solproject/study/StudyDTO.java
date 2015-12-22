package kr.co.solproject.study;

public class StudyDTO {
    private int lectureno;
    private String id;
    private String memo;
    private String memodate; // memo µÓ∑œ¿œ 
    
    public StudyDTO(){}

    public int getLectureno() {
      return lectureno;
    }

    public void setLectureno(int lectureno) {
      this.lectureno = lectureno;
    }

    public String getId() {
      return id;
    }

    public void setId(String id) {
      this.id = id;
    }

    public String getMemo() {
      return memo;
    }

    public void setMemo(String memo) {
      this.memo = memo;
    }

    public String getmemodate() {
      return memodate;
    }

    public void setmemodate(String memodate) {
      this.memodate = memodate;
    }
    
    
}
