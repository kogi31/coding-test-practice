# Write your MySQL query statement below
SELECT
    E.name AS Employee
FROM
    Employee AS E
JOIN
    Employee AS M
    ON E.managerId = M.Id
WHERE
    E.salary > M.salary;