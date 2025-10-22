SHOW DATABASES ;


USE inspire;
-- --------------------------------오후 수업 ----------------------------------------------------
-- 3-4 교시
/*
SQL(Structure Query Language)

Select Query
DDL : create, drop, alter
DML : insert, update, delete
DCL : commit, rollback

select : 데이터를 검색할 때 사용하는 문법

select 		column_name | * | 표현식 또는 함수를 포함하는 식 | [as] 별칭 | distinct column_name
				from table_name
[WHERE] -- 행의 제한
[GROUP BY 집계컬럼 WITH ROLLUP] -- 데이터를 그룹으로 묶을 때 (표현식 | 컬럼명 | 별칭x)
[HAVING] -- 그룹에 대한 조건
[ORDER BY] -- 정렬(내림차순 DESC, 오름차순 ASC)

*/
 

SELECT *
FROM department ;

SELECT EMP_ID,
EMP_NAME
FROM employee ;


SELECT *
FROM employee
WHERE DEPT_ID = '90' ;


SELECT 	EMP_NAME,
			SALARY,
			((SALARY + (SALARY * BONUS_PCT)) * 12) `연 봉`
FROM employee ;

-- NULL 처리를 위한 함수 : IFNULL(EXP1 , EXP2) , NULLIF(EXP1 , EXP2)

SELECT IFNULL(NULL, '넌 누구냐?') , NULLIF(100 , 'NOT NULL');

SELECT 	EMP_NAME,
			SALARY,
			((SALARY + (SALARY * IFNULL(BONUS_PCT,0))) * 12) `연 봉`
FROM employee ;
-- --------------5-6 교시--------------------------------------------------------------
-- distinct : 컬럼에 포함된 중복값을 한번 씩만 출력하고자 할 때
-- select 절에 한번만 사용 가능 ( 중복 x)
SELECT	DEPT_ID
FROM		employee;

-- where
-- 연산자 (비교(like, not like), 산술, 논리(and, or, not))

-- 부서 번호가 90번이거나, 급여가 4,000,000 이상인 사원의 정보를 검색 한다면?
SELECT	*
FROM 		employee
WHERE 	DEPT_ID = '90' AND  SALARY >= 4000000 ;

-- CONCAT() : 연결 연산자
SELECT	CONCAT ('임정섭', '강사님은', '과연', '강사료가', '얼마일까요?');

SELECT	CONCAT(EMP_NAME, '님의 급여는', SALARY, '원 입니다.') AS `급여정보(원)`
FROM		employee;

-- 급여 정보가 3500000 이상이고 5500000 이하인 사원의 정보를 검색한다면?

SELECT	*
FROM 		employee
WHERE		SALARY >= 3500000 AND SALARY >= 5500000 ;
-- BETWEEN ~ AND
SELECT	*
FROM 		employee
WHERE		SALARY BETWEEN 3500000 AND  5500000 ;

-- LIKE, NOT LIKE : 패턴 검색( %_ )시 사용하는 연산자
-- % : 하나 이상의 문자와 매칭
-- _ : 하나의 문자를  매칭


-- 김씨 성을 갖는 사원만 검색하고 싶다면?
SELECT	*
FROM 		employee
WHERE	 	EMP_NAME NOT LIKE '김%';


-- IS NULL, IS NOT NULL : 널 값은 '='로 비교할 수 없다.
-- 부서 배치를 받지 않는 사원 정보를 검색한다면?
SELECT	*
FROM 		employee
WHERE		DEPT_ID IS NULL;

-- 부서 번호가 60번 이거나, 90번인 사원의 정보를 검색한다면?
-- IN()
SELECT	*
FROM 		employee
WHERE		DEPT_ID=60 OR DEPT_ID=90;

SELECT	*
FROM 		employee
WHERE		DEPT_ID IN(60, 90);

-- ------------------------------------ Day 2  함수--------------------------------------------------------------------------------------------------------------------
/*
		함수 : select , where
			- 프로그램에서 반복적으로 사용되는 부분을 분리해서 서브 프로그램으로 만든 것
			- 유형
					-단일행 함수: 문자열, 날짜, 숫자, 기타 변형 함수...
					- 복수행(그룹)함수:nim, max, sum, count, avg ...
*/
SELECT	*
FROM 		employee;

-- 단일행 함수 -> 문자열 함수 : 문자열을 인자로 받을 수 있는 함수

SELECT	EMP_NAME,
							CONCAT(EMP_NAME, '님'),
							LENGTH(EMP_NAME),					-- 바이트 수 계산
							CHAR_LENGTH(EMP_NAME)	-- 문자 수 계산
FROM 		employee;


--  LOWER(), UPPER() :  대 소문자 변환

SELECT LOWER('HELLO'), UPPER('lgcns');     

-- LPAD, RPAD : 자리수를 고정하여 빈 공간을 원하는 문자로 채우는 함수
-- 													정렬의 의미로도 해석 가능

SELECT 	EMAIL AS `원본 데이터`,
								LENGTH(EMAIL)	`원본 길이`,
								LPAD(EMAIL, 30, '*'),
								RPAD(EMAIL, 30, '*'),
								LENGTH(LPAD(EMAIL, 30))
FROM 			employee;

-- ELT() 		: 인덱스를 이용해서 특정 위치의 문자를 찾는 함수
-- INSTR() : 문자열을 이용해서 부분 문자열을의 인뎃스를 반환하는  함수

SELECT ELT(2, '1', '2', '3'), INSTR('이현진', '이');

SELECT	EMAIL
FROM 		employee;	

-- . 앞의 문자 'C'의 인덱스 번지를 검색하고 싶다면?
-- LEFT() , RIGHE()
SELECT	LEFT('ABCDE', 3), RIGHT('ABCDE', 3);

-- SUBSTRING() : 부분 문자열을 반환하는 함수
SELECT	SUBSTR ('ABCDE', 1, 1);

SELECT	EMAIL,
							SUBSTR( EMAIL, INSTR(EMAIL, '.') - 1, 1)
							
FROM			employee;


-- TRIM() , LTRIM() , RTRIM() : 제거 (패턴을 제거하는 것이 아님), 기본 공백

SELECT		LTRIM('			LGCNS'), RTRIM('LGCNS    '), TRIM('     LGCNS     ');

SELECT		TRIM(BOTH '213' FROM '123TECH123'),
								TRIM(LEADING '123' FROM '123TECH123'),
								TRIM(TRAILING '123' FROM '123TECH123');


-- 문자열 반복 : REPEAT( );
SELECT		REPEAT('LGCNS' , 3);

-- 문자열 치환 : REPLATE( );
SELECT		REPLACE('오늘은 코스모스졸업식', '즐기자', '놀자'); 


-- 중요
-- SUBSREING (문자열, 시작위치, 길이) OR ( 문자열 FROM 시작위치 FOR 길이)
-- SUBSTRING_INDEX( 문지열, 구분자, 횟수)

SELECT		SUBSTRING('THIS IS INSPIRE CAMP',9, 7 ),
								SUBSTRING('THIS IS INSPIRE CAMP'FROM 9 FOR 7 );
								
SELECT		SUBSTRING_INDEX('WWW.LGCNS.COM',  '.', 1),
								SUBSTRING_INDEX('WWW.LGCNS.COM',  '.', -1);

 
 /*
 employee
 1. 사원의 이메일 중 아이디만 추출
 2. 입사 년도만 추출
 3. 주민번호 앞 6자리만 추출
 4. 입사일 출력 포멧을 xxxx년 xx월 xx일 형식으로 추출
*/


SELECT 
    EMAIL,
    SUBSTRING_INDEX(EMAIL, '@', 1) AS EMAIL_ID,
    SUBSTRING(HIRE_DATE, 1, 4) AS 입사년도,
    SUBSTRING(EMP_NO, 1, 6) AS 사번앞자리,
    CONCAT(
        SUBSTRING(HIRE_DATE, 1, 4), '년 ',
        SUBSTRING(HIRE_DATE, 6, 2), '월 ',
        SUBSTRING(HIRE_DATE, 9, 2), '일'
    ) AS 입사일_형식
FROM employee;


-- --------------------------------------------

SELECT		*
FROM				buytbl	;


-- 평균 구매 개수를 확인하고 싶다면?

SELECT		AVG(AMOUNT)
FROM				buytbl;
    			
-- --------------------------------
SELECT		CAST(AVG(AMOUNT)AS INT) AS `평균 구매 개수`
FROM				buytbl;
-- ------------------------------------
SELECT		CAST(AVG(AMOUNT)AS SIGNED INTEGER) AS `평균 구매 개수`
FROM				buytbl;
-- -----------------------------------
SELECT		'100' + '100' , CAST('100' AS INT) + CAST('100' AS INT);
--
-- 구매 번호, 총 금액 (PRICE * AMOUNT =), 구매액 검색한다면?
SELECT		NUM AS `구매번호`,
								PRICE AS `가격`,
    				AMOUNT AS `수량`,
								CONCAT(
										CAST(PRICE AS VARCHAR(10)),
										'*',
										CAST(AMOUNT AS VARCHAR(10))
								)AS `총 금액`,
								PRICE * AMOUNT AS `구매 액`
								
FROM				buytbl;	

-- ----------------
SELECT			LEFT(EMP_NO, 6),
									RIGHT(EMP_NO, 7),
									LEFT(EMP_NO, 6) + RIGHT(EMP_NO, 7),
									CAST(LEFT(EMP_NO, 6) AS INT) + CAST(RIGHT(EMP_NO, 7) AS INT)
FROM					employee;




-- ---------------------------------오후 수업---------------------------------------------------------------------------------

-- 숫자함수
SELECT		ABS(-100)																		-- 절대값
								,CEILING(4.7)														-- 올림
								,FLOOR(4.7)																-- 내림
								,ROUND(4.5)																-- 반올림
								,TRUNCATE(123.4567, 2);
			



-- 날짜 함수
SELECT		NOW()												-- 	현재 날짜와 시간
								,SYSDATE()							-- 현재 날짜와 시간 (실행 순간 기준)
								,CURDATE()							-- 현재 날짜만
								,CURTIME();						-- 현재 시간만
								
								
-- 날짜도 연산이 가능할까?
-- ADDDATE(DATE, INTERVAL EXPR TYPE), DATE_ADD();
-- SUBDATE();
-- TYPT : YEAR, MONTH, DAY
SELECT		NOW() + 1;	


SELECT
    ADDDATE(CURDATE(), INTERVAL 1 DAY),      -- 오늘 + 1일
    SUBDATE(CURDATE(), INTERVAL 1 MONTH),  	 -- 오늘 - 1개월
    SYSDATE() ,                           	  -- 현재 날짜+시간
    ADDTIME(SYSDATE(), '1:1:1')              -- 현재 시각 + 시간
;


-- 오늘 날짜를 기준으로 근속 년수가 25년이상인 사원의 정보를 검색 한다면?
-- DATEDIFF : 일 수를 반환
SELECT ROUND(DATEDIFF(CURDATE(), '2000-01-01')/365);
FROM
WHERE

SELECT *
FROM employee
WHERE ROUND(DATEDIFF(CURDATE(), hire_date) / 365) >= 25;


SELECT EMP_NAME,
							HIRE_DATE,
							ROUND(DATEDIFF(CURDATE(), hire_date) / 365) AS 근속연수
FROM employee
WHERE ROUND(DATEDIFF(CURDATE(), hire_date) ) >= (25 * 365);


-- YEAR(), MONTH(), DAY(), HOUR(), MINUTE(), SECOND()
SELECT		CAST(YEAR(HIRE_DATE) AS CHAR),
								MONTH(HIRE_DATE),
								DAY(HIRE_DATE)
FROM				employee; 

-- 기타 변형 함수
-- 제어 흐름 함수( IF, IFNULL, NULLIF, CAST ~WHEN)
SELECT			IF(100 > 200, '참', '거짓');

SELECT				CASE 4
												WHEN 1			THEN '1'
												WHEN	10 	THEN '10'
												ELSE '내가 원하는 값이 아님'
										END AS `구분`;
										
-- 부서 번호가 50번인 사원의 이름, 주민번호, 성별  검색
SELECT		EMP_NAME,
								EMP_NO,
								CASE SUBSTRING(EMP_NO,8,1)
										WHEN	'1' OR '3' THEN 'MALE'
										WHEN '2' OR '4' THEN 'FEMALE'
									END
								AS GENGER
FROM				employee
WHERE			DEPT_ID = '50';



SELECT		EMP_NAME,
								EMP_NO,
								CASE 
										WHEN	SUBSTRING(EMP_NO,8,1) IN('1','3') THEN 'MALE'
										WHEN SUBSTRING(EMP_NO,8,1) IN('2','4') THEN 'FEMALE'
									END AS GENDER
FROM				employee
WHERE			DEPT_ID = '50';


--  사원 테이블에서 남자 사원의 이름, 주민번호, 성별을 검색한다면?
SELECT		EMP_NAME,
								EMP_NO,
								CASE 
										WHEN	SUBSTRING(EMP_NO,8,1) IN('1','3') THEN 'MALE'
										
									END AS GENDER
FROM				employee
WHERE			SUBSTRING(EMP_NO, 8, 1) IN ('1', '3'); 


SELECT		EMP_NAME,
								EMP_NO,
								'MALE' AS GENDER
FROM				employee
WHERE			SUBSTRING(EMP_NO, 8, 1) IN ('1', '3'); 
-- -------------------------------
SELECT		*
FROM				employee

SELECT		*
FROM				department

SELECT		*
FROM				job

-- -------------------------------------------------------------------------------
-- 사원테이블에서 직급이 J4인 사원의 사번, 이름, 사수번호 검색?
-- 추가) 사수번호가 없는 사원의 MRG_ID 컬럼에 '관리자' 넣어주고 싶다면?

SELECT		EMP_NAME,
								EMP_ID,
								-- MGR_ID 
								IF (MGR_ID = ' ', '관리자', MGR_ID) AS 사수번호
						
FROM				employee
WHERE			JOB_ID = 'J4'; 



SELECT		EMP_NAME,
								EMP_ID,
								CASE
										WHEN MGR_ID = ' ' THEN '관리자'
										ELSE MGR_ID
									END AS 사수번호
						
FROM				employee
WHERE			JOB_ID = 'J4'; 


-- 사원의 급여 등급을 나누려고 한다
-- 3000000 이하면 초급, 4000000 이하면 중급, 초과면 고급
-- 사원 번호, 이름 ,급여, 급여등급을 검색한다면?

SELECT
    EMP_ID 			AS 사원번호,
    EMP_NAME 	AS 이름,
    SALARY 			AS 급여,
    CASE
        WHEN SALARY <= 300000 THEN '초급'
        WHEN SALARY <= 400000 THEN '중급'
        ELSE '고급'
    END AS 급여등급
FROM employee
ORDER BY 3 ASC;



SELECT 
					EMP_ID AS 사원 번호, 
					EMP_NAME AS 이름, 
					SALARY AS 급여, 
					CASE 
								WHEN SALARY <= '300000' THEN '초급' 
								WHEN SALARY <= '400000' THEN '중급' 
								ELSE '고급' 
					END AS `급여등급`
	FROM employee;


-- 복수행(그룹, 집계)함수 : 여러 행의 결과를 입력으로 하나의 결과를 반환하는 함수
SELECT			COUNT(*),
									COUNT(BONUS_PCT),
									COUNT(IFNULL(BONUS_PCT, 0)),
									MIN(SALARY),
									MAX(SALARY),
									SUM(SALARY)
FROM				employee;


-- 2025-08-22
-- ---------DAY 03 group by (having), join, subquery------------------------------------------------------------------------------------------



-- GROUP BY :  하위 데이터 그룹
-- 특정 칼럼에 대해 동일한 값을 가지는 행동을 하나의 행으로 처리
-- 통계 작업

SELECT			*
FROM			buytbl;

-- 사용자 별 구매 충액을 확인하고 싶다면?
SELECT			USERID,
									SUM(PRICE * AMOUNT),
									AVG(AMOUNT)
FROM				 buytbl
GROUP BY	USERID
ORDER BY 2 DESC;


-- 사용자 별 구매 개수를  확인하고 싶다면?
SELECT			USERID,
									AVG(AMOUNT)
FROM				 buytbl
GROUP BY	USERID
ORDER BY 2 DESC;




SELECT			*
FROM			employee;
-- 부서별 평균 급여를 조회하고 싶다면?

SELECT			DEPT_ID AS `부서`,
									AVG(SALARY) AS ` 급여 평균` 
FROM			employee
GROUP BY DEPT_ID
ORDER BY 1;

-- 성별에 따른 평균 급여를 조회하고 싶다면?
SELECT			
								CASE 
										WHEN SUBSTRING(EMP_NO, 8, 1) IN ('1', '3') THEN '남자'
										WHEN SUBSTRING(EMP_NO, 8, 1) IN ('2', '4') THEN '여자'
								END AS '성별' 
								, ROUND(AVG(SALARY)) AS '급여평균'
FROM			employee
GROUP BY CASE 
										WHEN SUBSTRING(EMP_NO, 8, 1) IN ('1', '3') THEN '남자'
										WHEN SUBSTRING(EMP_NO, 8, 1) IN ('2', '4') THEN '여자'
									END  
ORDER BY 1;


-- 부서별 금액 총액이 9,000,000 이상인 부서만 필터링 하고 싶다면?

SELECT			DEPT_ID AS `부서`,
									SUM(SALARY) AS ` 급여 총합` 
FROM					employee
GROUP BY DEPT_ID
HAVING			SUM(SALARY) >= 9000000
ORDER BY 1;


-- BUYBTL 에서 사용자별 구매액이 100 이상인 사용자들만 필터링 한다면?

SELECT			userID AS `이름`,
									SUM(PRICE * AMOUNT) AS ` 총 구매액` 
FROM						buytbl
GROUP BY userID
HAVING			SUM(PRICE * AMOUNT) >= 100;


-- [GROUP BY 집계컬럼 WITH ROLLUP] -- 데이터를 그룹으로 묶을 때 (표현식 | 컬럼명 | 별칭x)
-- GROUPBY 확장기능: 계층적인 집계 결과  WITH ROLLUP
SELECT			*
FROM			buytbl;

-- 구매 한 목록 중 그룹 아름 별 구매 비용을 검색한다면?
SELECT			 GROUPNAME, NUM,
										SUM(PRICE * AMOUNT) AS '구매비용'
FROM						buytbl
GROUP BY 	GROUPNAME, NUM WITH ROLLUP;				-- WITH ROLLUP 누적 결과



 
 /*
- JOIN : n개 이상의 테이블을 서로 묶어서 나마의 결과로 집합을 만드렁 내는 것
- 관계형 데이터베이스의 가장 큰 특징
- 테이블 관계 (1 : N, 1 : 1)


 ANSI 표준 구분
 
 SELECT
 FROM										TABLE01 ALIAS
LEFT | RIGHT   JOIN TAABLE02 ON(조건식)
JOIN TABLE02 USING(컬럼형)
  */
  
 -- --------------------------오후 수업------------------------------------------------------------------------------- 
 SELECT				*mysql
 FROM						department D
 JOIN						employee 		E ON(D.DEPT_ID = E.DEPT_ID);
 
 SELECT				E.EMP_NAME,
 										D.DEPT_NAME,
 										L.LOC_DESCRIBE
 FROM						department D
 JOIN						employee 		E USING(DEPT_ID )
 JOIN						location			L ON(L.LOCATION_ID = D.LOC_ID)
 WHERE					DEPT_NAME	LIKE '해외%';

 
 
 -- 사용자가 JYP인 유저의 이름과 구매 상품을 조회한다면?
 -- USER BUYTBL
 SELECT				*
 FROM						usertbl	U
 JOIN						buytbl		B	USING(userID)
 WHERE					B.userID = 'JYP'
 
 
  -- 사용자가  아이디, 이름, 구매상품,연락처(MOBILE1 + MOBILE2)를 조회한다면?
 SELECT				U.userID,
 										U.name,
 										B.prodName,
 										CONCAT(U.mobile1, U.mobile2)
 FROM						usertbl	U
 JOIN						buytbl		B	USING(userID);

 
 --위 요구사항에 구매 이력이 있는 회원만 조회한다면?
 SELECT				*
 FROM						usertbl	U
 WHERE					EXISTS (SELECT	*
 																		FROM				buytbl B
 																		WHERE B.userID = U.userID);
 
 -- ------------------------------------------------------------------   
 -- 업무적 연관성이 없는 테이블도 조인이 가능하다 (on 구문으로)
 -- 이름, 급여, 급여 등급을 검색한다면?
 SELECT				EMP_NAME,
 										SALARY,
 										SLEVEL
 FROM						employee		E
 JOIN						sal_grade	S ON(E.SALARY BETWEEN S.LOWEST AND S.HIGHEST )
 ORDER BY 3;
 
 
 -- OUTER JOIN (LEFT| RIGHT)  : 누락된 정보를 포함 해 줌
 -- JOIN의 조건에 만족하지 못 하는 모든 행을 조회할 때 사용
 SELECT				*
 FROM												department D
 RIGHT JOIN						employee 		E ON(D.DEPT_ID = E.DEPT_ID);
 
 -- 부서 배치를 갖지 않은 사원의 이름, 부서 명을 조회한다면?
 
SELECT 
    									E.EMP_NAME AS 사원명,
    									D.DEPT_NAME AS 부서명
FROM 								department D
RIGHT JOIN 		employee E ON (D.DEPT_ID = E.DEPT_ID)
WHERE								 D.DEPT_ID IS NULL;

-- 사원의 이름과 사수의 이름을 검색한다면?


SELECT 
    							E.EMP_NAME AS 사원명,
   							 M.EMP_NAME AS 사수명,
    							S.EMP_NAME AS 사수의_사수
FROM 						employee E
LEFT JOIN 	employee M ON (E.MGR_ID = M.EMP_ID)
LEFT JOIN 	employee S ON (M.MGR_ID = S.EMP_ID);

-- ----------------------------------------------------------
-- 직급이 대리이고 지역이 아시아로 시작하는 사원의 정보만 조회


SELECT 
    E.EMP_ID 							AS 사번,
    J.JOB_TITLE 				AS 직급,
    D.DEPT_NAME 				AS 부서명,
    L.LOC_DESCRIBE 	AS 지역,
    C.COUNTRY_NAME 	AS 나라,
    S.SLEVEL 							AS 등급
FROM employee 			E
JOIN department 	D ON (E.DEPT_ID = D.DEPT_ID)
JOIN location			 L ON (D.LOC_ID = L.LOCATION_ID)
JOIN country 				C ON( L.COUNTRY_ID = C.COUNTRY_ID)
JOIN job 								J ON (E.JOB_ID = J.JOB_ID)
JOIN sal_grade 		S ON (E.SALARY BETWEEN S.LOWEST AND S.HIGHEST)
WHERE J.JOB_TITLE = '대리'
AND L.LOC_DESCRIBE LIKE '아시아%';



-- -----------------2025-08-25----------------------------------------------------------------------------------------------------------------------

-- DAY 4 SUBQUERY & DDL (데이터 정의어)
-- SUBQUERY : 하나의 쿼리가 다른 쿼리를 포함하는 구조
-- 유형: 단일행(단일열, 다중열), 다중행(단일열, 다중열)
-- WHERE절(SUBQUERY), SELECT절(SCALAR SUBQUERY), FROM절 (INLINE VIEW) 
SELECT			DEPARTMENT_NO
FROM					tb_department
WHERE				DEPARTMENT_NAME = '국어 국문학과';

SELECT		S.STUDENT_NAME
FROM				tb_student S
WHERE			SUBSTRING(S.STUDENT_SSN, 8, 1)= '2' 
AND 				S.ABSENCE_YN = 'Y'
AND					S.DEPARTMENT_NO = (		SELECT			DEPARTMENT_NO
																													FROM					tb_department
																													WHERE				DEPARTMENT_NAME = '국어국문학과');			
--
SELECT			*
FROM				 employee

-- 나승원 사원과 같은 부서원을 검색 한다면?
-- 주어진 전제조건은 이름만 전달
SELECT				DEPT_ID
FROM						employee E
WHERE					E.EMP_NAME = '나승원';

SELECT			*
FROM					employee E
WHERE					DEPT_ID = ( 			SELECT				DEPT_ID
																									FROM						employee E
																									WHERE					E.EMP_NAME = '나승원');
																						
-- -----------------------------------------------------					
-- 부서별 급여 총합
-- 부서별 급여 총합이 가장 높은 부서만 확인하고 싶다면?																	
SELECT				DEPT_NAME,
										SUM(SALARY)
FROM						employee 		E
JOIN						department D ON(E.DEPT_ID = D.DEPT_ID)
GROUP BY		D.DEPT_NAME;

-- 부서별 급여 총합이 가장 높은 부서만 확인하고 싶다면?	
SELECT 		D.DEPT_ID,
									SUM(SALARY) AS `TOTAL`
FROM 				employee E
JOIN 				department D ON(E.DEPT_ID = D.DEPT_ID)
GROUP BY D.DEPT_ID
HAVING 		SUM(SALARY) = ( SELECT MAX(TOTAL)
																												FROM( SELECT DEPT_ID,
																																									SUM(SALARY) AS `TOTAL`
																															FROM employee E
                               GROUP BY DEPT_ID
                              ) T
                        );


-- 최소 급여  확인
SELECT				DEPT_ID,
										MIN(SALARY)
FROM						employee
GROUP BY DEPT_ID;

-- 다중열 SubQuery가 필요한 이유
-- 부서별 최소급여를 받는 사원의 정보를 검색

SELECT				*
FROM						employee 		
WHERE					(DEPT_ID, SALARY) IN ( SELECT			 DEPT_ID,                   
																															 												MIN(SALARY)              
																																	FROM							employee
																																	GROUP BY 		DEPT_ID );
																																	
-- 과장 직급의 급여 확인'
SELECT				SALARY
FROM						employee E
JOIN						job						J ON(E.JOB_ID = J.JOB_ID)
WHERE 				JOB_TITLE = '과장'; 		


/*
다중행 서브쿼리일 경우 사용할 수 있는 연산자 (IN, ANY, ALL)
> ANY, < ANY      : 박스 안쪽
> ALL, < ALL						: 박스 바깥쪽
단일행 서브쿼리는 일반 연산자 사용이 가능하다

*/
-- 과장 직급보다 많은 급여를 받는 대리직급 사원의 정보를 검색한다면?
SELECT				EMP_NAME, SALARY
FROM						employee E
JOIN						job						J ON(E.JOB_ID = J.JOB_ID)
WHERE 				JOB_TITLE = '대리'
AND							SALARY > ALL ( SELECT				SALARY
																										FROM						employee E
																										JOIN						job						J ON(E.JOB_ID = J.JOB_ID)
																										WHERE 				JOB_TITLE = '과장'
																									);


-- --------------------------------------------------------5-6 교시 ------------------------------------------------------------------

-- DDL (DATA DEFINITION LANGUAGE) : CREAT, DROP, ALTER
-- TABLE(CONSTRAINT) : NOT NULL, UNIQUE, PRIMARY KEY, FORIGN KEY, CHECK
-- VIEW : 읽기전용 (권한, 복잡한 질의어를 단순)
/*

CREAT TABLE TABLE_NAME(
		COLUMN_NAME DATATYPE [DEFAULT EXPR] [COLUMN CONSTRAINT],
		[TABLE CONSTRAINT]
		);
	CREATE VIEW

*/

-- DML (DATA MANIPULATION LANGUAGE) : INSERT, UPDATE, DELETE


DROP TABLE IF EXISTS TABLE_NAME;
CREATE TABLE DUMMY_TBL(
			USER_ID					VARCHAR(50) 	PRIMARY KEY,
			USER_NAME			VARCHAR(50) 	NOT NULL,
			BIRTH_YEAR		DATE 								DEFAULT SYSDATE(),
			ADDRESS					VARCHAR(50),
			MOBILE01 			CHAR(3),
			MOBILE02				CHAR(9),
			HEIGHT						INT,
			PRIMARY KEY(컬럼명) -- TABLE LEVEL CONSTRAINT
);

DROP TABLE IF EXISTS JOB_TBL;
CREATE TABLE JOB_TBL(
			JOB_ID						CHAR(3),
			JOB_TITLE			VARCHAR(100),
			PRIMARY KEY (JOB_ID)
);

SELECT				*
FROM						job_tbl;

INSERT INTO JOB_TBL(JOB_ID, JOB_TITLE) VALUES
('J1', '대표이사'),
('J2', '부장'),
('J3', '차장');

INSERT INTO JOB_TBL(JOB_ID, JOB_TITLE) VALUES('J4', '대리');
INSERT INTO JOB_TBL(JOB_ID, JOB_TITLE) VALUES('J5', '사원');


SELECT				*
FROM						job_tbl
WHERE					JOB_ID = 'J1 ';



-- ------------------------------


SELECT				*
FROM						DEPT_TBL;

INSERT INTO dept_tbl(DEPT_ID, DEPT_NAME)VALUES
('10', '교육팀'),
('20', '영업팀'),
('30', '힐링팀'),
('40', '레크팀');

-- ERROR
INSERT INTO dept_tbl(DEPT_ID, DEPT_NAME)VALUES('50', NULL);

-- 왜래키 옵션 : 참조 무결성 관련 옵션
-- ON DELETE CASCADE OM DELETE SET NULL , ON UPDATE CASTADE

-- TABLE 생성
DROP TABLE IF EXISTS emp_tbl;

CREATE TABLE EMP_TBL(
			EMP_ID						VARCHAR(20)						PRIMARY KEY, 
			EMP_NAME				VARCHAR(100)					NOT NULL,
			SALARY						INT														CHECK(SALARY > 0),
			GENDER  				CHAR(1)										CHECK( GENDER IN ('F', 'M')),
			JOB_ID						CHAR(3)										NOT NULL ,
			DEPT_ID					CHAR(2)										NOT NULL ,
			HEIGH_DATE		DATE													DEFAULT SYSDATE(),
			FOREIGN KEY (JOB_ID)									REFERENCES job_tbl(JOB_ID),
			FOREIGN KEY (DEPT_ID)							 REFERENCES dept_tbl(DEPT_ID)
);

CREATE TABLE EMP_TBL(
			EMP_ID						VARCHAR(20)						PRIMARY KEY, 
			EMP_NAME				VARCHAR(100)					NOT NULL,
			SALARY						INT														CHECK(SALARY > 0),
			GENDER  				CHAR(1)										CHECK( GENDER IN ('F', 'M')),
			JOB_ID						CHAR(2)										NOT NULL ,
			DEPT_ID					CHAR(3)										NOT NULL 
);

SELECT			*
FROM					emp_tbl;


/*
_ci : 대소문자 구별 X
_cs : 대소문자를 구별 o
*/



-- ERROR NOT NULL
INSERT INTO emp_tbl
VALUES('100', '이현진', 0, 'F', NULL , NULL );


-- ERROR CHECK
INSERT INTO emp_tbl
VALUES('100', '이현진', 0, 'F', 'J1' , '10' );

-- ERROR CHECK
INSERT INTO emp_tbl
VALUES('100', '이현진', 100, '?', 'J1' , '10' );

-- ERROR
INSERT INTO emp_tbl
VALUES('200', '이현진', 100, 'M', 'J5' , '50' );

-- SUCCESS
INSERT INTO emp_tbl
VALUES('300', '이현진', 100, 'M', 'J5' , '40' ,NULL);

-- -----------------2025-08-26----------------------------------------------------------------------------------------------------------------------
-- TABLE(CONSTRAINT) : NOT NULL, UNIQUE, PRIMARY KEY, FORIGN KEY, CHECK


INSERT INTO emp_tbl(EMP_ID, EMP_NAME, SALARY, GENDER, JOB_ID, DEPT_ID)
VALUES('500', '이현진', 100, 'M', 'J5' , '40' ,);


inspireSHOW INDEX FROM emp_tbl;

-- 테이블 생성 후 제약조건을 추가한다면 (ALTER)
ALTER TABLE emp_tbl
		ADD CONSTRAINT
		FOREIGN KEY (JOB_ID) REFERENCES job_tbl (JOB_ID);

ALTER TABLE emp_tbl
		ADD CONSTRAINT
		FOREIGN KEY (DEPT_ID) REFERENCES dept_tbl (DEPT_ID);


-- 컬럼 추가
ALTER TABLE emp_tbl
		ADD COLUMN HIRE_DATE DATE 			DEFAULT SYSDATE();

-- -----------------주문의 정보를 관리하는 ORDER TABLE----------------------------------------------------
CREATE TABLE CUS_TBL(
		CUS_ID								VARCHAR(20) 			PRIMARY KEY,
		CUS_NAME						VARCHAR(20)			 CHECK (CUS_NAME IS NOT NULL),
		CUS_GENDER				CHAR(1)								CHECK (CUS_GENDER IN ('F', 'M'))
);
/*
- INSERT 구문(서브쿼리 사용)
INSERT INTO TABLE_NAME([COLUMN_LIST]) VALUES([DATA])
주의점 : 컬럼 리스트 개수와 데이터 개수 및 타입은 일치
*/
INSERT INTO CUS_TBL VALUES('1', '이현진', 'M');
SELECT							*
FROM								CUS_TBL;

CREATE TABLE PROD_TBL(
		PROD_ID							INT												AUTO_INCREMENT		PRIMARY KEY,
		PROD_NAME					VARCHAR(20)				DEFAULT '라벨없음'
);

INSERT INTO PROD_TBL(PROD_NAME) VALUES('아이패드');
INSERT INTO PROD_TBL(PROD_NAME) VALUES(DEFAULT);

SELECT							*
FROM								PROD_TBL;


CREATE TABLE ORD_TBL(
		ORD_ID								INT												AUTO_INCREMENT,											
		CUS_ID								VARCHAR(20)				NOT NULL, 
		PROD_ID							INT												NOT NULL,
		PRIMARY KEY(ORD_ID, CUS_ID,PROD_ID),
		FOREIGN KEY (CUS_ID)									REFERENCES CUS_tbl(CUS_ID),
		FOREIGN KEY (PROD_ID)							 REFERENCES PROD_tbl(PROD_ID)
);

SELECT							*
FROM								ORD_TBL;


INSERT INTO ORD_TBL(CUS_ID, PROD_ID) VALUES('1', 1);
INSERT INTO ORD_TBL(CUS_ID, PROD_ID) VALUES(NULL, NULL);
SELECT							*
FROM								ORD_TBL;

SELECT						CUS_NAME,
												PROD_NAME
FROM								CUS_TBL 	C
JOIN								ORD_TBL		O	ON(C.CUS_ID = O.CUS_ID)
JOIN								PROD_TBL P ON(P.PROD_ID	= O.PROD_ID	);


-- ----------------------------------------------------------------------------
-- VIEW : 읽기전용 (권한, 복잡한 질의어를 단순)

SELECT		*
FROM				employee ;

CREATE VIEW EMP_VIEW
AS
SELECT		EMP_ID,
								EMP_NAME,
								EMAIL,
								JOB_ID,
								DEPT_ID
FROM				employee ;

SELECT		*
FROM				EMP_VIEW ;


-- UPDATE
-- 테이블에 포함 된 기존 데이터를 수정( 건수는 달라지지 않음)
/*
구문형식

UPDATE			TABLE_NAME
SET						COLUMN_NAME = VALUE, [COLUMN_NAME = VALUE]
WHERE				CONDITION;
*/

SELECT		*
FROM				employee ;

-- 심하균의 직급, 부서, 급여를 성해교의 직급, 부서, 급여로 수정한다면?
UPDATE employee
SET				JOB_ID	=	(	SELECT		JOB_ID
																		FROM				employee
																		WHERE			EMP_NAME = '성해교'),
							SALARY	=	(	SELECT		SALARY
																		FROM				employee
																		WHERE			EMP_NAME = '성해교'),
							DEPT_ID	=	(	SELECT		DEPT_ID
																		FROM				employee
																		WHERE			EMP_NAME = '성해교')
WHERE			EMP_NAME = '심하균';

UPDATE			employee
SET						MARRIAGE = DEFAULT
WHERE				EMP_NAME = '나승원';


SELECT	JOB_ID, SALARY, DEPT_ID
FROM		employee
WHERE			EMP_NAME = '한선기';

-- DELETE : 테이블에 포함 된 기본 데이터를 삭제
-- 행 단위로 삭제되므로 행 수가 달라짐
-- 참조무 결성 주의!!
/*
구문 형식)

DELETE 	[FROM] TABLE_NAME
WHERE			CONDITION;
*/

DELETE FROM department
WHERE 						DEPT_ID = 20;

-- -------------------------------------------------------------------------------------------------------







COMMIT ; 


INSERT INTO user_entity(CUS_ID, PROD_ID) VALUES('1', 1);




INSERT INTO dasiol_store_entity(avg_rating, store_id, store_name, address, location ) VALUES(Null, "1", "리쿤피자", "서울시 송파구구 가락로", "잠실");




user_entity

ALTER TABLE dasiol_store_entity ADD COLUMN created_at DATETIME;

INSERT INTO dasiol_store_entity(avg_rating, store_id, cratea_at, store_name, address, location ) VALUES(Null,  "라쿤피자", "2025-09-19 08:17:08.510249", "서울시 송파구 가락로", "잠실");























































