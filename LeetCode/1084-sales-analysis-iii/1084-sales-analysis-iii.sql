WITH ProductSales AS (
    SELECT 
        product_id,
        MAX(sale_date) AS last_sale_date,
        MIN(sale_date) AS first_sale_date
    FROM 
        Sales
    GROUP BY 
        product_id
),
FilteredProducts AS (
    SELECT 
        product_id
    FROM 
        ProductSales
    WHERE 
        first_sale_date >= '2019-01-01'
        AND last_sale_date <= '2019-03-31'
)
SELECT 
    P.product_id,
    P.product_name
FROM 
    Product AS P
JOIN 
    FilteredProducts AS F
    ON P.product_id = F.product_id;