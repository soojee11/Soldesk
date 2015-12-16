create table SOL_TEST (
	testno		INT				NOT NULL	auto_increment,	--�Ϸù�ȣ
	grade		INT				NOT NULL,					--�г�
	subject		VARCHAR(200)	NOT NULL,					--����
	testtitle	VARCHAR(500)	NOT NULL,					--����������
	primary key(testno)
);						

--insert
insert into sol_test(grade,subject,testtitle)
values(1,"eng","1�г� ���� �ٽ� ����2");

insert into sol_member(id,name,passwd,email,tel,zipcode,address1,address2,mdate,mlevel)
values("ming","�ΰ�","1234@@","alsrud0482@hanmail.net",'','','','',now(),"A");

create table SOL_QUESTION (
	testno		INT				NOT NULL	auto_increment,	--�Ϸù�ȣ
	questno		INT				NOT NULL,					--������ȣ
	qtitle		VARCHAR(500)	NOT NULL,					--��������
	qtype		VARCHAR(10)		NOT NULL,					--��������(G/J/OX)
	answer		VARCHAR(500)	NOT NULL,					--��
	comment		VARCHAR(600)	NOT NULL,					--�ؼ�
	qimg		VARCHAR(500)	NULL,						--ĸ��ȭ��
	primary key(testno,questno),
	constraint fk_testno foreign key (testno) REFERENCES SOL_TEST(testno) on delete cascade	
);

create table SOL_EXAMPLE (
	examno		INT				NOT NULL	auto_increment,	--�Ϸù�ȣ
	questno		INT				NOT NULL,					--������ȣ
	example		VARCHAR(500)	NOT NULL,					--����
	primary key(examno),
	constraint fk_questno foreign key (questno) REFERENCES SOL_QUESTION(questno) on delete cascade
);

create table SOL_MYSCORE (
	mytestno	INT				NOT NULL	auto_increment,	--max(mytestno)�ؼ� �ֱٺ� �������
	id			VARCHAR(10)		NOT NULL,					--���̵�
	testno		INT				NOT NULL,					--�Ϸù�ȣ
	usetime		VARCHAR(20)		NOT NULL,					--����ð�
	answerno	VARCHAR(200)	NOT NULL,					--������ȣ,��/
	regdt		datetime		NOT NULL,					--������
	primary key(mytestno),
	constraint fk_testno foreign key (testno) REFERENCES SOL_TEST(testno) on delete cascade
);