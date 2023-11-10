-- 11/07 공지 사항 테이블 생성
create table shop_notice(
  gno number(38) primary key  -- 공지번호
  , gname varchar2(50) not null  --공지 작성자
  , gtitle varchar2(200) not null  -- 공지제목
  , gpwd varchar2(20) not null -- 공지 비번
  , gcont  varchar2(4000) not null --공지 내용
  , ghit number(38) default 0 -- 조회수
  , gdate date -- 등록날짜 
  );
  
  ALTER TABLE shop_notice MODIFY (gcont VARCHAR2(4000));

  --gongji_no_seq 시퀀스 생성
  create sequence notice_no_seq
  start with 1
  increment by 1
  nocache;
  
  insert into shop_notice (gno, gname, gtitle, gpwd, gcont, gdate)
  values(gongji_no_seq.nextval, 'NUBE관리자','NUBE DRAW - 나이키 후드티','admin','공지내용입니다.',sysdate);
  
  select * from shop_notice order by gno desc;
  
  alter sequence notice_no_seq
  nocache; --nocache로 시퀀스 수정
  
commit;