USE [COACHX_TRAINING]

SELECT * FROM Orders

--- 1. Lable orders as 'Profitable', 'Loss' and 'Neutral'

SELECT [Order ID], Profit, 
CASE
	WHEN Profit > 0 THEN 'Profitable'
	WHEN Profit < 0 THEN 'Loss'
	ELSE 'Neutral'
	END AS Profit_Status
FROM Orders


--- 2. Assign Priority levels to shipping models

SELECT [Order ID], [Ship Mode],
CASE [Ship Mode]
	WHEN 'SAME DAY' THEN 'HIGH'
	WHEN 'FIRST CLASS' THEN 'MEDIUM'
	ELSE 'STANDARD'
	END AS PRIORITY
FROM Orders


--- 3.Flags orders eligible for discount (Sales > 750)

SELECT [Order ID], Sales,
CASE
	WHEN Sales > 750 THEN 'Yes'
	ELSE 'NO'
	END AS 'Discount_Flag'
FROM Orders


-------------------------------------------------------------------
--------------------------------------------------------------------

--- SUBQUERY

--- 1. Find all orders where sales is higher than average sales for all sales

select * from Orders

SELECT [Order ID], [CUSTOMER NAME],  ROUND(Sales,2) FROM Orders
WHERE Sales > (SELECT AVG(SALES) FROM Orders)


--- 2. Orders with sales above highest	sales in 'BINDERS' subcategory

SELECT [Order ID], [Customer Name], Sales FROM Orders
WHERE Sales > (
SELECT MAX(SALES) FROM Orders 
WHERE [Sub-Category] = 'Binders')
ORDER BY Sales DESC


--- 3. Appointments paid by a method in 'cardiology' dept

USE CLASSPRACTICE


SELECT * FROM Appointments
SELECT * FROM Patients

SELECT *, DATEDIFF(DAY, P.RegistrationDate, A.AppointmentDate) AS RESOLUTIONDAYS FROM Appointments A
INNER JOIN 
Patients P
ON
A.PatientID = P.PatientID


SELECT  DISTINCT AppointmentID, AppointmentDate, PaymentMethod FROM Appointments
WHERE Department = 'Cardiology' 


--------------------------------------------
---SQL DATE and STRING Function
/*
DATE - Extract, compare, manipulate data vlaues --- sales trend, duration, cohort analysis 

current_date -  todays date

GETDATE - Current date and time

DatePart - SELECT DATEPART(INTEREVAL,DATE) FROM TABLE(Extracts part of a date(m,y,q,etc)

Interval - Year, quarter, month, weekday

DATEDIFF - SELECT DATEDIFF(INTERVAL, Start_Date, End_Date) FROM Table
It calculates diff between DATES

DATERUN - SELECT DATE_TRUNC(INTERVAL, DATE) FROM TABLE
IT TRUNCATE DATES TO SPECIFIC UNITS - MONTHS, QUARTERS

STRING 
CONCAT, LEN, RIGHT, LEFT, UPPER, LOWER, REPLACE, SUBSTRING
*/
USE [COACHX_TRAINING]


SELECT * FROM ORDERS

SELECT REGION, 
AVG(DATEDIFF(DAY, [ORDER DATE], [SHIP DATE])) AS SHIP_DAYS
FROM Orders
GROUP BY Region


SELECT GETDATE()

select	DATEDIFF(MONTH,[ship date],GETDATE()) as Datediffe from Orders

SELECT CAST(GETDATE() AS DATE) AS CURRENTDATE

SELECT SYSDATETIME() AS CurrentDateTime

SELECT @@VERSION


--- Fitler orders  from last 7 days

SELECT * FROM Orders
WHERE [Order Date] >= GETDATE()-7

--- Extract week number from DATE

SELECT [ORDER ID], [Order Date],
DATEPART(WEEK, [Order Date]) AS ORDER_WEEK
FROM [COACHX_TRAINING].dbo.Orders

to_date(string, format)

to_char(sysdate, 'yyyy-mm-dd') as formatted_date)


---------------------------------------------------
GRANT - Give USer Access privilages to the database
REVOKE -  Removes access  from USER

GRANT SELECT, INSERT ON TABLE TO USER1
REVOKE INSERT ON TABLE  FROM USER1

ROLE 1 - FULL ACCESS
ROLE 2 -  SELECT 
ROLE 3 -  SELECT, VIEW , DELETE
  

---INDEX--
/* Improves the speed of data fetching operations on a table 
at the cost of additional space
INDEXED ARE USEFUL ON COLUMNS THAT ARE FREQUENTLY SEARCHED, FILTERED  IN JOINS

LIMITATION - SLower down operations -INSERT, UPDATE, DELETE

1.Clustured - sorts/stored table data physically to fast range queries
2.Unclustured - speedup lookup using seperate structure with pointer
3.Unique - Ensures all values in columns are unique
4.Filter Index - Index subset of rows in a table based on filter condition
*/

CREATE INDEX INDEX_NAME
ON
TABLE_NAME(COL1, COL2, .................)


CREATE UNIQUE INDEX INDEX_NAME   -- NO duplicate values in index
ON
TABLE_NAME(COL1, COL2, .................)

DROP INDEX index_name


USE CLASSPRACTICE


SELECT * FROM Appointments
SELECT * FROM Patients

CREATE INDEX INDEX_PATIENT_DATE
ON
APPOINTMENTS(APPOINTMENTDATE);
-- HERE we made index as AppointmentDate, in background index will run
-- Whenver we call from Appointmentdate now, Value is get faster than other 

SELECT * FROM Appointments
WHERE AppointmentDate = '2024-01-10'

Appointments('2024-01-10')

EXEC sp_helpindex 'Appointments'