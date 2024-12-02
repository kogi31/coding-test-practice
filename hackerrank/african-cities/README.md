# 17. African Cities

난이도: Easy
URL: https://www.hackerrank.com/challenges/african-cities?isFullScreen=true

### 문제

Given the **CITY** and **COUNTRY** tables, query the names of all cities where the *CONTINENT* is *'Africa'*.

**Note:** *CITY.CountryCode* and *COUNTRY.Code* are matching key columns.

**Input Format**

The **CITY** and **COUNTRY** tables are described as follows:

![image.png](17%20African%20Cities%20150bdab641518005bf83fb6059d963c9/image.png)

![image.png](17%20African%20Cities%20150bdab641518005bf83fb6059d963c9/image%201.png)

### 문제 접근

1. select city.name
2. join on city.countrycode = country.code
3. countrxy.continent=’africa’