-- SOCCER_SQL_021
-- ���� ���� �Ҽ����� ������� ���
SELECT PLAYER_NAME ������, POSITION ������, BACK_NO ��ѹ�
FROM PLAYER
WHERE TEAM_ID LIKE (SELECT TEAM_ID
                    FROM PLAYER
                    WHERE PLAYER_NAME LIKE '����')
ORDER BY PLAYER_NAME;

-- SOCCER_SQL_022
-- NULL ó���� �־�
-- SUM(NVL(SAL,0)) �� ��������
-- NVL(SUM(SAL),0) ���� �ؾ� �ڿ����� �پ���
 -- ���� �����Ǻ� �ο����� ���� ��ü �ο��� ���
 -- Oracle, Simple Case Expr 
SELECT TEAM_ID, 
COUNT(CASE WHEN POSITION LIKE 'FW' THEN 1 END) "FW",
COUNT(CASE WHEN POSITION LIKE 'MF' THEN 1 END) "MF",
COUNT(CASE WHEN POSITION LIKE 'DF' THEN 1 END) "DF",
COUNT(CASE WHEN POSITION LIKE 'GK' THEN 1 END) "GK",
COUNT(*) "SUM"
FROM PLAYER
GROUP BY TEAM_ID; -- NULL���� ���� �ȉ� K08

-- SOCCER_SQL_023
-- GROUP BY �� ���� ��ü �������� �����Ǻ� ��� Ű �� ��ü ��� Ű ���
SELECT
    ROUND(AVG(CASE WHEN POSITION LIKE 'MF' THEN HEIGHT END),2) "�̵��ʴ�",
    ROUND(AVG(CASE WHEN POSITION LIKE 'FW' THEN HEIGHT END),2) "������",
    ROUND(AVG(CASE WHEN POSITION LIKE 'DF' THEN HEIGHT END),2) "�����",
    ROUND(AVG(CASE WHEN POSITION LIKE 'GK' THEN HEIGHT END),2) "��Ű��",
    ROUND(AVG(HEIGHT),2) "��ü��� Ű"
FROM PLAYER;

-- SOCCER_SQL_024 
-- �Ҽ����� Ű�� ���� ���� ������� ����
SELECT P.TEAM_ID �����̵�, TEAM_NAME ����, PLAYER_NAME ����, 
        POSITION ������, BACK_NO ��ѹ�, HEIGHT Ű
FROM PLAYER P
    JOIN TEAM T
        ON P.TEAM_ID LIKE T.TEAM_ID
WHERE P.HEIGHT LIKE (SELECT MIN(HEIGHT)
                     FROM PLAYER
                     WHERE HEIGHT
                     GROUP BY TEAM_ID);