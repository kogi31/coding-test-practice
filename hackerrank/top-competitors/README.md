# 46. Top Competitors

난이도: Medium
URL: https://www.hackerrank.com/challenges/full-score?isFullScreen=true
날짜: December 8, 2024
사이트: hackerrank
완료여부: Yes

### 문제

Julia just finished conducting a coding contest, and she needs your help assembling the leaderboard! Write a query to print the respective *hacker_id* and *name* of hackers who achieved full scores for *more than one* challenge. Order your output in descending order by the total number of challenges in which the hacker earned a full score. If more than one hacker received full scores in same number of challenges, then sort them by ascending *hacker_id*.

**Input Format**

The following tables contain contest data:

- *Hackers:* The *hacker_id* is the id of the hacker, and *name* is the name of the hacker.

![image.png](46%20Top%20Competitors%20150bdab64151803a8ed8dcb67466cf2b/image.png)

- *Difficulty:* The *difficult_level* is the level of difficulty of the challenge, and *score* is the score of the challenge for the difficulty level.

![image.png](46%20Top%20Competitors%20150bdab64151803a8ed8dcb67466cf2b/image%201.png)

- *Challenges:* The *challenge_id* is the id of the challenge, the *hacker_id* is the id of the hacker who created the challenge, and *difficulty_level* is the level of difficulty of the challenge.

![image.png](46%20Top%20Competitors%20150bdab64151803a8ed8dcb67466cf2b/image%202.png)

- *Submissions:* The *submission_id* is the id of the submission, *hacker_id* is the id of the hacker who made the submission, *challenge_id* is the id of the challenge that the submission belongs to, and *score* is the score of the submission.

![image.png](46%20Top%20Competitors%20150bdab64151803a8ed8dcb67466cf2b/image%203.png)

**Sample Input**

*Hackers* Table:

![image.png](46%20Top%20Competitors%20150bdab64151803a8ed8dcb67466cf2b/image%204.png)

*Difficulty* Table:

![image.png](46%20Top%20Competitors%20150bdab64151803a8ed8dcb67466cf2b/image%205.png)

*Challenges* Table:

![image.png](46%20Top%20Competitors%20150bdab64151803a8ed8dcb67466cf2b/image%206.png)

*Submissions* Table:

![image.png](46%20Top%20Competitors%20150bdab64151803a8ed8dcb67466cf2b/image%207.png)

**Sample Output**

```sql
90411 Joe
```

**Explanation**

Hacker *86870* got a score of *30* for challenge *71055* with a difficulty level of *2*, so *86870* earned a full score for this challenge.

Hacker *90411* got a score of *30* for challenge *71055* with a difficulty level of *2*, so *90411* earned a full score for this challenge.

Hacker *90411* got a score of *100* for challenge *66730* with a difficulty level of *6*, so *90411* earned a full score for this challenge.

Only hacker *90411* managed to earn a full score for more than one challenge, so we print the their *hacker_id* and *name* as 2 space-separated values.

### 문제 접근

1. **조인** : 여러 테이블에서 필요한 데이터를 결합
2. **조건부 필터링** : 만점 제출만 선택
3. **집계 및 조건** : 만점 횟수를 기준으로 두 개 이상인 해커만 포함
4. **정렬** : 만점 횟수와 해커 ID를 기준으로 정렬