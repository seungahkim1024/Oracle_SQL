-- SOCCER_SQL_021
-- 이현 선수 소속팀의 선수명단 출력
SELECT PLAYER_NAME 선수명, POSITION 포지션, BACK_NO 백넘버
FROM PLAYER
WHERE TEAM_ID LIKE (SELECT TEAM_ID
                    FROM PLAYER
                    WHERE PLAYER_NAME LIKE '이현')
ORDER BY PLAYER_NAME;

-- SOCCER_SQL_022
-- NULL 처리에 있어
-- SUM(NVL(SAL,0)) 로 하지말고
-- NVL(SUM(SAL),0) 으로 해야 자원낭비가 줄어든다
 -- 팀별 포지션별 인원수와 팀별 전체 인원수 출력
 -- Oracle, Simple Case Expr 
    SELECT TEAM_ID, COUNT('FW') FW, COUNT('MF') MF, COUNT('DF') DF, COUNT('GK') GK
         FROM PLAYER
         GROUP BY TEAM_ID
       ;
        
    