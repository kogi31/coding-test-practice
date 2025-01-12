-- 코드를 작성해주세요
-- 대장균 개체의 크기 내림차순
-- percent_rank() -> 순위

WITH  RankedData AS (
SELECT  ID
        ,SIZE_OF_COLONY
        ,PERCENT_RANK() OVER (ORDER BY SIZE_OF_COLONY DESC) AS perc_rank
  FROM  ECOLI_DATA
)
SELECT  ID
        ,CASE
            WHEN perc_rank <= 0.25 THEN 'CRITICAL'
            WHEN perc_rank <= 0.50 THEN 'HIGH'
            WHEN perc_rank <= 0.75 THEN 'MEDIUM'
            ELSE 'LOW'
        END AS COLONY_NAME
  FROM  RankedData
 ORDER
    BY  ID ASC;
