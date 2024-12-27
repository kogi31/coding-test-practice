# Write your MySQL query statement below
SELECT  ID
        ,movie
        ,description
        ,rating
  FROM  Cinema
 WHERE  ID % 2 = 1
   AND  description NOT IN ('boring')
 ORDER
    BY  rating DESC;