SELECT		*
FROM				employee;

SELECT				EMP_ID, EMP_NAME, EMAIL, SALARY
FROM					employee
WHERE				EMP_ID = '100'AND EMAIL = 'hyunjinlee1@naver.com	'

CREATE TABLE BLOG_TBL(
		ID INT AUTO_INCREMENT PRIMARY KEY,
		TITLE VARCHAR(50) NOT NULL ,
		CONTENT VARCHAR(1000) NOT NULL
);


INSERT INTO blog_tbl(TITLE, CONTENT) VALUES
('강사님 짱!!', '냉무'),
('내일은 불금이다', '즐기자'),
('배고프다', '마라탕~ 콜') ;


INSERT INTO blog_tbl(TITLE, CONTENT) VALUES
('강사님 짱!!', '냉무'),
('내일은 불금이다', '즐기자'),
('배고프다', '마라탕~ 콜') ;

SELECT * 
FROM	 blog_tbl ; 

DROP TABLE BLOG_COMMENTS_TBL;

CREATE TABLE BLOG_COMMENTS_TBL(
		ID 						INT AUTO_INCREMENT PRIMARY KEY,
		comment 	VARCHAR(1000) NOT NULL,
		BLOG_ID 	INT NOT NULL REFERENCES blog_tbl (ID)
);

SELECT			*
FROM				BLOG_COMMENTS_TBL
WHERE		BLOG_ID= 1;


SELECT			*
FROM				user_entity;


SELECT			*
FROM				blog_entity;

INSERT INTO blog_entity(title, content, author_email)
VALUES('드디어 개발교육', '마무리 인가?', 'hyunjinlee1@naver.com');

SELECT			*
FROM				comment_entity;

INSERT INTO comment_entity(BLOG_ID, COMMENT)
VALUES(1, '댓글');

INSERT INTO comment_entity(BLOG_ID, COMMENT)
VALUES(1, '홧팅');

COMMIT;












