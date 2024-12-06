# 37. Draw The Triangle 2

난이도: Easy
URL: https://www.hackerrank.com/challenges/draw-the-triangle-2/problem?isFullScreen=true
사이트: hackerrank
완료여부: Yes

### 문제

*P(R)* represents a pattern drawn by Julia in *R* rows. The following pattern represents *P(5)*:

```
*
* *
* * *
* * * *
* * * * *
```

Write a query to print the pattern *P(20)*.

### 문제 접근

- CREATE RECURCIVE CTE
- REPEAT 문자열 반복 출력
- SELECT 20 AS S
- SELECT S - 1
- WHERE S > 1
- REPEAT ‘*’
- ORDER BY S