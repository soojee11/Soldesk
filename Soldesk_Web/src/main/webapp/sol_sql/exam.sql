create table SOL_TEST (
	testno		INT				NOT NULL	auto_increment,	--일련번호
	grade		INT				NOT NULL,					--학년
	subject		VARCHAR(200)	NOT NULL,					--과목
	testtitle	VARCHAR(500)	NOT NULL,					--문제지제목
	primary key(testno)
);						

--insert
insert into sol_test(grade,subject,testtitle)
values(1,"eng","1학년 영어 핵심 예제2");

insert into sol_member(id,name,passwd,email,tel,zipcode,address1,address2,mdate,mlevel)
values("ming","민경","1234@@","alsrud0482@hanmail.net",'','','','',now(),"A");

create table SOL_QUESTION (
	testno		INT				NOT NULL	auto_increment,	--일련번호
	questno		INT				NOT NULL,					--문제번호
	qtitle		VARCHAR(500)	NOT NULL,					--문제제목
	qtype		VARCHAR(10)		NOT NULL,					--문제종류(G/J/OX)
	answer		VARCHAR(500)	NOT NULL,					--답
	comment		VARCHAR(600)	NOT NULL,					--해설
	qimg		VARCHAR(500)	NULL,						--캡쳐화면
	primary key(testno,questno),
	constraint fk_testno foreign key (testno) REFERENCES SOL_TEST(testno) on delete cascade	
);

create table SOL_EXAMPLE (
	examno		INT				NOT NULL	auto_increment,	--일련번호
	questno		INT				NOT NULL,					--문제번호
	example		VARCHAR(500)	NOT NULL,					--보기
	primary key(examno),
	constraint fk_questno foreign key (questno) REFERENCES SOL_QUESTION(questno) on delete cascade
);

create table SOL_MYSCORE (
	mytestno	INT				NOT NULL	auto_increment,	--max(mytestno)해서 최근본 시험출력
	id			VARCHAR(10)		NOT NULL,					--아이디
	testno		INT				NOT NULL,					--일련번호
	usetime		VARCHAR(20)		NOT NULL,					--경과시간
	answerno	VARCHAR(200)	NOT NULL,					--문제번호,답/
	regdt		datetime		NOT NULL,					--시험일
	primary key(mytestno),
	constraint fk_testno foreign key (testno) REFERENCES SOL_TEST(testno) on delete cascade
);