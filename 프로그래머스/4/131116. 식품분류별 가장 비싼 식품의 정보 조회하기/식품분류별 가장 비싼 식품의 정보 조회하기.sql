-- 코드를 입력하세요
WITH MaxPriceByCategory AS (
    SELECT 
        CATEGORY,
        MAX(PRICE) AS MAX_PRICE
    FROM 
        FOOD_PRODUCT
    WHERE 
        CATEGORY IN ('과자', '국', '김치', '식용유')
    GROUP BY 
        CATEGORY
)
SELECT 
    FP.CATEGORY,
    MP.MAX_PRICE,
    FP.PRODUCT_NAME
FROM 
    MaxPriceByCategory AS MP
JOIN 
    FOOD_PRODUCT AS FP
ON 
    MP.CATEGORY = FP.CATEGORY AND MP.MAX_PRICE = FP.PRICE
ORDER BY 
    MP.MAX_PRICE DESC;