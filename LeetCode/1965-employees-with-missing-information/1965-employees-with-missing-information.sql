SELECT employee_id
FROM Employees
WHERE name IS NULL

UNION

SELECT employee_id
FROM Salaries
WHERE salary IS NULL

UNION

SELECT E.employee_id
FROM Employees AS E
LEFT JOIN Salaries AS S ON E.employee_id = S.employee_id
WHERE S.salary IS NULL

UNION

SELECT S.employee_id
FROM Salaries AS S
LEFT JOIN Employees AS E ON S.employee_id = E.employee_id
WHERE E.name IS NULL

ORDER BY employee_id;