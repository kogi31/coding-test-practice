# SQL Project Planning

난이도: Medium
URL: https://www.hackerrank.com/challenges/sql-projects?isFullScreen=true
날짜: January 24, 2025
사이트: hackerrank
완료여부: Yes

### 문제

You are given a table, *Projects*, containing three columns: *Task_ID*, *Start_Date* and *End_Date*. It is guaranteed that the difference between the *End_Date* and the *Start_Date* is equal to *1* day for each row in the table.

![image.png](SQL%20Project%20Planning%20150bdab6415180878612fb9ba3ca225f/image.png)

If the *End_Date* of the tasks are consecutive, then they are part of the same project. Samantha is interested in finding the total number of different projects completed.

Write a query to output the start and end dates of projects listed by the number of days it took to complete the project in ascending order. If there is more than one project that have the same number of completion days, then order by the start date of the project.

**Sample Input**

![image.png](SQL%20Project%20Planning%20150bdab6415180878612fb9ba3ca225f/image%201.png)

**Sample Output**

```
2015-10-28 2015-10-29
2015-10-30 2015-10-31
2015-10-13 2015-10-15
2015-10-01 2015-10-04
```

**Explanation**

The example describes following *four* projects:

- *Project 1*: Tasks *1*, *2* and *3* are completed on consecutive days, so these are part of the project. Thus start date of project is *2015-10-01* and end date is *2015-10-04*, so it took *3 days* to complete the project.
- *Project 2*: Tasks *4* and *5* are completed on consecutive days, so these are part of the project. Thus, the start date of project is *2015-10-13* and end date is *2015-10-15*, so it took *2 days* to complete the project.
- *Project 3*: Only task *6* is part of the project. Thus, the start date of project is *2015-10-28* and end date is *2015-10-29*, so it took *1 day* to complete the project.
- *Project 4*: Only task *7* is part of the project. Thus, the start date of project is *2015-10-30* and end date is *2015-10-31*, so it took *1 day* to complete the project.

### 문제 해설

- 작업의 시작 날짜와 종료 날짜를 기준으로 연속적으로 이어지는 작업들을 하나의 프로젝트로 간주
- 프로젝트와 시잘 날짜와 종료 날짜 조회
- 정렬
    - 프로젝트가 완료되는데 걸린 일수 (종료 날짜 - 시작 날짜 + 1) 기준으로 오름차순 정렬
    - 프로젝트의 시잘 날짜 기준 오름차순 정렬

### 문제 접근

- 연속된 작업 그룹화
    - ROW_NUMBER()
    - DENSE_RANK()
- 그룹별 최소 및 최대 날짜 계산
- 프로젝트 기간 및 정렬

### 쿼리 설명

1. **GroupedProjects**
    1. ROW_NUMBER() OVER (ORDER BY Start_Date)를 통해 각 작업에 순서를 부여
    2. Start_Date - ROW_NUMBER()를 계산하여 작업의 연속성을 확인하고, 동일한 그룹으로 묶음
2. **ProjectSummary**
    1. 각 그룹(group_id)에 대해 최소 Start_Date와 최대 End_Date 계산
    2. 프로젝트 기간 계산 (project_duration)
3. **최종 결과 출력**
    1. project_start_date와 project_end_date 출력
    2. project_duration과 project_start_date 기준 정렬