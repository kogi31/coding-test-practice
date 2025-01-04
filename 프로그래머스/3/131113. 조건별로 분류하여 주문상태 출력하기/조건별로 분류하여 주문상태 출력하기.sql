-- 코드를 입력하세요
# 2022-5-1
# 출고 여부 2022년 5월 1일까지 출고완료, 그 이후 출고 대기, 미정이면 출고미정
# 주문 ID 오름차순
SELECT  ORDER_ID
        ,PRODUCT_ID
        ,DATE_FORMAT(OUT_DATE, '%Y-%m-%d')
        ,CASE 
            WHEN DATE_FORMAT(OUT_DATE, '%Y-%m-%d') <= '2022-05-01' THEN '출고완료'
            WHEN DATE_FORMAT(OUT_DATE, '%Y-%m-%d') > '2022-05-01' THEN '출고대기'
            ELSE '출고미정'
        END AS '출고여부'
  FROM  FOOD_ORDER
 ORDER
    BY  ORDER_ID ASC;