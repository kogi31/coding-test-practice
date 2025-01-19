/*
1세대 NULL 포함
2세대는 1세대 다음으로
*/
WITH RECURSIVE Generation AS (
    SELECT
        ID,
        PARENT_ID,
        1 AS GENERATION
    FROM
        ECOLI_DATA
    WHERE PARENT_ID IS NULL
    -- 1세대
    UNION ALL
    SELECT
        S.ID,
        S.PARENT_ID,
        GENERATION + 1 AS GENERATION
    FROM
        ECOLI_DATA AS S
    JOIN
        Generation AS G
        ON S.PARENT_ID = G.ID
)

SELECT
    ID
FROM
    Generation
WHERE
    GENERATION = 3
ORDER BY
    ID ASC;