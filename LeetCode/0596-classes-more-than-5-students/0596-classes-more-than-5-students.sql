# Write your MySQL query statement below
# have at least five students
# find all the classes
SELECT  class
  FROM  Courses
 GROUP
    BY  class
HAVING  COUNT(student) >= 5;