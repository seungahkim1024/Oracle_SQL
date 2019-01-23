select COUNT(*) 선수인원 -- 468명
FROM PLAYER
WHERE BIRTH_DATE IS NOT NULL
ORDER BY BIRTH_DATE DESC;

-- 1단계
select BIRTH_DATE 생년월일, PLAYER_NAME 선수이름
FROM PLAYER
WHERE BIRTH_DATE IS NOT NULL
ORDER BY BIRTH_DATE DESC;

-- 2단계
select P.BIRTH_DATE 생년월일, P.PLAYER_NAME 선수이름
FROM (SELECT BIRTH_DATE, PLAYER_NAME
      FROM PLAYER
      WHERE BIRTH_DATE IS NOT NULL
      ORDER BY BIRTH_DATE DESC) P
WHERE ROWNUM BETWEEN 1 AND 5;

-- 3단계
select T2.SEQ "NO.", T2.생년월일, T2.선수
FROM (SELECT ROWNUM SEQ, T1.*
      FROM (SELECT P.BIRTH_DATE 생년월일,
                   P.PLAYER_NAME 선수
            FROM PLAYER P
            WHERE P.BIRTH_DATE IS NOT NULL
            ORDER BY BIRTH_DATE DESC) T1)T2
WHERE T2.SEQ BETWEEN 6 AND 10;