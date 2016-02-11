CREATE TABLE product ( 
  id   			NUMBER(7)     	NOT NULL,  -- 카테고리값 일련번호, 키
  category   	VARCHAR(10)   	NOT NULL,  -- 상품분류 
  wname   		VARCHAR(20)  	NOT NULL,  -- 제목(*) 
  pname 		VARCHAR(20) 	NOT NULL,  -- 글 내용 
  sname  		VARCHAR(20)   	NOT NULL,  -- 비밀 번호 
  price 		NUMBER(9)     	NOT NULL, -- 조회수, 기본값 사용 
  downprice   	NUMBER(9)       DEFAULT 0,  -- 등록 날짜, sysdate 
  inputdate   	VARCHAR(50)     DEFAULT 0, -- 부모글 번호 
  stock  		NUMBER(3)     	DEFAULT 0, -- 답변여부,답변의 깊이
  description  	VARCHAR(1000)   NULL, -- 답변 순서 
  small			VARCHAR(20)		NULL,
  large			VARCHAR(20)		NULL,
  PRIMARY KEY (id)  
); 

show tables;
select * from product;
UPDATE product 
SET category='44' WHERE id = 4400001; 
UPDATE product 
SET category='77' WHERE id = 7700001; 

delete from product;

select max(id) from product where category= '  '

insert into product(id,category,wname,pname,sname,price,downprice,
					inputdate,stock,small,large,description) 
values(0,'";
		sql = sql + cat + "','" + wn + "','" + pn + "','" + sn + "'," + price + "," + dprice + ",'" + ymd;
		sql = sql + "'," + stock + ",'" + filename2 + "','" + filename1 + "','" + des + "')"

insert into saleorder(id,name,orderdate,addr,tel,pay,cardno,prodcount,total)
		values(id,wname,ymd,addr,tel,pay,cardno,count,total);

CREATE TABLE saleorder ( --주문 정보를 포함. 
						 --saleorder 테이블의 레코드와 item 테이블의 레코드는 1:n 관계를 갖음.
   id   			NUMBER(7)     	NOT NULL,  --  키
  name   		VARCHAR(20)   	NOT NULL,  -- 고객(주문자)이름 
  orderdate   	VARCHAR(20)  	NOT NULL,  -- 주문일자
  addr 			VARCHAR(20) 	NOT NULL,  -- 배달주소
  tel  			VARCHAR(20)   	NOT NULL,  -- 연락전화번호 
  pay 			VARCHAR(10)     NOT NULL, -- 결재방법(카드/현금) 
  cardno   		VARCHAR(20)     NULL,  -- 결재방법이 카드인 경우에만 입력 
  prodcount   	NUMBER(10)      DEFAULT 0, -- 주문상품의 품목수
  total  		NUMBER(10)     	DEFAULT 0, -- 주문상품의 총금액
  PRIMARY KEY (id)  
);
select max(id) from saleorder

select * from saleorder

CREATE TABLE item ( -- 각 주문에 대한 상품 정보를 포함.
 					--주문의 상품 품목수가 3개이면 레코드도 3개가 저장됨. 
 					--키를 정의하지 않았지만 자동으로 증가하는 필드를 추가하여 키로 설정해도 됨.
  orderid   	NUMBER(7)     	NOT NULL,  -- saleorder테이블의 id값
  mynum   		NUMBER(10)   	NOT NULL,  -- 주문상품의 일련번호 
  prodid   		NUMBER(7)	  	NOT NULL,  -- 주문상품의 id(product의 name)
  pname 		VARCHAR(40) 	NOT NULL,  -- 주문상품의 이름
  quantity		NUMBER(7)   	DEFAULT 0,  -- 해당상품의 주문수량 
  price 		NUMBER(7)	    DEFAULT 0 -- 해당상품의 판매가격   
);

select * from item

