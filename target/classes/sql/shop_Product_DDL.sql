CREATE TABLE products (
    productId NUMBER(38) PRIMARY KEY,
    name VARCHAR2(255) NOT NULL,
    price NUMBER(38) NOT NULL,
    stock NUMBER(38) NOT NULL,
    imageUrl VARCHAR2(255) NOT NULL,
    pcode VARCHAR2(255) NOT NULL,
    thumbimg varchar2(255) not null,
    categoryId varchar2(38) ,
    seller_code number(38)       --���� seller id�� ����(FK) �߰�(� �Ǹ��ڰ� �ø� ��ǰ���� Ȯ���� �� �־�� ��)
);

create SEQUENCE product_no_seq
start with 1
increment by 1
nocache
nocycle;