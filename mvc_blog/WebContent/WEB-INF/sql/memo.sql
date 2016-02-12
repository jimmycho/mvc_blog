--1) 테이블 제작  
-- NOT NULL   : INSERT시 필수 입력, 생략 불가능 
-- DEFAULT 0  : INSERT시 값을 입력하지 않으면 0이 추가됨. 
-- DEFAULT 'A': INSERT시 값을 입력하지 않으면 'A'가 추가됨. 
-- NUMBER(3)  : int 계열, -999 ~ +999, 나머지 바이트 재사용 
-- VARCHAR(30): String 계열, 문자열 저장, 가변길이 문자열, 
--              빈공간 재사용, 한글 15자, 영숫자는 30자 
-- DATE       : 날짜 
 
 
-- 임시 영역으로 테이블 삭제, 복구 가능한 휴지통으로 삭제 
DROP TABLE memo; 
 
-- 테이블을 복구 불가능 하도록 삭제 
DROP TABLE memo PURGE; 

-- 테이블생성
SELECT memono, title, content, wdate, viewcnt, r
FROM(	
	SELECT memono, title, content, wdate, viewcnt, rownum r
	FROM(
		SELECT memono, title, content, wdate, viewcnt
		FROM memo                                 
		ORDER BY memono DESC                      
	)
) WHERE r>=1 and r<=5 
 
 
-- 테이블 생성 
CREATE TABLE memo( 
  memono  NUMBER(6)     NOT NULL,  -- 일련번호, -999999 ~ +999999 
  title   VARCHAR(100)  NOT NULL,  -- 메모 제목, 한글 50자 
  content VARCHAR(4000) NOT NULL,  -- 내용  
  wdate   DATE          NOT NULL,  -- 등록 날짜  
  viewcnt NUMBER(5)     DEFAULT 0, -- 조회수, -99999 ~ +99999  
  PRIMARY KEY(memono)              -- 고유한 값, 중복 안됨    
); 

select * from memo;
 
 
 

 
  
  
-- SEQUENCE 객체 삭제 
DROP SEQUENCE memo_seq; 
 
-- SEQUENCE 객체 생성 
CREATE SEQUENCE memo_seq 
START WITH 1 
INCREMENT BY 1 
MINVALUE 0 
CACHE 100; 
 
- CACHE 10: 메모리에서 10개의 일련 번호를 계산하여 사용후
            sequence 테이블 업데이트.
 
- CACHE 20: 메모리에서 20개의 일련 번호를 계산하여 사용후
            sequence 테이블 업데이트.
 
- CACHE 30: 메모리에서 30개의 일련 번호를 계산하여 사용후
            sequence 테이블 업데이트.
 
 
-- dual: 가상 테이블, SQL형식 맞출경우 임시 테이블 사용, 변경하면 안됨
SELECT memo_seq.nextval FROM dual;
 
 NEXTVAL
 -------
       1
 
-- 현재 sequence 확인(Run SQL Command Line 에서 실행);
SELECT memo_seq.currval FROM dual;
 
       
       
-- create 
-- memo_seq.nextval: 일련번호 자동 생성하여 할당 
--                   (MySQL은 컬럼명을 명시하지 않음). 
-- sysdate: 현재 날짜와 시간(MySQL: now()) 
INSERT INTO memo(memono, title, content, wdate) 
VALUES(memo_seq.nextval, '오늘의 메모', '이전주 토익 시험 준비', sysdate); 
 
-- select list, 자주 읽는 메모 먼저 출력  
-- DESC: Descending, ASC: Ascending 
SELECT memono, title, content, wdate, viewcnt 
FROM memo  
ORDER BY memono ASC; 
 
 MEMONO TITLE  CONTENT      WDATE                 VIEWCNT
 ------ ------ ------------ --------------------- -------
      1 오늘의 메모 이전주 토익 시험 준비 2014-08-19 14:38:16.0       0
 
 
INSERT INTO memo(memono, title, content, wdate) 
VALUES(memo_seq.nextval, '한국', '서울', sysdate); 
 
INSERT INTO memo(memono, title, content, wdate) 
VALUES(memo_seq.nextval, '미국', '워싱턴', sysdate); 
 
INSERT INTO memo 
VALUES(memo_seq.nextval, '중국', '베이징', sysdate, 0); 
 
 
SELECT memono, title, content, wdate, viewcnt 
FROM memo  
ORDER BY memono ASC; -- 오름 차순
 
 MEMONO TITLE  CONTENT             WDATE                 VIEWCNT 
 ------ ------ ------------------- --------------------- ------- 
      1 오늘의 메모 이전주 토익 시험 준비       2014-05-14 12:02:48.0       0 
      2 읽을 도서  가메출판사 오라클 11g       2014-05-14 12:02:49.0       0 
      3 수업 복습  메모 제작                 2014-05-14 12:02:49.0       0 
      4 도서구입   JSP Web Programming      2014-05-14 12:02:50.0       0 
 
      
-- DESC: 내림 차순 정렬      
SELECT memono, title, content, wdate, viewcnt 
FROM memo  
ORDER BY memono DESC; 
 
 MEMONO TITLE  CONTENT             WDATE                 VIEWCNT 
 ------ ------ ------------------- --------------------- ------- 
      4 도서구입    JSP Web Programming          2014-05-14 12:02:50.0       0
      3 수업 복습   메모 제작                    2014-05-14 12:02:49.0       0      
      2 읽을 도서   가메출판사 오라클 11g        2014-05-14 12:02:49.0       0 
      1 오늘의 메모 이전주 토익 시험 준비        2014-05-14 12:02:48.0       0 