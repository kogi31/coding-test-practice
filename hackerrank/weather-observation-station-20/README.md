# 48. Weather Observation Station 20

난이도: Medium
URL: https://www.hackerrank.com/challenges/weather-observation-station-20?isFullScreen=true
날짜: December 8, 2024
사이트: hackerrank
완료여부: Yes

### 문제

A [*median*](https://en.wikipedia.org/wiki/Median) is defined as a number separating the higher half of a data set from the lower half. Query the *median* of the *Northern Latitudes* (*LAT_N*) from **STATION** and round your answer to 4 decimal places.

**Input Format**

The **STATION** table is described as follows:

![image.png](48%20Weather%20Observation%20Station%2020%20150bdab6415180c0b9b6f82081059536/image.png)

where *LAT_N* is the northern latitude and *LONG_W* is the western longitude.

### 문제 접근

1. **정렬 및 데이터 준비**
    - 정렬된 데이터를 기반으로 중앙값 위치를 파악
2. **짝수와 홀수 처리 분리**
    - 중앙값이 한 값인지 평균 값인지 논리를 나눠 처리
3. **CTE 활용**
    - 각각의 계산 단계를 분리하여 쿼리를 간결하고 효율적으로 작성
4. **최종 결과 출력**
    - 중앙값을 계산하고 소수점 4자리로 반올림