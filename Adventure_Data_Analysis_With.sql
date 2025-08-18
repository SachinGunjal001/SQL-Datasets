CREATE Database Adventure_Works

Select * from customerlookup

ALTER TABLE Customerlookup
ALTER COLUMN BirthDate DATE;

ALTER TABLE Customerlookup
ALTER COLUMN TotalChildren INT;

ALTER TABLE Customerlookup
ALTER COLUMN AnnualIncome DECIMAL(8,2);

UPDATE Customerlookup
SET BirthDate =  FORMAT(CAST(BirthDate AS DATE), 'DD-MM-YYYY');

EXEC SP_help 'Customerlookup' 

Select * from CalendarLookup

ALTER TABLE CalenderLookup
ALTER COLUMN Date DATE;

Select * from productcategories
Select * from productcategorysales


ALTER TABLE productcategorysales
ALTER COLUMN Date DATE;

Select * from ProductSubcategories
Select * from ReturnData


ALTER TABLE Return_Data
ALTER COLUMN ReturnDate DATE;

Select * from SalesData

ALTER TABLE Salesdata
ALTER COLUMN Stockdate DATE

Select * from TerritoryLookup


------------------------------------------------------------------------------------------
Select * from Customers
Select * from Calendars
Select * from productcategories
Select * from ProductSubcategories
Select * from productcategorysales
Select * from Products
Select * from TerritoryLookup
Select * from productcategorysales
Select * from Returns
Select * from Sales
-------------------------------------------------------------------------------------------------

1. Joins

-- 1. List customers who have placed at least one order.

SELECT S.CustomerKey, CONCAT(C.firstname,' ',C.lastname) AS FullName, 
SUM(s.OrderQuantity) AS TotalOrderedQuantity FROM SALES S
INNER JOIN 
CUSTOMERS C
ON 
C.CUSTOMERKEY = S.CUSTOMERKEY
WHERE S.ORDERQUANTITY >= 1
GROUP BY S.CustomerKey, C.firstname,C.lastname

-- 2. Show all products along with their categories (even if some don’t belong to a category).

SELECT PC.CategoryName, PS.SUBCATEGORYNAME 
FROM ProductCategories PC
left JOIN
ProductSubCategories PS
ON
PC.ProductCategoryKey = PS.ProductCategoryKey

--- 3. Get a list of orders and customer full names (first, middle, last).

SELECT C.CustomerKey, CONCAT(C.firstname,' ',C.lastname) AS FullName, P.ProductKey, P.ProductName
FROM Customers C
INNER JOIN 
Sales S
ON C.CustomerKey = S.CustomerKey
INNER JOIN
Products P
ON P.ProductKey = S.ProductKey

--- 4. Display products that have never been sold.

SELECT P.ProductName,S.OrderQuantity FROM Products P
LEFT JOIN
SALES S
ON
S.ProductKey = P.ProductKey
WHERE S.OrderQuantity IS NULL

--- 5. List all employees and their managers using a self-join.


Select * from Customers
Select * from Sales
Select * from Products
Select * from productcategories

Select * from Calendars
Select * from ProductSubcategories
Select * from productcategorysales
Select * from TerritoryLookup
Select * from productcategorysales
Select * from Returns

-- 6. Find all orders, including those not linked to a customer.

SELECT S.ORDERNUMBER,C.CustomerKey
FROM SALES S
LEFT JOIN
Customers C
ON C.CUSTOMERKEY = S.CUSTOMERKEY

-- 7.Get a cross join result between Sales.SalesTerritory and Production.ProductCategory.


SELECT *
FROM PRODUCTS P
CROSS JOIN
TerritoryLookup T


-- 8. Show customer names and the total number of orders they placed in 2022.


SELECT C.CustomerKey, C.FirstName + ' ' + C.LastName AS FullName, COUNT(S.ORDERNUMBER) AS TOTAL_ORDERS 
FROM SALES S
RIGHT JOIN
Customers C
ON C.CUSTOMERKEY = S.CUSTOMERKEY
GROUP BY C.CustomerKey, C.FirstName, C.LastName, S.StockDate
HAVING YEAR(S.StockDate) = 2022
ORDER BY TOTAL_ORDERS DESC

-- 9. List product names, categories, and the number of times each product was sold.

SELECT pc.CategoryName, P.ProductName ,  count(s.ordernumber) as totalOrders
FROM Products P
LEFT JOIN 
SALES S
ON P.ProductKey = S.ProductKey
RIGHT JOIN 
ProductSubcategories Ps
on
Ps.productsubcategorykey = P.productsubcategorykey
right join 
ProductCategories pc
on
Ps.productcategorykey = Pc.productcategorykey
GROUP BY p.ProductName, pc.CategoryName
order by totalOrders desc


-- 10. Find employees who report to a manager who reports to someone else (2-level hierarchy).

--NO manager table in dataset




2. Data Types & Constraints

