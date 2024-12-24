-- 코드를 작성해주세요
SELECT
    DISTINCT id,
    email,
    first_name,
    last_name
FROM
    developers
WHERE
    skill_code & (SELECT SUM(code) FROM skillcodes WHERE name IN ('C#', 'Python')) 
ORDER BY
    1