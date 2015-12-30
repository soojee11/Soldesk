package kr.co.solproject.mypage;

public class MypageDTO {
	
	private int calno; //calendar numberÃß°¡µÊ->PK
	private String id; 		     
	private String regdate; 	    
	private int lectureno; 	
	
	
	
	//------------------------------------------------------sol_bbs
		  private int bbsno;
		  private String content;
		  private String passwd;
		  private int readcnt;
		  private String noticeshow;
	
	
    //------------------------------------------------------sol_qna
			
			private int qnano;
			private String replyok;
			private String qnashow;
			public int getBbsno() {
			return bbsno;
		}

		public void setBbsno(int bbsno) {
			this.bbsno = bbsno;
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

		public int getReadcnt() {
			return readcnt;
		}

		public void setReadcnt(int readcnt) {
			this.readcnt = readcnt;
		}

		public String getNoticeshow() {
			return noticeshow;
		}

		public void setNoticeshow(String noticeshow) {
			this.noticeshow = noticeshow;
		}

		public int getQnano() {
			return qnano;
		}

		public void setQnano(int qnano) {
			this.qnano = qnano;
		}

		public String getReplyok() {
			return replyok;
		}

		public void setReplyok(String replyok) {
			this.replyok = replyok;
		}

		public String getQnashow() {
			return qnashow;
		}

		public void setQnashow(String qnashow) {
			this.qnashow = qnashow;
		}
	
  
	
	
	
	
	
	
	
	
	
	
	//------------------------------------------------------sol_test&myscore
    
	private int mytestno;
	private int testno;
	private String usetime;
	private String answerno;
	private String regdt;
	private int grade;
	private String testtitle;
	private int myscore;
	
	
	public int getMytestno() {
		return mytestno;
	}

	public void setMytestno(int mytestno) {
		this.mytestno = mytestno;
	}

	public int getTestno() {
		return testno;
	}

	public void setTestno(int testno) {
		this.testno = testno;
	}

	public String getUsetime() {
		return usetime;
	}

	public void setUsetime(String usetime) {
		this.usetime = usetime;
	}

	public String getAnswerno() {
		return answerno;
	}

	public void setAnswerno(String answerno) {
		this.answerno = answerno;
	}

	public String getRegdt() {
		return regdt;
	}

	public void setRegdt(String regdt) {
		this.regdt = regdt;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public String getTesttitle() {
		return testtitle;
	}

	public void setTesttitle(String testtitle) {
		this.testtitle = testtitle;
	}

	public int getMyscore() {
		return myscore;
	}

	public void setMyscore(int myscore) {
		this.myscore = myscore;
	}



	//------------------------------------------------------sol_lecture
    private String subject;     // °­ÀÇÁ¦¸ñ
    private String poster;		// Ä¸ÃÄÈ­¸é 
	private String teacher;		// ¼±»ý´Ô ÀÌ¸§ 
    
    public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
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

	//------------------------------------------------------sol_study
    private String memo;     // memo
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
				+ ", bbsno=" + bbsno + ", content=" + content + ", passwd=" + passwd + ", readcnt=" + readcnt
				+ ", noticeshow=" + noticeshow + ", qnano=" + qnano + ", replyok=" + replyok + ", qnashow=" + qnashow
				+ ", mytestno=" + mytestno + ", testno=" + testno + ", usetime=" + usetime + ", answerno=" + answerno
				+ ", regdt=" + regdt + ", grade=" + grade + ", testtitle=" + testtitle + ", myscore=" + myscore
				+ ", subject=" + subject + ", poster=" + poster + ", teacher=" + teacher + ", memo=" + memo
				+ ", memodate=" + memodate + "] \n" ;
	}

	

	
	
	
	
}