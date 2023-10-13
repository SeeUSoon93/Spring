-- Board 게시판 테이블 생성
create table board(
	idx int not null auto_increment,
	title varchar(100) not null,
	content varchar(2000) not null,
	writer varchar(100) not null,
	indate datetime default now(),
	count int default 0,
	primary key(idx)
);

-- test 데이터 넣기
insert into board(title, content, writer)
values('신나는 월요일~', '월요일 조아~', '스폰지밥');
insert into board(title, content, writer)
values('내일은 화요일', '수요일까지만 버티자', '추석');
insert into board(title, content, writer)
values('오늘 회의 몇시에 끝나나', '안끝날지도...', '스마트');

-- 값 조회하기
select * from board;

-- 회원 테이블 만들기
create table member(
	memIdx int auto_increment,
	memId varchar(20) not null unique,
	memPw varchar(20) not null,
	memName varchar(20) not null,
	memAge int,
	memGender varchar(20),
	memEmail varchar(20),
	memProfile varchar(50),
	primary key(memIdx)
);

-- 값 넣기
insert into member(memId, memPw, memName, memAge, memGender, memEmail)
values('admin', '1234', '관리자', '1', '여자', 'admin@gmail.com');
insert into member(memId, memPw, memName, memAge, memGender, memEmail)
values('smart', '1111', '스마트', 20, '남자', 'smhrd@gmail.com');
insert into member(memId, memPw, memName, memAge, memGender, memEmail)
values('juhee', '5678', '이주희', 20, '여자', 'smart@gmail.com');

-- 값 조회
select * from member;

delete from member where memId = 'smart';












