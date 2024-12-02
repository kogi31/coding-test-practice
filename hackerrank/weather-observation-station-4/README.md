# 26. Weather Observation Station 4

난이도: Easy
URL: https://www.hackerrank.com/challenges/weather-observation-station-4/problem?isFullScreen=true

### 문제

Find the difference between the total number of **CITY** entries in the table and the number of distinct **CITY** entries in the table. The **STATION** table is described as follows:

![image.png](26%20Weather%20Observation%20Station%204%20150bdab64151807db988c235b2512e9c/image.png)

where **LAT_N** is the northern latitude and **LONG_W** is the western longitude.

For example, if there are three records in the table with **CITY** values 'New York', 'New York', 'Bengalaru', there are 2 different city names: 'New York' and 'Bengalaru'. The query returns , because

***total number of records - number of unique city names = 3 - 2 = 1***

### 문제 접근

1. count city
2. count distinct city