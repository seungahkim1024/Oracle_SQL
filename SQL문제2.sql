-- Employees 테이블
--[ employee_id = 사번 ] [ first_name = 이름 ] 
--[ last_name = 성 ] [ email = 이메일 ] 
--[ phone_number = 전화번호 ] [ hire_date = 입사일 ]
--[ job_id = 업무코드 ] [ salary = 급여]
--[ commission_pct = 커미션비율 ] [ manager_id = 상사아이디]
--[ department_id = 부서코드]



-- *******
-- 문제011. 
-- 커미션을 받지 못하는 직원의 이름,업무코드,급여,커미션비율을 조회
-- *******
select first_name, job_id, salary, commission_pct
from Employees
where commission_pct is null;

-- *******
-- 문제012. 
-- 사번이 110,120,130인 사원의 사번, 성, 이름 조회
-- *******
select employee_id, last_name, first_name
from Employees
where employee_id in('110', '120', '130');

-- *******
-- 문제013. 
-- 부서코드는 오름차순, 급여는 내림차순으로 
-- 부서코드, 급여, 사번, 이름, 성 정렬
-- 오름차순 0,1,2 ... 내림차순 9,8,7...
-- ******
select department_id, salary, employee_id, first_name, last_name
from Employees
order by department_id asc, salary desc;

-- *******
-- 문제014. 
-- 이름에 am 이란 글자가 포함된 직원의 사번,이름, 성
-- *******
select employee_id, first_name, last_name
from Employees
where first_name
like '%am%';

-- *******
-- 문제015. 
-- 이메일에 'GG' 와 'KK'두단어 중 하나만 포함되어도 조회
-- 단, 대소문자 구분함
-- *******
select email
from Employees
where (email like '%GG%' or email like '%KK%');

-- *******
-- 문제016. 
-- 이메일주소가 A 로 시작하지 않는 이메일 갯수
-- *******
select count(email) 
from Employees 
where email not like 'A%';

-- *******
-- 문제017.
-- 성의 두번째,세번째 글자가 동시에 e 인 직원의 이름, 성
-- *******
select first_name, last_name
from Employees
where last_name like '_ee%';


-- *******
-- 문제018
 -- 최저임금이 10000불 이상인 업무 의 상세 내역을 표시한다
-- *******


select job_id, job_title, min_salary, max_salary
from jobs
where min_salary >= 10000;

-- *******************
-- [문제19]
-- 2002년부터 2005년까지 
-- 가입한 직원의 이름과 가입 일자를 표시한다.
-- *******************
select first_name, hire_date
from Employees
where hire_date between '2002/01/01' and '2005/12/31'
order by hire_date;

-- *******************
-- [문제020]
-- IT Programmer 또는 Sales Man인 
-- 직원의 이름, 입사일, 업무코드 표시.
-- *******************
select first_name 이름, hire_date 입사일 , job_id 업무코드
from employees
where JOB_ID IN('IT_PROG','SA_MAN');
