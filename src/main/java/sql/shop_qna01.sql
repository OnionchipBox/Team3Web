-- 팀프로젝트 qna 게시판 
create table qna01(
 qnano number(38) primary key --게시물번호
 ,qid varchar2(100) not null --작성자
 ,qtitle varchar2(200) not null --제목
 ,qpw varchar2(20) not null --비밀번호
 ,qcont varchar2(1000) not null --내용
 ,qfile varchar2(200) --이진파일명
 ,qref number(38) --글 그룹번호
 ,qstep number(38) -- 첫번째 답변글 1,두번째 답변글 2,즉
                            --원본글과 답변글을 구분하는 번호값,몇번째 답변글인지
 ,qlevel number(38) -- 답변글 정렬순서
 ,qdate date --글 등록날짜 
);
-- qno_no - > qnono로 변경 해서 다시 테스트하니까 번호값 인식됨! 이유가 뭘까 ??
drop table qna01;
select * from qna01 order by qnano desc;

create sequence qna_no_seq01
start with 1
increment by 1
nocache
nocycle;

commit;

-- 11/01  1:1 문의 테이블 추가 

create table myQ(
  qnano number(38) primary key --게시물번호
 ,qid varchar2(100) not null --작성자
 ,qtitle varchar2(200) not null --제목
 ,qcont varchar2(1000) not null --내용
 ,qref number(38) --글 그룹번호
 ,qdate date --글 등록날짜 
);

ALTER TABLE myQ DROP COLUMN qid; -- ID 컬럼 삭제 ( 사용자 로그인 했을 때만 문의폼에 접근할 수 있으므로 ID값은 현재 필요 없음!! )
select * from myQ;
delete from myQ;
ALTER TABLE myQ DROP COLUMN qref; -- QREF 컬럼 삭제 
-- qnano에 적용할 시퀀스 생성
create sequence myQ_seq
start with 1
increment by 1
nocache
nocycle;

commit;
