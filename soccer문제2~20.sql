-- SOCCER_SQL_011
-- ���� ��Ÿ����� �����Ͽ�
-- ���̸�, ��Ÿ��� �̸� ���
SELECT TEAM_NAME ����, STADIUM_NAME ��Ÿ���
FROM TEAM T
    JOIN STADIUM S
    ON T.STADIUM_ID LIKE S.STADIUM_ID
ORDER BY TEAM_NAME;
    
-- SOCCER_SQL_012
-- ���� ��Ÿ���, �������� �����Ͽ�
-- 2012�� 3�� 17�Ͽ� ���� �� ����� 
-- ���̸�, ��Ÿ���, ������� �̸� ���
-- �������̺� join �� ã�Ƽ� �ذ��Ͻÿ�.
SELECT T.TEAM_NAME ����, S.STADIUM_NAME ��Ÿ���, AWAYTEAM_ID ������ID,
   SCH.SCHE_DATE �����ٳ�¥
FROM STADIUM S
    JOIN TEAM T
    ON S.STADIUM_ID LIKE T.STADIUM_ID
    JOIN SCHEDULE SCH
    ON SCH.STADIUM_ID LIKE S.STADIUM_ID
WHERE SCHE_DATE LIKE '20120317'
ORDER BY T.TEAM_NAME;

-- SOCCER_SQL_013
-- 2012�� 3�� 17�� ��⿡ 
-- ���� ��ƿ���� �Ҽ� ��Ű��(GK)
-- ����, ������,���� (����������), 
-- ��Ÿ���, ��⳯¥�� ���Ͻÿ�
-- �������� ���̸��� ������ ���ÿ�
SELECT PLAYER_NAME ������, POSITION ������, CONCAT('���� ',TEAM_NAME) "����",
       (SELECT STADIUM_NAME
        FROM STADIUM
        WHERE STADIUM_NAME LIKE '���׽�ƿ�ߵ�') ��Ÿ���, 
        SCHE_DATE �����ٳ�¥
FROM TEAM T
    JOIN PLAYER P
    ON T.TEAM_ID LIKE P.TEAM_ID
    JOIN STADIUM S
    ON S.STADIUM_ID = T.STADIUM_ID
    JOIN SCHEDULE SCH
    ON SCH.STADIUM_ID = T.STADIUM_ID
WHERE SCHE_DATE LIKE '20120317' AND POSITION LIKE 'GK'
    AND TEAM_NAME LIKE '��ƿ����'
ORDER BY PLAYER_NAME;

-- SOCCER_SQL_014
-- Ȩ���� 3���̻� ���̷� �¸��� ����� 
-- ����� �̸�, ��� ����
-- Ȩ�� �̸��� ������ �̸���
-- ���Ͻÿ�
SELECT STADIUM_NAME ��Ÿ���, SCHE_DATE ��⳯¥;
