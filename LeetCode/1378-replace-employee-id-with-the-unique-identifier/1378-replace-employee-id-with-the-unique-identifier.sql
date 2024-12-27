# Write your MySQL query statement below
SELECT  CASE 
            WHEN U.unique_id IS NOT NULL THEN U.unique_id
            ELSE NULL
        END AS unique_id
        ,E.name
  FROM  Employees E
  LEFT
  JOIN  EmployeeUNI U
    ON  E.id = U.id
 WHERE  U.unique_id IS NOT NULL
    OR  U.unique_id IS NULL;