--테이블 삭제
drop table tb_bbs;
--테이블 생성
create table tb_bbs(
  bbsno    number(5)       not null -- 일련번호 99999
 ,wname    varchar2(20)    not null -- 작성자
 ,subject  varchar2(100)   not null -- 글제목
 ,content  varchar2(2000)  not null -- 글내용
 ,passwd   varchar2(10)    not null -- 글비밀번호
 ,readcnt  number(5)       default 0 not null -- 글조회수
 ,regdt    date            default  sysdate -- 글작성일
 ,grpno    number(5)       not null  -- 글 그룹번호
 ,indent   number(5)       default 0 -- 들여쓰기
 ,ansnum   number(5)       default 0 -- 글순서
 ,ip       varchar2(15)    not null -- 글 IP
 ,primary key(bbsno)                --bbsno 기본키 
);
--시퀀스 생성
create sequence bbsno_seq;
--조회
select * from tb_bbs;

drop table tb_bbs;
drop sequence bbsno_seq;

select bbsno, wname, subject, regdt, readcnt, ip, grpno
from tb_bbs
where bbsno = 142

select count(*) as cnt
from tb_bbs
where bbsno = 121 and passwd = '1234'

select * from member