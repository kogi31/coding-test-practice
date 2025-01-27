SELECT 
    CONCAT(Name, '(', LEFT(Occupation, 1), ')') AS formatted_name
FROM 
    Occupations
ORDER BY 
    Name ASC;
    
SELECT 
    CONCAT('There are a total of ', COUNT(*), ' ', LOWER(Occupation), 's.') AS occupation_count
FROM 
    Occupations
GROUP BY 
    Occupation
ORDER BY 
    COUNT(*) ASC, Occupation ASC;