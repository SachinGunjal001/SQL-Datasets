Use CompanyDB;
/*
1.Single Row Subquery
Returns only one row and is used with operators like =, <, >, <=, >=, <>.
 Syntax:
SELECT column1
FROM table1
WHERE column2 = (SELECT column2 FROM table2 WHERE condition);
*/

-- Find employees who have the max salary 
SELECT FirstName, Salary
FROM Employees
WHERE Salary = (
    SELECT max(Salary) FROM Employees
);

/*
2. Multiple Row Subquery
Returns more than one row, and is used with operators like IN, ANY, ALL.

A. Using IN
Find employees who belong to departments same as employees with salary > 70000:

*/
SELECT FirstName, Department
FROM Employees
WHERE Department IN (
    SELECT Department
    FROM Employees     WHERE Salary > 70000 );

/* B. Using ANY
Find employees who earn less than any employee in the IT department:

*/
SELECT FirstName, Salary
FROM Employees
WHERE Salary < ANY (
    SELECT Salary
    FROM Employees
    WHERE Department = 'IT'
);
-- Compares each employee’s salary against each of the salaries in the IT department.

/*
C. Using ALL
Find employees who earn more than all employees in HR:
*/

SELECT FirstName, Salary
FROM Employees
WHERE Salary > ALL (
    SELECT Salary
    FROM Employees
    WHERE Department = 'HR'
);



/* Using ANY
Find employees who earn less than any employee in the IT department:*/

SELECT FirstName, Salary
FROM Employees
WHERE Salary < ANY (
    SELECT Salary
    FROM Employees
    WHERE Department = 'IT'
);


-- Compares each employee’s salary against each of the salaries in the IT department.

-- Using ALL
-- Find employees who earn more than all employees in HR:


SELECT FirstName, Salary
FROM Employees
WHERE Salary > ALL (
    SELECT Salary
    FROM Employees
    WHERE Department = 'HR'
);



/*
Triggers
Syntax
CREATE TRIGGER TriggerName ON Table AFTER INSERT|UPDATE|DELETE AS BEGIN ... END
Use
Automatically perform actions after an event.

Send an alert when a new employee is added.

*/

-- create audit table 
CREATE TABLE EmployeeAudit (
    AuditID INT IDENTITY(1,1) PRIMARY KEY,
    EmpID INT,
    AuditDate DATETIME DEFAULT GETDATE()
);

CREATE TRIGGRT TRG_NEWEMPLOYEE
ON EMPLOYEES
AFTER INSERT
AS
BEGIN
	INSERT INTO EMPLOYEEAUDIT (EMPID)
	SELECT EMPLOYEEID
	FROM INSERTED

	PRINT 'A New Employee has been logged in the Audut Table'
	END;

INSERT INTO EMPLOYEEAUDIT(EMPID)
SELECT EMPLOYEEID FROM  INSERTED

SELECT * FROM EMPLOYEES

CREATE TRIGGER trg_NewEmployee
ON Employees
AFTER INSERT
AS
BEGIN
    INSERT INTO EmployeeAudit (EmpID)
    SELECT EmployeeID
    FROM INSERTED;

    PRINT 'A new employee has been logged in the audit table.';
END;

select * from employees;




Insert into Employees values ('Ivan', 'Chan', 'Marketing', 60000, '2021-01-20');


select * from EmployeeAudit;

-- Update Trigger
CREATE TRIGGER trg_UpdateEmployee
ON Employees
AFTER UPDATE
AS
BEGIN
    PRINT 'Employee data has been updated.';
END;


update Employees set LastName='Chang' where FirstName='Ivan';

/*
CTE (Common Table Expression)
Syntax
	WITH CTEName AS (SELECT ...)
	SELECT * FROM CTEName;
Use
Temporary named result set for easier querying.
Use Case
Easily find high earning employees.

*/


WITH HighEarners AS (
    SELECT FirstName, Salary FROM Employees WHERE Salary > 60000
)
SELECT * FROM HighEarners;

WITH HighEarners 
AS(
SELECT fIRSTNAME, LASTNAME FROM EMPLOYEES
WHERE SALARY > 60000
)

SELECT * FROM HighEarners


/*
Dynamic SQL
Syntax
DECLARE @SQL VARCHAR(MAX);
SET @SQL = 'SELECT * FROM Table WHERE Column = ''value''';
EXEC sp_executesql @SQL;
Use
Build queries dynamically at runtime.



Query based on a department name selected at runtime.

*/
DECLARE @DEPT NVARCHAR(50) = 'IT';	
DELCARE @S1 NCARCHAR(MAX);

SET @S1 = 'SELECT * FROM Employees WHERE Department = @DEPT'
EXEC sp_excutesql @s1, N'@dept varchar(50)', @dept;

DECLARE @Dept NVARCHAR(50) = 'IT';
DECLARE @S1 NVARCHAR(MAX);
SET @S1 = 'SELECT * FROM Employees WHERE Department = @Dept';
EXEC sp_executesql @S1, N'@Dept VARCHAR(50)', @Dept;



select * from Employees;

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    EmployeeID INT,
    OrderDate DATE
);


INSERT INTO Orders (OrderID, EmployeeID, OrderDate)
VALUES 
(101, 1, '2024-01-10'),
(102, 1, '2024-03-15'),
(103, 2, '2024-01-20'),
(104, 3, '2024-02-25'),
(105, 3, '2024-04-05'),
(106, 4, '2024-01-30'),
(107, 4, '2024-02-10'),
(108, 1, '2024-05-01'),
(109, 2, '2024-03-20');


/*

LEAD() / LAG() on Orders: You'll see next and previous order dates when ordered by OrderDate.

FIRST_VALUE() / LAST_VALUE() with PARTITION BY EmployeeID: Useful for employees with multiple orders (like Employee 1, 3, 4, 6).

NTILE(4) on Employees: Employees will be divided into quartiles based on Salary.

*/

/* 
SYNTAX
select columnname,
fun(),over([partition by clause],
           [order by clause]);
		   */

-- LEAD():Accesses data from the next row

select employeeid,orderdate
from orders
order by OrderDate;

SELECT EmployeeID, OrderDate, 
 LEAD(OrderDate, 1) OVER (ORDER BY OrderDate) AS NextOrderDate
FROM Orders;


-- LAG : access data from previous row

select employeeid,orderdate,
lag(orderdate,1) over ( order by orderdate) as previousdate
from orders;

-- First Value 
SELECT EmployeeID, OrderDate, 
 FIRST_VALUE(OrderDate) OVER (PARTITION BY EmployeeID ORDER BY OrderDate) AS 
FirstOrderDate
FROM Orders;


-- LAST_VALUE():
SELECT EmployeeID, OrderDate, 
 LAST_VALUE(OrderDate) OVER (PARTITION BY EmployeeID ORDER BY OrderDate ) as lastorderdate
 FROM Orders;
 -- ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS LastOrderDate

 -- NTILE
 -- divide employees into four quartiles based on their salary
 SELECT EmployeeID,FirstNAme,LastNAme, 
 NTILE(4) OVER (ORDER BY Salary) AS Quartile
FROM Employees;