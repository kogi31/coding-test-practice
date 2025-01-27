SELECT
    W.id,
    P.age,
    W.coins_needed,
    W.power
FROM
    Wands AS W
JOIN
    Wands_Property AS P
    ON W.code = P.code
WHERE
    P.is_evil = 0
    AND W.coins_needed = (
        SELECT
            MIN(W1.coins_needed)
        FROM
            Wands AS W1
        JOIN
            Wands_Property AS P1
            ON W1.code = P1.code
        WHERE
            W1.power = W.power
            AND P1.age = P.age
            AND P1.is_evil = 0
    )
ORDER BY
    W.power DESC,
    P.age DESC;