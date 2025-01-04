-- 코드를 입력하세요
-- 입양이 되지 않은 동물 (서브쿼리) -> join 후 null값

SELECT  NAME
        ,DATETIME
  FROM  ANIMAL_INS
 WHERE  ANIMAL_ID NOT IN (SELECT  ANIMAL_ID
                            FROM  ANIMAL_OUTS
                         )
 ORDER
    BY  DATETIME ASC
 LIMIT  3;