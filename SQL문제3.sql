-- Employees 테이블
--[ employee_id = 사번 ] [ first_name = 이름 ] 
--[ last_name = 성 ] [ email = 이메일 ] 
--[ phone_number = 전화번호 ] [ hire_date = 입사일 ]
--[ job_id = 업무코드 ] [ salary = 급여]
--[ commission_pct = 커미션비율 ] [ manager_id = 상사아이디]
--[ department_id = 부서코드]

--  Jobs 테이블
-- job_id 업무코드
-- job_title 업무타이틀
-- min_salary  최저급여
-- max_salary 최고급여 

desc jobs;
create view job as
select 
    JOB_ID JID,
    JOB_TITLE TITLE,
    MIN_SALARY MINSAL,
    MAX_SALARY MAXSAL
    FROM JOBS;
    
desc departments;
create view dp as
    select 
    DEPARTMENT_ID DID,
    DEPARTMENT_NAME DNAME,
    MANAGER_ID MID,
    LOCATION_ID LID
FROM departments;

desc locations;
create view loc as
    select
    LOCATION_ID LID,
    STREET_ADDRESS ADDR,
    POSTAL_CODE ZIP,
    CITY,
    STATE_PROVINCE PROV,
    COUNTRY_ID CID
FROM locations;

desc JOB_HISTORY;
create view his as
    select
    EMPLOYEE_ID EID,
    START_DATE SDATE,
    END_DATE EDATE,
    JOB_ID JID,
    DEPARTMENT_ID DID
FROM JOB_HISTORY;
drop view his;

DESC EMPLOYEES;
CREATE VIEW EMP AS
    SELECT
    EMPLOYEE_ID EID,
    FIRST_NAME FNAME,
    LAST_NAME LNAME,
    EMAIL,
    PHONE_NUMBER PNUM,
    HIRE_DATE HDATE,
    JOB_ID JID,
    SALARY SAL,
    COMMISSION_PCT COMM,
    MANAGER_ID MID,
    DEPARTMENT_ID DID
FROM EMPLOYEES;
    
--*******************
-- [문제021]
-- JOB_TITLE 가 "Programmer" 또는 "Sales Manager"인 
-- 직원의 이름, 입사일, 업무명 표시.
-- 직원의 이름을 오름차순으로 정렬하시오
-- *******************
select e.first_name 이름, e.hire_date 입사일 , e.job_id 업무코드, j.job_title as "업무명"
from employees e
    inner join jobs j
    on e.JOB_ID LIKE j.JOB_ID
where j.job_title in('Programmer', 'Sales Manager')
ORDER BY e.first_name;

-- *******************
-- [문제022]
-- 부서명 및 관리자이름 표시
-- (단, 컬럼명은 관리자 [공백] 이름 이 되도록 ...)
-- DEPARTMENTS 에서 MANAGER_ID 가 관리자 코드
-- *******************  
select d.department_name 부서명, e.first_name "관리자 이름"
from departments d
    join employees e
    on d.MANAGER_ID like e.EMPLOYEE_ID;

-- *******************
-- [문제023]
-- 마케팅(Marketing) 부서에서 근무하는 사원의 
-- 사번, 직책, 이름, 근속기간
-- (단, 근속기간은 JOB_HISTORY 에서 END_DATE-START_DATE로 구할 것)
-- EMPLOYEE_ID 사번, JOB_TITLE 직책임
-- *******************  

select E.EID 사번,  J.TITLE 직책, E.FNAME 이름, 
       H.EDATE - H.SDATE 근속일수
FROM HIS H
    JOIN JOB J
        ON H.JID LIKE J.JID
    JOIN EMP E
        ON E.EID LIKE H.EID
WHERE E.DID LIKE(SELECT DID
                FROM DP
                WHERE DNAME LIKE 'Marketing');
        


-- *******************
-- [문제024]
--  직책이 "Programmer"인 사원의 정보를 출력
-- DEPARTMENT_NAME 부서명, 이름(FIRST_NAME + [공백] + LAST_NAME)까지 출력
-- 이름은 중복되어서 출력됨. 즉 한명이 여러부서에서 업무를 수행함
-- *******************
SELECT DNAME 부서명, FNAME ||' '|| LNAME 이름
FROM EMP E
    JOIN DP D
    ON D.DID LIKE E.DID
    JOIN JOB J
    ON J.JID LIKE E.JID
WHERE J.JID LIKE (SELECT JID
                  FROM JOB
                  WHERE TITLE LIKE 'Programmer');

-- *******************
-- [문제025]
-- 부서명, 관리자 이름, 부서위치 도시 표시
-- 부서명 오름차순
-- *******************
SELECT 
    D.DNAME 부서명, 
    E.FNAME ||' '|| E.LNAME "관리자 이름", 
    L.CITY "부서위치 도시"
FROM DP D
    JOIN EMP E 
        ON D.MID LIKE E.EID
    JOIN LOC L
        ON D.LID LIKE L.LID
ORDER BY DNAME;

-- *******************
-- [문제026]
-- 부서별 평균 급여를 출력하시오.
-- *******************
SELECT 
    D.DNAME 부서명,
    ROUND(AVG(E.SAL),2) "부서별 평균 급여"
FROM EMP E
    JOIN DP D 
        ON E.DID LIKE D.DID
GROUP BY E.EID, D.DNAME
;
-- *******************
-- [문제027]
-- 부서별 평균 급여가 10000 이 넘는
--  부서명, "부서별 평균 급여" 를 출력하시오
-- *******************  
SELECT 
    D.DNAME 부서명,
    ROUND(AVG(E.SAL),2) "부서별 평균 급여"
FROM EMP E
    JOIN DP D 
        ON E.DID LIKE D.DID
GROUP BY E.DID, D.DNAME
HAVING ROUND(AVG(E.SAL),2) >= 10000
;

-- *******************
-- [문제028]
-- 올해 연봉에서 10% 인상된 금액이 내년 연봉으로
-- 책정되었습니다. 내년 전사원의 내년급여를
-- 출력하세요.
-- 단, 연봉 = 급여 * 12 입니다
-- *********************
select E.EID 사번, E.FNAME ||' '|| E.LNAME 이름, SAL 올해급여;

