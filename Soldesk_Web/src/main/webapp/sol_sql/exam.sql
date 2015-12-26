create table sol_test(							
	testno INT NOT NULL auto_increment,				
	grade INT NOT NULL,				
	subject VARCHAR(200) NOT NULL,			
	testtitle VARCHAR(500) NOT NULL,
	testshow VARCHAR(10) NOT NULL default 'N',
	primary key(testno)						
)ENGINE=MyISAM DEFAULT CHARSET="euckr";			
							
create table sol_question(							
	testno INT NOT NULL,			
	questno INT NOT NULL,
	qtitle VARCHAR(500) NOT NULL,			
	qtype VARCHAR(10)	 NOT NULL,		
	answer VARCHAR(500) NOT NULL,			
	comment VARCHAR(600) NOT NULL,			
	poster VARCHAR(600) NULL,			
	example VARCHAR(500) NULL,			
	qynshow VARCHAR(10)	 NOT NULL default 'Y',		
	primary key(testno,questno)						
)ENGINE=MyISAM DEFAULT CHARSET="euckr";							
											
create table sol_myscore(							
	mytestno INT NOT NULL auto_increment,
	id VARCHAR(10) NOT NULL,	
	testno INT NOT NULL,
	usetime VARCHAR(20) NOT NULL,
	answerno VARCHAR(200) NOT NULL,				
	regdt datetime NOT NULL,
	myscore INT NOT NULL,
	primary key(mytestno)						
)ENGINE=MyISAM DEFAULT CHARSET="euckr";							



create table sol_qna(		
qnano INT NOT NULL auto_increment,		
id VARCHAR(20) NOT NULL,		
subject VARCHAR(100) NOT NULL,		
content text NOT NULL,		
passwd VARCHAR(15) NOT NULL,		
readcnt int default 0 not null,		
regdt DATETIME NOT NULL,		
replyok VARCHAR(10) NOT NULL default 'N',		
qnashow VARCHAR(10) NOT NULL default 'N',		
primary key(qnano)		
)ENGINE=MyISAM DEFAULT CHARSET="euckr";				
		
CREATE TABLE sol_bbs(
bbsno		int(11)		NOT NULL	auto_increment,
subject		varchar(100)    NOT NULL,       
content		text		NOT NULL,
passwd		varchar(15)	NOT NULL,
regdt		datetime	NOT  NULL,
readcnt		int(11)		NOT NULL	default 0,
PRIMARY KEY  (bbsno)
)ENGINE=MyISAM DEFAULT CHARSET="euckr";	

CREATE TABLE sol_study(
lectureno	int(11)		NOT NULL,
id		VARCHAR(200) 	NOT NULL,      
memo		VARCHAR(500)	NULL,
memodate		datetime	NULL,
PRIMARY KEY  (lectureno,id)
)ENGINE=MyISAM DEFAULT CHARSET="euckr";	

CREATE TABLE sol_postscript(
postscriptno	INT(11)	auto_increment NOT NULL,
categoryno	INT(11)	NOT NULL,
id		VARCHAR(20)	NOT NULL,
content		VARCHAR(500)	NOT NULL,
regdate		datetime	NOT NULL,
postgrade	INT(11)	default 0	NOT NULL,
PRIMARY KEY  (postscriptno)
)ENGINE=MyISAM DEFAULT CHARSET="euckr";	

CREATE TABLE sol_lectureqna(
lectureqnano	INT(11)		auto_increment 	NOT NULL,
categoryno	INT(11)		NOT NULL,
id		VARCHAR(20)	NOT NULL,
subject		VARCHAR(200)	NOT NULL,
content		VARCHAR(500)	NOT NULL,
regdate		datetime	NOT NULL,
readcnt		INT(11)		NOT NULL	default 0,
filename	VARCHAR(200)	NULL,
PRIMARY KEY  (lectureqnano)
)ENGINE=MyISAM DEFAULT CHARSET="euckr";	

create table SOL_category(				
	categoryno	INT(11)	NOT NULL auto_increment,	
	grade		TINYINT NOT NULL,	
	gwamok		VARCHAR(200) NOT NULL,	
	categoryInfo	VARCHAR(500) NOT NULL,		
	primary key(categoryno)			
)ENGINE=MyISAM DEFAULT CHARSET="euckr";				
				
create table sol_lecture(				
	lectureno	INT(11)	NOT NULL	auto_increment,
	subject		VARCHAR(200)	NOT NULL,
	filename	VARCHAR(200)	NOT NULL,
	filesize	BIGINT(20)	NOT NULL,
	poster		VARCHAR(500)	NOT NULL,
	teacher		VARCHAR(200)	NOT NULL,
	lecturetime	INT(11)	NOT NULL,
	categoryno	INT(11)	NOT NULL,
	primary key(lectureno)		
)ENGINE=MyISAM DEFAULT CHARSET="euckr";	

CREATE TABLE sol_reply(	
  replyno INT NOT NULL auto_increment, -- 댓글 번호	
  content VARCHAR(500) NOT NULL,    -- 댓글 내용 	
  passwd VARCHAR(15) NOT NULL,      -- 패스워드  	
  rdate DATETIME NOT NULL,          -- 등록일	
  tablename VARCHAR(10) NOT NULL,   -- B자게 Q질게	
  tableno INT NOT NULL,	
  primary key(replyno)	
)ENGINE=MyISAM DEFAULT CHARSET="euckr";	
