-- SOLSOL 계정 생성
 CREATE USER SOLSOL IDENTIFIED BY SOLSOL;
 GRANT RESOURCE, DBA, CONNECT TO SOLSOL;

-- DROP TABLE PRODUCT CASCADE CONSTRAINTS;
-- DROP TABLE CATEGORY CASCADE CONSTRAINTS;


---- 테이블 드랍시 순서대로
--DROP TABLE PADD;
--DROP TABLE PCOMMENTS;
--DROP TABLE REPORT;
--DROP TABLE TRADING;
--DROP TABLE HEART;
--DROP TABLE ASKBOARD;
--DROP TABLE BADD;
--DROP TABLE COMMENTS;
--DROP TABLE BOARD;
--DROP TABLE PRODUCT;
--DROP TABLE MEMBER;
--DROP TABLE CATEGORY;
--
---- 시퀀스 드랍문
--DROP SEQUENCE SEQ_PCOMMENTS_NO;
--DROP SEQUENCE SEQ_REPORT_NO;
--DROP SEQUENCE SEQ_PRODUCT_NO;
--DROP SEQUENCE SEQ_PADD_NO;
--DROP SEQUENCE SEQ_TRADING_NO;
--DROP SEQUENCE SEQ_BADD_NO;
--DROP SEQUENCE SEQ_BOARD_NO;

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
-------------- 회원신고 관련 테이블 -------------
------------------------------------------------
CREATE TABLE REPORT (
	R_NO	NUMBER		NOT NULL,
	M_ID	VARCHAR2(500)		NOT NULL,
	R_ID	VARCHAR2(500)		NULL
);

-- 회원신고 테이블 코멘트 생성
COMMENT ON COLUMN REPORT.R_NO IS '신고번호';
COMMENT ON COLUMN REPORT.M_ID IS '신고당한회원아이디';
COMMENT ON COLUMN REPORT.R_ID IS '신고한회원아이디';

-- 회원신고 시퀀스 생성
CREATE SEQUENCE SEQ_REPORT_NO;

-- 회원신고 테이블 PK
ALTER TABLE REPORT ADD CONSTRAINT PK_REPORT PRIMARY KEY (
	R_NO
);


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
	P_LIKE	NUMBER	DEFAULT 0 NULL, -- DEFAULT 0 값 생성됨
	C_ID	VARCHAR2(100) NOT NULL, -- NUMBER -> VARCHAR2로 수정 
	P_DATE	DATE	DEFAULT SYSDATE    NULL,
    P_COMMENTS VARCHAR2(3000) NULL,
    STATUS VARCHAR2(1) DEFAULT 'Y' CHECK (STATUS IN('Y', 'N'))
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
COMMENT ON COLUMN PRODUCT.P_COMMENTS IS '상품댓글';

CREATE SEQUENCE SEQ_PRODUCT_NO;

-- 멤버 로그인 기능 연동 안된 상태라 M_ID NOT NULL에서 일단 NULL로 바꿈 (M_ID)-여울
-- ALTER TABLE PRODUCT MODIFY M_ID NULL;


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


-- 상품 테이블 테스트 데이터 삽입
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
    1,
    'osk',
    '테스트상품',
    10000,
    '양호',
    '거래중',
    '서울',
    'Y',
    3,
    '상품INSERT테스트',
    1
);


------------------------------------------------
-------------- CATEGORY 관련 테이블 -------------
------------------------------------------------

-- 카테고리 테이블 생성
CREATE TABLE CATEGORY (
	C_ID	VARCHAR2(100) NOT NULL,
	C_NAME	VARCHAR2(300)		NULL
);

-- 카테고리 테이블 코멘트 삽입
COMMENT ON COLUMN CATEGORY.C_ID IS '카테고리분류아이디';
COMMENT ON COLUMN CATEGORY.C_NAME IS '카테고리이름';


-- 카테고리 테이블 PK 생성
ALTER TABLE CATEGORY ADD CONSTRAINT "PK_CATEGORY" PRIMARY KEY (
	C_ID
);



    
-- 카테고리 테이블 데이터 삽입
INSERT INTO CATEGORY ( 
    C_ID,
    C_NAME
    )
    VALUES (
    '1',
    '의류'
);

INSERT INTO CATEGORY ( 
    C_ID,
    C_NAME
    )
    VALUES (
    '2',
    '악세서리'
);

INSERT INTO CATEGORY ( 
    C_ID,
    C_NAME
    )
    VALUES (
    '3',
    '디지털가전'
);

INSERT INTO CATEGORY ( 
    C_ID,
    C_NAME
    )
    VALUES (
    '4',
    '스포츠레저'
);

INSERT INTO CATEGORY ( 
    C_ID,
    C_NAME
    )
    VALUES (
    '5',
    '도서음반'
);

INSERT INTO CATEGORY ( 
    C_ID,
    C_NAME
    )
    VALUES (
    '6',
    '반려동물'
);

INSERT INTO CATEGORY ( 
    C_ID,
    C_NAME
    )
    VALUES (
    '7',
    '기타'
);

COMMIT;

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

INSERT INTO PADD (
    PA_IMG_ID,
    PA_IMG1,
    PA_IMG2,
    PA_IMG3,
    PA_IMG4,
    PA_IMG5,
    P_NO
)
    VALUES(
    '1',
    '20220730_224212479_52.JPG',
    '20220730_224212487_508.JPG',
    '',
    '',
    '',
    '40'
);


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

CREATE SEQUENCE SEQ_PADD_NO;

------------------------------------------------
--------------- 상품 댓글 테이블 -----------------
------------------------------------------------
-- 상품댓글 테이블
CREATE TABLE PCOMMENTS (
    CM_NO   NUMBER NOT NULL,
	CM_ID   VARCHAR2(500)	NOT NULL,
	P_NO	NUMBER	NOT NULL,
	CM_CONTENT	VARCHAR2(1000)	NULL,
    CM_DATE DATE DEFAULT SYSDATE
);

-- 상품댓글 테이블 코멘트 생성
COMMENT ON COLUMN PCOMMENTS.CM_NO IS '댓글번호';
COMMENT ON COLUMN PCOMMENTS.CM_ID IS '댓글작성아이디';
COMMENT ON COLUMN PCOMMENTS.P_NO IS '상품번호';
COMMENT ON COLUMN PCOMMENTS.CM_CONTENT IS '댓글내용';
COMMENT ON COLUMN PCOMMENTS.CM_CONTENT IS '작성날짜';

-- 상품 댓글 시퀀스
CREATE SEQUENCE SEQ_PCOMMENTS_NO;

-- 상품댓글 테이블 PK
ALTER TABLE PCOMMENTS ADD CONSTRAINT PK_PCOMMENTS PRIMARY KEY (
	CM_NO
);

------------------------------------------------
--------------- 상품 좋아요 테이블 ---------------
------------------------------------------------
-- 좋아요 테이블
CREATE TABLE HEART (
    M_ID VARCHAR2(500),
    P_NO NUMBER
);
-- 좋아요 테이블 코멘트 생성
COMMENT ON COLUMN HEART.M_ID IS '좋아요누른회원아이디';
COMMENT ON COLUMN HEART.P_NO IS '좋아요누른상품번호';

-- 좋아요 중복 방지 쿼리문
--INSERT INTO HEART (M_ID, P_NO)
--SELECT ? , ?
--FROM DUAL
--WHERE NOT EXISTS (
--    SELECT 1, 2
--    FROM HEART     
--    WHERE M_ID = ? AND P_NO = ?
--    );
    
-- 상품테이블 좋아요 추가 쿼리문
--UPDATE PRODUCT P
--SET P.P_LIKE = P.P_LIKE + 1
--WHERE P.P_NO IN (
--    SELECT P.P_NO
--    FROM PRODUCT P
--    JOIN HEART H ON (H.P_NO = P.P_NO)
--    WHERE H.P_NO = ? AND H.M_ID = ?
--);

------------------------------------------------
--------------- 상품 거래 테이블 -----------------
------------------------------------------------
CREATE TABLE TRADING (
    T_NO    NUMBER NOT NULL,
	P_NO	NUMBER	NOT NULL,
	B_ID	VARCHAR2(500)	NOT NULL,
	S_ID	VARCHAR2(500)	NOT NULL
);

-- 상품 거래 테이블 코멘트 생성
COMMENT ON COLUMN TRADING.T_NO IS '거래번호';
COMMENT ON COLUMN TRADING.P_NO IS '상품번호';
COMMENT ON COLUMN TRADING.B_ID IS '구매회원';
COMMENT ON COLUMN TRADING.S_ID IS '판매회원';

-- 상품 거래 테이블 PK FK 값
ALTER TABLE TRADING ADD CONSTRAINT PK_TRADING PRIMARY KEY (
	T_NO
);

-- 상품 거래 시퀀스 테이블
CREATE SEQUENCE SEQ_TRADING_NO;


-- 상품 거래 체크 쿼리문
--INSERT INTO TRADE (P_NO, B_ID, S_ID)
--SELECT ? , ? , ?
--FROM DUAL
--WHERE NOT EXISTS (
--    SELECT 1, 2, 3
--    FROM TRADING   
--    WHERE P_NO = ? AND B_ID = ? AND S_ID = ?
--    );
    

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

-- 게시판 첨부파일 테이블 시퀀스 생성
CREATE SEQUENCE SEQ_BADD_NO;

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


------------------------------------------------
--------------- 1:1 문의 관련 테이블 ---------------
------------------------------------------------

CREATE TABLE ASKBOARD (	
    NO NUMBER,
    WRITER_ID VARCHAR2(500), 
	TITLE VARCHAR2(50), 
	CONTENT VARCHAR2(2000), 
	ORIGINAL_FILENAME VARCHAR2(100), 
	RENAMED_FILENAME VARCHAR2(100), 
    STATUS VARCHAR2(1) DEFAULT 'Y' CHECK (STATUS IN('Y', 'N')),
    ANSWER_STATUS VARCHAR2(1) DEFAULT 'N' CHECK (ANSWER_STATUS IN('Y', 'N')),
    CREATE_DATE DATE DEFAULT SYSDATE, 
    MODIFY_DATE DATE DEFAULT SYSDATE,
    CONSTRAINT PK_BOARD_NO PRIMARY KEY(NO),
    CONSTRAINT FK_BOARD_WRITER FOREIGN KEY(WRITER_ID) REFERENCES MEMBER(M_ID) ON DELETE SET NULL
);

COMMENT ON COLUMN ASKBOARD.NO IS '게시글번호';
COMMENT ON COLUMN ASKBOARD.WRITER_ID IS '게시글작성자';
COMMENT ON COLUMN ASKBOARD.TITLE IS '게시글제목';
COMMENT ON COLUMN ASKBOARD.CONTENT IS '게시글내용';
COMMENT ON COLUMN ASKBOARD.ORIGINAL_FILENAME IS '첨부파일원래이름';
COMMENT ON COLUMN ASKBOARD.RENAMED_FILENAME IS '첨부파일변경이름';
COMMENT ON COLUMN ASKBOARD.STATUS IS '삭제여부(Y/N)';
COMMENT ON COLUMN ASKBOARD.ANSWER_STATUS IS '답변여부(Y/N)';
COMMENT ON COLUMN ASKBOARD.CREATE_DATE IS '게시글올린날짜';
COMMENT ON COLUMN ASKBOARD.MODIFY_DATE IS '게시글수정날짜';


CREATE SEQUENCE SEQ_ASKBOARD_NO;



-- NOTICE 테이블

CREATE TABLE NOTICE (	
    N_NO NUMBER,
    N_WRITER_ID VARCHAR2(500), 
	N_TITLE VARCHAR2(50), 
	N_CONTENT VARCHAR2(2000),
    N_ORIGINAL_FILENAME VARCHAR2(100), 
	N_RENAMED_FILENAME VARCHAR2(100), 
	N_READCOUNT NUMBER DEFAULT 0, 
    N_STATUS VARCHAR2(1) DEFAULT 'Y' CHECK (N_STATUS IN('Y', 'N')),
    N_CREATE_DATE DATE DEFAULT SYSDATE, 
    CONSTRAINT PK_BOARD_NO PRIMARY KEY(N_NO),
    CONSTRAINT FK_BOARD_WRITER FOREIGN KEY(N_WRITER_ID) REFERENCES MEMBER(M_ID) ON DELETE SET NULL
);

COMMENT ON COLUMN NOTICE.N_NO IS '게시글번호';
COMMENT ON COLUMN NOTICE.N_WRITER_ID IS '게시글작성자';
COMMENT ON COLUMN NOTICE.N_TITLE IS '게시글제목';
COMMENT ON COLUMN NOTICE.N_CONTENT IS '게시글내용';
COMMENT ON COLUMN NOTICE.N_READCOUNT IS '조회수';
COMMENT ON COLUMN NOTICE.N_STATUS IS '상태값(Y/N)';
COMMENT ON COLUMN NOTICE.N_CREATE_DATE IS '게시글올린날짜';
COMMENT ON COLUMN NOTICE.N_ORIGINAL_FILENAME IS '첨부파일원래이름';
COMMENT ON COLUMN NOTICE.N_RENAMED_FILENAME IS '첨부파일변경이름';

CREATE SEQUENCE SEQ_NOTICE_NO;
drop SEQUENCE SEQ_NOTICE_NO;
drop table NOTICE;

