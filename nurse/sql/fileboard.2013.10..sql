
CREATE SEQUENCE FILEBOARD_SNO_SEQ
	START WITH 1
	INCREMENT BY 1
	NOMAXVALUE
	NOCACHE
	NOCYCLE;

CREATE TABLE fileboard (
                sno NUMBER(8) NOT NULL,
                gno NUMBER(8) NOT NULL,
                srtno NUMBER(5) NOT NULL,
                gap NUMBER(3) NOT NULL,
                writer VARCHAR2(40) NOT NULL,
                subject VARCHAR2(200) NOT NULL,
                content VARCHAR2(4000) NOT NULL,
                regdate TIMESTAMP NOT NULL,
                ip VARCHAR2(60),
                readcount NUMBER(6) DEFAULT 0 NOT NULL,
                downcount NUMBER(6) DEFAULT 0 NOT NULL,
                file1 VARCHAR2(100),
                file2 VARCHAR2(100),
                file3 VARCHAR2(100),
                file4 VARCHAR2(100),
                file5 VARCHAR2(100),
                CONSTRAINT FILEBOARD_SNO_PK PRIMARY KEY (sno)
);

select * from fileboard;

desc fileboard;

insert into fileboard
values(FILEBOARD_SNO_SEQ.NEXTVAL,FILEBOARD_SNO_SEQ.NEXTVAL,1,0,
'writer','subject','content',sysdate,
'localhost',0,0,null,null,null,null,null
);

commit;