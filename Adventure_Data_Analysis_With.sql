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

2. Data Types & Constraints

 -- Q1. The EmailAddress in the Customers table is critical and should never be empty. Write the SQL statement to add a NOT NULL constraint to this column.

 ALTER TABLE Customers
 ALTER COLUMN EmailAddress nvarchar(255) NOT NULL


-- Q2. Write a SQL query that uses the systems INFORMATION_SCHEMA.COLUMNS view to list all the columns in your Customers table, 
--     along with their DATA_TYPE (e.g., NVARCHAR, INT, DATETIME).

execute sp_help 'Customers'

ALTER TABLE Customers
ALTER COLUMN CustomerKey INT

Select * from Customers


--Q3. Write the SQL statement to add a CHECK constraint to the Sales table. This constraint should be named CK_Sales_PositiveQuantity and 
--    must ensure the OrderQuantity is always greater than zero.

ALTER TABLE Sales
ADD CONSTRAINT CK_Sales_PositiveQuantity CHECK (OrderQuantity > 0)

Select * from Sales


-- Q4. The ProductSKU in the Products table should be unique for every product to avoid duplicates. 
--  Write the SQL statement to add a UNIQUE constraint to the ProductSKU column.

Select * from Products

ALTER TABLE Products
ADD CONSTRAINT UN_SKU UNIQUE (ProductSKU)


-- Q5. When a new product is added to the Products table, if the ProductColor is not specified,
--it should automatically be set to the text 'Unspecified'. Write the SQL statement to add this DEFAULT constraint.

ALTER TABLE Products
ADD CONSTRAINT DF_Color DEFAULT 'Unspecified' FOR ProductColor 

-- Q6. The Returns table needs a formal relationship to the Products table. Write the SQL statement to add a 
--   FOREIGN KEY constraint on the ProductKey column in the Returns table that references the ProductKey column in the Products table.

Select * from Returns

ALTER TABLE Products
ALTER COLUMN ProductKey INT NOT NULL;


ALTER TABLE Products
ADD CONSTRAINT PK_ProductKey PRIMARY KEY (ProductKey);

ALTER TABLE Returns
ALTER COLUMN ProductKey INT;


ALTER TABLE Returns
ADD CONSTRAINT FK_ProductKey
FOREIGN KEY (ProductKey) REFERENCES Products(ProductKey)

-- Q7. You want to find all the constraints (like Primary Keys and Foreign Keys) that exist on your Sales table. 
-- Write a query against INFORMATION_SCHEMA.TABLE_CONSTRAINTS to find the CONSTRAINT_NAME and CONSTRAINT_TYPE for the Sales table.

SELECT 
    CONSTRAINT_NAME,
    CONSTRAINT_TYPE
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'Sales';


-- Q8. To ensure profitability, the ProductPrice in the Products table must always be at least 15% higher than the ProductCost. 
--Write a single CHECK constraint to enforce this business rule across all products.
Select * from Products

ALTER TABLE Products
ADD CONSTRAINT CK_15High CHECK (ProductPrice >= 1.15 * ProductCost)


--Q9. Imagine you are creating the FOREIGN KEY between ProductSubcategories and ProductCategories. 
--Modify the constraint definition so that if a parent ProductCategory is deleted, all of its child ProductSubcategories are automatically deleted as well.

SELECT * FROM [dbo].[ProductCategories]
select * from [dbo].[ProductSubcategories]

Execute SP_help '[ProductCategories]'
Execute SP_help '[ProductSubCategories]'

ALTER TABLE ProductCategories
ALTER COLUMN ProductCategoryKey INT NOT NULL

ALTER TABLE ProductSubcategories
ALTER COLUMN ProductCategoryKey INT NOT NULL;


ALTER TABLE ProductSubCategories
ALTER COLUMN ProductSubCategoryKey INT NOT NULL

ALTER TABLE ProductSubCategories
ADD CONSTRAINT PK_Key PRIMARY KEY (ProductSubCategoryKey)


ALTER TABLE ProductCategories
ADD CONSTRAINT PK_ProductCategory PRIMARY KEY (ProductCategoryKey);


ALTER TABLE ProductSubcategories
ADD CONSTRAINT FK_ProductCategory_SubCategory
FOREIGN KEY (ProductCategoryKey) 
REFERENCES ProductCategories(ProductCategoryKey)
ON DELETE CASCADE ON UPDATE CASCADE;


--Q10. You try to run the following query: DELETE FROM Customers WHERE CustomerKey = 11000;. Assuming this customer has existing orders in the Sales table, 
--the query will fail.
 
 CANT delete becasue it child table

 ON DELETE CASCADE recommended if you want child records auto-deleted



 3. Subqueries and Correlated Subqueries.

 
--Q1. Write a query to find all products from the Products table whose ProductPrice is greater than the overall average ProductPrice of all products.
Select * from Products

Select ProductName, ROUND(ProductPrice,2) as AboveAvgProductPrice
FROM Products
WHERE ProductPrice >= (SELECT AVG(ProductPrice) FROM Products)

-- Q2. List the FirstName and LastName of all customers from the Customers table who placed an order on the date 2021-09-09. 

Select * from Customers
select * from sales

select FirstName, LastName FROM Customers
Where CustomerKey IN
(Select CustomerKey From Sales
Where OrderDate = '2021-09-09')

select C.FirstName, C.LastName, S.OrderDate from Customers C
left join 
Sales S
ON C.CustomerKey = S.CustomerKey
WHERE S.OrderDate = '2021-09-09'


--Q3. List the ProductName for all products that belong to the 'Bikes' CategoryName.

Select * from Products
select * from ProductCategories
select * from ProductsubCategories


select p.ProductName from Products P
Inner join
ProductSubcategories PS
ON 
P.ProductSubcategoryKey = PS.ProductSubcategoryKey
Where ps.ProductSubcategoryKey IN 
(select ProductCategoryKey from ProductCategories WHERE CategoryName = 'Bikes')

--Q4. Find the FirstName and LastName of all customers who have purchased the product with ProductKey 214.

Select * from Products
select * from Customers
select * from sales

Select C.FirstName, C.LastName from Customers C
Left Join
Sales S ON
C.customerKey = S.CustomerKey
WHERE s.ProductKey IN
(SELECT productKey FROM Products Where ProductKey = 214)

--Q5. Find all sales records (OrderNumber, OrderQuantity) where the OrderQuantity is greater than the average OrderQuantity for all orders in the Sales table.


WHERE OrderQuantity > (select AVG(OrderQuantity) from Sales)

--Q6. (Correlated Subquery) A correlated subquery runs once for each row of the outer query. 
--    Write a query to list all sales records from the Sales table where the OrderQuantity is greater than the average OrderQuantity for that same ProductKey.

select ProductKey, OrderNumber, OrderQuantity from Sales S1
WHERE s1.OrderQuantity > (select AVG(s2.OrderQuantity) from Sales s2
where S1.ProductKey = S2.ProductKey)

--Q7. Find all products (ProductName) that have been returned at least once. Use a subquery with EXISTS or IN on the Returns table to check for a matching ProductKey.

select * from Products
select * from Returns


SELECT ProductName
FROM Products
WHERE ProductKey IN (
    SELECT DISTINCT ProductKey
    FROM Returns
);


--Q8. (Correlated Subquery) For each customer in the Customers table, find the OrderDate of their most recent order. 
--  The result should show the customer's CustomerKey, FirstName, LastName, and this most recent OrderDate.

select * from customers
select * from sales


SELECT c.CustomerKey, c.FirstName, c.LastName,
    (SELECT MAX(s.OrderDate) FROM Sales s
        WHERE s.CustomerKey = c.CustomerKey
    ) AS MostRecentOrderDate
FROM Customers c
ORDER BY c.CustomerKey;

-- Q9. List the names (FirstName, LastName) of customers whose total lifetime order quantity (the sum of all their OrderQuantity values) is greater than 
--  the overall average total quantity per customer.

-- Step 1: Create a CTE to calculate the total order quantity for each individual customer.
WITH CustomerTotalQuantities AS (
    SELECT
        CustomerKey,
        SUM(OrderQuantity) AS TotalQuantityPerCustomer
    FROM
        Sales
    GROUP BY
        CustomerKey
),

-- Step 2: Create a second CTE to calculate the overall average of the total quantities calculated in the first step.
-- This gives us a single value to compare against.
AverageQuantity AS (
    SELECT
        AVG(TotalQuantityPerCustomer) AS OverallAverageQuantity
    FROM
        CustomerTotalQuantities
)

-- Step 3: Select the names of the customers who meet the criteria.
SELECT
    c.FirstName,
    c.LastName,
    ctq.TotalQuantityPerCustomer
FROM
    Customers c
-- Join our main customer table with the per-customer totals
JOIN
    CustomerTotalQuantities ctq ON c.CustomerKey = ctq.CustomerKey,
-- Include the single average value so we can use it in the WHERE clause
    AverageQuantity aq
-- The final filter: only include customers whose total is greater than the overall average.
WHERE
    ctq.TotalQuantityPerCustomer > aq.OverallAverageQuantity
ORDER BY
    ctq.TotalQuantityPerCustomer DESC;


-- Q10. List all products (ProductName and ProductPrice) that have a price greater than every single product in the 'Mountain Bikes' subcategory.

SELECT
    ProductName,
    ProductPrice
FROM
    Products
WHERE
    ProductPrice > ALL (
        -- This subquery generates a list of all the ProductPrices
        -- for products that belong to the 'Mountain Bikes' subcategory.
        SELECT
            p.ProductPrice
        FROM
            Products p
        JOIN
            ProductSubcategories ps ON p.ProductSubcategoryKey = ps.ProductSubcategoryKey
        WHERE
            ps.SubcategoryName = 'Mountain Bikes'
    )
ORDER BY
    ProductPrice;



	4. CTEs Common Table Expressions

--Q1. Write a query using a CTE named ProfessionalCustomers to select only the customers whose Occupation is 'Professional'. 
Then, write the final SELECT statement to show the FirstName, LastName, and AnnualIncome from the CTE.

WITH ProfessionalCustomers as(
SELECT * from Customers
where Occupation = 'Professional'
)
SELECT FirstName, LastName, AnnualIncome from ProfessionalCustomers

-- Q2. Create a CTE named HighQuantitySales that holds all sales records from the Sales table where the OrderQuantity is 3 or more. 
Then, query the CTE to get the OrderNumber and ProductKey.

WITH HighQuantitySales AS(
	SELECT * from Sales
	where OrderQuantity >= 3 )

select OrderNumber, ProductKey from HighQuantitySales


-- Q3. Use a CTE to calculate the total OrderQuantity for each CustomerKey. Then, JOIN the CTE back to the Customers table to list the FirstName, LastName, 
and their TotalQuantity.

WITH TotalOrderQuantity AS (
	SELECT CustomerKey, COUNT(OrderQuantity) as TotalQuantity  FROM Sales S
	group by CustomerKey
	)

	SELECT C.FirstName, C.LastName, T.TotalQuantity 
	FROM Customers C
	LEFT JOIN
	TotalOrderQuantity T ON
	T.CustomerKey = C.CustomerKey


-- Q4. Create a CTE named BikeProducts that lists the ProductName and ProductPrice for all products that belong to the 'Bikes' CategoryName. 
-- This will require JOINs inside the CTE. Then, query the CTE to find all bikes with a ProductPrice over $2000.

WITH BikeProducts AS(
	
	select P.ProductName, P.ProductPrice from Products P
	LEFT JOIN
	ProductSubcategories PS
	ON P.ProductSubcategoryKey = PS.ProductSubcategoryKey
	INNER JOIN
	Productcategories PC
	ON
	PC.ProductCategoryKey = PS.ProductCategoryKey
	WHERE PC.CategoryName = 'Bikes'
			
	)

SELECT * FROM BikeProducts
WHERE ProductPrice > 2000

-- Q5. Write a query that uses two chained CTEs.

-- The first CTE, NorthAmericaSales, should find all OrderNumbers from sales that occurred in the 'North America' Continent (using the TerritoryLookup table).
-- The second CTE, HighValueSales, should query the first CTE to find the sales records from NorthAmericaSales that have an OrderQuantity > 1.

-- Finally, select the OrderNumber from the HighValueSales CTE.

WITH NorthAmericaSales AS(

select s.OrderNumber, s.OrderQuantity from TerritoryLookup T
LEFT JOIN Sales S
ON 
T.SalesTerritoryKey = s.TerritoryKey
WHERE T.Continent = 'North America'
	),

HighValueSales AS(
	
	select OrderQuantity,OrderNumber FROM NorthAmericaSales
	where OrderQuantity > 1
	)

select OrderNumber from HighValueSales
-- Q6. Lets re-solve a problem from our subquery section. Use a CTE named AveragePrice to find the single average ProductPrice for all products. 
-- Then, in the main query, select all ProductNames from the Products table that have a ProductPrice greater than the average (by joining to the CTE).

-- Q7. Use a CTE to find the total quantity sold (TotalSold) for each ProductKey. Then, JOIN this CTE with the Products table to show the ProductName and its TotalSold,
--ordered from most sold to least sold.