--11/07
CREATE TABLE shop_cart (
    cartId NUMBER(38) PRIMARY KEY,
    username varchar2(50),
    productId NUMBER(38),
    cartSize VARCHAR2(10),
    quantity NUMBER(38),

    CONSTRAINT fk_cart_user FOREIGN KEY (username) REFERENCES shop_user(username),
    CONSTRAINT fk_cart_product FOREIGN KEY (productId) REFERENCES shop_products(productId)
); 

create sequence cart_no_seq
start with 1
increment by 1
nocache
nocycle;

select * from shop_cart;

commit;

--11/07
CREATE TABLE shop_order (
    username  VARCHAR2(50) not null,
    orderId number(38) PRIMARY KEY NOT NULL,
    merchant_uid VARCHAR2(255) NOT NULL,
    zipcode VARCHAR2(10) NOT NULL,
    name VARCHAR2(255) NOT NULL,
    price NUMBER(38) NOT NULL,
    phone VARCHAR2(15) NOT NULL,
    status VARCHAR2(50) NOT NULL,
    odate TIMESTAMP NOT NULL,
    address1 VARCHAR2(255) NOT NULL,
    address2 VARCHAR2(255) NOT NULL,
    req VARCHAR2(255)
);

ALTER TABLE shop_order
ADD CONSTRAINT fk_shop_user_id FOREIGN KEY (username) REFERENCES shop_user(username);

CREATE SEQUENCE order_no_seq
start with 1
increment by 1
nocache
nocycle;


select * from shop_order;


create table shop_catrgory(
categoryId number(38) primary key,
categoryName varchar2(100) not null,
subcatrgory number(38) 
);

select * from shop_category;
select * from shop_products order by categoryId;
ALTER TABLE shop_catrgory RENAME TO shop_category;

insert into shop_category values(4,'가방',0);


ALTER TABLE shop_products
ADD CONSTRAINT fk_category
FOREIGN KEY (categoryId)
REFERENCES shop_category(categoryId);

commit;