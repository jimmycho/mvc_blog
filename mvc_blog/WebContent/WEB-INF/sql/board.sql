DROP TABLE board CASCADE CONSTRAINTS PURGE; --board를 누군가 참조한다면 삭제되지 않으나, 
											--cascade constraints 선언하면 지울수 있음
 
CREATE TABLE board ( 
       num                  NUMBER(6) NOT NULL,      -- 글 일련 번호 
       name                 VARCHAR(10) NOT NULL,    -- 글쓴이 성명 
       subject              VARCHAR(100) NOT NULL,   -- 제목 
       content              VARCHAR(4000) NOT NULL,  -- 내용 
       ref                  NUMBER(5) NOT NULL,      -- 그룹번호(부모글 번호이며 답변글 관리용) 
       indent               NUMBER(2) DEFAULT 0 NOT NULL, -- 답변여부,깊이 
       ansnum               NUMBER(5) DEFAULT 0 NOT NULL, -- 답변 순서(최신답변은 부모글 바로 아래 달려집니다.) 
       regdate              DATE NOT NULL,           -- 글 등록일 
       passwd               VARCHAR(15) NOT NULL,    -- 패스워드 
       count                NUMBER(5) DEFAULT 0 NOT NULL,      -- 조회수  
       ip                   VARCHAR(15) NOT NULL,    -- 글쓴이 IP  
       filename             VARCHAR(50) NULL,        -- 파일명  
       filesize             NUMBER(7) NULL,          -- 파일 사이즈 
       refnum               NUMBER    DEFAULT 0,     -- 답변확인 컬럼(레코드삭제시 부모글 여부 확인) 
       PRIMARY KEY (num) 
); 

CREATE SEQUENCE board_seq 
    START WITH   1         --시작번호 
    INCREMENT BY 1         --증가값 
    MAXVALUE     99999     --최대값 
    CACHE 20               --시쿼스 변경시 자주 update되는 것을 방지하기위한 캐시값 
    NOCYCLE;    
    
INSERT INTO bbs(bbsno, wname, title, content, passwd, wdate, 
grpno)  
VALUES((SELECT NVL(MAX(bbsno), 0) + 1 as bbsno FROM bbs), 
'왕눈이', '부모글3', '내용', '123', sysdate,
(SELECT NVL(MAX(grpno), 0) + 1 as grpno FROM bbs)
);  

INSERT INTO board(num, name, subject, content, passwd, regdate, 
ref,ip)  
VALUES((SELECT NVL(MAX(num), 0) + 1 as num FROM board), 
'조운제', '부모글', '내용', '123', sysdate,
(SELECT NVL(MAX(ref), 0) + 1 as grpno FROM board),
'0:0:0:0:0:0:0:1');  
INSERT INTO board(num, name, subject, content, passwd, regdate, 
ref,ip)  
VALUES((SELECT NVL(MAX(num), 0) + 1 as num FROM board), 
'조운제', '부모글', '내용', '123', sysdate,
(SELECT NVL(MAX(ref), 0) + 1 as grpno FROM board),
'0:0:0:0:0:0:0:1');  
INSERT INTO board(num, name, subject, content, passwd, regdate, 
ref,ip)  
VALUES((SELECT NVL(MAX(num), 0) + 1 as num FROM board), 
'조운제', '부모글', '내용', '123', sysdate,
(SELECT NVL(MAX(ref), 0) + 1 as grpno FROM board),
'0:0:0:0:0:0:0:1');  
INSERT INTO board(num, name, subject, content, passwd, regdate, 
ref,ip)  
VALUES((SELECT NVL(MAX(num), 0) + 1 as num FROM board), 
'조운제', '부모글', '내용', '123', sysdate,
(SELECT NVL(MAX(ref), 0) + 1 as grpno FROM board),
'0:0:0:0:0:0:0:1');  
INSERT INTO board(num, name, subject, content, passwd, regdate, 
ref,ip)  
VALUES((SELECT NVL(MAX(num), 0) + 1 as num FROM board), 
'조운제', '부모글', '내용', '123', sysdate,
(SELECT NVL(MAX(ref), 0) + 1 as grpno FROM board),
'0:0:0:0:0:0:0:1');  
INSERT INTO board(num, name, subject, content, passwd, regdate, 
ref,ip)  
VALUES((SELECT NVL(MAX(num), 0) + 1 as num FROM board), 
'조운제', '부모글', '내용', '123', sysdate,
(SELECT NVL(MAX(ref), 0) + 1 as grpno FROM board),
'0:0:0:0:0:0:0:1');  
INSERT INTO board(num, name, subject, content, passwd, regdate, 
ref,ip)  
VALUES((SELECT NVL(MAX(num), 0) + 1 as num FROM board), 
'조운제', '부모글', '내용', '123', sysdate,
(SELECT NVL(MAX(ref), 0) + 1 as grpno FROM board),
'0:0:0:0:0:0:0:1');  
INSERT INTO board(num, name, subject, content, passwd, regdate, 
ref,ip)  
VALUES((SELECT NVL(MAX(num), 0) + 1 as num FROM board), 
'조운제', '부모글', '내용', '123', sysdate,
(SELECT NVL(MAX(ref), 0) + 1 as grpno FROM board),
'0:0:0:0:0:0:0:1');  
INSERT INTO board(num, name, subject, content, passwd, regdate, 
ref,ip)  
VALUES((SELECT NVL(MAX(num), 0) + 1 as num FROM board), 
'조운제', '부모글', '내용', '123', sysdate,
(SELECT NVL(MAX(ref), 0) + 1 as grpno FROM board),
'0:0:0:0:0:0:0:1');  
INSERT INTO board(num, name, subject, content, passwd, regdate, 
ref,ip)  
VALUES((SELECT NVL(MAX(num), 0) + 1 as num FROM board), 
'조운제', '부모글', '내용', '123', sysdate,
(SELECT NVL(MAX(ref), 0) + 1 as grpno FROM board),
'0:0:0:0:0:0:0:1');  

 DELETE FROM board WHERE name ='111' ;
    
select * from board;