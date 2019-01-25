SELECT * FROM EMP;
--EMPNO �����ȣ
--ENAME �����
--JOB ����
--MGR �Ŵ���
--HIREDATE �Ի���
--SAL ����
--COMM Ŀ�̼�
--DEPTNO �μ��ڵ�

SELECT * FROM DEPT;
--DEPTNO �μ��ڵ�
--DNAME �μ���
--LOC ȸ����ġ

-- EMP_TEST_01
-- CASE ǥ��
SELECT ENAME,
    CASE WHEN SAL > 2000
        THEN SAL
        ELSE 2000
    END REVISED_SALARY
FROM EMP;

-- ����
-- CASE WHEN ���ǽ�
--    THEN ���� ���
--    ELSE ������ ���
-- END �÷������� ó��

-- EMP_TEST_02
-- �μ��������� �μ���ġ�� �̱��� ����, �ߺ�, ���η� �����϶�
-- ���� - EAST, ������ - EAST, ��ī�� - CENTER, �޶� - CENTER
-- �÷��� - AREA
SELECT DEPTNO, DNAME �μ���, LOC ȸ����ġ,
    CASE WHEN LOC IN ('NEW YORK','BOSTON')
         THEN 'EAST'
         ELSE 'CENTER'
    END AREA
FROM DEPT;

-- EMP_TEST_03
-- �޿��� 3000 �̻��̸� HIGH, 1000 �̻��̸� MID, �̸��̸� LOW 
SELECT ENAME, SAL �޿�,
    CASE WHEN SAL >= 3000
         THEN 'HIGHT'
         WHEN SAL >= 1000
         THEN 'MID'
         ELSE 'LOW'
    END �޿�����
FROM EMP;

-- EMP_TEST_04
-- �޿��� 2000 �̻��̸� ���ʽ� 1000, 
-- 1000 �̻��̸� 500,
-- 1000 �̸��̸� 0���� ����Ͻÿ�
-- �÷����� BONUS
SELECT ENAME, SAL �޿�,
    CASE WHEN SAL >= 2000
         THEN 1000
         WHEN SAL >= 1000
         THEN 500
         ELSE 0
    END BONUS
FROM EMP;

-- EMP_TEST_05
-- �Ŵ����� "BLAKE" �̸� NULL ǥ��, ���� ������ MGR ǥ��
SELECT ENAME �̸�, EMPNO �����ȣ, MGR,
    CASE WHEN MGR LIKE (SELECT EMPNO
                        FROM EMP
                        WHERE ENAME LIKE 'BLAKE')
         THEN NULL
         ELSE MGR
    END NUIF
FROM EMP;

-- EMP_TEST_06
-- ���� �Ի��������� ���� �����͸� �����ϱ�
-- EXTRACT() <- ����Ŭ ���� �Լ�.
SELECT ENAME, DEPTNO, 
    EXTRACT(MONTH FROM HIREDATE) �Ի��, SAL
FROM EMP;

-- EMP_TEST_07
-- ����� MONTH �����͸� 12���� ���� Į������ �����ϱ�
SELECT ENAME, DEPTNO, 
    CASE MONTH WHEN 1 THEN SAL END "1��",
    CASE MONTH WHEN 2 THEN SAL END "2��",
    CASE MONTH WHEN 3 THEN SAL END "3��",
    CASE MONTH WHEN 4 THEN SAL END "4��",
    CASE MONTH WHEN 5 THEN SAL END "5��",
    CASE MONTH WHEN 6 THEN SAL END "6��",
    CASE MONTH WHEN 7 THEN SAL END "7��",
    CASE MONTH WHEN 8 THEN SAL END "8��",
    CASE MONTH WHEN 9 THEN SAL END "9��",
    CASE MONTH WHEN 10 THEN SAL END "10��",
    CASE MONTH WHEN 11 THEN SAL END "11��",
    CASE MONTH WHEN 12 THEN SAL END "12��"
FROM (SELECT ENAME, DEPTNO, 
    EXTRACT(MONTH FROM HIREDATE) MONTH, SAL
    FROM EMP);
    
-- EMP_TEST_08
-- ����� MONTH �����͸� 12���� ���� Į������ ������ ��
-- SELECT �μ����� �����ϱ�
SELECT 
    (SELECT DNAME 
    FROM DEPT D 
    WHERE D.DEPTNO LIKE T.DEPTNO) DNAME,
    DEPTNO,
    AVG(CASE MONTH WHEN 1 THEN SAL END) "1��",
    AVG(CASE MONTH WHEN 2 THEN SAL END) "2��",
    AVG(CASE MONTH WHEN 3 THEN SAL END) "3��",
    AVG(CASE MONTH WHEN 4 THEN SAL END) "4��",
    AVG(CASE MONTH WHEN 5 THEN SAL END) "5��",
    AVG(CASE MONTH WHEN 6 THEN SAL END) "6��",
    AVG(CASE MONTH WHEN 7 THEN SAL END) "7��",
    AVG(CASE MONTH WHEN 8 THEN SAL END) "8��",
    AVG(CASE MONTH WHEN 9 THEN SAL END) "9��",
    AVG(CASE MONTH WHEN 10 THEN SAL END) "10��",
    AVG(CASE MONTH WHEN 11 THEN SAL END) "11��",
    AVG(CASE MONTH WHEN 12 THEN SAL END) "12��"
FROM (SELECT E.DEPTNO, 
    EXTRACT(MONTH FROM HIREDATE) MONTH, SAL
    FROM EMP E)T
GROUP BY T.DEPTNO;

-- EMP_TEST_09
-- ������ ����
-- LEVEL : ��Ʈ �������̸�, 1, �� ���� �������̸� 2�̴�.
-- ����(LEAF) �����ͱ��� 1�� �����Ѵ�.
-- CONNECT_BY_ISLEAF ���� �������� �ش� �����Ͱ� �����������̸�
-- 1, �׷��� ������ 0�̴�.
-- 
SELECT LEVEL, 
       LPAD(' ', 4 * (LEVEL-1)) || EMPNO ���,
       MGR ������,
       CONNECT_BY_ISLEAF ISLEAF
FROM EMP
START WITH MGR IS NULL
CONNECT BY PRIOR EMPNO LIKE MGR;

-- EMP_TEST_10
-- ��������
-- �ڽŰ� �ڽ��� ���Ӱ����ڴ� ������ �࿡�� ���� �� ������
-- ������ �����ڴ� �ٷ� ���� �� ����.
-- ������ �����ڸ� ���ϱ� ���ؼ��� �ڽ��� ���� �����ڸ�
-- �������� ���������� �����ؾ� �ȴ�.
-- �׷���, INNER JOIN�� ��������ν� �ڽ��� �ڸ��ڰ�
-- �������� �ʴ� ����� E2���̺��� ������ �����
-- �������� �ʱ� ������ �ش� �����ʹ� ������� �����ȴ�.
-- �̸� �����ϱ� ���ؼ��� �ƿ��� ������ ����
-- �������� = ������ LEFT�ƿ�������!

SELECT E1.EMPNO ���, E1.MGR ������, E2.MGR "���� ������"
FROM EMP E1
    JOIN EMP E2
        ON E1.MGR LIKE E2.EMPNO
ORDER BY E2.MGR DESC, E1.MGR, E1.EMPNO;

SELECT E1.EMPNO ���, E1.MGR ������, E2.MGR "���� ������"
FROM EMP E1
   LEFT JOIN EMP E2 --OUTER ���� ����
        ON E1.MGR LIKE E2.EMPNO
ORDER BY E2.MGR DESC, E1.MGR, E1.EMPNO;

SELECT DNAME �μ���, JOB ����, COUNT(*) "��ü ���", SUM(SAL) "��ü �޿�"
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
GROUP BY ROLLUP(DNAME, JOB);


-- ANSI ���� ������ �Լ� ������
-- AGGREGATE FUNCTION ���� �Լ� = SUM(), MIN(), MAX(), COUNT()...
-- GROUP FUNCTION �׷� �Լ� = ROLLUP(), CUBE()
-- Ư���׸� ���� �Ұ踦 �ϴ� �Լ�
-- ROLLUP : �ұ׷찣�� �Ұ踦 ����ϴ� �Լ�
-- CUBE : ���������� �Ұ踦 ����ϴ� �Լ�
-- WINDOW FUNCTION ������ �Լ�.. RANK(), ROW_NUMBER()
SELECT DNAME �μ���, JOB ����, COUNT(*) "��ü ���", SUM(SAL) "��ü �޿�"
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
GROUP BY ROLLUP(DNAME, JOB);

SELECT CASE GROUPING(DNAME)
            WHEN 1 THEN 'ALL DEPTS'
            ELSE DNAME
            END "�μ���",
       CASE GROUPING(JOB)
            WHEN 1 THEN 'ALL JOBS'
            ELSE JOB 
            END "����",
       COUNT(*) "��ü ���",
       SUM(SAL) "��ü �޿�"
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
GROUP BY CUBE(DNAME, JOB);