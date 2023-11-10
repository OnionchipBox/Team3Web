-- 스프링 시큐리티 공식 문서 권장사항 CREATE문
CREATE TABLE persistent_logins (
    username varchar(64) not null,
    series varchar(64) primary key,
    token varchar(64) not null,
    last_used timestamp not null
);
commit;
SELECT * FROM persistent_logins;