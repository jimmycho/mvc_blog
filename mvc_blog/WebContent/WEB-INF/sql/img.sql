CREATE TABLE img ( 
  imgno   NUMBER(7)     NOT NULL,  -- 글 일련 번호, -9999999 ~ +9999999 
  wname   VARCHAR(20)   NOT NULL,  -- 글쓴이 
  title   VARCHAR(100)  NOT NULL,  -- 제목(*) 
  content VARCHAR(4000) NOT NULL,  -- 글 내용 
  passwd  VARCHAR(15)   NOT NULL,  -- 비밀 번호 
  viewcnt NUMBER(5)     DEFAULT 0, -- 조회수, 기본값 사용 
  wdate   DATE          NOT NULL,  -- 등록 날짜, sysdate 
  grpno   NUMBER(7)     DEFAULT 0, -- 부모글 번호 
  indent  NUMBER(2)     DEFAULT 0, -- 답변여부,답변의 깊이
  ansnum  NUMBER(5)     DEFAULT 0, -- 답변 순서 
  filename  VARCHAR(30) NOT NULL,
  PRIMARY KEY (imgno)  
); 

SELECT imgno, wname, title, content, passwd, viewcnt, wdate, grpno, indent, ansnum ,filename
FROM img  
ORDER BY imgno DESC; 


INSERT INTO img(imgno, wname, title, content, passwd, 
wdate,grpno,filename)  
VALUES((SELECT NVL(MAX(imgno), 0) + 1 as imgno FROM img), 
'왕눈이1', '이미지1', '내용1', '123', sysdate,
(SELECT NVL(MAX(grpno), 0) + 1 as grpno FROM img),
'aaa7.jpg') ;

INSERT INTO img(imgno, wname, title, content, passwd, 
wdate,grpno,filename)  
VALUES((SELECT NVL(MAX(imgno), 0) + 1 as imgno FROM img), 
'왕눈이2', '이미지2', '내용2', '123', sysdate,
(SELECT NVL(MAX(grpno), 0) + 1 as grpno FROM img),
'aaa8.jpg') ;

INSERT INTO img(imgno, wname, title, content, passwd, 
wdate,grpno,filename)  
VALUES((SELECT NVL(MAX(imgno), 0) + 1 as imgno FROM img), 
'왕눈이3', '이미지3', '내용3', '123', sysdate,
(SELECT NVL(MAX(grpno), 0) + 1 as grpno FROM img),
'aaa9.jpg') ;

INSERT INTO img(imgno, wname, title, content, passwd, 
wdate,grpno,filename)  
VALUES((SELECT NVL(MAX(imgno), 0) + 1 as imgno FROM img), 
'왕눈이4', '이미지4', '내용4', '123', sysdate,
(SELECT NVL(MAX(grpno), 0) + 1 as grpno FROM img),
'aaa10.jpg') ;

INSERT INTO img(imgno, wname, title, content, passwd, 
wdate,grpno,filename)  
VALUES((SELECT NVL(MAX(imgno), 0) + 1 as imgno FROM img), 
'왕눈이5', '제목5', '내용5', '123', sysdate,
(SELECT NVL(MAX(grpno), 0) + 1 as grpno FROM img),
'aaa11.jpg') ;

select * from img;

SELECT COUNT(imgno) as cnt
FROM img 
WHERE imgno = 6 AND passwd = '123';

DELETE FROM img  WHERE imgno = 2;

DELETE FROM img  WHERE imgno < 100;

SELECT  * from
  ( 
     select imgno, filename,  
         lag(imgno,2)     over (order by imgno) pre_imgno2,  
         lag(filename,2)  over (order by imgno) pre_file2,   
         lag(imgno,1)     over (order by imgno ) pre_imgno1,  
         lag(filename,1)  over (order by imgno ) pre_file1,  
         lead(imgno,1)    over (order by imgno) nex_imgno1,  
         lead(filename,1) over (order by imgno) nex_file1,
         lead(imgno,2)    over (order by imgno) nex_imgno2,  
         lead(filename,2) over (order by imgno) nex_file2 
         from ( 
              SELECT imgno, filename  
              FROM img
              ORDER BY imgno DESC 
         ) 
  ) WHERE imgno = 4
  