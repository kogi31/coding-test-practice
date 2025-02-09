-- 코드를 작성해주세요
WITH RECURSIVE GenerationTree AS (
    -- 1. 최초의 대장균 개체 (1세대) 찾기
    SELECT 
        ID,
        PARENT_ID,
        1 AS GENERATION
    FROM ECOLI_DATA
    WHERE PARENT_ID IS NULL

    UNION ALL

    -- 2. 재귀적으로 부모 세대 +1을 하여 세대 계산
    SELECT 
        E.ID,
        E.PARENT_ID,
        G.GENERATION + 1
    FROM ECOLI_DATA E
    JOIN GenerationTree G
    ON E.PARENT_ID = G.ID
),
LeafNodes AS (
    -- 3. 자식이 없는 개체 (ID가 PARENT_ID에 포함되지 않는 경우)
    SELECT G.GENERATION, G.ID
    FROM GenerationTree G
    LEFT JOIN ECOLI_DATA E ON G.ID = E.PARENT_ID
    WHERE E.PARENT_ID IS NULL
)
-- 4. 세대별 자식이 없는 개체의 개수 계산
SELECT 
    COUNT(ID) AS COUNT, 
    GENERATION 
FROM LeafNodes
GROUP BY GENERATION
ORDER BY GENERATION ASC;