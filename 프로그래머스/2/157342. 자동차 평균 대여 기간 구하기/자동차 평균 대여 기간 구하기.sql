-- 코드를 입력하세요
-- 평균 대여 기간 7일 이상 필터링
-- 자동차 ID, 평균 대여 기간 (AVERAGE_DURATION) 출력
-- 평균 대여 기간 소수점 두번째 자리에서 반올림
-- 평균 대여 기간 기준 내림차순 정렬, 자동차 ID 기준 내림차순 정렬
SELECT
    CAR_ID,
    ROUND(AVG(DATEDIFF(END_DATE, START_DATE) + 1), 1) AS AVERAGE_DURATION
FROM
    CAR_RENTAL_COMPANY_RENTAL_HISTORY
GROUP BY
    CAR_ID
HAVING
    ROUND(AVG(DATEDIFF(END_DATE, START_DATE) + 1), 1) >= 7
ORDER BY
    AVERAGE_DURATION DESC, CAR_ID DESC;
    