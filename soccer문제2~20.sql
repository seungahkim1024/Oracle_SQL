-- SOCCER_SQL_011
-- 팀과 스타디움을 조인하여
-- 팀이름, 스타디움 이름 출력
SELECT TEAM_NAME 팀명, STADIUM_NAME 스타디움
FROM TEAM T
    JOIN STADIUM S
    ON T.STADIUM_ID LIKE S.STADIUM_ID
ORDER BY TEAM_NAME;
    
-- SOCCER_SQL_012
-- 팀과 스타디움, 스케줄을 조인하여
-- 2012년 3월 17일에 열린 각 경기의 
-- 팀이름, 스타디움, 어웨이팀 이름 출력
-- 다중테이블 join 을 찾아서 해결하시오.
SELECT T.TEAM_NAME 팀명, S.STADIUM_NAME 스타디움, AWAYTEAM_ID 원정팀ID,
   SCH.SCHE_DATE 스케줄날짜
FROM STADIUM S
    JOIN TEAM T
    ON S.STADIUM_ID LIKE T.STADIUM_ID
    JOIN SCHEDULE SCH
    ON SCH.STADIUM_ID LIKE S.STADIUM_ID
WHERE SCHE_DATE LIKE '20120317'
ORDER BY T.TEAM_NAME;

-- SOCCER_SQL_013
-- 2012년 3월 17일 경기에 
-- 포항 스틸러스 소속 골키퍼(GK)
-- 선수, 포지션,팀명 (연고지포함), 
-- 스타디움, 경기날짜를 구하시오
-- 연고지와 팀이름은 간격을 띄우시오
SELECT PLAYER_NAME 선수명, POSITION 포지션, CONCAT('포항 ',TEAM_NAME) "팀명",
       (SELECT STADIUM_NAME
        FROM STADIUM
        WHERE STADIUM_NAME LIKE '포항스틸야드') 스타디움, 
        SCHE_DATE 스케줄날짜
FROM TEAM T
    JOIN PLAYER P
    ON T.TEAM_ID LIKE P.TEAM_ID
    JOIN STADIUM S
    ON S.STADIUM_ID = T.STADIUM_ID
    JOIN SCHEDULE SCH
    ON SCH.STADIUM_ID = T.STADIUM_ID
WHERE SCHE_DATE LIKE '20120317' AND POSITION LIKE 'GK'
    AND TEAM_NAME LIKE '스틸러스'
ORDER BY PLAYER_NAME;

-- SOCCER_SQL_014
-- 홈팀이 3점이상 차이로 승리한 경기의 
-- 경기장 이름, 경기 일정
-- 홈팀 이름과 원정팀 이름을
-- 구하시오
SELECT STADIUM_NAME 스타디움, SCHE_DATE 경기날짜;
