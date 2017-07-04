select * from board where b_del='y';
------댓글게시판--------------------------------------------------------------
create table boardR(
	br_num		number			primary key not null,
	r_num		number			not null,
	id		varchar2(20),
	br_content	varchar2(1000) 	not null,
	br_ref		number			not null,
	br_re_step	number			not null,
	br_re_level	number			not null,
	br_reg_date	date			not null,
	br_del		char(1)			default 'n',
	foreign key	(r_num)	references	recipe(r_num)
);
select * from boardR;
alter table boardR drop column m_id;
alter table boardR rename column u_id to id;
-- 회원게시판 ---------------------------------------
create table board(
	b_num		number			primary key not null,
	u_id		varchar2(20)	not null,
	b_title		varchar2(20) 	not null,
	b_content	varchar2(4000) 	not null,
	b_readcount	number		 	not null,
	b_ref 		number 			not null,
	b_re_step 	number 			not null,
	b_re_level 	number 			not null,
	b_reg_date 	date 			not null,
	b_del 		char(1) 		default 'n',
	foreign key (u_id) references member(u_id)
);
select *from (select a.*, rownum rn from (select* from magazine order by ma_reg_date desc) a) where rn between 1 and 5;
select *from (select a.*, rownum rn from (select* from board order by b_reg_date desc) a) where rn between 1 and 5;
select *from (select a.*, rownum rn from (select* from recipe order by r_reg_date desc) a) where rn between 1 and 5;
select *from (select a.*, rownum rn from (select* from board where b_del='n' order by b_reg_date desc) a) where rn between 1 and 5;
select * from recipe where u_id='null' or m_id='master';
select * from BOARD;
delete BOARD where b_num=0;
alter table board rename column boardNum to r_num;
alter table board drop column r_num;
update board set boardNum=0 where b_num between 18 and 32;
alter table board modify(b_content varchar2(4000));
drop table board;
select * from tab;
truncate table board;
select del from BOARDA;
-----회원---------------------------------------------------------
create table member (
	u_id 		varchar2(20) 	primary key not null, -- key
	u_passwd 	varchar2(30) 	not null,
	u_name 		varchar2(12) 	not null,
	u_nickname 	varchar2(30), 
	u_birthday	varchar2(50) 	not null,
	u_gender 	varchar2(500) 	not null,
	u_job 		varchar2(20) 	default '기타',
	u_address 	varchar2(100),
	u_postcode 	varchar2(15),
	u_tel 		varchar2(20) 	not null,
	u_email 	varchar2(30) 	not null,
	u_reg_date 	date 			not null,
	u_del 		char(1) 		default 'n' not null
);

insert into member values('kildong','kil','길동','똥','900101','man','학생','서울특별시 강남구','12345','01011111111','k@k.com',sysdate,'n')
drop table member;
select*from member;
select * from member where u_id='kildong' and u_del !='y'
select*from tab;
update member set u_del='n';
--------관리자------------------------------------------------------------------
create table manager (
	m_id 		varchar2(20) 	primary key, 
	m_Passwd 	varchar2(30) 	not null
);
insert into manager values('master','master');
select * from manager;
drop table manager;
------------요리게시판----------------------------------------------------------
create table recipe (
	r_num 			number 			primary key not null,
	u_id 			varchar2(20) ,
	m_id 			varchar2(20) ,
	r_kind 			number 	default 100,
	r_title 		varchar2(100) 	not null,
	r_image 		varchar2(40) 	default 'nothing.jpg',
	r_ingredients 	varchar2(30),
	r_content 		varchar2(4000) 	not null,
	r_readcount 	number			not null,
	r_likeit		number,
	r_saveit 		number,
	r_reg_date 		date 			not null,
	r_del 			char(1) 		default 'n',
	foreign key (u_id) references member(u_id),
	foreign key (m_id) references manager(m_id)
);
update recipe set r_kind=100;
truncate table recipe;
alter table recipe modify(r_kind number default 100);
alter table recipe modify(r_image varchar2(40) default 'nothig.jpg');
alter table recipe modify(r_content varchar2(4000));
alter table recipe modify(r_title varchar2(100));
select*from recipe;
drop table recipe;
select* from (select a.*, rownum rn
		from (select * from recipe order by r_reg_date desc) a)
		where rn between 1 and 11 and r_kind=100;
select count(*) from recipe	where r_kind=100;
-----------자기 장바구니----------------------------------------------------------
create table mypage(
	my_num 	number primary key not null,
	u_id 	varchar2(20),
	ma_num 	number,
	r_num 	number,
	m_id 	varchar2(20),
	my_reg_date date not null,
	my_del 	char(1) default'n',
	foreign key (u_id) references member(u_id),
	foreign key (m_id) references manager(m_id)
);
select*from mypage;
drop table mypage;
-------------매거진게시판-------------------------------------------------------
create table magazine(
	ma_num 			number 			primary key not null,
	m_id 			varchar2(20) 	not null,
	ma_title		varchar2(100)	not null,
	ma_kind			number			default 100,
	ma_image 		varchar2(40),
	ma_content		varchar2(4000) 	not null,
	ma_readcount	number			not null,
	ma_reg_date 	date 			not null,
	ma_del 			char(1) 		default'n',
	foreign key (m_id) references manager(m_id)
);
truncate table magazine;
alter table magazine modify(ma_title varchar2(100));
alter table magazine add constraint fk_ma_m_id foreign key (m_id) references manager(m_id); 
select * from magazine;
drop table magazine;
-----------------------------------------------------------------------------------
select *from (select a.*, rownum rn from (select* from magazine order by ma_reg_date desc) a) where rn between 1 and 10;
select * from recipe where u_id='null' or m_id='master';