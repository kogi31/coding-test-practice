/*
product_id별 하나씩 8월 16일 중 가장 최근
2019-08-16 이전 제품들의 가격
ROW_NUMBER()
*/
WITH RnData AS (
    SELECT
        product_id,
        new_price,
        ROW_NUMBER() OVER (PARTITION BY product_id ORDER BY change_date DESC)  AS RN
    FROM
        products
    WHERE
        DATE_FORMAT(change_date, '%Y-%m-%d') <= '2019-08-16'
)

SELECT
    product_id,
    new_price AS price
FROM
    RnData
WHERE
    RN = 1

UNION

SELECT
    product_id,
    10 AS price
FROM
    Products
WHERE
    product_id NOT IN (SELECT
                            product_id
                        FROM
                            RnData
    )