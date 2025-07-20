CREATE DATABASE WorkForce_Case_Study_4

USE WorkForce_Case_Study_4

Select * FROM Workforce_salary

EXEC SP_help 'Workforce_salary' 

SELECT COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Workforce_salary';


/*
TASK 1

Investigating the job market based on company size in 2021: 
Task: You need to count how many employees are working in 
different companies, categorized by size (S, M, L).

*/

SELECT  WORK_YEAR,company_size, COUNT(*) AS CompanySize_Count 
FROM Workforce_Salary
WHERE WORK_YEAR = 2021
GROUP BY company_size, work_year

-- BY SUBQUERY
SELECT  WORK_YEAR,company_size, COUNT(*) AS CompanySize_Count 
FROM Workforce_Salary
GROUP BY company_size, work_year
HAVING WORK_YEAR IN (
SELECT work_year FROM Workforce_Salary 
WHERE work_year = 2021
)


/*
TASK 2

Top 3 job titles with the highest average salary for part-time positions in 2023: 
Task: Identify the highest-paying job titles for part-time positions while 
ensuring you only include countries with more than 50 employees. 

*/
Select TOP 3 company_location,Job_title, AVG(Salary) as AverageSalary
FROM Workforce_salary
WHERE work_year = 2023 AND employment_type = 'PT'
GROUP BY Job_title, company_location
--HAVING COUNT(*) > 50
ORDER BY AverageSalary DESC

WITH CountryCounts AS (
    SELECT company_location
    FROM workforce_salary
    WHERE work_year = 2023 AND employment_type = 'PT'
    GROUP BY company_location
    HAVING COUNT(*) > 50
)

SELECT TOP 3 job_title, 
       ROUND(AVG(salary_in_usd), 2) AS AverageSalary
FROM workforce_salary
WHERE work_year = 2023 
  AND employment_type = 'PT'
  AND company_location IN (SELECT company_location FROM CountryCounts)
GROUP BY job_title
ORDER BY AverageSalary DESC;


/*
TASK 3
Countries where mid-level salary is higher than the overall mid-level salary in 2023: 

Task: Identify countries where the average salary for mid-level employees (MI) is greater than the overall average for that level.
*/
Select * FROM Workforce_salary


 SELECT company_location, AVG(salary) AS mid_level_avg
FROM Workforce_Salary
WHERE work_year = 2023 AND experience_level = 'MI'
GROUP BY company_location
HAVING AVG(salary) > (
SELECT AVG(salary) FROM Workforce_Salary
    WHERE work_year = 2023 
	AND experience_level = 'MI');

/*
TASK 4

Highest and lowest average salary locations for senior-level employees in 2023: 
Task: Identify which countries pay senior level (SE) employees the highest and lowest average salaries.

*/

WITH cte_Average 
AS
(
SELECT company_location, AVG(salary) AS AVG_SALARY
FROM Workforce_Salary
WHERE work_year = 2023 AND experience_level = 'SE'
GROUP BY company_location
)
SELECT TOP 1 * FROM cte_Average
ORDER BY AVG_SALARY ASC

SELECT TOP 1 * FROM cte_Average
ORDER BY AVG_SALARY DESC






/*
TASK 5

Salary growth rates by job title:

Task: Calculate the percentage increase in salaries for various job titles between two years (e.g., 2023 and 2024).

*/

WITH Salary_2023 AS (
    SELECT 
        job_title,
        AVG(salary) AS avg_salary_2023
    FROM Workforce_Salary
    WHERE work_year = 2023
    GROUP BY job_title
),
Salary_2024 AS (
    SELECT 
        job_title,
        AVG(salary) AS avg_salary_2024
    FROM Workforce_Salary
    WHERE work_year = 2024
    GROUP BY job_title
)

SELECT 
    s23.job_title,
    ROUND(((s24.avg_salary_2024 - s23.avg_salary_2023) / s23.avg_salary_2023) * 100, 2) AS percentage_increase
FROM Salary_2023 s23
JOIN Salary_2024 s24 
ON s23.job_title = s24.job_title
ORDER BY percentage_increase DESC;


/*
TASK 6
Top three countries with the highest salary growth for entry-level positions. 

Task: Find the countries with the most significant salary growth in 

*/

WITH Salary_2020 AS (
    SELECT 
        company_location,
        AVG(salary) AS avg_salary_2020
    FROM Workforce_Salary
    WHERE work_year = 2020
    GROUP BY company_location
),
Salary_2023 AS (
    SELECT 
        company_location,
        AVG(salary) AS avg_salary_2023
    FROM Workforce_Salary
    WHERE work_year = 2023
    GROUP BY company_location
)

SELECT 
    s20.company_location,
    ROUND(((s23.avg_salary_2023 - s20.avg_salary_2020) / NULLIF(s20.avg_salary_2020, 0)) * 100, 2) AS percentage_increase
FROM Salary_2020 s20
JOIN Salary_2023 s23 ON s20.company_location = s23.company_location
ORDER BY percentage_increase DESC;


/*
TASK7
Updating remote work ratio for employees earning more than $90,000 in the US and AU: 

Task: Update the remote_ratio for employees based on their salary and location.
*/

UPDATE WORKFORCE_SALARY
SET remote_ratio = 100
WHERE salary_in_usd = 90000 AND company_location IN('US','AU');

Select company_location, remote_ratio,salary_in_usd FROM Workforce_salary
WHERE salary_in_usd = 90000


/*
TASK 8
Salary updates based on percentage increases by level in 
Task: Update the salaries for various experience levels (SE, MI, etc.) according to predefined percentage increases.
*/
select * from Workforce_Salary

UPDATE Workforce_Salary
SET Salary_in_USD = CASE 
    WHEN Experience_Level = 'SE' THEN Salary_in_USD * 1.10
    WHEN Experience_Level = 'MI' THEN Salary_in_USD * 1.12
    WHEN Experience_Level = 'EN' THEN Salary_in_USD * 1.08
    WHEN Experience_Level = 'EX' THEN Salary_in_USD * 1.15
    ELSE Salary_in_USD
END;
 /*
TASK 9
Year with the highest average salary for each job title: 
Task: Identify which year had the highest average salary for each job title.
*/

WITH JobTitleSalaryRank AS (
    SELECT 
        Job_Title,
        Work_Year,
        AVG(Salary_in_USD) AS Avg_Salary,
        RANK() OVER (PARTITION BY Job_Title ORDER BY AVG(Salary_in_USD) DESC) AS salary_rank
    FROM Workforce_Salary
    GROUP BY Job_Title, Work_Year
	order by Avg_Salary DESC
)
SELECT Job_Title, Work_Year, Avg_Salary
FROM JobTitleSalaryRank
WHERE salary_rank = 1;


/*
TASK 10
Percentage of employment types for different job titles: 
Task: Calculate the percentage of full-time and part-time employees for each job title. 
*/
SELECT 
    Job_Title,
    Employment_Type,
    COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (PARTITION BY Job_Title) AS Percentage
FROM Workforce_Salary
GROUP BY Job_Title, Employment_Type
ORDER BY Job_Title, Percentage DESC;


/*
TASK 11
COUNTRIES OFFERING FULL REMOTE WORK FOR MANAGERS WITH SALARIES OVER $90,000: 
TASK: FIND COUNTRIES WHERE MANAGERS EARN MORE THAN $90,000 AND WORK FULLY REMOTELY. 
*/
SELECT DISTINCT employee_residence AS country
FROM Workforce_Salary
WHERE job_title LIKE '%Manager%'
  AND salary_in_usd > 90000
  AND remote_ratio = 100;


/*
TASK 12
Top 5 countries with the most large companies: companies. 
Task: Identify which countries have the highest number of large 
*/

SELECT TOP 5 company_location AS country,
       COUNT(*) AS large_company_count
FROM Workforce_Salary
WHERE company_size = 'L'
GROUP BY company_location
ORDER BY large_company_count DESC


/*
TASK 13
Percentage of employees with fully remote roles earning more than $100,000: 
Task: Calculate the percentage of fully remote employees earning more than $100,000. 
*/
SELECT 
  ROUND(
    (COUNT(*) * 100.0) / 
    (SELECT COUNT(*) FROM workforce_salary WHERE remote_ratio = 100),
    2
  ) AS percentage_high_earning_remote
FROM workforce_salary
WHERE remote_ratio = 100
  AND salary_in_usd > 100000;


/*
TASK 14
Locations where entry-level average salaries exceed market average for entry level: 
Task: Identify locations where entrylevel salaries surpass the market average. 
*/
SELECT company_location, 
       ROUND(AVG(salary_in_usd), 2) AS avg_entry_salary
FROM workforce_salary
WHERE experience_level = 'EN'
GROUP BY company_location
HAVING AVG(salary_in_usd) > (
    SELECT AVG(salary_in_usd)
    FROM workforce_salary
    WHERE experience_level = 'EN'
);


/*
TASK 15
Countries paying the maximum average salary for each job title: 
Task: For each job title, identify which country pays the highest average salary. 
*/
WITH avg_salaries AS (
  SELECT job_title, 
         company_location, 
         ROUND(AVG(salary_in_usd), 2) AS avg_salary
  FROM workforce_salary
  GROUP BY job_title, company_location
),
ranked_salaries AS (
  SELECT *, 
         ROW_NUMBER() OVER (PARTITION BY job_title ORDER BY avg_salary DESC) AS rn
  FROM avg_salaries
)
SELECT job_title, company_location, avg_salary
FROM ranked_salaries
WHERE rn = 1;


/*
TASK 16
Countries with sustained salary growth over three years: 
Task: Identify countries with consistent salary growth over the past three years. 
*/
WITH yearly_avg AS (
  SELECT 
    company_location,
    work_year,
    ROUND(AVG(salary_in_usd), 2) AS avg_salary
  FROM workforce_salary
  GROUP BY company_location, work_year
),
ranked_avg AS (
  SELECT *,
         ROW_NUMBER() OVER (PARTITION BY company_location ORDER BY work_year) AS year_rank
  FROM yearly_avg
),
pivoted AS (
  SELECT 
    company_location,
    MAX(CASE WHEN year_rank = 1 THEN avg_salary END) AS year1,
    MAX(CASE WHEN year_rank = 2 THEN avg_salary END) AS year2,
    MAX(CASE WHEN year_rank = 3 THEN avg_salary END) AS year3
  FROM ranked_avg
  GROUP BY company_location
)
SELECT company_location, year1, year2, year3
FROM pivoted
WHERE year1 < year2 AND year2 < year3;


/*
TASK 17
PERCENTAGE OF FULLY REMOTE WORK BY EXPERIENCE LEVEL (2021 VS 2024): 
TASK: COMPARE THE ADOPTION OF FULLY REMOTE WORK ACROSS EXPERIENCE LEVELS BETWEEN 2021 AND 2024.
*/
WITH experience_remote AS (
  SELECT 
    experience_level,
    work_year,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN remote_ratio = 100 THEN 1 ELSE 0 END) AS fully_remote
  FROM workforce_salary
  WHERE work_year IN (2021, 2024)
  GROUP BY experience_level, work_year
)
SELECT 
  experience_level,
  work_year,
  ROUND((fully_remote * 100.0) / total_employees, 2) AS percent_fully_remote
FROM experience_remote
ORDER BY experience_level, work_year;


/*
TASK 18
: 
Average salary increase percentage by experience level and job title(2023 to 2024)
Task: Calculate the average salary increase for each experience level and job title. 
*/

WITH avg_salary_by_year AS (
  SELECT 
    experience_level,
    job_title,
    work_year,
    ROUND(AVG(salary_in_usd), 2) AS avg_salary
  FROM workforce_salary
  WHERE work_year IN (2023, 2024)
  GROUP BY experience_level, job_title, work_year
)

SELECT 
  a.experience_level,
  a.job_title,
  a.avg_salary AS avg_salary_2023,
  b.avg_salary AS avg_salary_2024,
  ROUND(((b.avg_salary - a.avg_salary) * 100.0) / a.avg_salary, 2) AS salary_increase_percentage
FROM avg_salary_by_year a
JOIN avg_salary_by_year b 
  ON a.experience_level = b.experience_level
  AND a.job_title = b.job_title
  AND a.work_year = 2023 
  AND b.work_year = 2024
ORDER BY salary_increase_percentage DESC;


/*
TASK 19
Role-based access control for employees based on experience level 
Task: Implement security to restrict access based on an employee's experience level.
*/



/*
TASK 20
Guiding clients in switching domains based on salary insights: 
Task: Based on an employee's data (experience, job title, location), suggest new domains they can transition to, based on salary trends. 
*/
SELECT 
  job_title,
  experience_level,
  company_location,
  ROUND(AVG(salary_in_usd), 2) AS avg_salary
FROM workforce_salary
GROUP BY job_title, experience_level, company_location;


-- Find better-paying roles than current salary
SELECT 
  job_title,
  experience_level,
  company_location,
  ROUND(AVG(salary_in_usd), 2) AS avg_salary
FROM workforce_salary
WHERE experience_level = 'MI'  -- Change as per client
  AND company_location = 'India'  -- Change as per client
GROUP BY job_title, experience_level, company_location
HAVING AVG(salary_in_usd) > 80000  -- Assume current salary is $80K
ORDER BY avg_salary DESC;
