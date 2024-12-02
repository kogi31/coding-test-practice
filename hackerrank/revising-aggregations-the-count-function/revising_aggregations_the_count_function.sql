SELECT  COUNT(NAME) => COUNT(*)
/* null 값이 있을 수 있기 때문에 또는 의도를 파악하기 쉽게 모든 행을 count 해라 */
  FROM  CITY
 WHERE  POPULATION > 100000;