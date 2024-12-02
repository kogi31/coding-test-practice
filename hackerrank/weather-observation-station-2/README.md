# 21. Weather Observation Station 2

난이도: Easy
URL: https://www.hackerrank.com/challenges/weather-observation-station-2?isFullScreen=true

### 문제

Query the following two values from the **STATION** table:

1. The sum of all values in *LAT_N* rounded to a scale of 2 decimal places.
2. The sum of all values in *LONG_W* rounded to a scale of 2 decimal places.

**Input Format**

The **STATION** table is described as follows:

![image.png](21%20Weather%20Observation%20Station%202%20150bdab6415180239c6bda1c78f43ac6/image.png)

where *LAT_N* is the northern latitude and *LONG_W* is the western longitude.

**Output Format**

Your results must be in the form:

```sql
lat lon
```

where ***lat*** is the sum of all values in *LAT_N* and ***lon*** is the sum of all values in *LONG_W*. Both results must be rounded to a scale of 2 decimal places.

### 문제 접근

1. sum lat_n
2. sum long_w
3. round answer to 2 decimal places