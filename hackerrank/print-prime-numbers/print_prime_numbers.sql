WITH RECURSIVE Numbers AS (
    SELECT 2 AS n
    UNION ALL
    SELECT n + 1
    FROM Numbers
    WHERE n + 1 <= 1000
),
PrimeNumbers AS (
    SELECT n
    FROM Numbers
    WHERE NOT EXISTS (
        SELECT 1
        FROM Numbers AS Divisors
        WHERE Divisors.n < Numbers.n
          AND Numbers.n % Divisors.n = 0
    )
)
SELECT GROUP_CONCAT(n SEPARATOR '&') AS prime_numbers
FROM PrimeNumbers;