-- Employees ���̺�
--[ employee_id = ��� ] [ first_name = �̸� ] 
--[ last_name = �� ] [ email = �̸��� ] 
--[ phone_number = ��ȭ��ȣ ] [ hire_date = �Ի��� ]
--[ job_id = �����ڵ� ] [ salary = �޿�]
--[ commission_pct = Ŀ�̼Ǻ��� ] [ manager_id = �����̵�]
--[ department_id = �μ��ڵ�]

--  Jobs ���̺�
-- job_id �����ڵ�
-- job_title ����Ÿ��Ʋ
-- min_salary  �����޿�
-- max_salary �ְ�޿� 

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
-- [����021]
-- JOB_TITLE �� "Programmer" �Ǵ� "Sales Manager"�� 
-- ������ �̸�, �Ի���, ������ ǥ��.
-- ������ �̸��� ������������ �����Ͻÿ�
-- *******************
select e.first_name �̸�, e.hire_date �Ի��� , e.job_id �����ڵ�, j.job_title as "������"
from employees e
    inner join jobs j
    on e.JOB_ID LIKE j.JOB_ID
where j.job_title in('Programmer', 'Sales Manager')
ORDER BY e.first_name;

-- *******************
-- [����022]
-- �μ��� �� �������̸� ǥ��
-- (��, �÷����� ������ [����] �̸� �� �ǵ��� ...)
-- DEPARTMENTS ���� MANAGER_ID �� ������ �ڵ�
-- *******************  
select d.department_name �μ���, e.first_name "������ �̸�"
from departments d
    join employees e
    on d.MANAGER_ID like e.EMPLOYEE_ID;

-- *******************
-- [����023]
-- ������(Marketing) �μ����� �ٹ��ϴ� ����� 
-- ���, ��å, �̸�, �ټӱⰣ
-- (��, �ټӱⰣ�� JOB_HISTORY ���� END_DATE-START_DATE�� ���� ��)
-- EMPLOYEE_ID ���, JOB_TITLE ��å��
-- *******************  

select E.EID ���,  J.TITLE ��å, E.FNAME �̸�, 
       H.EDATE - H.SDATE �ټ��ϼ�
FROM HIS H
    JOIN JOB J
        ON H.JID LIKE J.JID
    JOIN EMP E
        ON E.EID LIKE H.EID
WHERE E.DID LIKE(SELECT DID
                FROM DP
                WHERE DNAME LIKE 'Marketing');
        


-- *******************
-- [����024]
--  ��å�� "Programmer"�� ����� ������ ���
-- DEPARTMENT_NAME �μ���, �̸�(FIRST_NAME + [����] + LAST_NAME)���� ���
-- �̸��� �ߺ��Ǿ ��µ�. �� �Ѹ��� �����μ����� ������ ������
-- *******************
SELECT DNAME �μ���, FNAME ||' '|| LNAME �̸�
FROM EMP E
    JOIN DP D
    ON D.DID LIKE E.DID
    JOIN JOB J
    ON J.JID LIKE E.JID
WHERE J.JID LIKE (SELECT JID
                  FROM JOB
                  WHERE TITLE LIKE 'Programmer');

-- *******************
-- [����025]
-- �μ���, ������ �̸�, �μ���ġ ���� ǥ��
-- �μ��� ��������
-- *******************
SELECT 
    D.DNAME �μ���, 
    E.FNAME ||' '|| E.LNAME "������ �̸�", 
    L.CITY "�μ���ġ ����"
FROM DP D
    JOIN EMP E 
        ON D.MID LIKE E.EID
    JOIN LOC L
        ON D.LID LIKE L.LID
ORDER BY DNAME;

-- *******************
-- [����026]
-- �μ��� ��� �޿��� ����Ͻÿ�.
-- *******************
SELECT 
    D.DNAME �μ���,
    ROUND(AVG(E.SAL),2) "�μ��� ��� �޿�"
FROM EMP E
    JOIN DP D 
        ON E.DID LIKE D.DID
GROUP BY E.EID, D.DNAME
;
-- *******************
-- [����027]
-- �μ��� ��� �޿��� 10000 �� �Ѵ�
--  �μ���, "�μ��� ��� �޿�" �� ����Ͻÿ�
-- *******************  
SELECT 
    D.DNAME �μ���,
    ROUND(AVG(E.SAL),2) "�μ��� ��� �޿�"
FROM EMP E
    JOIN DP D 
        ON E.DID LIKE D.DID
GROUP BY E.DID, D.DNAME
HAVING ROUND(AVG(E.SAL),2) >= 10000
;

-- *******************
-- [����028]
-- ���� �������� 10% �λ�� �ݾ��� ���� ��������
-- å���Ǿ����ϴ�. ���� ������� ����޿���
-- ����ϼ���.
-- ��, ���� = �޿� * 12 �Դϴ�
-- *********************
select E.EID ���, E.FNAME ||' '|| E.LNAME �̸�, SAL ���ر޿�;

