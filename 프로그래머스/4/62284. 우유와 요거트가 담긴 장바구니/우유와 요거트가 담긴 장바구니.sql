-- 코드를 입력하세요
-- 우유와 요거트 동시에 구입한 장바구니 조회
SELECT  CART_ID
  FROM  CART_PRODUCTS
 WHERE  NAME IN ('Milk', 'Yogurt')
 GROUP
    BY  CART_ID
HAVING  COUNT(DISTINCT NAME) = 2
 ORDER
    BY  CART_ID ASC;