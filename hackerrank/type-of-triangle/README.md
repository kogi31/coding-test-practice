# 43. Type of Triangle

난이도: Easy
URL: https://www.hackerrank.com/challenges/what-type-of-triangle?isFullScreen=true
사이트: hackerrank
완료여부: No

### 문제

Write a query identifying the *type* of each record in the **TRIANGLES** table using its three side lengths. Output one of the following statements for each record in the table:

- **Equilateral**: It's a triangle with 3 sides of equal length.
- **Isosceles**: It's a triangle with 2 sides of equal length.
- **Scalene**: It's a triangle with 3 sides of differing lengths.
- **Not A Triangle**: The given values of *A*, *B*, and *C* don't form a triangle.

**Input Format**

The **TRIANGLES** table is described as follows:

![image.png](43%20Type%20of%20Triangle%20150bdab6415180599176d123e435c94a/image.png)

Each row in the table denotes the lengths of each of a triangle's three sides.

**Sample Input**

![image.png](43%20Type%20of%20Triangle%20150bdab6415180599176d123e435c94a/image%201.png)

**Sample Output**

```sql
Isosceles
Equilateral
Scalene
Not A Triangle
```

**Explanation**

Values in the tuple $(20, 20, 23)$ form an Isosceles triangle, because $A \text{三}B$.

Values in the tuple $(20, 20, 20)$ form an Equilateral triangle, because $A \text{三}B \text{三}C$. Values in the tuple $(20, 21, 22)$ form a Scalene triangle, because $A\neq B \neq C$.

Values in the tuple $(13, 14, 30)$ cannot form a triangle because the combined value of sides $A$ and $B$ is not larger than that of side $C$.

### 문제 접근

- case1 a=b and b=c then equilateral
- case2 a=b or b=c or a=c then Isosceles
- case4 a + b ≤ c  or a + c ≤ b or b+c ≤ a then not a triangle
- then scalene