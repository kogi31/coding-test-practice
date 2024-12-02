# 29. Weather Observation Station 19

난이도: Easy
URL: https://www.hackerrank.com/challenges/weather-observation-station-19?isFullScreen=true

### 문제

Consider $P_1(a,c)$ and $P_2(b,d)$ to be two points on a 2D plane where $(a, b)$ are the respective minimum and maximum values of *Northern Latitude* (*LAT_N*) and $(c, d)$ are the respective minimum and maximum values of *Western Longitude* (*LONG_W*) in **STATION**.

Query the [Euclidean Distance](https://en.wikipedia.org/wiki/Euclidean_distance) between points $P_1$ and $P_2$ and *format your answer* to display 4 decimal digits.

**Input Format**

The **STATION** table is described as follows:

![image.png](29%20Weather%20Observation%20Station%2019%20150bdab641518083969fd57e28b7a2b3/image.png)

where *LAT_N* is the northern latitude and *LONG_W* is the western longitude.

### 문제 접근

1. power(max(lat_n) - min(lat_n), 2) + power(max(long_w) - min(long_w), 2)
2. sqrt
3. round answer to 4 decimal places