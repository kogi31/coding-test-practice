-- 코드를 작성해주세요
SELECT
    CASE
        WHEN S.CATEGORY = 'Front End' AND S.NAME = 'Python' THEN 'A'
        WHEN S.NAME = 'C#' THEN 'B'
        ELSE 'C'
    END AS GRADE,
    D.ID,
    D.EMAIL
    
FROM
    DEVELOPERS AS D
JOIN
    SKILLCODES AS S
    ON D.SKILL_CODE & S.CODE = S.CODE;