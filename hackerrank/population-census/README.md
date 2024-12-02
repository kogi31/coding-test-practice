# 27. Population Census

난이도: Easy
URL: https://www.hackerrank.com/challenges/asian-population?isFullScreen=true

### 문제

Given the **CITY** and **COUNTRY** tables, query the sum of the populations of all cities where the *CONTINENT* is *'Asia'*.

**Note:** *CITY.CountryCode* and *COUNTRY.Code* are matching key columns.

**Input Format**

The **CITY** and **COUNTRY** tables are described as follows:

![image.png](27%20Population%20Census%20150bdab6415180c68016e83173c24e33/image.png)

![image.png](27%20Population%20Census%20150bdab6415180c68016e83173c24e33/image%201.png)

### 문제 접근

1. sum city.population
2. join on city.countrycode = country.code
3. country.continent = ‘asia’