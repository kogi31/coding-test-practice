# 34. Average Population of Each Continent

난이도: Easy
URL: https://www.hackerrank.com/challenges/average-population-of-each-continent?isFullScreen=true

### 문제

Given the **CITY** and **COUNTRY** tables, query the names of all the continents (*COUNTRY.Continent*) and their respective average city populations (*CITY.Population*) rounded *down* to the nearest integer.

**Note:** *CITY.CountryCode* and *COUNTRY.Code* are matching key columns.

**Input Format**

The **CITY** and **COUNTRY** tables are described as follows:

![image.png](34%20Average%20Population%20of%20Each%20Continent%20150bdab6415180a7af24cd61f6cabcac/image.png)

![image.png](34%20Average%20Population%20of%20Each%20Continent%20150bdab6415180a7af24cd61f6cabcac/image%201.png)

### 문제 접근

1. average city.population
2. groupby continent
3. join on city.countrycode = country.code