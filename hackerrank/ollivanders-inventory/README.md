# Ollivander's Inventory

난이도: Medium
URL: https://www.hackerrank.com/challenges/harry-potter-and-wands/problem?isFullScreen=true
사이트: hackerrank
완료여부: No

### 문제

Harry Potter and his friends are at Ollivander's with Ron, finally replacing Charlie's old broken wand.

Hermione decides the best way to choose is by determining the minimum number of gold galleons needed to buy each *non-evil* wand of high power and age. Write a query to print the *id*, *age*, *coins_needed*, and *power* of the wands that Ron's interested in, sorted in order of descending *power*. If more than one wand has same power, sort the result in order of descending *age*.

**Input Format**

The following tables contain data on the wands in Ollivander's inventory:

- *Wands:* The *id* is the id of the wand, *code* is the code of the wand, *coins_needed* is the total number of gold galleons needed to buy the wand, and *power* denotes the quality of the wand (the higher the power, the better the wand is).

![image.png](Ollivander's%20Inventory%20150bdab641518045be89dabc643ef9a6/image.png)

*Wands_Property:* The *code* is the code of the wand, *age* is the age of the wand, and *is_evil* denotes whether the wand is good for the dark arts. If the value of *is_evil* is *0*, it means that the wand is not evil. The mapping between *code* and *age* is one-one, meaning that if there are two pairs, $(code_1, age_1)$ and $(code_2, age_2)$, then  $code_1 \neq code_2$ and $age_1 \neq age_2$.

![image.png](Ollivander's%20Inventory%20150bdab641518045be89dabc643ef9a6/image%201.png)

**Sample Input**

*Wands* Table:

![image.png](Ollivander's%20Inventory%20150bdab641518045be89dabc643ef9a6/image%202.png)

*Wands_Property* Table:

![image.png](Ollivander's%20Inventory%20150bdab641518045be89dabc643ef9a6/image%203.png)

**Sample Output**

```sql
9 45 1647 10
12 17 9897 10
1 20 3688 8
15 40 6018 7
19 20 7651 6
11 40 7587 5
10 20 504 5
18 40 3312 3
20 17 5689 3
5 45 6020 2
14 40 5408 1
```

**Explanation**

The data for wands of *age 45* (code 1):

![image.png](Ollivander's%20Inventory%20150bdab641518045be89dabc643ef9a6/image%204.png)

- The minimum number of galleons needed for $wand(age = 45, power = 2) = 6020$
- The minimum number of galleons needed for $wand(age = 45, power = 10) = 1647$

The data for wands of *age 40* (code 2):

![image.png](Ollivander's%20Inventory%20150bdab641518045be89dabc643ef9a6/image%205.png)

- The minimum number of galleons needed for $wand(age=40,power=1)=5408$
- The minimum number of galleons needed for $wand(age=40,power=3)=3312$
- The minimum number of galleons needed for $wand(age=40,power=5)=7587$
- The minimum number of galleons needed for $wand(age=40,power=7)=6018$

The data for wands of *age 20* (code 4):

![image.png](Ollivander's%20Inventory%20150bdab641518045be89dabc643ef9a6/image%206.png)

- The minimum number of galleons needed for $wand(age=20,power=5)=504$
- The minimum number of galleons needed for $wand(age=20,power=6)=7651$
- The minimum number of galleons needed for $wand(age=20,power=8)=3688$

The data for wands of *age 17* (code 5):

![image.png](Ollivander's%20Inventory%20150bdab641518045be89dabc643ef9a6/image%207.png)

- The minimum number of galleons needed for $wand(age=17, power=3)=5689$
- The minimum number of galleons needed for $wand(age=17, power=10)=9897$

### 문제 접근

- 비악마적인 지팡이 중 (필터링) WHERE is_evil = 0
- 높은 파워 & 나이에 따라 가장 적은 골드 갤리온으로 구매할 수 있는 지팡이
- id, age, coins_needed, power 출력
- power 내림차순, age 내림차순age 내림차순

### 작성 쿼리 (오답)

```sql
SELECT
    W.id,
    P.age,
    W.coins_needed,
    W.power
FROM
    Wands AS W
JOIN
    Wands_Property AS P
    ON W.code = P.code
WHERE
    P.is_evil = 0
GROUP BY
    W.power, P.age
HAVING
    MIN(coins_needed)
ORDER BY
    W.power DESC, P.age DESC;
```

### 쿼리 리뷰

**문제점 1: GROUP BY와 HAVING**

- **문제**
    - GROUP BY를 사용했지만, SELECT에 포함된 모든 컬럼(예: W.id, W.coins_needed)이 GROUP BY에 포함되지 않았음
    - SQL에서는 GROUP BY로 그룹화되지 않은 컬럼은 집계 함수와 함께 사용해야 함
    - 즉, W.id와 같은 컬럼은 GROUP BY 없이 바로 사용할 수 없음
- **해결 방법**
    - 최저 비용(MIN(coins_needed))을 찾고 해당 레코드의 다른 컬럼을 반환하려면 **서브쿼리**를 활용해야 함

**문제점 2: HAVING 사용 오류**

- **문제**
    - HAVING MIN(coins_needed)는 잘못된 구문입니다. **HAVING 조건에서는 직접적으로 집계된 결과를 조건으로 지정**해야 함.
    - HAVING MIN(coins_needed)는 명확하지 않으며 실행되지 않음
- **해결 방법**
    - HAVING 구문 대신 서브쿼리나 JOIN을 활용하여 최소 비용을 가진 행만 필터링해야 함

**문제점 3: GROUP BY로 올바른 행 필터링 실패**

- **문제**
    - GROUP BY를 사용하면 그룹별로 집계된 값만 반환하므로, W.id 같은 개별 행 정보를 포함한 결과를 얻을 수 없다.
- **해결 방법**
    - 서브쿼리로 power와 age별 최소 비용을 찾은 후, 이를 원래 테이블과 JOIN하여 해당 행의 정보를 가져온다.

### 수정한 쿼리

```sql
SELECT
    W.id,
    P.age,
    W.coins_needed,
    W.power
FROM
    Wands AS W
JOIN
    Wands_Property AS P
    ON W.code = P.code
WHERE
    P.is_evil = 0
    AND W.coins_needed = (
        SELECT
            MIN(W1.coins_needed)
        FROM
            Wands AS W1
        JOIN
            Wands_Property AS P1
            ON W1.code = P1.code
        WHERE
            W1.power = W.power
            AND P1.age = P.age
            AND P1.is_evil = 0
    )
ORDER BY
    W.power DESC,
    P.age DESC;
```

### 쿼리 설명

1. JOIN
    - Wands와 Wands_Property를 code를 기준으로 조인하여 필요한 데이터를 모두 가져온다.
2. WHERE **조건**
    - P.is_evil = 0 : 비악마적인 지팡이만 필터링
    - W.coins_needed = (서브쿼리): 서브쿼리를 사용하여 power와 age 조합별 최소 비용을 가진 행만 선택
3. **서브쿼리**
    - SELECT MIN(W1.coins_needed): 각 power와 age 조합에 대해 최소 비용 계산
    - 서브쿼리는 동일한 power와 age 조건을 만족하는 지팡이 중 최소 비용을 가진 값 반환
4. ORDER BY
    - W.power DESC: 파워를 기준으로 내림차순 정렬
    - P.age DESC: 같은 파워의 경우 나이를 기준으로 내림차순 정렬