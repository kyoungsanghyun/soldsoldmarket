-- SOLSOL 계정 생성
 CREATE USER SOLSOL IDENTIFIED BY SOLSOL;
 GRANT RESOURCE, DBA, CONNECT TO SOLSOL;

------------------------------------------------
-------------- PRODUCT 관련 테이블 -------------
------------------------------------------------


-- 상품 테이블
CREATE TABLE PRODUCT (
	P_NO    NUMBER NOT NULL,
	M_ID	VARCHAR2(500)		NOT NULL,
	P_NAME	VARCHAR2(300)		NULL,
	P_PRICE	NUMBER		NULL,
	P_QLT	VARCHAR2(100)		NULL,
	P_TRADING	VARCHAR2(100)		NULL,
	P_LOCATION	VARCHAR2(100)		NULL,
	P_EXCHANGE	CHAR(1)		CHECK(P_EXCHANGE IN ('Y','N')) NULL,
	P_QTT	NUMBER		NULL,
	P_CONTENTS	VARCHAR2(3000)		NULL,
	P_VIEW	NUMBER		NULL,
	P_LIKE	NUMBER		NULL,
	C_ID	NUMBER		NOT NULL,
	P_DATE	DATE	DEFAULT SYSDATE    NULL
);

-- 상품 테이블 코멘트 생성
COMMENT ON COLUMN PRODUCT.P_NO IS '상품번호';
COMMENT ON COLUMN PRODUCT.M_ID IS '회원아이디';
COMMENT ON COLUMN PRODUCT.P_NAME IS '상풍명';
COMMENT ON COLUMN PRODUCT.P_PRICE IS '상품가격';
COMMENT ON COLUMN PRODUCT.P_QLT IS '상품상태';
COMMENT ON COLUMN PRODUCT.P_TRADING IS '거래상태';
COMMENT ON COLUMN PRODUCT.P_LOCATION IS '거래지역';
COMMENT ON COLUMN PRODUCT.P_EXCHANGE IS '교환여부';
COMMENT ON COLUMN PRODUCT.P_QTT IS '수량';
COMMENT ON COLUMN PRODUCT.P_CONTENTS IS '상품설명';
COMMENT ON COLUMN PRODUCT.P_VIEW IS '조회수';
COMMENT ON COLUMN PRODUCT.P_LIKE IS '찜하기';
COMMENT ON COLUMN PRODUCT.C_ID IS '카테고리분류아이디';
COMMENT ON COLUMN PRODUCT.P_DATE IS '상품등록일';

-- 카테고리 테이블 생성
CREATE TABLE CATEGORY (
	C_ID	NUMBER		NOT NULL,
	C_NAME	VARCHAR2(300)		NULL
);

-- 카테고리 테이블 코멘트 삽입
COMMENT ON COLUMN CATEGORY.C_ID IS '카테고리분류아이디';
COMMENT ON COLUMN CATEGORY.C_NAME IS '카테고리이름';


-- 상품 테이블 PK FK 생성
ALTER TABLE PRODUCT ADD CONSTRAINT "PK_PRODUCT" PRIMARY KEY (
	P_NO
);

ALTER TABLE PRODUCT ADD CONSTRAINT "FK_Member_TO_PRODUCT_1" FOREIGN KEY (
	M_ID
)
REFERENCES MEMBER (
	M_ID
);


ALTER TABLE PRODUCT ADD CONSTRAINT "FK_Category_TO_Product_1" FOREIGN KEY (
	C_ID
)
REFERENCES CATEGORY (
	C_ID
);




-- 상품 테이블 데이터 삽입
INSERT INTO PRODUCT (
    P_NO,
    M_ID,
    P_NAME,
    P_PRICE,
    P_QLT,
    P_TRADING,
    P_LOCATION,
    P_EXCHANGE,
    P_QTT,
    P_CONTENTS,
    C_ID
)
    VALUES(
    '1',
    'osk',
    '테스트상품',
    '10000',
    '양호',
    '거래중',
    '서울',
    'Y',
    '3',
    '상품INSERT테스트',
    '01'
);
    

-- 카테고리 테이블 FK 생성
ALTER TABLE CATEGORY ADD CONSTRAINT "PK_CATEGORY" PRIMARY KEY (
	C_ID
);




-- 카테고리 테이블 데이터 삽입
INSERT INTO CATEGORY ( 
    C_ID,
    C_NAME
    )
    VALUES (
    '01',
    '의류'
);




------------------------------------------------
--------------- MEMBER 관련 테이블 ---------------
------------------------------------------------

CREATE TABLE MEMBER (
    M_ID    VARCHAR2(500) PRIMARY KEY,
    M_PW    VARCHAR2(50),
    M_NAME    VARCHAR2(500),
    M_BIRTH    DATE,
    M_GENDER    VARCHAR2(1) CHECK(M_GENDER IN('M', 'F')),
    M_ADDRESS    VARCHAR2(1000),
    M_JOINDATE DATE DEFAULT SYSDATE,
    M_INTRO    VARCHAR2(1000),
    M_SELLAMOUNT    NUMBER DEFAULT 0,
    M_VISIT    NUMBER DEFAULT 0,
    M_IMAGE    VARCHAR2(500),
    M_STATUS    VARCHAR2(1) DEFAULT 'Y' CHECK(M_STATUS IN('Y', 'N')),
    M_LOGINDATE    DATE ,
    M_REPORTCOUNT    NUMBER DEFAULT 0,
    M_PHONE    VARCHAR2(20),
    M_AUTHORIZATION    VARCHAR2(1) DEFAULT 'C' CHECK(M_AUTHORIZATION IN('M', 'C')),
    M_JOINWAY    VARCHAR2(20) DEFAULT 'MY' CHECK(M_JOINWAY IN('MY', 'SNS'))
);


COMMENT ON COLUMN MEMBER.M_ID IS '회원아이디';
COMMENT ON COLUMN MEMBER.M_PW IS '회원비밀번호';
COMMENT ON COLUMN MEMBER.M_NAME IS '회원명';
COMMENT ON COLUMN MEMBER.M_BIRTH IS '회원생일';
COMMENT ON COLUMN MEMBER.M_GENDER IS '회원성별';
COMMENT ON COLUMN MEMBER.M_ADDRESS IS '회원주소';
COMMENT ON COLUMN MEMBER.M_JOINDATE IS '회원가입일';
COMMENT ON COLUMN MEMBER.M_INTRO IS '회원소개글';
COMMENT ON COLUMN MEMBER.M_SELLAMOUNT IS '판매횟수';
COMMENT ON COLUMN MEMBER.M_IMAGE IS '회원사진';
COMMENT ON COLUMN MEMBER.M_VISIT IS '방문횟수';
COMMENT ON COLUMN MEMBER.M_STATUS IS '회원상태(Y/N)';
COMMENT ON COLUMN MEMBER.M_LOGINDATE IS '마지막로그인날짜';
COMMENT ON COLUMN MEMBER.M_REPORTCOUNT IS '신고당한횟수';
COMMENT ON COLUMN MEMBER.M_PHONE IS '회원번호';
COMMENT ON COLUMN MEMBER.M_AUTHORIZATION IS '권한';
COMMENT ON COLUMN MEMBER.M_JOINWAY IS '가입방법';


INSERT INTO MEMBER (
    M_ID, 
    M_PW, 
    M_NAME, 
    M_BIRTH,
    M_GENDER, 
    M_ADDRESS, 
    M_PHONE 
) VALUES(
    'osk', 
    '1234', 
    '오성균',
    '1995/08/23',
    'M', 
    '경기도', 
    010-1234-5678
);

-- 관리자 계정
INSERT INTO MEMBER (
    M_ID, 
    M_PW, 
    M_NAME, 
    M_BIRTH,
    M_GENDER, 
    M_ADDRESS, 
    M_PHONE,
    M_AUTHORIZATION
) VALUES(
    'admin', 
    'admin', 
    '관리자',
    '2000/01/01',
    'M', 
    '서울 강남구', 
    010-0000-0000,
    'M'
);

------------------------------------------------
--------------- 상품 이미지 관련 테이블 ---------------
------------------------------------------------
CREATE TABLE PAdd (
	PA_IMG_ID    NUMBER NOT NULL,
	PA_IMG1 VARCHAR2(4000) NULL,
  PA_IMG2 VARCHAR2(4000) NULL,
  PA_IMG3 VARCHAR2(4000) NULL,
  PA_IMG4 VARCHAR2(4000) NULL,
  PA_IMG5 VARCHAR2(4000) NULL,
  P_NO NUMBER NOT NULL
);

-- 상품 이미지 테이블 코멘트 생성
COMMENT ON COLUMN PAdd.PA_IMG_ID IS '상품이미지번호';
COMMENT ON COLUMN PAdd.PA_IMG1 IS '상품이미지1주소';
COMMENT ON COLUMN PAdd.PA_IMG2 IS '상품이미지2주소';
COMMENT ON COLUMN PAdd.PA_IMG3 IS '상품이미지3주소';
COMMENT ON COLUMN PAdd.PA_IMG4 IS '상품이미지4주소';
COMMENT ON COLUMN PAdd.PA_IMG5 IS '상품이미지5주소';
COMMENT ON COLUMN PAdd.P_NO IS '상품번호';

-- 상품 이미지 테이블 PK,FK 생성
ALTER TABLE PAdd ADD CONSTRAINT "PK_PAdd" PRIMARY KEY (
	PA_IMG_ID
);

ALTER TABLE PAdd ADD CONSTRAINT "FK_PRODUCT_TO_PAdd_1" FOREIGN KEY (
	P_NO
)
REFERENCES PRODUCT (
  P_NO
);

------------------------------------------------
--------------- 게시판 관련 테이블 ------------------
------------------------------------------------

-- 게시판 테이블
CREATE TABLE BOARD (
	B_ID	NUMBER	NOT NULL,
	B_TYPE	CHAR(1)	CHECK (B_TYPE IN ('G', 'P', 'Q', 'N'))	NULL,
	B_TITLE	VARCHAR2(1000)	NULL,
	B_TIMESTAMP	TIMESTAMP	NULL,
	B_VIEW	NUMBER DEFAULT 0	NULL,
	B_LIKE	NUMBER DEFAULT 0	NULL,
	B_CONTENT	VARCHAR2(4000)	NULL,
	B_SECRET	CHAR(1) CHECK(B_SECRET IN ('Y', 'N'))	NULL,
	B_SECRETNUMBER	NUMBER	NULL,
	B_REF	NUMBER	NULL,
	B_RE_STEP	NUMBER	NULL,
	B_RE_LEVEL	NUMBER	NULL,
	M_ID	VARCHAR2(500)	NOT NULL
);

-- 게시판 테이블 코멘트 생성
COMMENT ON COLUMN BOARD.B_ID IS '게시글번호';
COMMENT ON COLUMN BOARD.B_TYPE IS '게시글타입';
COMMENT ON COLUMN BOARD.B_TITLE IS '글제목';
COMMENT ON COLUMN BOARD.B_TIMESTAMP IS '글작성날짜';
COMMENT ON COLUMN BOARD.B_VIEW IS '조회수';
COMMENT ON COLUMN BOARD.B_LIKE IS '좋아요';
COMMENT ON COLUMN BOARD.B_CONTENT IS '글내용';
COMMENT ON COLUMN BOARD.B_SECRET IS '비밀글여부';
COMMENT ON COLUMN BOARD.B_SECRETNUMBER IS '비밀글비밀번호';
COMMENT ON COLUMN BOARD.B_REF IS '최상위게시글번호';
COMMENT ON COLUMN BOARD.B_RE_STEP IS '댓글순서';
COMMENT ON COLUMN BOARD.B_RE_LEVEL IS '대댓글순서';
COMMENT ON COLUMN BOARD.M_ID IS '회원아이디';

-- 게시판 첨부파일 테이블
CREATE TABLE BAdd (
	BA_IMG_ID	NUMBER	NOT NULL,
	BA_IMG	VARCHAR2(4000)	NULL,
	B_ID	NUMBER	NOT NULL
);

-- 게시판 첨부파일 테이블 코멘트 생성
COMMENT ON COLUMN BAdd.BA_IMG_ID IS '이미지 아이디';
COMMENT ON COLUMN BAdd.BA_IMG IS '게시글이미지주소';
COMMENT ON COLUMN BAdd.B_ID IS '게시글번호';

-- 댓글 테이블
CREATE TABLE COMMENTS (
	CM_ID   VARCHAR2(500)	NOT NULL,
	B_ID	NUMBER	NOT NULL,
	CM_CONTENT	VARCHAR2(1000)	NULL
);

-- 댓글 테이블 코멘트 생성
COMMENT ON COLUMN COMMENTS.CM_ID IS '댓글아이디';
COMMENT ON COLUMN COMMENTS.B_ID IS '게시글번호';
COMMENT ON COLUMN COMMENTS.CM_CONTENT IS '댓글내용';

-- 게시판 테이블 PK FK 생성
ALTER TABLE BOARD ADD CONSTRAINT "PK_BOARD" PRIMARY KEY (
	B_ID
);

ALTER TABLE BOARD ADD CONSTRAINT "FK_Member_TO_BOARD_1" FOREIGN KEY (
	M_ID
)
REFERENCES MEMBER (
	M_ID
);


ALTER TABLE BAdd ADD CONSTRAINT "PK_BAdd" PRIMARY KEY (
	BA_IMG_ID
);

ALTER TABLE BAdd ADD CONSTRAINT "FK_BOARD_TO_BAdd_1" FOREIGN KEY (
	B_ID
)
REFERENCES BOARD (
	B_ID
);

ALTER TABLE COMMENTS ADD CONSTRAINT "PK_COMMENTS" PRIMARY KEY (
	CM_ID
);

ALTER TABLE COMMENTS ADD CONSTRAINT "FK_BOARD_TO_COMMENTS_1" FOREIGN KEY (
	B_ID
)
REFERENCES BOARD (
	B_ID
);