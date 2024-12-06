WITH  RECURSIVE STARS
  AS (
      SELECT  20 
          AS  S 
   UNION ALL
      SELECT  S-1 
        FROM  STARS
       WHERE  S > 1
)
SELECT  REPEAT('* ',S)
  FROM  STARS
 ORDER
    BY S;