# 4. Employee Names

난이도: Easy

### 문제

Write a query that prints a list of employee names (i.e.: the *name* attribute) from the **Employee** table in alphabetical order.

**Input Format**

The **Employee** table containing employee data for a company is described as follows:

![image.png](4%20Employee%20Names%20150bdab641518007afdfe18243d22cb6/image.png)

where *employee_id* is an employee's ID number, *name* is their name, *months* is the total number of months they've been working for the company, and *salary* is their monthly salary.

**Sample Input**

![image.png](4%20Employee%20Names%20150bdab641518007afdfe18243d22cb6/image%201.png)

**Sample Output**

```sql
Angela
Bonnie
Frank
Joe
Kimberly
Lisa
Michael
Patrick
Rose
Todd
```

### 문제 접근

1. order by name asc