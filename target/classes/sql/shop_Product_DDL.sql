CREATE TABLE shop_products (
    productId NUMBER(38) PRIMARY KEY,
    name VARCHAR2(255) NOT NULL,
    price NUMBER(38) NOT NULL,
    stock NUMBER(38) NOT NULL,
    imageUrl VARCHAR2(255) NOT NULL,
    pcode VARCHAR2(255) NOT NULL,
    thumbimg varchar2(255) not null,
    category varchar2(255) ,
     seller_id number(38)       --μΆν seller idκ°? μ°Έμ‘°(FK) μΆκ?(?΄?€ ?λ§€μκ°? ?¬λ¦? ???Έμ§? ??Έ?  ? ??΄?Ό ?¨)
);

create SEQUENCE product_no_seq
start with 1
increment by 1
nocache
nocycle;