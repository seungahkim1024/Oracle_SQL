-- Employees ���̺�
--[ employee_id = ��� ] [ first_name = �̸� ] 
--[ last_name = �� ] [ email = �̸��� ] 
--[ phone_number = ��ȭ��ȣ ] [ hire_date = ����� ]
--[ job_id = �����ڵ� ] [ salary = �޿�]
--[ commission_pct = Ŀ�̼Ǻ��� ] [ manager_id = �����̵�]
--[ department_id = �μ��ڵ�]

-- *******
-- ����001. 
-- HR ��Ű�� ���̺��� ��� ���?
-- *******
select * from tab;

-- *******
-- ����002. 
-- HR ��Ű�� ���̺� ���� �?
-- *******
select count(*) from tab;

-- *******
-- ����003. 
-- ���, ��, �̸����?
-- *******
SELECT employee_id, first_name, last_name
FROM EMPLOYEES;

-- *******
-- ����004. 
-- �̸��� s�� ������ ������ �̸� ���?
-- *******
select first_name
from EMPLOYEES
where first_name 
like '%s';

-- *******
-- ����005. 
-- �̸��� s�� �����ϴ� ������ �̸� ���?
-- *******
select first_name
from EMPLOYEES
where first_name 
like 'S%';

-- *******
-- ����006. 
-- �޿��� ���� ������ �̸�,�μ��ڵ�,�޿� ��ȸ 
-- *******
select first_name, department_id, salary
from EMPLOYEES
order by salary desc;

-- *******
-- ����007.
-- �޿��� 12000 �̻��� ���,�̸�,�μ��ڵ�, �޿� ��ȸ 
-- *******
select employee_id, first_name, department_id, salary
from EMPLOYEES
where salary>=12000;

-- *******
-- ����008.
-- �޿��� 1500�̻� 2500���ϸ� �޴� ������ ���,�̸�,�μ��ڵ�, �޿� ��ȸ 
-- ( AND ��� )
-- *******
select employee_id, first_name, department_id, salary
from EMPLOYEES
where salary>=1500 and salary<=2500;

-- *******
-- ����009.
-- �޿��� 1500�̻� 2500���ϸ� �޴� 
-- ������ ���,�̸�,�μ��ڵ�, �޿� ��ȸ (BETWEEN ���) 
-- *******
select employee_id, first_name, department_id, salary
from EMPLOYEES
where salary between 1500 and 2500;

-- *******
-- ����010.
-- 2005�⵵�� �Ի��� ������ �̸��� �μ��ڵ�, 
-- �Ի����ڸ� ��ȸ
-- *******
select first_name, employee_id, hire_date
from EMPLOYEES
where hire_date >= '2005/01/01' and hire_date <= '2005/12/31'; 