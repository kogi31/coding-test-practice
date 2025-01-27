# Occupations

난이도: Medium
URL: https://www.hackerrank.com/challenges/occupations?isFullScreen=true
날짜: January 26, 2025
사이트: hackerrank
완료여부: Yes

### 문제

[Pivot](https://en.wikipedia.org/wiki/Pivot_table) the *Occupation* column in **OCCUPATIONS** so that each *Name* is sorted alphabetically and displayed underneath its corresponding *Occupation*. The output column headers should be *Doctor*, *Professor*, *Singer*, and *Actor*, respectively.

**Note:** Print **NULL** when there are no more names corresponding to an occupation.

**Input Format**

The **OCCUPATIONS** table is described as follows:

![image.png](Occupations%20150bdab641518034bd46c115e23439a6/image.png)

*Occupation* will only contain one of the following values: **Doctor**, **Professor**, **Singer** or **Actor**.

**Sample Input**

![image.png](Occupations%20150bdab641518034bd46c115e23439a6/image%201.png)

**Sample Output**

```
Jenny    Ashley     Meera  Jane
Samantha Christeen  Priya  Julia
NULL     Ketty      NULL   Maria
```

**Explanation**

The first column is an alphabetically ordered list of Doctor names.

The second column is an alphabetically ordered list of Professor names.

The third column is an alphabetically ordered list of Singer names.

The fourth column is an alphabetically ordered list of Actor names.

The empty cell data for columns with less than the maximum number of names per occupation (in this case, the Professor and Actor columns) are filled with **NULL** values.

### 문제 접근

- pivot 형태 변환
- 직업별로 이름 정리, 이름 알파벳 순서대로 출력
- 부족한 부분은 null로 채우기

**접근 방법**

1.	**직업별 이름 정렬**

•	각 직업에 대해 이름을 알파벳 순서로 정렬한 결과를 준비합니다.

2.	**직업별 최대 이름 수 확인**

•	각 직업에서 이름의 최대 개수를 계산하여 테이블의 행 수를 결정합니다.

3.	**NULL 추가**

•	이름이 부족한 직업의 경우, 부족한 만큼 NULL 값을 추가하여 행 수를 맞춥니다.

4.	**피벗(Pivot) 변환**

•	직업별 데이터를 한 행에 묶어서 출력하도록 변환합니다.

### 작성 쿼리

```sql
WITH Ranked_Occupations AS (
    SELECT 
        Name,
        Occupation,
        ROW_NUMBER() OVER (PARTITION BY Occupation ORDER BY Name) AS RowNum
    FROM 
        Occupations
),
Pivoted_Occupations AS (
    SELECT
        MAX(CASE WHEN Occupation = 'Doctor' THEN Name END) AS Doctor,
        MAX(CASE WHEN Occupation = 'Professor' THEN Name END) AS Professor,
        MAX(CASE WHEN Occupation = 'Singer' THEN Name END) AS Singer,
        MAX(CASE WHEN Occupation = 'Actor' THEN Name END) AS Actor,
        RowNum
    FROM 
        Ranked_Occupations
    GROUP BY 
        RowNum
)
SELECT 
    Doctor, 
    Professor, 
    Singer, 
    Actor
FROM 
    Pivoted_Occupations;
```