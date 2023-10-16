DROP TABLE shop_user;

create table shop_user
(
  ID        VARCHAR2(50)          PRIMARY KEY,
  PASSWORD        VARCHAR2(100)        ,
  NAME      VARCHAR2(30)                  ,
  GENDER      VARCHAR2(10)                  ,
  PHONE     VARCHAR2(20)                ,
  NICKNAME VARCHAR2(30)                ,
  ZIPCODE VARCHAR2(10)	,
  ADDRESS   VARCHAR2(400)                  ,
  BIRTHDAY  DATE                  ,
  JOINDATE  VARCHAR2(20)                  ,
  UPDATEDATE VARCHAR2(20)   ,
    VERIFY    VARCHAR2(30) DEFAULT 'USER' CHECK (VERIFY IN ('USER', 'SELLER', 'ADMIN')) ,
    BALANCE NUMBER(10, 0) DEFAULT 0 ,
    POINT NUMBER(10, 0) DEFAULT 1000
);

ALTER TABLE shop_user
ADD BALANCE NUMBER(10, 0) DEFAULT 0;

ALTER TABLE shop_user
ADD POINT NUMBER(10, 0) DEFAULT 1000;

ALTER TABLE shop_user
ADD CONSTRAINT fk_user_seller FOREIGN KEY (ID) REFERENCES shop_seller (ID);



-------------------------------------------------------------------------------- 