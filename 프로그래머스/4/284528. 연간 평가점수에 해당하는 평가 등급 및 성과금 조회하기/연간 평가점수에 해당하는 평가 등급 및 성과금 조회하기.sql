-- 코드를 작성해주세요
-- 사원별 성과금 정보
-- 평가등급 >= 96 S 20%, >= 90 A 15%, >= 80 B 10%, ELSE C 0%
WITH GRADE_CALC AS (
    SELECT 
        E.EMP_NO,
        E.EMP_NAME,
        CASE
            WHEN G.SCORE >= 96 THEN 'S'
            WHEN G.SCORE >= 90 THEN 'A'
            WHEN G.SCORE >= 80 THEN 'B'
            ELSE 'C'
        END AS GRADE,
        E.SAL
    FROM 
        HR_DEPARTMENT AS D
    GROUP BY
        E.EMP_NO
    JOIN 
        HR_EMPLOYEES AS E
        ON D.DEPT_ID = E.DEPT_ID
    JOIN 
        HR_GRADE AS G
        ON E.EMP_NO = G.EMP_NO
)
SELECT 
    EMP_NO,
    EMP_NAME,
    GRADE,
    CASE
        WHEN GRADE = 'S' THEN SAL * 0.2
        WHEN GRADE = 'A' THEN SAL * 0.15
        WHEN GRADE = 'B' THEN SAL * 0.1
        ELSE 0
    END AS BONUS
FROM 
    GRADE_CALC
ORDER BY 
    EMP_NO ASC;