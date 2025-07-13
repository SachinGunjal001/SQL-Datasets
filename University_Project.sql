
CREATE DATABASE University_DataBase_Prj

USE University_DataBase_Prj

CREATE TABLE College_Table(
 College_ID INT PRIMARY KEY NOT NULL,
 College_Name VARCHAR(100) NOT NULL,
 College_Area VARCHAR(100) NOT NULL
 );

 INSERT INTO College_Table (College_ID, College_Name, College_Area) VALUES
(1, 'Sunrise Institute', 'Pune'),
(2, 'Global Tech University', 'Mumbai'),
(3, 'Skyline College', 'Delhi'),
(4, 'Greenfield University', 'Bangalore'),
(5, 'Northern Heights College', 'Chennai'),
(6, 'Central State University', 'Hyderabad'),
(7, 'Western Valley Institute', 'Jaipur'),
(8, 'Southern Star College', 'Kolkata'),
(9, 'Innovation Hub College', 'Ahmedabad'),
(10, 'Modern Knowledge University', 'Nagpur');

SELECT * FROM College_Table



 CREATE TABLE Department_Table(
 Dept_ID INT PRIMARY KEY NOT NULL,
 Dept_Name VARCHAR(100) NOT NULL,
 Dept_Facility VARCHAR(100) NOT NULL,
 College_ID INT,
 FOREIGN KEY (College_ID) REFERENCES College_Table(College_ID)
 );

 INSERT INTO Department_Table (Dept_ID, Dept_Name, Dept_Facility, College_ID) VALUES
(101, 'Computer Science', 'AI Lab', 1),
(102, 'Mechanical', 'Robotics Lab', 2),
(103, 'Electronics', 'Circuit Design Lab', 3),
(104, 'Civil Engineering', 'Structure Lab', 4),
(105, 'Electrical', 'Power Systems Lab', 5),
(106, 'Information Tech', 'Coding Hub', 6),
(107, 'Pharmacy', 'Chemistry Lab', 7),
(108, 'Architecture', 'Design Studio', 8),
(109, 'Management', 'Conference Rooms', 9),
(110, 'Physics', 'Research Lab', 10);

SELECT * FROM Department_Table


 CREATE TABLE Professor_Table(
 Professor_ID INT PRIMARY KEY NOT NULL,
 Professor_Name VARCHAR(100),
 Professor_Subject VARCHAR(100)
 );

 INSERT INTO Professor_Table (Professor_ID, Professor_Name, Professor_Subject) VALUES
(201, 'Dr. Neha Sharma', 'Data Structures'),
(202, 'Dr. Ravi Patil', 'Thermodynamics'),
(203, 'Dr. Ayesha Khan', 'Digital Circuits'),
(204, 'Dr. Karan Mehta', 'Concrete Tech'),
(205, 'Dr. Meena Desai', 'Electrical Machines'),
(206, 'Dr. Sandeep Roy', 'Database Systems'),
(207, 'Dr. Pooja Nair', 'Pharmacology'),
(208, 'Dr. Harshit Joshi', 'Urban Design'),
(209, 'Dr. Jyoti Singh', 'Marketing Strategy'),
(210, 'Dr. Anand Rathi', 'Quantum Physics');

SELECT * FROM Professor_Table


 CREATE TABLE Student_Table(
 Student_ID INT PRIMARY KEY NOT NULL,
 Student_Name VARCHAR(100),
 Student_Stream VARCHAR(100),
 Professor_ID INT,
 FOREIGN KEY (Professor_ID) REFERENCES  Professor_Table(Professor_ID)
 );

 INSERT INTO Student_Table (Student_ID, Student_Name, Student_Stream, Professor_ID) VALUES
(301, 'Amit Rawat', 'B.Tech CS', 201),
(302, 'Sneha More', 'B.Tech ME', 202),
(303, 'Ravi Thakur', 'B.Tech EC', 203),
(304, 'Komal Jadhav', 'B.Tech CE', 204),
(305, 'Farhan Shaikh', 'B.Tech EE', 205),
(306, 'Anjali Reddy', 'B.Tech IT', 206),
(307, 'Nikhil Shelar', 'B.Pharm', 207),
(308, 'Riya Sen', 'B.Arch', 208),
(309, 'Suresh Dey', 'MBA', 209),
(310, 'Kavita Pillai', 'B.Sc Physics', 210);

SELECT * FROM STUDENT_TABLE


SELECT * FROM College_Table
SELECT * FROM Department_Table
SELECT * FROM Professor_Table
SELECT * FROM STUDENT_TABLE

-- TASK 2

--1. Give the information of College_ID and College_name from College_Table 

SELECT College_ID, College_Name FROM College_Table

--2. Show Top 5 rows from Student table. 

SELECT TOP 5 * FROM STUDENT_TABLE


--3. What is the name of professor whose ID is 5 

SELECT * FROM Professor_Table
WHERE Professor_ID = 205

--4. Convert the name of the Professor into Upper case

SELECT UPPER(Professor_Name) as Capitalized_Prof_Name FROM Professor_Table

--5. Show me the names of those students whose name is start with a 

SELECT * FROM STUDENT_TABLE
WHERE Student_Name LIKE 'A%'

--6. Give the name of those colleges whose end with a 

SELECT * FROM College_Table
WHERE College_Name LIKE '%a'

--7. Add one Salary Column in Professor_Table 

ALTER TABLE Professor_Table
ADD Salary DECIMAL(10,2);

SELECT * FROM Professor_Table

--8. Add one Contact Column in Student_table 

ALTER TABLE STUDENT_TABLE
ADD Contact_Number INT

ALTER TABLE STUDENT_TABLE
ALTER COLUMN CONTACT_NUMBER BIGINT

UPDATE Student_Table SET Contact_Number = 9686785755 WHERE Student_ID = 301;
UPDATE Student_Table SET Contact_Number = 9823456712 WHERE Student_ID = 302;
UPDATE Student_Table SET Contact_Number = 9876543210 WHERE Student_ID = 303;
UPDATE Student_Table SET Contact_Number = 9123456789 WHERE Student_ID = 304;
UPDATE Student_Table SET Contact_Number = 9765432180 WHERE Student_ID = 305;
UPDATE Student_Table SET Contact_Number = 9898989898 WHERE Student_ID = 306;
UPDATE Student_Table SET Contact_Number = 9345678901 WHERE Student_ID = 307;
UPDATE Student_Table SET Contact_Number = 9786453210 WHERE Student_ID = 308;
UPDATE Student_Table SET Contact_Number = 9234567890 WHERE Student_ID = 309;
UPDATE Student_Table SET Contact_Number = 9001234567 WHERE Student_ID = 310;

SELECT * FROM Student_Table

--9. Find the total Salary of Professor 

UPDATE Professor_Table SET SALARY = 75000 WHERE Professor_ID = 201;
UPDATE Professor_Table SET SALARY = 72000 WHERE Professor_ID = 202;
UPDATE Professor_Table SET SALARY = 70000 WHERE Professor_ID = 203;
UPDATE Professor_Table SET SALARY = 73000 WHERE Professor_ID = 204;
UPDATE Professor_Table SET SALARY = 71000 WHERE Professor_ID = 205;
UPDATE Professor_Table SET SALARY = 76000 WHERE Professor_ID = 206;
UPDATE Professor_Table SET SALARY = 69000 WHERE Professor_ID = 207;
UPDATE Professor_Table SET SALARY = 74000 WHERE Professor_ID = 208;
UPDATE Professor_Table SET SALARY = 72000 WHERE Professor_ID = 209;
UPDATE Professor_Table SET SALARY = 77000 WHERE Professor_ID = 210;

SELECT * FROM Professor_Table

ALTER TABLE Professor_Table
ALTER COLUMN Salary DECIMAL(10,1); 

SELECT SUM(SALARY) AS Total_Professor_Salary 
FROM Professor_Table

--10. Change datatype of any one column of any one Table

ALTER TABLE PROFESSOR_TABLE
ALTER COLUMN SALARY VARCHAR(50);

EXEC sp_help 'PROFESSOR_TABLE'

SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Professor_Table';



- -- TASK :03

--1. Show first 5 records from Students table and Professor table Combine 

SELECT TOP 5 ST.Student_ID, ST.Student_Name, ST.Student_Stream, ST.CONTACT_NUMBER,
PT.Professor_ID, PT.Professor_Name, PT.Professor_Subject, PT.SALARY
FROM Student_Table ST
INNER JOIN 
Professor_Table PT
ON
ST.Professor_ID = PT.Professor_ID


--2. Apply Inner join on all 4 tables together(Syntax is mandatory) 


ALTER TABLE PROFESSOR_TABLE
ADD DEPT_ID INT

ALTER TABLE Professor_Table
ADD CONSTRAINT FK_Professor_Department
FOREIGN KEY (Dept_ID)
REFERENCES Department_Table(Dept_ID);

UPDATE Professor_Table SET Dept_ID = 101 WHERE Professor_ID = 201;
UPDATE Professor_Table SET Dept_ID = 102 WHERE Professor_ID = 202;
UPDATE Professor_Table SET Dept_ID = 103 WHERE Professor_ID = 203;
UPDATE Professor_Table SET Dept_ID = 104 WHERE Professor_ID = 204;
UPDATE Professor_Table SET Dept_ID = 105 WHERE Professor_ID = 205;
UPDATE Professor_Table SET Dept_ID = 106 WHERE Professor_ID = 206;
UPDATE Professor_Table SET Dept_ID = 107 WHERE Professor_ID = 207;
UPDATE Professor_Table SET Dept_ID = 108 WHERE Professor_ID = 208;
UPDATE Professor_Table SET Dept_ID = 109 WHERE Professor_ID = 209;
UPDATE Professor_Table SET Dept_ID = 110 WHERE Professor_ID = 210;

SELECT CT.College_Name, DT.Dept_Name, ST.Student_Name, PT.Professor_Name
FROM College_Table CT
INNER JOIN 
Department_Table DT 
ON CT.College_ID = DT.College_ID
INNER JOIN 
Professor_Table PT 
ON DT.Dept_ID = PT.Dept_ID
INNER JOIN 
Student_Table ST 
ON ST.Professor_ID = PT.Professor_ID;



--3. Show Some null values from Department table and Professor table. 

UPDATE Department_Table
SET Dept_Name = 'NULL'
WHERE Dept_ID = 105;

UPDATE Professor_Table
SET Salary = 'NULL'
WHERE Professor_ID = 204;

UPDATE Professor_Table
SET Salary = CAST(Salary AS DECIMAL(10,1))
WHERE Professor_ID = 204;


SELECT DT.Dept_Name, PT.Salary FROM DEPARTMENT_TABLE DT
LEFT JOIN
Professor_Table PT
ON 
DT.Dept_ID = PT.DEPT_ID




-- 4. Create a View from College Table and give those records whose college name starts with C

CREATE VIEW CollegeNamesWith_C
AS
SELECT * FROM College_Table
WHERE College_Name LIKE 'C%'

SELECT College_Name FROM CollegeNamesWith_C


-- 5. Create Stored Procedure of Professor table whatever customer ID will be given by user it should show whole records of it.

CREATE PROCEDURE Find_Details
@Cust_id INT
AS
BEGIN

SELECT * FROM Professor_Table
WHERE Professor_ID = @CUST_ID;

END

EXEC Find_Details 207


-- 6. Rename the College_Table to College_Tables_Data .

EXEC sp_rename 'COLLEGE_TABLE', 'COLLEGE_TABLES_DATA';

SELECT * FROM College_Tables_data