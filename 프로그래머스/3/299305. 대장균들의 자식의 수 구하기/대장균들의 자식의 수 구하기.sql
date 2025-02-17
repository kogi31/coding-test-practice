-- 코드를 작성해주세요
SELECT  P.ID
        ,COALESCE(COUNT(C.PARENT_ID), 0) AS CHILD_COUNT
  FROM ECOLI_DATA AS P
  LEFT
  JOIN ECOLI_DATA AS C
    ON P.ID = C.PARENT_ID
 GROUP
    BY  P.ID
 ORDER
    BY  P.ID ASC;