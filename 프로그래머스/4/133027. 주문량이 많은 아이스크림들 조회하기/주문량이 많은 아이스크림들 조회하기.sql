-- 코드를 입력하세요
-- 7월 아이스크림 총주문량 + 상반기 아이스크림 총 주문량
SELECT  A.FLAVOR
  FROM  (SELECT FLAVOR,
                TOTAL_ORDER
           FROM FIRST_HALF
         UNION ALL
         SELECT FLAVOR,
                TOTAL_ORDER
           FROM  JULY) A
 GROUP
    BY  A.FLAVOR
 ORDER
    BY  SUM(A.TOTAL_ORDER) DESC
 LIMIT  3;