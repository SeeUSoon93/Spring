CREATE TABLE member(
	email varchar(100) not null,		
	nick varchar(100) not null,
	pw varchar(100),
	primary key(email)
);

CREATE TABLE sboard (
    idx INT NOT NULL AUTO_INCREMENT,
    bTitle VARCHAR(100) NOT NULL,
    bContent VARCHAR(4000) NOT NULL,
    nick varchar(100) not null,
    bDate DATETIME DEFAULT NOW(),
    bGood INT DEFAULT 0,
    PRIMARY KEY (idx)
);

CREATE TABLE reple(	
idx INT NOT NULL,
	nick varchar(100) not null,
	rContent VARCHAR(4000) NOT NULL
);




INSERT INTO member(email, nick, pw) values('a@b.c', '관리자','1234');
INSERT INTO sboard(bTitle, bContent, nick) values('테스트 제목', '테스트 내용','관리자');
INSERT INTO reple values('관리자', '테스트 제목','댓글 테스트');

-- 값 조회
SELECT * FROM board;


DELETE FROM reple;

