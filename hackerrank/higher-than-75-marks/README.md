# 23. Higher Than 75 Marks

난이도: Easy
URL: https://www.hackerrank.com/challenges/more-than-75-marks?isFullScreen=true

### 문제

Query the *Name* of any student in **STUDENTS** who scored higher than 75 *Marks*. Order your output by the *last three characters* of each name. If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending *ID*.

**Input Format**

The **STUDENTS** table is described as follows:

![image.png](23%20Higher%20Than%2075%20Marks%20150bdab641518029a746cbb715f3d3d8/image.png)

The *Name* column only contains uppercase (`A`-`Z`) and lowercase (`a`-`z`) letters.

**Sample Input**

![image.png](23%20Higher%20Than%2075%20Marks%20150bdab641518029a746cbb715f3d3d8/image%201.png)

**Sample Output**

```sql
Ashley
Julia
Belvet
```

**Explanation**

Only Ashley, Julia, and Belvet have *Marks* > 75. If you look at the last three characters of each of their names, there are no duplicates and 'ley' < 'lia' < 'vet'.

### 문제 접근

1. marks > 75
2. order by right(name,3) ,id