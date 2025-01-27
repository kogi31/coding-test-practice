# Challenges

난이도: Medium
URL: https://www.hackerrank.com/challenges/challenges?isFullScreen=true
날짜: January 25, 2025
사이트: hackerrank
완료여부: Yes

### 문제

Julia asked her students to create some coding challenges. Write a query to print the *hacker_id*, *name*, and the total number of challenges created by each student. Sort your results by the total number of challenges in descending order. If more than one student created the same number of challenges, then sort the result by *hacker_id*. If more than one student created the same number of challenges and the count is less than the maximum number of challenges created, then exclude those students from the result.

**Input Format**

The following tables contain challenge data:

- *Hackers:* The *hacker_id* is the id of the hacker, and *name* is the name of the hacker.

![image.png](Challenges%20150bdab6415180cf9320c552a47639ae/image.png)

*Challenges:* The *challenge_id* is the id of the challenge, and *hacker_id* is the id of the student who created the challenge.

![image.png](Challenges%20150bdab6415180cf9320c552a47639ae/image%201.png)

**Sample Input 0**

*Hackers* Table:

![image.png](Challenges%20150bdab6415180cf9320c552a47639ae/image%202.png)

*Challenges* Table:

![image.png](Challenges%20150bdab6415180cf9320c552a47639ae/image%203.png)

**Sample Output 0**

```
21283 Angela 6
88255 Patrick 5
96196 Lisa 1

```

**Sample Input 1**

*Hackers* Table:

![image.png](Challenges%20150bdab6415180cf9320c552a47639ae/image%204.png)

*Challenges* Table:

![image.png](Challenges%20150bdab6415180cf9320c552a47639ae/image%205.png)

**Sample Output 1**

```
12299 Rose 6
34856 Angela 6
79345 Frank 4
80491 Patrick 3
81041 Lisa 1

```

**Explanation**

For *Sample Case 0*, we can get the following details:

![image.png](Challenges%20150bdab6415180cf9320c552a47639ae/image%206.png)

Students 5077 and 62743 both created 4 challenges, but the maximum number of challenges created is 6 so these students are excluded from the result.

For *Sample Case 1*, we can get the following details:

![image.png](Challenges%20150bdab6415180cf9320c552a47639ae/image%207.png)

Students 12299 and 34856 both created 6 challenges. Because 6 is the maximum number of challenges created, these students are included in the result.

### 문제 접근

### 작성 쿼리(오답)

```sql
/*
print hacker_id, name, total number of challenges by each student
total number of challenges desc, hacker_id asc
*/
SELECT
    C.hacker_id,
    H.name,
    COUNT(C.challenge_id) AS challenges_created
FROM
    Hackers AS H
JOIN
    Challenges AS C
    ON H.hacker_id = C.hacker_id
GROUP BY
    C.hacker_id, H.name
ORDER BY
    challenges_created DESC, C.hacker_id ASC;
```

### 오답 설명

**문제 1: 최대값보다 작은 challenges_created에서 동일한 값 처리**

쿼리는 모든 학생들을 challenges_created의 내림차순으로 정렬합니다. 그러나 문제의 조건 중 하나는 **“최대값보다 작은 challenges_created 값에서 동일한 값을 가진 학생들을 제외”**하는 것입니다.

예를 들어:

•	학생 A와 학생 B가 각각 4개의 챌린지를 만들었지만, 최대값이 6일 경우, 4개의 챌린지를 만든 학생들은 출력에 포함되지 않아야 합니다.

현재 쿼리는 이 조건을 충족하지 않습니다.

**문제 2: 중복 제거 기준**

GROUP BY는 학생별로 challenge_id를 그룹화하고 COUNT()를 사용해 챌린지 개수를 세는 것은 올바른 접근입니다. 그러나 “최대값보다 작은 동일한 challenges_created 값 제외” 조건을 처리하기 위해 추가적인 서브쿼리나 필터링 단계가 필요합니다.

### **해결 방법**

1.	**최대값 계산:**

최대 challenges_created 값을 계산하기 위해 서브쿼리를 사용해야 합니다. 이 값을 기준으로 동일한 challenges_created 값을 가진 학생들을 포함하거나 제외할 수 있습니다.

2.	**서브쿼리로 필터링:**

HAVING 조건을 사용해 최대값에 해당하지 않는 중복된 challenges_created 값을 제거합니다.

### 수정 쿼리

```sql
WITH ChallengeCounts AS (
    SELECT
        C.hacker_id,
        H.name,
        COUNT(C.challenge_id) AS challenges_created
    FROM
        Hackers AS H
    JOIN
        Challenges AS C
        ON H.hacker_id = C.hacker_id
    GROUP BY
        C.hacker_id, H.name
),
MaxChallenges AS (
    SELECT MAX(challenges_created) AS max_created
    FROM ChallengeCounts
)
SELECT
    hacker_id,
    name,
    challenges_created
FROM
    ChallengeCounts
WHERE
    challenges_created = (SELECT max_created FROM MaxChallenges)
   OR challenges_created < (SELECT max_created FROM MaxChallenges)
   AND challenges_created NOT IN (
       SELECT challenges_created
       FROM ChallengeCounts
       WHERE challenges_created < (SELECT max_created FROM MaxChallenges)
       GROUP BY challenges_created
       HAVING COUNT(*) > 1
   )
ORDER BY
    challenges_created DESC,
    hacker_id ASC;
```

### 쿼리 설명

1.	ChallengeCounts**:**

각 학생의 challenges_created 값을 계산합니다.

2.	MaxChallenges**:**

최대 challenges_created 값을 계산합니다.

3.	**조건 필터링:**

•	최대값(max_created)을 가진 학생은 무조건 포함합니다.

•	최대값보다 작은 동일한 challenges_created 값을 가진 학생은 제외합니다.

4.	**정렬:**

challenges_created 기준으로 내림차순 정렬하고, 동일한 값이 있을 경우 hacker_id 기준으로 오름차순 정렬합니다.