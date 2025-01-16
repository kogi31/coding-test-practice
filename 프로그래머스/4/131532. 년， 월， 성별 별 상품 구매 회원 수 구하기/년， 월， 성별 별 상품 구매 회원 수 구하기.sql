-- 코드를 입력하세요
-- 년, 월, 성별 별로 상품을 구매한 회원 수 집계
-- 년, 월, 성별 기준 오름차순 정렬
-- 성별 정보가 없는 경우 결과에서 제외
SELECT  YEAR(O.SALES_DATE) AS YEAR,
        MONTH(O.SALES_DATE) AS MONTH,
        G.GENDER,
        COUNT(DISTINCT O.USER_ID) AS USERS
  FROM  USER_INFO AS G
  JOIN  ONLINE_SALE AS O
    ON  G.USER_ID = O.USER_ID
 WHERE  GENDER IS NOT NULL
 GROUP
    BY  YEAR, MONTH, G.GENDER
 ORDER
    BY  YEAR ASC, MONTH ASC, G.GENDER ASC;