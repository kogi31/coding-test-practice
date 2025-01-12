-- 코드를 작성해주세요
-- 물고기 종류 별 (fish_type)
-- max(length)
SELECT  I.ID
        ,N.FISH_NAME
        ,I.LENGTH
  FROM  (SELECT  *
                 ,MAX(LENGTH) OVER (PARTITION BY FISH_TYPE) AS MAX_LENGTH
           FROM  FISH_INFO
      ) AS I
  JOIN  FISH_NAME_INFO AS N
    ON  I.FISH_TYPE = N.FISH_TYPE
 WHERE I.LENGTH = I.MAX_LENGTH
 ORDER
    BY ID ASC;