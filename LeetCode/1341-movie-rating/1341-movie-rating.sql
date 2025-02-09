# Write your MySQL query statement below
/*
CTE, JOIN
1. user who has rated the greatest number of movies
2. ascending user name
3. movie name with highest average rating in 2022-02
4. ascending movie name
*/
WITH Name AS (
    SELECT
        U.name AS results
    FROM
        Users AS U
    JOIN
        MovieRating AS MR
        USING (user_id)
    JOIN
        Movies AS M
        USING (movie_id)
    GROUP BY
        U.user_id
    ORDER BY
        COUNT(U.user_id) DESC,
        results ASC
    LIMIT 1
),
Movie AS (
    SELECT
        M.title AS results
    FROM
        Movies AS M
    JOIN
        MovieRating AS MR
        USING (movie_id)
    WHERE
        DATE_FORMAT(MR.created_at, '%Y-%m') = '2020-02'
    GROUP BY
        M.title
    ORDER BY
        AVG(MR.rating) DESC,
        results ASC
    LIMIT 1
)
SELECT
    results
FROM
    Name

UNION ALL

SELECT
    results
FROM
    Movie;
