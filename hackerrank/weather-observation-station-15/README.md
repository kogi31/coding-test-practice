# 24. Weather Observation Station 15

난이도: Easy
URL: https://www.hackerrank.com/challenges/weather-observation-station-15?isFullScreen=true

### 문제

Query the *Western Longitude* (*LONG_W*) for the largest *Northern Latitude* (*LAT_N*) in **STATION** that is less than 137.2345. Round your answer to 4 decimal places.

**Input Format**

The **STATION** table is described as follows:

![image.png](24%20Weather%20Observation%20Station%2015%20150bdab64151807f94cbfa53403d70df/image.png)

where *LAT_N* is the northern latitude and *LONG_W* is the western longitude.

### 문제 접근

1. lat_n < 137.2345
2. lat_n desc
3. limit 1
4. round answer to 4 decimal places