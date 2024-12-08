WITH SortedData AS (
    SELECT 
        LAT_N,
        ROW_NUMBER() OVER (ORDER BY LAT_N) AS row_num,
        COUNT(*) OVER () AS total_count
    FROM STATION
),
MedianOdd AS (
    SELECT LAT_N AS median_lat
    FROM SortedData
    WHERE row_num = (total_count + 1) / 2
),
MedianEven AS (
    SELECT AVG(LAT_N) AS median_lat
    FROM SortedData
    WHERE row_num IN (total_count / 2, (total_count / 2) + 1)
)
SELECT 
    ROUND(
        CASE
            WHEN (SELECT total_count FROM SortedData LIMIT 1) % 2 = 1 THEN
                (SELECT median_lat FROM MedianOdd)
            ELSE
                (SELECT median_lat FROM MedianEven)
        END, 
        4
    ) AS median_lat;