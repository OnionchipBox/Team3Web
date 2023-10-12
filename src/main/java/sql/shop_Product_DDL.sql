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