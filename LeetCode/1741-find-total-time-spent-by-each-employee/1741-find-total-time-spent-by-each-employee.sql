# Write your MySQL query statement below
SELECT
    event_day as day,
    emp_id,
    SUM(out_time - in_time) AS total_time
FROM
    EMPLOYEES
GROUP BY
    emp_id, day;