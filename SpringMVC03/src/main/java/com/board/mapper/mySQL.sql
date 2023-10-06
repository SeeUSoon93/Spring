-- Board 게시판 테이블 생성

CREATE TABLE board(
	idx int not null auto_increment,
	title varchar(100) not null,
	content varchar(2000) not null,		
	writer varchar(100) not null,
	indate datetime default now(),
	count int default 0,
	good int default 0,
	bad int default 0,	
	primary key(idx)
);

INSERT INTO board(title, content, writer) values('연휴에 낚시 갈 사람', '고멤은 10시까지 영산강으로 집합!', '순이');

-- 회원 테이블 생성
CREATE TABLE member(
	memIdx int not null auto_increment,
	memId varchar(200) not null UNIQUE,
	memPw varchar(200) not null,		
	memName varchar(100) not null,
	memAge int,
	memGender varchar(20),
	memEmail varchar(200),
	memProfile varchar(200),	
	primary key(memIdx)
);

INSERT INTO member(memId, memPw,memName,memAge,memGender,memEmail)
values('rlarnstns','1234','순이','30','남성','soonecally@gmail.com');

INSERT INTO member(memId, memPw,memName)
values('admin','1234','관리자');

INSERT INTO member(memId, memPw,memName,memAge,memGender,memEmail)
values('rla','1234','군순이','30','남성','rlarnstns@gmail.com');




-- 값 조회
SELECT * FROM member;

DELETE FROM board;

