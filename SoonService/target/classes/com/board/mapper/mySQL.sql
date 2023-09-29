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


INSERT INTO member(email, nick, pw) values('a@b.c', '관리자','1234');
INSERT INTO sboard(bTitle, bContent, nick) values('테스트 제목', '테스트 내용','관리자');

-- 값 조회
SELECT * FROM member;
SELECT * FROM sboard;

