# Print Prime Numbers

난이도: Medium
URL: https://www.hackerrank.com/challenges/print-prime-numbers?isFullScreen=true
날짜: January 25, 2025
사이트: hackerrank
완료여부: Yes

### 문제

Write a query to print all *prime numbers* less than or equal to ***1000***. Print your result on a single line, and use the ampersand (&) character as your separator (instead of a space).

For example, the output for all prime numbers $\leq 10$ would be:

```
2&3&5&7
```

### 문제 접근

1. WITH RECURSIVE Numbers
    - 재귀형 CTE 사용해 숫자 2부터 1000까지 생성
    - 기본 단계(SELECT 2)는 숫자 2를 포함하며, 재귀 단계(SELECT n + 1 FROM Numbers WHERE n + 1 <= 1000)는 이전 숫자에 1을 더해 1000까지 생성
2. PrimeNumbers
    - 소수는 자기 자신보다 작은 숫자로 나누어떨어지지 않는 숫자로 정의
    - NOT EXISTS 서브쿼리를 사용해 자기 자신보다 작은 숫자 중 나누어떨어지는 숫자가 없음을 확인함
3. GROUP_CONCAT
    - GROUP_CONCAT(n SEPARATOR '&')는 소수들을 &로 연결된 하나의 문자열로 변환
    - 이는 MySQL의 문자열 집계 함수로, 다른 DBMS에서는 적합한 문자열 집계 함수를 사용해야 함

### 작성 쿼리

```sql
WITH RECURSIVE Numbers AS (
    SELECT 2 AS n
    UNION ALL
    SELECT n + 1
    FROM Numbers
    WHERE n + 1 <= 1000
),
PrimeNumbers AS (
    SELECT n
    FROM Numbers
    WHERE NOT EXISTS (
        SELECT 1
        FROM Numbers AS Divisors
        WHERE Divisors.n < Numbers.n
          AND Numbers.n % Divisors.n = 0
    )
)
SELECT GROUP_CONCAT(n SEPARATOR '&') AS prime_numbers
FROM PrimeNumbers;
```