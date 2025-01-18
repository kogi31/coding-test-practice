-- 코드를 작성해주세요
-- 사원별 성과금 정보
-- 평가등급 >= 96 S 20%, >= 90 A 15%, >= 80 B 10%, ELSE C 0%
WITH AvgGrade AS (
    SELECT 
        EMP_NO,
        AVG(SCORE) AS AVG_SCORE
    FROM 
        HR_GRADE
    WHERE 
        YEAR = 2022 -- 2022년 평가만 사용
    GROUP BY 
        EMP_NO
),
GradeCalc AS (
    SELECT 
        E.EMP_NO,
        E.EMP_NAME,
        CASE
            WHEN AG.AVG_SCORE >= 96 THEN 'S'
            WHEN AG.AVG_SCORE >= 90 THEN 'A'
            WHEN AG.AVG_SCORE >= 80 THEN 'B'
            ELSE 'C'
        END AS GRADE,
        E.SAL
    FROM 
        HR_EMPLOYEES AS E
    JOIN 
        AvgGrade AS AG
        ON E.EMP_NO = AG.EMP_NO
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
    GradeCalc
ORDER BY 
    EMP_NO ASC;