select * from bbs;

INSERT INTO bbs(bbsno, wname, title, content, passwd, wdate, grpno, indent, ansnum)  
VALUES((SELECT NVL(MAX(bbsno), 0) + 1 as bbsno FROM bbs), '왕눈이', '제목2', '내용', '123', 
sysdate, ((SELECT NVL(MAX(grpno), 0) + 1 as grpno FROM bbs)), 0, 0);                 
 
INSERT INTO bbs(bbsno, wname, title, content, passwd, wdate, grpno, indent, ansnum)  
VALUES((SELECT NVL(MAX(bbsno), 0) + 1 as bbsno FROM bbs), '왕눈이', '제목2', '내용', '123', 
sysdate, ((SELECT NVL(MAX(grpno), 0) + 1 as grpno FROM bbs)), 0, 0); 
 
INSERT INTO bbs(bbsno, wname, title, content, passwd, wdate, grpno, indent, ansnum)  
VALUES((SELECT NVL(MAX(bbsno), 0) + 1 as bbsno FROM bbs), '왕눈이', '제목2', '내용', '123', 
sysdate, ((SELECT NVL(MAX(grpno), 0) + 1 as grpno FROM bbs)), 0, 0); 
 
INSERT INTO bbs(bbsno, wname, title, content, passwd, wdate, grpno, indent, ansnum)  
VALUES((SELECT NVL(MAX(bbsno), 0) + 1 as bbsno FROM bbs), '왕눈이', '제목2', '내용', '123', 
sysdate, ((SELECT NVL(MAX(grpno), 0) + 1 as grpno FROM bbs)), 0, 0); 
 
INSERT INTO bbs(bbsno, wname, title, content, passwd, wdate, grpno, indent, ansnum)  
VALUES((SELECT NVL(MAX(bbsno), 0) + 1 as bbsno FROM bbs), '왕눈이', '제목2', '내용', '123', 
sysdate, ((SELECT NVL(MAX(grpno), 0) + 1 as grpno FROM bbs)), 0, 0); 
 
INSERT INTO bbs(bbsno, wname, title, content, passwd, wdate, grpno, indent, ansnum)  
VALUES((SELECT NVL(MAX(bbsno), 0) + 1 as bbsno FROM bbs), '왕눈이', '제목2', '내용', '123', 
sysdate, ((SELECT NVL(MAX(grpno), 0) + 1 as grpno FROM bbs)), 0, 0); 
 
INSERT INTO bbs(bbsno, wname, title, content, passwd, wdate, grpno, indent, ansnum)  
VALUES((SELECT NVL(MAX(bbsno), 0) + 1 as bbsno FROM bbs), '왕눈이', '제목2', '내용', '123', 
sysdate, ((SELECT NVL(MAX(grpno), 0) + 1 as grpno FROM bbs)), 0, 0); 
 
INSERT INTO bbs(bbsno, wname, title, content, passwd, wdate, grpno, indent, ansnum)  
VALUES((SELECT NVL(MAX(bbsno), 0) + 1 as bbsno FROM bbs), '왕눈이', '제목2', '내용', '123', 
sysdate, ((SELECT NVL(MAX(grpno), 0) + 1 as grpno FROM bbs)), 0, 0); 
 
INSERT INTO bbs(bbsno, wname, title, content, passwd, wdate, grpno, indent, ansnum)  
VALUES((SELECT NVL(MAX(bbsno), 0) + 1 as bbsno FROM bbs), '왕눈이', '제목2', '내용', '123', 
sysdate, ((SELECT NVL(MAX(grpno), 0) + 1 as grpno FROM bbs)), 0, 0); 
 
INSERT INTO bbs(bbsno, wname, title, content, passwd, wdate, grpno, indent, ansnum)  
VALUES((SELECT NVL(MAX(bbsno), 0) + 1 as bbsno FROM bbs), '왕눈이', '제목2', '내용', '123', 
sysdate, ((SELECT NVL(MAX(grpno), 0) + 1 as grpno FROM bbs)), 0, 0); 
 
 
INSERT INTO bbs(bbsno, wname, title, content, passwd, wdate, grpno, indent, ansnum)  
VALUES((SELECT NVL(MAX(bbsno), 0) + 1 as bbsno FROM bbs), '왕눈이', '제목2', '내용', '123', 
sysdate, ((SELECT NVL(MAX(grpno), 0) + 1 as grpno FROM bbs)), 0, 0); 
 
 
select * from bbs;
 
 
4. 페이징이 되는 소스: 1페이지만 나오게 하기 
1) 정렬 
SELECT bbsno, wname, title, viewcnt, wdate
FROM bbs  
ORDER BY grpno DESC, ansnum ASC; 
 
 
 
2) rownum 생성 
 
SELECT bbsno, wname, title, viewcnt, wdate, rownum as r 
FROM ( 
   SELECT bbsno, wname, title, viewcnt, wdate
FROM bbs  
ORDER BY grpno DESC, ansnum ASC 
)
 
 
 
3) rownum 값에 따른 페이지 분리 
SELECT bbsno, wname, title, viewcnt, wdate,  r
FROM (
	SELECT bbsno, wname, title, viewcnt, wdate, rownum as r 
	FROM ( 
	  	SELECT bbsno, wname, title, viewcnt, wdate, grpno,indent,ansnum
		FROM bbs  
		ORDER BY grpno DESC, ansnum ASC 
	)
)where r>=1 and r<=10
