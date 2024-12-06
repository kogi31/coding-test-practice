# 45. Draw The Triangle 1

난이도: Easy
URL: https://www.hackerrank.com/challenges/draw-the-triangle-1?isFullScreen=true
사이트: hackerrank
완료여부: Yes

### 문제

*P(R)* represents a pattern drawn by Julia in *R* rows. The following pattern represents *P(5)*:

```
* * * * *
* * * *
* * *
* *
*

```

Write a query to print the pattern *P(20)*.

### 문제 접근

1. 패턴 이해하기
- 각 행에서 출력되는 별(*)의 개수는  R 행부터 시작하여 매 행마다 하나씩 줄어듭니다.
- P(20) 에서는 20개의 별로 시작하여 마지막 행에는 1개의 별이 출력됩니다.
1. 재귀 CTE 설계
- 초기 조건
- 첫 번째 행은  20 개의 별로 시작.
- 재귀 조건:
- 별 개수를 하나씩 줄여서 다음 행을 생성.
- 종료 조건:
- 별의 개수가 0이 되면 재귀를 종료.
1. 결과 출력
- 각 행의 별 개수만큼 *를 반복하여 문자열로 출력.