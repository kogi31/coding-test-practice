# Write your MySQL query statement below
WITH ProcessTime AS (
    SELECT  machine_id,
            process_id,
            MAX(CASE WHEN activity_type = 'end' THEN timestamp ELSE NULL END) -
            MAX(CASE WHEN activity_type = 'start' THEN timestamp ELSE NULL END) AS processing_time
      FROM  Activity
     GROUP
        BY  machine_id, process_id
)
SELECT  machine_id,
        ROUND(AVG(processing_time), 3) AS processing_time
  FROM  ProcessTime
 GROUP
    BY  machine_id;