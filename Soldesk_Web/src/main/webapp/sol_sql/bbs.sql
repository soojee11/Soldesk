--���̺� ����
drop table tb_bbs;
--���̺� ����
create table tb_bbs(
  bbsno    number(5)       not null -- �Ϸù�ȣ 99999
 ,wname    varchar2(20)    not null -- �ۼ���
 ,subject  varchar2(100)   not null -- ������
 ,content  varchar2(2000)  not null -- �۳���
 ,passwd   varchar2(10)    not null -- �ۺ�й�ȣ
 ,readcnt  number(5)       default 0 not null -- ����ȸ��
 ,regdt    date            default  sysdate -- ���ۼ���
 ,grpno    number(5)       not null  -- �� �׷��ȣ
 ,indent   number(5)       default 0 -- �鿩����
 ,ansnum   number(5)       default 0 -- �ۼ���
 ,ip       varchar2(15)    not null -- �� IP
 ,primary key(bbsno)                --bbsno �⺻Ű 
);
--������ ����
create sequence bbsno_seq;
--��ȸ
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