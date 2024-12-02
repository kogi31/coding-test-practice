# 6. Employee Salaries

난이도: Easy

### 문제

Write a query that prints a list of employee names (i.e.: the *name* attribute) for employees in **Employee** having a salary greater than $2000 per month who have been employees for less than 10 months. Sort your result by ascending *employee_id*.

**Input Format**

The **Employee** table containing employee data for a company is described as follows:

![image.png](6%20Employee%20Salaries%20150bdab641518090bc3ed58017c167ad/image.png)

where *employee_id* is an employee's ID number, *name* is their name, *months* is the total number of months they've been working for the company, and *salary* is the their monthly salary.

**Sample Input**

![image.png](6%20Employee%20Salaries%20150bdab641518090bc3ed58017c167ad/image%201.png)

**Sample Output**

```sql
Angela
Michael
Todd
Joe
```

**Explanation**

*Angela* has been an employee for 1 month and earns $3443 per month.

*Michael* has been an employee for 6 months and earns $2017 per month.

*Todd* has been an employee for 5 months and earns $3396 per month.

*Joe* has been an employee for 9 months and earns $3573 per month.

We order our output by ascending *employee_id*.

### 문제 접근

1. select name
2. salary > 2000 and months < 10