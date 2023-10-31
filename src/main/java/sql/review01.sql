--review01.sql

create table review01(
 reno number(38) primary key --게시물번호
 ,rename2 varchar2(100) not null --작성자
 ,retitle varchar2(200) not null --제목
 ,repwd varchar2(20) not null --비밀번호
 ,recont varchar2(4000) not null --내용
 ,refile varchar2(200) --이진파일명
 ,rehit number(38) default 0 --조회수
 ,reref number(38) --글 그룹번호
 ,restep number(38) -- 첫번째 답변글 1,두번째 답변글 2,즉
 --원본글과 답변글을 구분하는 번호값,몇번째 답변글인가를 알려줌
 ,relevel number(38) -- 답변글 정렬순서
 ,redate date --글 등록날짜 
);

select * from review01 order by reno desc;
drop table review01;
delete from review01;
--re_no_seq 시퀀스 생성
create sequence re_no_seq01
start with 1
increment by 1
nocache
nocycle;

--10/19
-- thumbimg 컬럼 추가 
alter table review01 add thumbimg varchar2(255) DEFAULT '-' NOT NULL;


--10/30 thumbimg not null 해제 
alter table review01 modify (thumbimg null);

--reply_seq 시퀀스 생성
create sequence reply_seq
start with 1
increment by 1
nocache
nocycle;

commit;