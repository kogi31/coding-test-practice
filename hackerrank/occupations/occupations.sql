WITH Ranked_Occupations AS (
    SELECT 
        Name,
        Occupation,
        ROW_NUMBER() OVER (PARTITION BY Occupation ORDER BY Name) AS RowNum
    FROM 
        Occupations
),
Pivoted_Occupations AS (
    SELECT
        MAX(CASE WHEN Occupation = 'Doctor' THEN Name END) AS Doctor,
        MAX(CASE WHEN Occupation = 'Professor' THEN Name END) AS Professor,
        MAX(CASE WHEN Occupation = 'Singer' THEN Name END) AS Singer,
        MAX(CASE WHEN Occupation = 'Actor' THEN Name END) AS Actor,
        RowNum
    FROM 
        Ranked_Occupations
    GROUP BY 
        RowNum
)
SELECT 
    Doctor, 
    Professor, 
    Singer, 
    Actor
FROM 
    Pivoted_Occupations;