-- Board 게시판 테이블 생성

CREATE TABLE board(
	idx int not null auto_increment,
	title varchar(100) not null,
	content varchar(2000) not null,		
	writer varchar(100) not null,
	indate datetime default now(),
	count int default 0,
	primary key(idx)
);

-- test 데이터 넣기
INSERT INTO board(title, content, writer)
values('박순자 갈사람 구함','고멤은 박순자로 집합하도록','순이');
INSERT INTO board(title, content, writer)
values('치킨 먹을 사람 구함','고멤은 광주에서 가장 큰 BHC로 집합하도록','최윤석');
INSERT INTO board(title, content, writer)
values('연휴에 낚시ㄱㄱ','고멤은 영산강으로 집합하도록','순이');

-- 값 조회
SELECT * FROM board;