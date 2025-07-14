CREATE DATABASE EMP_WINDOWS

USE EMP_WINDOWS

CREATE TABLE Departments (
    DepartmentID INT,
    DepartmentName VARCHAR(50)
);



CREATE TABLE Employees (
    EmployeeID INT ,
    EmployeeName VARCHAR(50),
	EmployeeEmail VARCHAR(100),
    DepartmentID INT,
    ManagerID INT 
)

INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(101, 'IT'),
(102, 'HR'),
(103, 'Finance'),
(104,'Marketing');

INSERT INTO Employees (EmployeeID, EmployeeName, EmployeeEmail,DepartmentID, ManagerID) VALUES
(1, 'Ankita','ankita@gmail.com' ,101, NULL),
(2, 'Sachin','sachin@gmail.com' ,102, 1),
(3, 'Rudra','rudra@gmail.com' ,105, 1),
(4,'Sakshi','sakshi@gmail.com',102,2),
(5,'Asif','asif@gmail.com',103,NULL);

--INNER JOIN
SELECT * FROM Departments
SELECT * FROM Employees

SELECT * FROM Employees E
INNER JOIN 
Departments D
ON E.DepartmentID = D.DepartmentID

-- LEFT JOIN

SELECT * FROM Departments
SELECT * FROM Employees

SELECT * FROM Employees E
LEFT JOIN 
Departments D
ON E.DepartmentID = D.DepartmentID


-- RIGHT JOIN

SELECT * FROM Employees E
RIGHT JOIN 
Departments D
ON E.DepartmentID = D.DepartmentID


SELECT E.EmployeeName AS MANAGER, M.EmployeeName FROM Employees E
INNER JOIN 
Employees AS M
ON 
E.EmployeeID = M.ManagerID






-- UNION, UNION ALL
CREATE TABLE TABLE1 (INVOICENO INT);

CREATE TABLE TABLE2 (REFNO INT);

SELECT * FROM TABLE1;
SELECT * FROM TABLE2;

INSERT INTO TABLE1 VALUES (1),(2),(3),(4);

INSERT INTO TABLE2 VALUES (3),(4),(5),(6);

SELECT * FROM TABLE1
UNION ALL
SELECT * FROM TABLE2;


SELECT * FROM TABLE1
UNION 
SELECT * FROM TABLE2;


SELECT * FROM TABLE1
INTERSECT
SELECT * FROM TABLE2;



---------------------------------------
-- Windows Fuction

CREATE TABLE SALES
 (EMPLOYEE VARCHAR(100),DEPARTMENT VARCHAR(100),SALES INT);


  INSERT INTO SALES VALUES ('ARJUN','MUMBAI',500),('BHARTI','MUMBAI',700),('CAROL','MUMBAI',700),('DHEERAJ','PUNE',300),('EKTA','PUNE',300),('ATIF','PUNE',400);

 SELECT * FROM SALES;

 -- RANK() -  
SELECT *, RANK()
 OVER(ORDER BY SALES DESC) AS EmpRank
 FROM sales

 -- partition by

 SELECT *, RANK()
 OVER(Partition BY DEPARTMENT
 ORDER BY SALES DESC) AS EmpRank
 FROM sales

 -- Dense_Rank()
 SELECT *, DENSE_RANK()
 OVER(ORDER BY SALES DESC) AS EmpRank
 FROM sales

 SELECT *, DENSE_RANK()
 OVER(PARTITION BY DEPARTMENT
 ORDER BY SALES DESC) AS EmpRank
 FROM sales

 -- Row_Number()

 SELECT *, ROW_NUMBER()
 OVER(ORDER BY SALES) AS RowNumber
 FROM Sales

SELECT 

 ------------------------------------------------------------
 -- CASE Statement

 SELECT *,
	CASE
		WHEN SALES >=700 THEN 'High Sales'
		WHEN SALES>=500 THEN 'Medium Sales'
		ELSE 'Low Sales'
	END AS Performance
FROM SALES
ORDER BY SALES DESC


---------------------------------------------------

-- Procedure -  It is saved set of SQL statement

CREATE PROCEDURE GetAllSales
AS
BEGIN

SELECT * FROM SALES

END

EXEC GetAllSales


CREATE PROCEDURE EmpDepart
@dept VARCHAR(50)
AS
BEGIN
SELECT * FROM SALES
WHERE Department = @dept
END

EXEC EmpDepart 'Mumbai';


CREATE PROCEDURE GETSALES
@V INT
AS
BEGIN
SELECT * FROM SALES
WHERE SALES > @v;

END

EXEC GETSALES 400 



ALTER PROCEDURE GETSALES
@V INT,
@DEPT VARCHAR(40)
AS
BEGIN
SELECT * FROM SALES
WHERE SALES > @v AND DEPARTMENT = @DEPT;

END

EXEC GETSALES 200, Pune


CREATE PROCEDURE DEMO
@D VARCHAR(50)
AS
BEGIN
SELECT E.EmployeeID, E.EmployeeName, D.DepartmentName FROM Departments D
INNER JOIN 
Employees E
ON D.DepartmentID = E.DepartmentID
WHERE DepartmentName = @D;

END

EXEC DEMO 'IT'
EXEC DEMO 'HR'

DROP PROCEDURE GetAllSales