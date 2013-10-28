CREATE TABLE BOARD(
	NUM NUMBER(7,0) PRIMARY KEY,
	WRITER VARCHAR2(12) NOT NULL,
	EMAIL VARCHAR2(30) NOT NULL,
	SUBJECT VARCHAR2(50) NOT NULL,
	PASS VARCHAR2(10) NOT NULL,
	READCOUNT NUMBER(5,0) DEFAULT 0 NOT NULL,
	REF NUMBER(5,0) DEFAULT 0 NOT NULL,
	STEP NUMBER(3,0) DEFAULT 0 NOT NULL,
	DEPTH NUMBER(3,0) DEFAULT 0 NOT NULL,
	REGDATE TIMESTAMP(6) DEFAULT SYSDATE NOT NULL,
	CONTENT VARCHAR2(4000) NOT NULL,
	IP VARCHAR2(20) NOT NULL
);
insert into board(num, writer, email, subject, pass, readcount,ref, step, depth, regdate, content,ip) 
values(1,'song','lightel@naver.com','title','1111',1,1,0,0, sysdate,'content','127.0.0.1')
commit

CREATE SEQUENCE board_seq
	START WITH 1
	INCREMENT BY 1
	NOMAXVALUE
	NOCACHE
	NOCYCLE;
  
select * from board
desc board

alter table board add (gno number(7,0));
alter table board add (ccnt number(7,0));
alter table board add (srtno number(7,0));
alter table board add (gap number(7,0));