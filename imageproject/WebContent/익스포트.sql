--------------------------------------------------------
--  파일이 생성됨 - 목요일-12월-06-2018   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence USER1_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SCOTT"."USER1_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 7 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence MINDGAME_GNO_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SCOTT"."MINDGAME_GNO_SEQ"  MINVALUE 1 MAXVALUE 99999 INCREMENT BY 1 START WITH 15 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence POSTIMG_PNO_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SCOTT"."POSTIMG_PNO_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 10 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence GAMEANSWER_ANO_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SCOTT"."GAMEANSWER_ANO_SEQ"  MINVALUE 1 MAXVALUE 99999 INCREMENT BY 1 START WITH 14 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence GAMELIKE_GLNO_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SCOTT"."GAMELIKE_GLNO_SEQ"  MINVALUE 1 MAXVALUE 99999 INCREMENT BY 1 START WITH 4 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence GCOMMENTS_GNO_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SCOTT"."GCOMMENTS_GNO_SEQ"  MINVALUE 1 MAXVALUE 99999 INCREMENT BY 1 START WITH 6 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table USER1
--------------------------------------------------------

  CREATE TABLE "SCOTT"."USER1" 
   (	"CNO" NUMBER(9,0), 
	"CID" VARCHAR2(50 BYTE), 
	"CNIC" VARCHAR2(20 BYTE), 
	"CPW" VARCHAR2(20 BYTE), 
	"CGEN" NUMBER(2,0), 
	"CJOB" VARCHAR2(50 BYTE), 
	"CPO" NUMBER(9,0), 
	"CTEL" VARCHAR2(14 BYTE), 
	"CGRADE" NUMBER(1,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table MINDGAME
--------------------------------------------------------

  CREATE TABLE "SCOTT"."MINDGAME" 
   (	"G_NO" NUMBER(10,0), 
	"G_TITLE" VARCHAR2(50 BYTE), 
	"G_WRITER" VARCHAR2(20 BYTE), 
	"G_CONTENT" VARCHAR2(3000 BYTE), 
	"G_FILE" VARCHAR2(200 BYTE), 
	"G_LIKE" NUMBER(10,0), 
	"G_HIT" NUMBER(10,0), 
	"G_DATE" DATE, 
	"ANSWER" VARCHAR2(50 BYTE), 
	"CURRECT" NUMBER(1,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table POSTIMG
--------------------------------------------------------

  CREATE TABLE "SCOTT"."POSTIMG" 
   (	"P_NO" NUMBER(10,0), 
	"P_TITLE" VARCHAR2(20 BYTE), 
	"P_WRITER" VARCHAR2(20 BYTE), 
	"P_CONTENT" VARCHAR2(3000 BYTE), 
	"P_DRAW" VARCHAR2(200 BYTE), 
	"P_FILE" VARCHAR2(200 BYTE), 
	"P_LIKE" NUMBER(10,0), 
	"P_HIT" NUMBER(10,0), 
	"P_DATE" DATE, 
	"P_THUMBNAIL" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table GAMEANSWER
--------------------------------------------------------

  CREATE TABLE "SCOTT"."GAMEANSWER" 
   (	"A_NO" NUMBER(10,0), 
	"ANSWER" VARCHAR2(50 BYTE), 
	"TAG" VARCHAR2(100 BYTE), 
	"USE" NUMBER(2,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table GAME_LIKE
--------------------------------------------------------

  CREATE TABLE "SCOTT"."GAME_LIKE" 
   (	"GL_NO" NUMBER(10,0), 
	"GL_LIKE" NUMBER(1,0), 
	"G_NO" NUMBER(10,0), 
	"CNO" NUMBER(10,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table GAME_COMMENTS
--------------------------------------------------------

  CREATE TABLE "SCOTT"."GAME_COMMENTS" 
   (	"GC_NO" NUMBER(10,0), 
	"GC_WRITER" VARCHAR2(20 BYTE), 
	"GC_COMMENT" VARCHAR2(100 BYTE), 
	"GC_DATE" DATE, 
	"G_NO" NUMBER(10,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into SCOTT.USER1
SET DEFINE OFF;
Insert into SCOTT.USER1 (CNO,CID,CNIC,CPW,CGEN,CJOB,CPO,CTEL,CGRADE) values (5,'test1','test3','test1',1,'중.고등학생',0,'010-1111-1111',1);
Insert into SCOTT.USER1 (CNO,CID,CNIC,CPW,CGEN,CJOB,CPO,CTEL,CGRADE) values (6,'test2','test2','test2',1,'중.고등학생',0,'010-2222-2222',1);
Insert into SCOTT.USER1 (CNO,CID,CNIC,CPW,CGEN,CJOB,CPO,CTEL,CGRADE) values (0,'master','master','master',1,null,0,null,0);
REM INSERTING into SCOTT.MINDGAME
SET DEFINE OFF;
Insert into SCOTT.MINDGAME (G_NO,G_TITLE,G_WRITER,G_CONTENT,G_FILE,G_LIKE,G_HIT,G_DATE,ANSWER,CURRECT) values (14,'2018년 12월 6일 목요','master','귀여운?','../gameImages/draw14.png',0,1,to_date('18/12/06','RR/MM/DD'),'강아지',0);
Insert into SCOTT.MINDGAME (G_NO,G_TITLE,G_WRITER,G_CONTENT,G_FILE,G_LIKE,G_HIT,G_DATE,ANSWER,CURRECT) values (9,'2018년 12월 4일','김진열','문제 테스트 8','../gameImages/draw9.png',1,17,to_date('18/12/04','RR/MM/DD'),'옥수수',1);
Insert into SCOTT.MINDGAME (G_NO,G_TITLE,G_WRITER,G_CONTENT,G_FILE,G_LIKE,G_HIT,G_DATE,ANSWER,CURRECT) values (8,'2018년 12월 4일','김진열','문제 테스트 8','../gameImages/draw8.png',0,19,to_date('18/12/04','RR/MM/DD'),'감',1);
Insert into SCOTT.MINDGAME (G_NO,G_TITLE,G_WRITER,G_CONTENT,G_FILE,G_LIKE,G_HIT,G_DATE,ANSWER,CURRECT) values (10,'문제 테스트 9 ','김진열','고구마','../gameImages/draw10.png',0,4,to_date('18/12/04','RR/MM/DD'),'고구마',0);
Insert into SCOTT.MINDGAME (G_NO,G_TITLE,G_WRITER,G_CONTENT,G_FILE,G_LIKE,G_HIT,G_DATE,ANSWER,CURRECT) values (11,'문제 테스트 10','김진열','배배','../gameImages/draw11.png',0,4,to_date('18/12/04','RR/MM/DD'),'배',0);
Insert into SCOTT.MINDGAME (G_NO,G_TITLE,G_WRITER,G_CONTENT,G_FILE,G_LIKE,G_HIT,G_DATE,ANSWER,CURRECT) values (12,'문제 테스트 11','김진열','감감','../gameImages/draw12.png',0,12,to_date('18/12/04','RR/MM/DD'),'감자',0);
REM INSERTING into SCOTT.POSTIMG
SET DEFINE OFF;
Insert into SCOTT.POSTIMG (P_NO,P_TITLE,P_WRITER,P_CONTENT,P_DRAW,P_FILE,P_LIKE,P_HIT,P_DATE,P_THUMBNAIL) values (9,'ㅎㅇㅎㅇ','test1','<p>안녕하세요~?<br><br type="_moz"><br>ㅁㄴㅇㄹ</p>','../draws/draw9.png','../upload/Lighthouse.jpg,',0,0,to_date('18/12/06','RR/MM/DD'),'../upload/Lighthouse.jpg');
Insert into SCOTT.POSTIMG (P_NO,P_TITLE,P_WRITER,P_CONTENT,P_DRAW,P_FILE,P_LIKE,P_HIT,P_DATE,P_THUMBNAIL) values (1,'테스트제목','김진열','<p>테스트본문</p>','../draws/draw1.png','../upload/Desert.jpg,',0,0,to_date('18/12/04','RR/MM/DD'),'../upload/Desert.jpg');
Insert into SCOTT.POSTIMG (P_NO,P_TITLE,P_WRITER,P_CONTENT,P_DRAW,P_FILE,P_LIKE,P_HIT,P_DATE,P_THUMBNAIL) values (2,'2','new','<p>2</p>','../draws/draw2.png','../upload/Tulips.jpg,',0,0,to_date('18/12/04','RR/MM/DD'),'../draws/draw2.png');
Insert into SCOTT.POSTIMG (P_NO,P_TITLE,P_WRITER,P_CONTENT,P_DRAW,P_FILE,P_LIKE,P_HIT,P_DATE,P_THUMBNAIL) values (3,'테스트3','김시진','<p>테스트3</p>','../draws/draw3.png','../upload/Tulips1.jpg,',0,0,to_date('18/12/04','RR/MM/DD'),'../draws/draw3.png');
Insert into SCOTT.POSTIMG (P_NO,P_TITLE,P_WRITER,P_CONTENT,P_DRAW,P_FILE,P_LIKE,P_HIT,P_DATE,P_THUMBNAIL) values (4,'테스트4','김시진','<p>테스트4</p>','../draws/draw4.png','../upload/Koala.jpg,',0,0,to_date('18/12/04','RR/MM/DD'),'../upload/Koala.jpg');
Insert into SCOTT.POSTIMG (P_NO,P_TITLE,P_WRITER,P_CONTENT,P_DRAW,P_FILE,P_LIKE,P_HIT,P_DATE,P_THUMBNAIL) values (5,'테스트 5','김시진','<p>테스트 5&nbsp;</p>','../draws/draw5.png','../upload/Penguins.jpg,',0,0,to_date('18/12/04','RR/MM/DD'),'../draws/draw5.png');
Insert into SCOTT.POSTIMG (P_NO,P_TITLE,P_WRITER,P_CONTENT,P_DRAW,P_FILE,P_LIKE,P_HIT,P_DATE,P_THUMBNAIL) values (6,'테스트  6 ','김시진','<p>테스트&nbsp; 6&nbsp;</p>','../draws/draw6.png','../upload/Chrysanthemum.jpg,',0,0,to_date('18/12/04','RR/MM/DD'),'../upload/Chrysanthemum.jpg');
Insert into SCOTT.POSTIMG (P_NO,P_TITLE,P_WRITER,P_CONTENT,P_DRAW,P_FILE,P_LIKE,P_HIT,P_DATE,P_THUMBNAIL) values (7,'gdgd','test1','<p>gdgd</p>','../draws/draw7.png','../upload/Tulips2.jpg,',0,0,to_date('18/12/05','RR/MM/DD'),'../draws/draw7.png');
Insert into SCOTT.POSTIMG (P_NO,P_TITLE,P_WRITER,P_CONTENT,P_DRAW,P_FILE,P_LIKE,P_HIT,P_DATE,P_THUMBNAIL) values (8,'ㅎㅇㅎㅇ?','test1','<p>안녕</p>','../draws/draw8.png','../upload/Jellyfish.jpg,',0,0,to_date('18/12/05','RR/MM/DD'),'../upload/Jellyfish.jpg');
REM INSERTING into SCOTT.GAMEANSWER
SET DEFINE OFF;
Insert into SCOTT.GAMEANSWER (A_NO,ANSWER,TAG,USE) values (1,'오렌지','#과일,#노란색',1);
Insert into SCOTT.GAMEANSWER (A_NO,ANSWER,TAG,USE) values (2,'사과','#과일,#빨간색',1);
Insert into SCOTT.GAMEANSWER (A_NO,ANSWER,TAG,USE) values (3,'바나나','#과일,#노란색',1);
Insert into SCOTT.GAMEANSWER (A_NO,ANSWER,TAG,USE) values (4,'포도','#과일,#푸른색',1);
Insert into SCOTT.GAMEANSWER (A_NO,ANSWER,TAG,USE) values (5,'딸기','#과일,#빨간색',1);
Insert into SCOTT.GAMEANSWER (A_NO,ANSWER,TAG,USE) values (6,'풋사과','#과일,#초록색',1);
Insert into SCOTT.GAMEANSWER (A_NO,ANSWER,TAG,USE) values (7,'귤','#과일,#노란색',1);
Insert into SCOTT.GAMEANSWER (A_NO,ANSWER,TAG,USE) values (8,'감','#과일,#주황색',1);
Insert into SCOTT.GAMEANSWER (A_NO,ANSWER,TAG,USE) values (9,'배','#배',1);
Insert into SCOTT.GAMEANSWER (A_NO,ANSWER,TAG,USE) values (10,'감자','#감자',1);
Insert into SCOTT.GAMEANSWER (A_NO,ANSWER,TAG,USE) values (11,'옥수수','#옥수수',1);
Insert into SCOTT.GAMEANSWER (A_NO,ANSWER,TAG,USE) values (12,'고구마','#고구마',1);
Insert into SCOTT.GAMEANSWER (A_NO,ANSWER,TAG,USE) values (13,'강아지','#동물',1);
REM INSERTING into SCOTT.GAME_LIKE
SET DEFINE OFF;
Insert into SCOTT.GAME_LIKE (GL_NO,GL_LIKE,G_NO,CNO) values (3,1,9,1);
REM INSERTING into SCOTT.GAME_COMMENTS
SET DEFINE OFF;
Insert into SCOTT.GAME_COMMENTS (GC_NO,GC_WRITER,GC_COMMENT,GC_DATE,G_NO) values (3,'master','옥?',to_date('18/12/06','RR/MM/DD'),9);
Insert into SCOTT.GAME_COMMENTS (GC_NO,GC_WRITER,GC_COMMENT,GC_DATE,G_NO) values (4,'master','감자',to_date('18/12/06','RR/MM/DD'),9);
Insert into SCOTT.GAME_COMMENTS (GC_NO,GC_WRITER,GC_COMMENT,GC_DATE,G_NO) values (5,'master','[옥수수]',to_date('18/12/06','RR/MM/DD'),9);
Insert into SCOTT.GAME_COMMENTS (GC_NO,GC_WRITER,GC_COMMENT,GC_DATE,G_NO) values (1,'김진열','ㅀㅀ',to_date('18/12/04','RR/MM/DD'),9);
Insert into SCOTT.GAME_COMMENTS (GC_NO,GC_WRITER,GC_COMMENT,GC_DATE,G_NO) values (2,'test1','[감]',to_date('18/12/05','RR/MM/DD'),8);
--------------------------------------------------------
--  DDL for Index USER1_SEQ
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCOTT"."USER1_SEQ" ON "SCOTT"."USER1" ("CNO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index MINDGAME_GNO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCOTT"."MINDGAME_GNO_PK" ON "SCOTT"."MINDGAME" ("G_NO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index POSTIMG_PNO_SEQ_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCOTT"."POSTIMG_PNO_SEQ_PK" ON "SCOTT"."POSTIMG" ("P_NO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index GAMEANSWER_ANSWER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCOTT"."GAMEANSWER_ANSWER_PK" ON "SCOTT"."GAMEANSWER" ("ANSWER") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index GAMELIKE_GLNO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCOTT"."GAMELIKE_GLNO_PK" ON "SCOTT"."GAME_LIKE" ("GL_NO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index GCOMMENTS_GNO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCOTT"."GCOMMENTS_GNO_PK" ON "SCOTT"."GAME_COMMENTS" ("GC_NO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table USER1
--------------------------------------------------------

  ALTER TABLE "SCOTT"."USER1" ADD CONSTRAINT "USER1_SEQ" PRIMARY KEY ("CNO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MINDGAME
--------------------------------------------------------

  ALTER TABLE "SCOTT"."MINDGAME" ADD CONSTRAINT "MINDGAME_GNO_PK" PRIMARY KEY ("G_NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table POSTIMG
--------------------------------------------------------

  ALTER TABLE "SCOTT"."POSTIMG" ADD CONSTRAINT "POSTIMG_PNO_SEQ_PK" PRIMARY KEY ("P_NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table GAMEANSWER
--------------------------------------------------------

  ALTER TABLE "SCOTT"."GAMEANSWER" ADD CONSTRAINT "GAMEANSWER_ANSWER_PK" PRIMARY KEY ("ANSWER")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table GAME_LIKE
--------------------------------------------------------

  ALTER TABLE "SCOTT"."GAME_LIKE" ADD CONSTRAINT "GAMELIKE_GLNO_PK" PRIMARY KEY ("GL_NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table GAME_COMMENTS
--------------------------------------------------------

  ALTER TABLE "SCOTT"."GAME_COMMENTS" ADD CONSTRAINT "GCOMMENTS_GNO_PK" PRIMARY KEY ("GC_NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
