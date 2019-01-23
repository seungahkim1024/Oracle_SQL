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
    SELECT TEAM_ID, COUNT('FW') FW, COUNT('MF') MF, COUNT('DF') DF, COUNT('GK') GK
         FROM PLAYER
         GROUP BY TEAM_ID
       ;
        
    