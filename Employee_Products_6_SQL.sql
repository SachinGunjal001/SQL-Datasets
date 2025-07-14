CREATE DATABASE EmployeeDetails_6

USE EmployeeDetails_6

CREATE TABLE EmployeeDetails_table(
EmployeeID INT PRIMARY KEY NOT NULL,
FirstName VARCHAR(50),
LastName VARCHAR(50),
Salary DECIMAL(10,2),
JoiningDate DATE,
Department VARCHAR(15),
Gender VARCHAR(10)
)


INSERT INTO EmployeeDetails_table (EmployeeID, FirstName, LastName, Salary, JoiningDate, Department, Gender) VALUES
(1, 'Vikas', 'Ahlawat', 600000.00, '2013-02-12 11:16:00', 'IT', 'Male'),
(2, 'nikita', 'Jain', 530000.00, '2013-02-14 11:16:00', 'HR', 'Female'),
(3, 'Ashish', 'Kumar', 1000000.00, '2013-02-14 11:16:00', 'IT', 'Male'),
(4, 'Nikhil', 'Sharma', 480000.00, '2013-02-15 11:16:00', 'HR', 'Male'),
(5, 'anish', 'kadian', 500000.00, '2013-02-16 11:16:00', 'Paroll', 'Male');


SELECT * FROM EmployeeDetails_table

ALTER TABLE EmployeeDetails_table
ALTER COLUMN JOININGDATE DATETIME

--1. Write a query to get all employee detail from "EmployeeDetail" table 
SELECT * FROM EmployeeDetails_table


--2. Write a query to get only "FirstName" column from "EmployeeDetail" table 
SELECT FIRSTNAME FROM EmployeeDetails_table


--3. Write a query to get FirstName in upper case as "First Name". 
SELECT UPPER(FIRSTNAME) FROM EmployeeDetails_table


--4. Write a query to get FirstName in upper case as "First Name".
SELECT UPPER(FIRSTNAME) FROM EmployeeDetails_table


--5. Write a query for combine FirstName and LastName and display it as "Name" (also include white space between first name & last name) 
SELECT CONCAT(FIRSTNAME, ' ', LASTNAME) AS FullName FROM EmployeeDetails_table

--i. Select employee detail whose name is "Vikas 
SELECT * FROM EmployeeDetails_table
WHERE FirstName = 'Vikas'

--ii. Get all employee detail from EmployeeDetail table whose "FirstName" start with latter 'a'. 
SELECT * FROM EmployeeDetails_table
WHERE FIRSTNAME LIKE 'A%'

--iv. Get all employee details from EmployeeDetail table whose "FirstName" end with 'h' 
SELECT * FROM EmployeeDetails_table
WHERE FIRSTNAME LIKE '%h'

--6. Get all employee detail from EmployeeDetail table whose "FirstName" start with any single character between 'a-p' 
SELECT * FROM EmployeeDetails_table
WHERE LEFT(FIRSTNAME,1) BETWEEN 'A' AND 'P'


--8.Get all employee detail from EmployeeDetail table whose "Gender" end with 'le' and contain 4 letters. The Underscore(_) Wildcard Character represents any single character 
SELECT * FROM EmployeeDetails_table
WHERE Gender LIKE '__le'

--9.  Get all employee detail from EmployeeDetail table whose "FirstName" start with 'A' and contain 5 letters 
SELECT * FROM EmployeeDetails_table
WHERE FIRSTNAME LIKE 'A____'

--10.  Get all employee detail from EmployeeDetail table whose "FirstName" containing '%'. ex:-"Vik%as".
SELECT * 
FROM EmployeeDetails_table
WHERE FirstName LIKE '%\%%' ESCAPE '\';


--11.  Get all unique "Department" from EmployeeDetail table 
SELECT DISTINCT Department FROM EmployeeDetails_table

--12.  Get the highest "Salary" from EmployeeDetail table. 
SELECT MAX(SALARY) AS MaxSalary FROM EmployeeDetails_table

--13.  Get the lowest "Salary" from EmployeeDetail table 
SELECT MIN(SALARY) AS MinSalary FROM EmployeeDetails_table

--14.  Show "JoiningDate" in "dd mmm yyyy" format, ex- "15 Feb 2013 

SELECT FORMAT(JoiningDate, 'dd MMM yyyy') AS Formatted_JoiningDate
FROM EmployeeDetails_table;

--15. Show "JoiningDate" in "yyyy/mm/dd" format, ex- "2013/02/15" 
SELECT FORMAT(JoiningDate, 'yyyy/mm/dd') AS Formatted_JoiningDate
FROM EmployeeDetails_table;

--16. Show only time part of the "JoiningDate" 
 SELECT FORMAT(JoiningDate, 'HH:MM:00') AS TIME
FROM EmployeeDetails_table;


--17. Get only Year part of "JoiningDate" 
 SELECT YEAR(JoiningDate) AS YEAR
FROM EmployeeDetails_table;

--18. Get only Month part of "JoiningDate” 
 SELECT MONTH(JoiningDate) AS MONTH
FROM EmployeeDetails_table;

--19. Get system date 
SELECT GETDATE()

--20. Get UTC date. 
SELECT GETUTCDATE() AS Current_UTC_Date;

--a. Get the first name, current date, joiningdate and diff between current date and joining date in months. 
SELECT FirstName, GetDate(), JoiningDate, DATEDIFF(MONTH,JoiningDate, GetDate() )AS TotalMonths FROM EmployeeDetails_table

--21. Get the first name, current date, joiningdate and diff between current date and joining date in days. 
SELECT FirstName, GetDate(), JoiningDate, DATEDIFF(DAY,JoiningDate, GetDate() )AS TotalDays FROM EmployeeDetails_table

--22.  Get all employee details from EmployeeDetail table whose joining year is 2013
 SELECT YEAR(JoiningDate) AS JOINING_YEAR
FROM EmployeeDetails_table
WHERE YEAR(JoiningDate) = 2013

--23. Get all employee details from EmployeeDetail table whose joining month is Jan(1) 
 SELECT month(JoiningDate) AS JOINING_MONTH
FROM EmployeeDetails_table
WHERE month(JoiningDate) = 1


--25. Get how many employee exist in "EmployeeDetail" table 

SELECT count(*) Total_Employee FROM EmployeeDetails_table

--26. Select only one/top 1 record from "EmployeeDetail" table 
SELECT TOP 1 *  FROM EmployeeDetails_table


27. Select all employee detail with First name "Vikas","Ashish", and "Nikhil". 
SELECT FirstName  
FROM EmployeeDetails_table
WHERE FirstName IN ('Vikas', 'Ashish', 'Nikhil');



-- 28. Select all employee detail with First name not in "Vikas","Ashish", and "Nikhil" 

SELECT FirstName  
FROM EmployeeDetails_table
WHERE FirstName NOT IN ('Vikas', 'Ashish', 'Nikhil');


--29. Select first name from "EmployeeDetail" table after removing white spaces from right side 
SELECT RTRIM(FirstName) AS Trimmed_FirstName
FROM EmployeeDetails_table;

--30. Select first name from "EmployeeDetail" table after removing white spaces from left side 
SELECT LTRIM(FirstName) AS Trimmed_FirstName
FROM EmployeeDetails_table;

--31. Display first name and Gender as M/F.(if male then M, if Female then F) 
SELECT FIRSTNAME, 
				CASE
				WHEN Gender =  'MALE' THEN 'M'
				WHEN Gender = 'FEMALE' THEN 'F'
				ELSE Gender
				END AS UPDATED_GENDER
FROM EmployeeDetails_table

--32. Select first name from "EmployeeDetail" table prifixed with "Hello 
SELECT CONCAT('Hello ', firstname) as updatedFirstName FROM EmployeeDetails_table

--33. Get employee details from "EmployeeDetail" table whose Salary greater than 600000 
SELECT SALARY FROM EmployeeDetails_table
WHERE SALARY > 600000                

--34. Get employee details from "EmployeeDetail" table whose Salary less than 700000 
SELECT SALARY FROM EmployeeDetails_table
WHERE SALARY < 700000   

--35. Get employee details from "EmployeeDetail" table whose Salary between 500000 than 600000

SELECT SALARY FROM EmployeeDetails_table
WHERE SALARY BETWEEN 500000 AND 600000  



CREATE TABLE ProjectDetail (
    ProjectDetailID INT PRIMARY KEY,
    EmployeeDetailID INT,
    ProjectName VARCHAR(50)
);


INSERT INTO ProjectDetail (ProjectDetailID, EmployeeDetailID, ProjectName) VALUES
(1, 1, 'Task Track'),
(2, 1, 'CLP'),
(3, 1, 'Survey Managment'),
(4, 2, 'HR Managment'),
(5, 3, 'Task Track'),
(6, 3, 'GRS'),
(7, 3, 'DDS'),
(8, 4, 'HR Managment'),
(9, 6, 'GL Managment');

SELECT * FROM ProjectDetail
SELECT * FROM EmployeeDetails_table


-- 1. Give records of ProjectDetail table 
SELECT * FROM ProjectDetail

--2. Write the query to get the department and department wise total(sum) salary from "EmployeeDetail" table. 

SELECT Department, SUM(SALARY) AS DepartmentWiseSalary FROM EmployeeDetails_table
GROUP BY DEPARTMent


--3. Write the query to get the department and department wise total(sum) salary, display it in ascending order according to salary. 
SELECT Department, SUM(SALARY) AS DepartmentWiseSalary FROM EmployeeDetails_table
GROUP BY DEPARTMENT
ORDER BY SUM(SALARY) ASC


--4. Write the query to get the department and department wise total(sum) salary, display it in descending order according to salary 

SELECT Department, SUM(SALARY) AS DepartmentWiseSalary FROM EmployeeDetails_table
GROUP BY DEPARTMENT
ORDER BY SUM(SALARY) DESC

-- 5. Write the query to get the department, total no. of departments, total(sum) salary with respect to department from "EmployeeDetail" table. 

SELECT Department,COUNT(*) TotalDepartment, SUM(SALARY) AS DepartmentWiseSalary 
FROM EmployeeDetails_table
GROUP BY DEPARTMENT

-- 6. Get department wise average salary from "EmployeeDetail" table order by salary ascending 
SELECT DEPARTMENT, AVG(SALARY) AS AverageSalary FROM EmployeeDetails_table
GROUP BY Department
ORDER BY AVG(SALARY) ASC

--7. Get department wise maximum salary from "EmployeeDetail" table order by salary ascending 
SELECT DEPARTMENT, MAX(SALARY) AS AverageSalary FROM EmployeeDetails_table
GROUP BY Department
ORDER BY MAX(SALARY) ASC

--8. Get department wise minimum salary from "EmployeeDetail" table order by salary ascending. 
SELECT DEPARTMENT, MIN(SALARY) AS AverageSalary FROM EmployeeDetails_table
GROUP BY Department
ORDER BY MIN(SALARY) ASC

--10. Join both the table that is Employee and ProjectDetail based on some common paramter 

SELECT PD.ProjectDetailID,ED.*, PD.ProjectName FROM ProjectDetail PD
LEFT JOIN
EmployeeDetails_table ED
ON
PD.EmployeeDetailID = ED.EmployeeID

SELECT * FROM ProjectDetail
SELECT * FROM EmployeeDetails_table

--11. Get employee name, project name order by firstname from "EmployeeDetail" and "ProjectDetail" for those employee which have assigned project already. 

SELECT ED.FirstName +' '+ ED.LastName  AS FullName, PD.ProjectName  FROM ProjectDetail PD
INNER JOIN
EmployeeDetails_table ED
ON
PD.EmployeeDetailID = ED.EmployeeID
ORDER BY ed.FirstName


--12. Get employee name, project name order by firstname from "EmployeeDetail" and "ProjectDetail" for all employee even they have not assigned project. 
SELECT ED.FirstName +' '+ ED.LastName  AS FullName, PD.ProjectName  FROM ProjectDetail PD
LEFT JOIN
EmployeeDetails_table ED
ON
PD.EmployeeDetailID = ED.EmployeeID
ORDER BY ed.FirstName


-- 13. Get employee name, project name order by firstname from "EmployeeDetail" and "ProjectDetail" for all employee if project is not assigned then display "-No Project Assigned" 

SELECT ED.FirstName,
  ISNULL(PD.ProjectName, '-No Project Assigned') AS ProjectName
FROM EmployeeDetails_table ED
LEFT JOIN ProjectDetail PD
  ON ED.EmployeeID = PD.EmployeeDetailID
ORDER BY ED.FirstName;


--14. Get all project name even they have not matching any employeeid, in left table, order by firstname from "EmployeeDetail" and "ProjectDetail 

SELECT ED.FirstName +' '+ ED.LastName  AS FullName, PD.ProjectName  FROM ProjectDetail PD
RIGHT JOIN
EmployeeDetails_table ED
ON
PD.EmployeeDetailID = ED.EmployeeID
ORDER BY ed.FirstName


--15. Get complete record (employeename, project name) from both tables ([EmployeeDetail],[ProjectDetail]), if no match found in any table then show NULL 

SELECT ED.FirstName +' '+ ED.LastName  AS FullName, PD.ProjectName  FROM ProjectDetail PD
FULL OUTER JOIN
EmployeeDetails_table ED
ON
PD.EmployeeDetailID = ED.EmployeeID


--18. Write down the query to fetch EmployeeName & Project who has assign more than one project 

SELECT ED.FirstName, PD.ProjectName AS No_of_Project  FROM ProjectDetail PD
INNER JOIN
EmployeeDetails_table ED
ON
PD.EmployeeDetailID = ED.EmployeeID
WHERE PD.EmployeeDetailID IN (
SELECT EmployeeDetailID FROM ProjectDetail
GROUP BY EmployeeDetailID
HAVING COUNT(*)>1)

SELECT ed.FirstName, count(*) AS No_of_Project  FROM ProjectDetail PD
full outer JOIN
EmployeeDetails_table ED
ON
PD.EmployeeDetailID = ED.EmployeeID
GROUP BY ed.FirstName
HAVING COUNT(*)>1

--19. Write down the query to fetch ProjectName on which more than one employee are working along with EmployeeName 

SELECT ed.FirstName, pd.ProjectName  FROM ProjectDetail PD
INNER JOIN
EmployeeDetails_table ED
ON
PD.EmployeeDetailID = ED.EmployeeID
WHERE PD.ProjectName IN (
SELECT ProjectName FROM ProjectDetail
GROUP BY ProjectName
HAVING COUNT(DISTINCT EmployeeDetailID) >1)


--20. Apply Cross Join in Both the tables

SELECT *  FROM ProjectDetail PD
CROSS JOIN
EmployeeDetails_table ED
