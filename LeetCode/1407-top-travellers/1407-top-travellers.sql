# Write your MySQL query statement below
/*
1. U.id = R.user_id
2. select name, SUM(distance) AS travelled_distance
3. GROUP BY U.name
*/

SELECT
    U.name,
    COALESCE(SUM(R.distance), 0) AS travelled_distance
FROM
    Users AS U
LEFT JOIN
    Rides AS R
    ON U.id = R.user_id
GROUP BY
    U.name, U.id
ORDER BY
    travelled_distance DESC, U.name ASC;