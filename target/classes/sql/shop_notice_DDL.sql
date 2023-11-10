-- 11/07 ���� ���� ���̺� ����
create table shop_notice(
  gno number(38) primary key  -- ������ȣ
  , gname varchar2(50) not null  --���� �ۼ���
  , gtitle varchar2(200) not null  -- ��������
  , gpwd varchar2(20) not null -- ���� ���
  , gcont  varchar2(4000) not null --���� ����
  , ghit number(38) default 0 -- ��ȸ��
  , gdate date -- ��ϳ�¥ 
  );
  
  ALTER TABLE shop_notice MODIFY (gcont VARCHAR2(4000));

  --gongji_no_seq ������ ����
  create sequence notice_no_seq
  start with 1
  increment by 1
  nocache;
  
  insert into shop_notice (gno, gname, gtitle, gpwd, gcont, gdate)
  values(gongji_no_seq.nextval, 'NUBE������','NUBE DRAW - ����Ű �ĵ�Ƽ','admin','���������Դϴ�.',sysdate);
  
  select * from shop_notice order by gno desc;
  
  alter sequence notice_no_seq
  nocache; --nocache�� ������ ����
  
commit;