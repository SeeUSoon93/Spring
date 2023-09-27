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


-- 값 조회
SELECT * FROM board;

DELETE FROM board WHERE idx = 6;
