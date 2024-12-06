# 38. Placements

난이도: Medium
URL: https://www.hackerrank.com/challenges/placements?isFullScreen=true
사이트: hackerrank
완료여부: Yes

### 문제

You are given three tables: *Students*, *Friends* and *Packages.* *Students* contains two columns: *ID* and *Name*. *Friends* contains two columns: *ID* and *Friend_ID* (*ID* of the ONLY best friend). *Packages* contains two columns: *ID* and *Salary* (offered salary in $ thousands per month).

![image.png](38%20Placements%20150bdab6415180668ba1f3b0fac9d936/image.png)

Write a query to output the names of those students whose best friends got offered a higher salary than them. Names must be ordered by the salary amount offered to the best friends. It is guaranteed that no two students got same salary offer.

**Sample Input**

![image.png](38%20Placements%20150bdab6415180668ba1f3b0fac9d936/image%201.png)

![image.png](38%20Placements%20150bdab6415180668ba1f3b0fac9d936/image%202.png)

**Sample Output**

```
Samantha
Julia
Scarlet

```

**Explanation**

See the following table:

![image.png](38%20Placements%20150bdab6415180668ba1f3b0fac9d936/image%203.png)

Now,

- *Samantha's* best friend got offered a higher salary than her at 11.55
- *Julia's* best friend got offered a higher salary than her at 12.12
- *Scarlet's* best friend got offered a higher salary than her at 15.2
- *Ashley's* best friend did NOT get offered a higher salary than her

The name output, when ordered by the salary offered to their friends, will be:

- *Samantha*
- *Julia*
- *Scarlet*

### 문제 접근

- join ID
- join p, p1 with friends as f.ID, f.FRIEND_ID
- order by friend salary