create table member(
id varchar2(10) primary key,
pass varchar2(10) not null,
ssn varchar2(14) not null,
name varchar2(10) not null
);

create table account(
account_num varchar2(9) primary key,
created_date date default sysdate,
money number default 0,
id varchar2(10) not null,
constraint account_fk_member foreign key(id)
references member(id)
);


select * from tab;
select * from member;

drop table account;
drop table member;
drop table admin;
drop table article;
drop sequence art_seq;


alter table member
add primary key(id);


create table admin(
admin_num varchar2(10) primary key,
name varchar2(10) not null,
pass varchar2(10) not null,
auth varchar2(10) default '사원'
);

create sequence art_seq
start with 1000
increment by 1;

create table article(
art_seq number primary key,
title varchar2(20) default '제목없음',
content varchar2(50),
regdate DATE DEFAULT SYSDATE,
id varchar2(10) not null,
constraint article_fk_member foreign key(id)
references member(id)
);

insert into member(id, name, pass, ssn)
values ('park', '박효신', '1', '811111-1111111');

SELECT * FROM member WHERE id LIKE 'hong' AND PASS LIKE '1';