<<<<<<< HEAD
<<<<<<< HEAD
﻿﻿-------------------------------------------------------------------------------- 
=======
﻿-------------------------------------------------------------------------------- 
>>>>>>> 6a3530dc46bcab8f96a465db2171416df037c414
=======
﻿-------------------------------------------------------------------------------- 
>>>>>>> 6a3530dc46bcab8f96a465db2171416df037c414
					-- CREATE TABLE --
--------------------------------------------------------------------------------
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
  UPDATEDATE VARCHAR2(20),
<<<<<<< HEAD
<<<<<<< HEAD
    verify      VARCHAR2(30)          DEFAULT 'USER'
=======
    verify      number          default 0

>>>>>>> 6a3530dc46bcab8f96a465db2171416df037c414
=======
    verify      number          default 0

>>>>>>> 6a3530dc46bcab8f96a465db2171416df037c414
);

-------------------------------------------------------------------------------- 