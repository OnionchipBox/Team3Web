CREATE TABLE shop_products (
    productId NUMBER(38) PRIMARY KEY,
    name VARCHAR2(255) NOT NULL,
    price NUMBER(38) NOT NULL,
    stock NUMBER(38) NOT NULL,
    imageUrl VARCHAR2(255) NOT NULL,
    pcode VARCHAR2(255) NOT NULL,
    thumbimg varchar2(255) not null,
    category varchar2(255) ,
     seller_id number(38)       --추후 seller id�? 참조(FK) 추�?(?��?�� ?��매자�? ?���? ?��?��?���? ?��?��?�� ?�� ?��?��?�� ?��)
);

create SEQUENCE product_no_seq
start with 1
increment by 1
nocache
nocycle;

select * from shop_products;

commit;

create table shop_user
(

  ID        VARCHAR2(50)         PRIMARY KEY,
  PASSWORD        VARCHAR2(100)        ,
  NAME      VARCHAR2(30)                  ,
  GENDER      VARCHAR2(10)                  ,
  PHONE     VARCHAR2(20)                ,
  NICKNAME VARCHAR2(30)                ,
  ZIPCODE VARCHAR2(10)   ,
  ADDRESS   VARCHAR2(400)                  ,
  BIRTHDAY  DATE                  ,
  JOINDATE  VARCHAR2(20)                  ,
  UPDATEDATE VARCHAR2(20)   ,
    VERIFY    VARCHAR2(30) DEFAULT 'USER' CHECK (VERIFY IN ('USER', 'SELLER', 'ADMIN')) ,
    BALANCE NUMBER(10, 0) DEFAULT 0 ,
    POINT NUMBER(10, 0) DEFAULT 1000
);


select * from shop_user;

