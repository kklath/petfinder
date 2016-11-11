--멤버 테이블
CREATE TABLE MEMBER(
M_ID VARCHAR2(20),
M_PASSWORD VARCHAR2(20) NULL,
M_NAME VARCHAR2(20) NULL,
M_PHONE VARCHAR2(18) NULL,
M_REGION1 VARCHAR2(80) NULL,
M_REGION2 VARCHAR2(80) NULL,
M_REGION3 VARCHAR2(80) NULL,
M_DOG VARCHAR2(20) NULL,
M_SIZE VARCHAR2(10) NULL,
M_COLOR VARCHAR2(20) NULL,
M_GENDER VARCHAR2(4) NULL,
CONSTRAINT PK_MEMBER PRIMARY KEY(M_ID)
);

--멤버사진 테이블
--멤버테이블 M_ID랑 멤버사진테이블 M_BOARD_IDX랑 00임
CREATE TABLE MEMBER_FILE
(
  M_ID VARCHAR2(20) NULL,
  M_ORIGINAL_FILE_NAME VARCHAR2(260 BYTE) NULL,
  M_STORED_FILE_NAME VARCHAR2(36 BYTE) NULL,
  M_FILE_SIZE NUMBER NULL,
  CONSTRAINT FK_MEMBER_FILE FOREIGN KEY(M_ID) REFERENCES MEMBER(M_ID)
);

--분실 테이블
CREATE TABLE DISAPPEARANCE(
	D_IDX VARCHAR2(5),
	D_ID VARCHAR2(20),
	D_PHONE VARCHAR2(18) NULL,
	D_EMERTGENCY_PHONE VARCHAR2(18) NULL,
	D_DOGNAME VARCHAR2(50) NULL,
	D_DOG VARCHAR2(20) NULL,
	D_SIZE VARCHAR2(10) NULL,
	D_COLOR VARCHAR2(20) NULL,
	D_GENDER VARCHAR2(4) NULL,
	D_DATE DATE NULL,
	D_REGION VARCHAR2(80) NULL,
	D_TITLE VARCHAR2(50) NULL,
	D_DETAIL VARCHAR2(1000) NULL,
  CONSTRAINT PK_DISAPPEARANCE PRIMARY KEY(D_IDX)
);

--분실사진 테이블
--분실테이블 D_IDX랑 분실사진테이블 D_BOARD_IDX랑 00임
CREATE TABLE DISAPPEARANCE_FILE
(
  D_FILE_IDX VARCHAR2(20),
  D_BOARD_IDX VARCHAR2(5) NULL,
  D_ORIGINAL_FILE_NAME VARCHAR2(260 BYTE) NULL,
  D_STORED_FILE_NAME VARCHAR2(36 BYTE) NULL,
  D_FILE_SIZE NUMBER NULL,
  CONSTRAINT FK_DISAPPEARANCE_FILE FOREIGN KEY(D_BOARD_IDX) REFERENCES DISAPPEARANCE(D_IDX)
);

CREATE SEQUENCE SEQ_DISAPPEARANCE_IDX
  START WITH 1
  INCREMENT BY 1
  NOMAXVALUE
  NOCACHE;

CREATE SEQUENCE SEQ_DISAPPEARANCE_FILE_IDX
  START WITH 1
  INCREMENT BY 1
  NOMAXVALUE
  NOCACHE;
  
--발견 테이블
CREATE TABLE FINDS(
	F_IDX VARCHAR2(5),
	F_PASSWORD VARCHAR2(20) NULL,
	F_PHONE VARCHAR2(18) NULL,
	F_DOG VARCHAR2(20) NULL,
	F_SIZE VARCHAR2(10) NULL,
	F_COLOR VARCHAR2(20) NULL,
	F_GENDER VARCHAR2(4) NULL,
	F_DATE DATE NULL,
	F_REGION VARCHAR2(80) NULL,
  	F_TITLE VARCHAR2(50),
	F_DETAIL VARCHAR2(1000) NULL,
CONSTRAINT PK_FINDS PRIMARY KEY(F_IDX)
);

--발견사진테이블
--발견테이블 F_IDX랑 분실사진테이블 F_BOARD_IDX랑 00임
CREATE TABLE FINDS_FILE
(
  F_FILE_IDX VARCHAR2(20),
  F_BOARD_IDX VARCHAR2(5) NULL,
  F_ORIGINAL_FILE_NAME VARCHAR2(260 BYTE) NULL,
  F_STORED_FILE_NAME VARCHAR2(36 BYTE) NULL,
  F_FILE_SIZE NUMBER NULL,
CONSTRAINT FK_FINDS_FILE FOREIGN KEY(F_BOARD_IDX) REFERENCES FINDS(F_IDX)
);

CREATE SEQUENCE SEQ_FINDS_IDX
  START WITH 1
  INCREMENT BY 1
  NOMAXVALUE
  NOCACHE;

CREATE SEQUENCE SEQ_FINDS_FILE_IDX
  START WITH 1
  INCREMENT BY 1
  NOMAXVALUE
  NOCACHE;
