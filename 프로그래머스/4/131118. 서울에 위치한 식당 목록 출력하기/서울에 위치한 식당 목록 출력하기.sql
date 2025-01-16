-- 코드를 입력하세요
-- 서울에 위치한 식당
-- 리뷰 평균점수 소수점 3번째 자리에서 반올림
-- 평균점수 기준 내림차순 정렬, 즐겨찾기수 기준 내림차순 정렬
SELECT  I.REST_ID,
        I.REST_NAME,
        I.FOOD_TYPE,
        I.FAVORITES,
        I.ADDRESS,
        ROUND(AVG(R.REVIEW_SCORE), 2) AS SCORE
  FROM  REST_INFO AS I
  JOIN  REST_REVIEW AS R
    ON  I.REST_ID = R.REST_ID
 WHERE  I.ADDRESS LIKE '서울%'
 GROUP
    BY  I.REST_ID
 ORDER
    BY  SCORE DESC, I.FAVORITES DESC;