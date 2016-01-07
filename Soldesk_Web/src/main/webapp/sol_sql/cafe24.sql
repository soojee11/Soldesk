create table sol_test(							
	testno INT NOT NULL auto_increment,				
	grade INT NOT NULL,				
	subject VARCHAR(200) NOT NULL,			
	testtitle VARCHAR(500) NOT NULL,
	testshow VARCHAR(10) NOT NULL default 'N',
	primary key(testno)						
);		
							
create table sol_question(							
	testno INT NOT NULL,			
	questno INT NOT NULL,
	qtitle VARCHAR(500) NOT NULL,			
	qtype VARCHAR(10) NOT NULL,		
	answer VARCHAR(500) NOT NULL,			
	comment text NOT NULL,			
	poster text NULL,			
	example VARCHAR(500) NULL,			
	qynshow VARCHAR(10)	 NOT NULL default 'Y',		
	primary key(testno,questno),
	constraint fk_testno foreign key ( testno ) REFERENCES  sol_test ( testno ) on delete cascade					
);	
											
create table sol_myscore(							
	mytestno INT NOT NULL auto_increment,
	id VARCHAR(10) NOT NULL,	
	testno INT NOT NULL,
	usetime VARCHAR(20) NOT NULL,
	answerno VARCHAR(200) NOT NULL,				
	regdt datetime NOT NULL,
	myscore INT NOT NULL,
	primary key(mytestno),
	constraint fk_testno foreign key ( testno ) REFERENCES  sol_test ( testno ) on delete cascade						
);					
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
);			
		
CREATE TABLE sol_bbs(
	bbsno int(11) NOT NULL auto_increment,
	subject varchar(100) NOT NULL,       
	content text NOT NULL,
	passwd varchar(15) NOT NULL,
	regdt datetime NOT  NULL,
	readcnt int(11) NOT NULL default 0,
	noticeshow varchar(10) NOT NULL  default 'N', 
	PRIMARY KEY (bbsno)
);

CREATE TABLE sol_study(
	lectureno	int(11)	NOT NULL,
	id		VARCHAR(200) 	NOT NULL,      
	memo		VARCHAR(500)	NULL,
	memodate		datetime	NULL,
	PRIMARY KEY  (lectureno,id),
	constraint fk_lectureno foreign key ( lectureno ) REFERENCES  sol_lecture ( lectureno ) on delete cascade
);

CREATE TABLE sol_postscript(
	postscriptno	INT(11)	auto_increment NOT NULL,
	categoryno	INT(11)	NOT NULL,
	id		VARCHAR(20)	NOT NULL,
	content		VARCHAR(500)	NOT NULL,
	regdate		datetime	NOT NULL,
	postgrade	INT(11)	default 0	NOT NULL,
	PRIMARY KEY  (postscriptno),
	constraint fkfk_categoryno foreign key ( categoryno ) REFERENCES  sol_category ( categoryno ) on delete cascade
);

CREATE TABLE sol_lectureqna(
	lectureqnano	INT(11)		auto_increment 	NOT NULL,
	categoryno	INT(11)		NOT NULL,
	id		VARCHAR(20)	NOT NULL,
	subject		VARCHAR(200)	NOT NULL,
	content		TEXT	NOT NULL,
	regdate		datetime	NOT NULL,
	readcnt		INT(11)		NOT NULL	default 0,
	filename	VARCHAR(200)	NULL,
	PRIMARY KEY  (lectureqnano),
	constraint fkfkfk_categoryno foreign key ( categoryno ) REFERENCES  sol_category ( categoryno ) on delete cascade
);

create table SOL_category(
	categoryno INT NOT NULL auto_increment,
	grade TINYINT NOT NULL,
	gwamok VARCHAR(200) NOT NULL,
	categoryinfo VARCHAR(500) NOT NULL,
	teacherName VARCHAR(20) NOT NULL,
	teacherCareer VARCHAR(500) NOT NULL,
	teacherPhoto VARCHAR(50) NOT NULL,
	bookInfo TEXT NOT NULL,
	bookPhoto  VARCHAR(50) not null,
	primary key(categoryno)
);
				
create table sol_lecture(				
	lectureno	INT(11)	NOT NULL	auto_increment,
	subject		VARCHAR(200)	NOT NULL,
	filename	VARCHAR(200)	NOT NULL,
	filesize	BIGINT(20)	NOT NULL,
	poster		VARCHAR(500)	NOT NULL,
	lecturetime	INT(11)	NOT NULL,
	categoryno	INT(11)	NOT NULL,
	primary key(lectureno),
	constraint fk_categoryno foreign key ( categoryno ) REFERENCES  sol_category ( categoryno ) on delete cascade	
);

CREATE TABLE sol_reply(	
	replyno INT NOT NULL auto_increment, -- 댓글 번호	
	content VARCHAR(500) NOT NULL,    -- 댓글 내용 	
	passwd VARCHAR(15) NOT NULL,      -- 패스워드  	
	rdate DATETIME NOT NULL,          -- 등록일	
	tablename VARCHAR(10) NOT NULL,   -- B자게 Q질게	
	tableno INT NOT NULL,	
	primary key(replyno)	
);

CREATE TABLE sol_calendar(			
	calno           int(11)        NOT NULL  auto_increment primary key,			
	id              varchar(10)    NOT NULL,       			
	lectureno       int(11)        NOT NULL,			
	regdate         datetime       NOT NULL,
);		

CREATE TABLE sol_member(			
	id          varchar(10)    NOT NULL primary key ,			
	name        varchar(50)    NOT NULL,       			
	passwd      varchar(15)    NOT NULL,			
	email       varchar(50)    NOT NULL ,			
	tel         varchar(14)     NULL,			
	zipcode     varchar(7)     NULL,			
	address1     varchar(200)    NULL,			
	address2    varchar(200)     NULL ,			
	mdate  datetime not null,			
	mlevel  varchar(10) not null default 'B',	
	promise varchar(200) null default 'fighting!',		
	unique key(email)					
);

CREATE TABLE sol_zipcode(
	zipcode char(7) not null,
	sido varchar(30) not null,
	gugun varchar(50) not null,
	dong varchar(50) not null,
	li varchar(50)  null,
	bunji varchar(255) null,
	etc varchar(255) null
);

create table sol_video(				
	videono	INT	NOT NULL	auto_increment,
	title	VARCHAR(100)	NOT NULL,	
	primary key(videono)			
);	
insert into sol_video(title) values('공부하는 아이.mp4');			
insert into sol_video(title) values('대한민국에서 [초딩]으로 산다는 것.mp4');					