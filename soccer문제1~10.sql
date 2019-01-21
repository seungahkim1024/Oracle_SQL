-- SQL_TEST_001
-- ��ü �౸�� ���. �̸� ��������
SELECT TEAM_NAME "��ü �౸�� ���"
FROM TEAM
ORDER BY TEAM_NAME;

-- SQL_TEST_002
-- ������ ����(�ߺ�����,������ �����)
SELECT DISTINCT POSITION ������
FROM PLAYER;

-- SQL_TEST_003
-- ������ ����(�ߺ�����,������ �������� ����)
-- nvl2()��� 
-- -> NVL2(expr, expr1, expr2): expr�� ���� null�� �ƴҰ�� expr1�� ���� ��ȯ�ϰ�,
--                              null�� ��쿡�� expr2�� ���� ��ȯ.
SELECT DISTINCT NVL2(POSITION,POSITION,'����') ������
FROM PLAYER;

-- SQL_TEST_004
-- ������(ID: K02)��Ű��
SELECT PLAYER_NAME �̸�
FROM PLAYER
WHERE POSITION LIKE 'GK' AND TEAM_ID LIKE 'K02'
ORDER BY PLAYER_NAME; 
                    
-- SQL_TEST_005
-- ������(ID: K02)Ű�� 170 �̻� ����
-- �̸鼭 ���� ���� ����
SELECT POSITION ������, PLAYER_NAME �̸�
FROM PLAYER
WHERE PLAYER_NAME LIKE '��%' AND TEAM_ID LIKE 'K02' AND HEIGHT >= '170'; 

-- SQL_TEST_006
-- ������(ID: K02) ������ �̸�,
-- Ű�� ������ ����Ʈ (���� cm �� kg ����)
-- Ű�� �����԰� ������ "0" ǥ��
-- Ű ��������
SELECT CONCAT(PLAYER_NAME, '����') "�̸�", 
       TO_CHAR(NVL2(HEIGHT,HEIGHT,'0')||'cm') Ű, 
       TO_CHAR(NVL2(WEIGHT,WEIGHT,'0') ||'kg') ������
FROM PLAYER
WHERE TEAM_ID LIKE 'K02'
ORDER BY HEIGHT DESC;

-- SQL_TEST_007
-- ������(ID: K02) ������ �̸�,
-- Ű�� ������ ����Ʈ (���� cm �� kg ����)
-- Ű�� �����԰� ������ "0" ǥ��
-- BMI���� 
-- Ű ��������
SELECT CONCAT(PLAYER_NAME, '����') "�̸�", 
       TO_CHAR(NVL(HEIGHT,'0')||'cm') Ű, 
       TO_CHAR(NVL(WEIGHT,'0') ||'kg') ������,
       ROUND (WEIGHT/((HEIGHT*HEIGHT)*0.0001), 2) BMI������
FROM (SELECT PLATER_NAME, HEIGHT, WEIGHT
      FROM PLAYER
      WHERE TEAM_ID LIKE 'K02')
ORDER BY HEIGHT DESC;

-- SQL_TEST_008
-- ������(ID: K02) �� ������(ID: K10)������ �� 
--  �������� GK ��  ����
-- ����, ����� ��������
SELECT TEAM_NAME, POSITION, PLAYER_NAME
FROM PLAYER P
    INNER JOIN TEAM T
    ON P.TEAM_ID LIKE T.TEAM_ID
WHERE T.TEAM_ID IN('K02','K10') AND POSITION LIKE 'GK'
ORDER BY TEAM_NAME, PLAYER_NAME;

-- SQL_TEST_009
-- ������(ID: K02) �� ������(ID: K10)������ �� ��
-- Ű�� 180 �̻� 183 ������ ������
-- Ű, ����, ����� ��������
SELECT T.TEAM_NAME ����, P.PLAYER_NAME �����, P.HEIGHT Ű
FROM (SELECT T.TEAM_NAME, T.TEAM_ID
      FROM TEAM T
      WHERE T.TEAM_ID IN('K02', 'K10')) T
    JOIN PLAYER P
    ON T.TEAM_ID LIKE P.TEAM_ID
WHERE P.HEIGHT BETWEEN 180 AND 183
ORDER BY P.HEIGHT, T.TEAM_NAME, P.PLAYER_NAME;

-- SOCCER_SQL_010
-- ��� ������ ��
-- �������� �������� ���� �������� ���� �̸�
-- ����, ����� ��������
SELECT TEAM_NAME, PLAYER_NAME
FROM TEAM T
    JOIN PLAYER P
    ON T.TEAM_ID = P.TEAM_ID
WHERE POSITION IS NULL
ORDER BY TEAM_NAME, PLAYER_NAME;
