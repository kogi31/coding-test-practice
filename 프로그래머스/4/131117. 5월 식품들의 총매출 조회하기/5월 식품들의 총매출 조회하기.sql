-- 코드를 입력하세요
-- product_date = 2022-05
-- product_id, product_name, total_sales
-- total_sales desc, product_id asc
SELECT  P.PRODUCT_ID
        ,P.PRODUCT_NAME
        ,SUM(P.PRICE * O.AMOUNT) AS TOTAL_SALES
  FROM  FOOD_PRODUCT AS P
  JOIN  FOOD_ORDER AS O
    ON  P.PRODUCT_ID = O.PRODUCT_ID
 WHERE  DATE_FORMAT(O.PRODUCE_DATE, '%Y-%m') = '2022-05'
 GROUP
    BY  P.PRODUCT_ID, P.PRODUCT_NAME
 ORDER
    BY  TOTAL_SALES DESC, P.PRODUCT_ID ASC;