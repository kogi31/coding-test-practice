# The PADS

난이도: Medium
URL: https://www.hackerrank.com/challenges/the-pads?isFullScreen=true
날짜: January 25, 2025
사이트: hackerrank
완료여부: Yes

### 문제

Generate the following two result sets:

1. Query an *alphabetically ordered* list of all names in **OCCUPATIONS**, immediately followed by the first letter of each profession as a parenthetical (i.e.: enclosed in parentheses). For example: `AnActorName(A)`, `ADoctorName(D)`, `AProfessorName(P)`, and `ASingerName(S)`.
2. Query the number of ocurrences of each occupation in **OCCUPATIONS**. Sort the occurrences in *ascending order*, and output them in the following format:
    
    ```
    There are a total of [occupation_count] [occupation]s.
    
    ```
    
    where `[occupation_count]` is the number of occurrences of an occupation in **OCCUPATIONS** and `[occupation]` is the *lowercase* occupation name. If more than one *Occupation* has the same `[occupation_count]`, they should be ordered alphabetically.
    

**Note:** There will be at least two entries in the table for each type of occupation.

**Input Format**

The **OCCUPATIONS** table is described as follows:

![image.png](The%20PADS%20150bdab6415180279628d4eca5c1713e/image.png)

*Occupation* will only contain one of the following values: **Doctor**, **Professor**, **Singer** or **Actor**.

**Sample Input**

An **OCCUPATIONS** table that contains the following records:

![image.png](The%20PADS%20150bdab6415180279628d4eca5c1713e/image%201.png)

**Sample Output**

```sql
Ashely(P)
Christeen(P)
Jane(A)
Jenny(D)
Julia(A)
Ketty(P)
Maria(A)
Meera(S)
Priya(S)
Samantha(D)
There are a total of 2 doctors.
There are a total of 2 singers.
There are a total of 3 actors.
There are a total of 3 professors.
```

**Explanation**

The results of the first query are formatted to the problem description's specifications.

The results of the second query are ascendingly ordered first by number of names corresponding to each profession ($2\leq2\leq3\leq3$), and then alphabetically by profession ($doctor\leq singer$ and $actor \leq professor$).

### 문제 접근

### 쿼리 작성 (오답)

```sql
SELECT
    CONCAT(Name, '(', LEFT(Occupation, 1), ')') AS Name,
    CONCAT('There are a total of', ' ', COUNT(*)) AS count,
    CONCAT(LOWER(Occupation), '.')
FROM
    Occupations
GROUP BY
    Occupation, Name
ORDER BY
    LEFT(Name, 1) ASC;
```

### 정답 쿼리

```sql
SELECT 
    CONCAT(Name, '(', LEFT(Occupation, 1), ')') AS formatted_name
FROM 
    Occupations
ORDER BY 
    Name ASC;
    
SELECT 
    CONCAT('There are a total of ', COUNT(*), ' ', LOWER(Occupation), 's.') AS occupation_count
FROM 
    Occupations
GROUP BY 
    Occupation
ORDER BY 
    COUNT(*) ASC, Occupation ASC;
```

- 출력 결과 통합???
    - 이 두 쿼리는 독립적으로 실행되어 두 개의 출력 결과를 제공합니다. 문제에서 요구한 두 가지 결과를 동시에 출력해야 하므로, 각 쿼리를 따로 실행한 후 통합하면 됩니다. MySQL에서는 두 쿼리를 한 번에 실행하는 기능은 없으므로, 결과를 각각 확인해야 합니다.
    - 이 쿼리들을 실행하면 문제에서 제시한 조건에 부합하는 결과를 얻을 수 있습니다.