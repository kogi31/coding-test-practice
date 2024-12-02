# 30. Weather Observation Station 18

난이도: Easy
URL: https://www.hackerrank.com/challenges/weather-observation-station-18?isFullScreen=true

### 문제

Consider $P_1(a,b)$ and $P_2(c, d)$  to be two points on a *2D* plane.

- happens to equal the minimum value in *Northern a Latitude* (*LAT_N* in **STATION**).
- happens to equal the minimum value in *Western b Longitude* (*LONG_W* in **STATION**).
- happens to equal the maximum value in *Northern c Latitude* (*LAT_N* in **STATION**).
- happens to equal the maximum value in *Western d Longitude* (*LONG_W* in **STATION**).

Query the [Manhattan Distance](https://xlinux.nist.gov/dads/HTML/manhattanDistance.html) between points $P_1$ and $P_2$ and round it to a scale of 4 decimal places.

**Input Format**

The **STATION** table is described as follows:

![image.png](30%20Weather%20Observation%20Station%2018%20150bdab6415180c3b96edc3fe66c24c0/image.png)

where *LAT_N* is the northern latitude and *LONG_W* is the western longitude.

### 문제 접근

1. abs(max_a - min_a) + abs(max_b - min_b)
2. round answer to 4 decimal places