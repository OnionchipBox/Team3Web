CREATE TABLE products (
    productId NUMBER(38) PRIMARY KEY,
    name VARCHAR2(255) NOT NULL,
    price NUMBER(38) NOT NULL,
    stock NUMBER(38) NOT NULL,
    imageUrl VARCHAR2(255) NOT NULL,
    pcode VARCHAR2(255) NOT NULL,
    thumbimg varchar2(255) not null,
    categoryId varchar2(38) ,
    seller_code number(38)       --추후 seller id값 참조(FK) 추가(어떤 판매자가 올린 상품인지 확인할 수 있어야 함)
);

create SEQUENCE product_no_seq
start with 1
increment by 1
nocache
nocycle;