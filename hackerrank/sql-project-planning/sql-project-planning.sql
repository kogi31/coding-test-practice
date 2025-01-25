WITH GroupedProjects AS (
    SELECT 
        Task_ID,
        Start_Date,
        End_Date,
        Start_Date - ROW_NUMBER() OVER (ORDER BY Start_Date) AS group_id
    FROM 
        Projects
),
ProjectSummary AS (
    SELECT 
        MIN(Start_Date) AS project_start_date,
        MAX(End_Date) AS project_end_date,
        MAX(End_Date) - MIN(Start_Date) + 1 AS project_duration
    FROM 
        GroupedProjects
    GROUP BY 
        group_id
)
SELECT 
    project_start_date,
    project_end_date
FROM 
    ProjectSummary
ORDER BY 
    project_duration ASC,
    project_start_date ASC;