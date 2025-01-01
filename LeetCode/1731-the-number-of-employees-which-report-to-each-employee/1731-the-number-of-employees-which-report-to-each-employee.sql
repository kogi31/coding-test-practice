# Write your MySQL query statement below

SELECT  E.employee_id
        ,E.name
        ,COUNT(R.employee_id) AS reports_count
        ,ROUND(AVG(R.age), 0) AS average_age
  FROM  Employees AS E
  JOIN  Employees AS R
    ON  E.employee_id = R.reports_to
 GROUP
    BY  E.employee_id, E.name
 ORDER
    BY  E.employee_id;