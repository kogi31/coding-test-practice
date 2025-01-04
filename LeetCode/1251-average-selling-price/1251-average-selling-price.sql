# Write your MySQL query statement below
SELECT  P.product_id,
        ROUND(COALESCE(SUM(U.units * P.price), 0) / COALESCE(SUM(U.units), 1), 2) AS average_price
  FROM  Prices AS P
  LEFT
  JOIN  UnitsSold AS U
    ON  P.product_id = U.product_id
   AND  U.purchase_date BETWEEN P.start_date AND P.end_date
 GROUP
    BY  P.product_id;