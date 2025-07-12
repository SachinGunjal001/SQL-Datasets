--1.	Create two Databases Name :- Brands , and Products 

CREATE DATABASE Brands
CREATE DATABASE Products


--2.	Create two tables in SQL Server name as ITEMS_TABLE in Brands database and PRODUCT_TABLE in Products database. 

USE Brands

CREATE TABLE Items_Table(
Item_ID INT PRIMARY KEY,
Item_Description VARCHAR(100) NOT NULL,
Vendor_nos INT,
Vendor_Name VARCHAR(100),
Bottle_Size INT,
Bottle_Price FLOAT
);

INSERT INTO ITEMS_TABLE VALUES
(1, 'Travis Hasse Apple Pie', 305, 'Mhw Ltd', 750, 9.77),
(2, 'D''aristi Xtabentun', 391, 'Anchor Distilling (preiss Imports)', 750, 14.12),
(3, 'Hiram Walker Peach Brandy', 370, 'Pernod Ricard Usa/austin Nichols', 1000, 6.50),
(4, 'Oak Cross Whisky', 305, 'Mhw Ltd', 750, 25.33),
(5, 'Uv Red(cherry) Vodka', 380, 'Phillips Beverage Company', 200, 1.97),
(6, 'Heaven Hill Old Style White Label', 259, 'Heaven Hill Distilleries Inc.', 750, 6.37),
(7, 'Hyde Herbal Liqueur', 194, 'Fire Tail Brands Llc', 750, 5.06),
(8, 'Dupont Calvados Fine Reserve', 403, 'Robert Kacher Selections', 750, 23.61);

SELECT * FROM Items_Table
-----------------------------------------------------------------------------
USE Products

CREATE TABLE Products_Table(
Product_ID INT PRIMARY KEY,
Country VARCHAR(50),
Product VARCHAR(50) NOT NULL,
UnitSold FLOAT,
ManufacturingPrice FLOAT,
SalePrice FLOAT,
GrossSales VARCHAR(20),
Sales VARCHAR(20),
COGS VARCHAR(20),
Profit VARCHAR(20),
Dates Date,
MonthNumber INT,
MonthName VARCHAR(25),
YEAR INT
);
DROP TABLE Products_Table
INSERT INTO PRODUCTS_TABLE VALUES
(1, 'Canada', 'Carretera', 1618.5, 3, 20, '32,370', '32,370', '16,185', '16,185', '2014-01-01', 1, 'January', 2014),
(2, 'Germany', 'Carretera', 1321, 3, 20, '26,420', '26,420', '13,210', '13,210', '2015-01-01', 1, 'January', 2015),
(3, 'France', 'Carretera', 2178, 3, 15, '32,670', '32,670', '21,780', '10,890', '2016-06-01', 6, 'June', 2016),
(4, 'Germany', 'Carretera', 888, 3, 15, '13,320', '13,320', '8,880', '4,440', '2017-06-01', 6, 'June', 2017),
(5, 'Mexico', 'Carretera', 2470, 3, 15, '37,050', '37,050', '24,700', '12,350', '2018-06-01', 6, 'June', 2018),
(6, 'Germany', 'Carretera', 1513, 3, 350, '529,550', '529,550', '393,380', '136,170', '2019-12-01', 12, 'December', 2019),
(7, 'Germany', 'Montana', 921, 5, 15, '13,815', '13,815', '9,210', '4,605', '2020-03-01', 3, 'March', 2020),
(8, 'Canada', 'Montana', 2518, 5, 12, '30,216', '30,216', '7,554', '22,662', '2021-06-01', 6, 'June', 2021);



SELECT * FROM Products_Table

--3.	After Creating both the tables Add records in that tables (records are available in ITEMS_TABLE Sheet and PRODUCTS_TABLE Sheet) 
--DONE
--4.	Delete those product having the Units Sold 1618.5 , 888 and 2470. 
 
 DELETE FROM Products_Table
 WHERE UnitSold IN (1618.5 , 888, 2470)

 SELECT * FROM Products_Table


--5.	Select all records from the ITEMS_TABLE table.

USE Brands

Select * from Items_Table

--6.	Select the item_description and bottle_price for all items in the ITEMS_TABLE table. 

SELECT Item_Description, Bottle_Price FROM Items_Table


--7.	Find the item_description and bottle_price of items where bottle_price is greater than 20. 

SELECT Item_Description, Bottle_Price FROM Items_Table
WHERE Bottle_Price > 20;

--8.	Select Unique Country from the product_sales table 

USE Products

SELECT DISTINCT Country FROM Products_Table

--9.	Count the number of Countries in the product_sales table

SELECT COUNTRY, COUNT(*) AS TotalCountries FROM Products_Table
GROUP BY Country

--10.	How Many Countries are there which contain the sales price between 10 to 20

SELECT  COUNT(DISTINCT Country) AS TotalCountries FROM Products_Table
WHERE SalePrice BETWEEN 10 AND 20

-----------------------------------------------------------------------------------
--INTERMEDIATE QUESTIONS
--------------------------------------------------------------------------------------

--1. Find the Total Sale Price and Gross Sales 

SELECT SUM(CAST(SalePrice AS DECIMAL(10,2))) as TotalSalePrice, 
	SUM(CAST(REPLACE(GrossSales,',', '') as DECIMAL(10,2))) as TotalGrossSales 
	FROM Products_Table


--2. In which year we have got the highest sales 

	SELECT TOP 1 YEAR, SUM(CAST(REPLACE(SALES,',','') AS DECIMAL(10,2))) AS TotalSales FROM Products_Table
	GROUP BY YEAR
	ORDER BY TotalSales DESC


--3. Which Product having the sales of $ 37,050.00 
--Adding DELETED ROWS 
INSERT INTO Products_Table VALUES
(1, 'Canada', 'Carretera', 1618.5, 3, 20, '32,370', '32,370', '16,185', '16,185', '2014-01-01', 1, 'January', 2014),
(4, 'Germany', 'Carretera', 888, 3, 15, '13,320', '13,320', '8,880', '4,440', '2017-06-01', 6, 'June', 2017),
(5, 'Mexico', 'Carretera', 2470, 3, 15, '37,050', '37,050', '24,700', '12,350', '2018-06-01', 6, 'June', 2018);

SELECT Product, SUM(CAST(REPLACE(SALES,',','') AS DECIMAL(10,2))) AS TotalSales FROM Products_Table
WHERE SALES = '37,050'
GROUP BY Product

--4. Which Countries lies between profit of $ 4,605 to $ 22 , 662.00 

SELECT Country, 
SUM(CAST(REPLACE(Profit, ',', '') AS DECIMAL(10,2))) AS TotalProfit
FROM Products_Table
WHERE CAST(REPLACE(Profit, ',', '') AS DECIMAL(10,2)) BETWEEN 4605 AND 22662
GROUP BY Country;



--5. Which Product Id having the sales of $ 24 , 700.00 

SELECT Product_ID FROM Products_Table
WHERE CAST(REPLACE(COGS, ',','') AS decimal(10,2)) = 24700


--6. Find the total Units Sold for each Country. 

SELECT Country, SUM(UNITSOLD) AS UnitSold FROM PRODUCTS_TABLE
GROUP BY COUNTRY
order by UnitSold DESC

--7. Find the average sales for each country

SELECT Country, AVG(CAST(REPLACE(Sales, ',','') AS DECIMAL(10,2))) as AverageSales FROM Products_table
GROUP BY Country

--8. Retrieve all products sold in 2014 

SELECT Product, Year FROM Products_table
WHERE YEAR = 2014 

--9. Find the maximum Profit in the product_sales table. 
SELECT MAX(CAST(REPLACE(Profit, ',','') AS Decimal(10,2))) as MaxProfit FROM Products_table

--10. Retrieve the records from product_sales where Profit is greater than the average Profit of all records.
SELECT AVG(CAST(REPLACE(Profit, ',','') AS Decimal(10,2))) as AverageProfit
FROM Products_Table 

SELECT Profit 
FROM Products_Table
WHERE CAST(REPLACE(Profit, ',','') AS DECIMAL(10,2)) > 
(
SELECT AVG(CAST(REPLACE(Profit, ',','') AS Decimal(10,2))) 
FROM Products_Table 
)

--11. Find the item_description having the bottle size of 750 
 USE Brands

SELECT ITEM_ID, Item_Description FROM Items_Table
WHERE Bottle_Size = 750

--12. Find the vendor Name having the vendor_nos 305 , 380 , 391 

SELECT ITEM_ID, Vendor_Name, Vendor_nos FROM Items_Table
WHERE Vendor_nos IN (305, 380, 391)

--13. What is total Bottle_price 
SELECT SUM(BOTTLE_PRICE) AS Total_Bottle_Price FROM Items_Table


--14. Make Primary Key to Item_id 
ALTER TABLE ITEMS_TABLE
ADD CONSTRAINT PK_ITEM PRIMARY KEY(Item_id)


--15. Which item id having the bottle_price of $ 5.06
SELECT ITEM_ID FROM  Items_Table
WHERE Bottle_Price = 5.06

-------------------------------------------------------------------------------
-- Advanced Questions
----------------------------------------------------------------------------------

-- 1. Apply INNER  , FULL OUTER , LEFT JOIN types on both the table  
USE BRANDS
SELECT * FROM Items_table

USe Products
SELECT * FROM PRODUCTS_TABLE 

SELECT P.*, I.* FROM Products.dbo.[Products_Table] as P
INNER JOIN
Brands.dbo.[Items_Table] as I
ON
P.Product_ID = I.Item_ID

SELECT P.*, I.* FROM Products.dbo.[Products_Table] as P
LEFT JOIN
Brands.dbo.[Items_Table] as I
ON
P.Product_ID = I.Item_ID

SELECT P.*, I.* FROM Products.dbo.[Products_Table] as P
FULL JOIN
Brands.dbo.[Items_Table] as I
ON
P.Product_ID = I.Item_ID


--- 2. Find the item_description and Product having the gross sales of 13,320.00 

SELECT P.Product, I.Item_Description, P.GrossSales FROM Products.dbo.[Products_Table] as P
INNER JOIN
Brands.dbo.[Items_Table] as I
ON
P.Product_ID = I.Item_ID
WHERE P.GrossSales = '13,320'

---3. Split the Item_description Column into Columns Item_desc1 and  Item_desc2 

SELECT Item_Description,
SUBSTRING(Item_Description, 1, CHARINDEX(' ',Item_Description)-1) as Item_Desc1,
SUBSTRING(Item_Description, CHARINDEX(' ',Item_Description), Len(Item_Description)) as Item_Desc2
FROM Brands.dbo.Items_Table


--- 4. Find the top 3 most expensive items in the ITEMS_TABLE table. 

SELECT TOP 3 Item_ID, BOTTLE_PRICE FROM BRANDS.DBO.ITEMS_TABLE
ORDER BY Bottle_Price DESC

--- 5. Find the total Gross Sales and Profit for each Product in each  Country. 

SELECT PRODUCT, Country,
SUM(CAST(REPLACE(GrossSales, ',','') AS DECIMAL(10,2))) as TotalGrossSale,
SUM(CAST(REPLACE(Profit, ',','') AS DECIMAL(10,2))) as TotalProfit
FROM PRODUCTS_TABLE
GROUP BY Product, COUNTRY

--- 6. Find the vendor_name and item_description of items with a  bottle_size of 750 and bottle_price less than 10. 

SELECT Vendor_Name, Item_Description, Bottle_Size, Bottle_price FROM BRANDS.DBO.ITEMS_TABLE
WHERE Bottle_size = 750 
AND
Bottle_Price < 10;


--- 7. Find the Product with the highest Profit in 2019. 

SELECT TOP 1 Product, CAST(REPLACE(Profit, ',','') AS Decimal(10,2)) AS TotalProfit 
FROM PRODUCTS_TABLE
WHERE YEAR = 2019
ORDER BY TotalProfit DESC

--- 8. Retrieve the Product_Id and Country of all records where the  Profit is at least twice the COGS.

SELECT Product_ID, Country, Profit, COGS 
FROM  Products_Table
WHERE CAST(REPLACE(Profit, ',','') AS Decimal(10,2)) >=
(CAST(REPLACE(COGS, ',','') AS Decimal(10,2))) * 2

--- 9. Find the Country that had the highest total Gross Sales in 2018 

SELECT TOP 1 Country, CAST(REPLACE(GrossSales, ',','') AS DECIMAL(10,2)), Year 
FROM products_table
WHERE YEAR = 2018
ORDER BY CAST(REPLACE(GrossSales, ',','') AS DECIMAL(10,2)) DESC



-- 10. Calculate the total Sales for each Month Name across all  years. 

select * from products_table

SELECT MonthName, Year, SUM(CAST(REPLACE(Sales, ',','') AS Decimal(10,2))) as TotalSales  
FROM Products_Table
GROUP By MonthName, Year
Order By Year

--- 11.  List the item_description and vendor_name for items  whose vendor_nos exists more than once in the ITEMS_TABLE table. 
	SELECT Item_Description, Vendor_Name, Vendor_nos from Brands.dbo.Items_Table
	WHERE Vendor_nos IN
	(
	SELECT Vendor_nos FROM Brands.dbo.Items_Table
	GROUP BY Vendor_nos
	HAVING COUNT(*) >1 
	)


---12.  Find the average Manufacturing Price for Product in each Country and only include those Country and Product combinations where the average is above 3 

SELECT Product, Country, AVG(MANUFACTURINGPRICE) AS AverageManufacturingPrice 
FROM PRODUCTS_TABLE
GROUP BY Product, COUNTRY
HAVING AVG(MANUFACTURINGPRICE) > 3

-----------------------------------------------------------------------------------------------------------------
--SUPER ADVANCED QUERIES
-------------------------------------------------------------------------------------------------------------------

-- 1. Find the item_description and bottle_price of items that have  the same vendor_name as items with Item_Id 1. 

SELECT * FROM BRANDS.DBO.ITEMS_TABLE
SELECT * FROM PRODUCTS.DBO.PRODUCTS_TABLE

SELECT Item_ID, Vendor_Name, Item_Description, Bottle_Price FROM BRANDS.DBO.ITEMS_TABLE
WHERE Vendor_Name = (
SELECT Vendor_Name FROM BRANDS.DBO.ITEMS_TABLE
WHERE Item_ID = 1)


---2. Create a stored procedure to retrieve all records from the ITEMS_TABLE table where bottle_price is greater than a given value 

CREATE PROCEDURE RetrieveRecords
@BottlePrice FLOAT
AS
BEGIN

SELECT * FROM BRANDS.DBO.ITEMS_TABLE
WHERE Bottle_Price > @BottlePrice

END

EXEC RetrieveRecords @BottlePrice = 10.00


---3. Create a stored procedure to insert a new record into the product_sales table. 

SELECT * FROM PRODUCTS.DBO.PRODUCTS_TABLE
DELETE FROM PRODUCTS.DBO.PRODUCTS_TABLE WHERE PRODUCT_ID = 10
DROP PROCEDURE InsertNewRecords

CREATE PROCEDURE InsertNewRecords
@Product_ID INT,
@Country VARCHAR(50),
@Product VARCHAR(50),
@UnitSold FLOAT,
@ManufacturingPrice FLOAT,
@SalePrice FLOAT,
@GrossSales VARCHAR(20),
@Sales VARCHAR(20),
@COGS VARCHAR(20),
@Profit VARCHAR(20),
@Dates Date,
@MonthNumber INT,
@MonthName VARCHAR(25),
@YEAR INT

AS
BEGIN

INSERT INTO Products_Table 
(Product_ID, Country, Product,UnitSold, ManufacturingPrice ,SalePrice,GrossSales,Sales,COGS,Profit,Dates,MonthNumber,MonthName,YEAR)
VALUES 
(@Product_ID,@Country,@Product,@UnitSold,@ManufacturingPrice,@SalePrice,@GrossSales,@Sales,@COGS,@Profit,@Dates,@MonthNumber,@MonthName,@YEAR)

END;

EXEC InsertNewRecords
@Product_ID = 10,
@Country = 'India',
@Product = 'Computer',
@UnitSold = 345,
@ManufacturingPrice = 6,
@SalePrice =50,
@GrossSales = '103,500',
@Sales ='103,500',
@COGS ='51,750',
@Profit = '51,750',
@Dates = '2016-06-05',
@MonthNumber = 6,
@MonthName = 'June',
@YEAR = 2016

SELECT * FROM PRODUCTS.DBO.PRODUCTS_TABLE


--- 4. Create a trigger to automatically update the Gross_Sales field in the product_sales table whenever Units_Sold or Sale_Price is updated. 


--- 5. Write a query to find all item_description in the ITEMS_TABLE table that contain the word "Whisky" regardless of case. 

SELECT * FROM Brands.DBO.Items_Table

SELECT Item_ID, Item_description FROM Brands.DBO.Items_Table
WHERE Item_Description LIKE '%Whisky%'

-- 6. Write a query to find the Country and Product where the Profit is greater than the average Profit of all products. 

SELECT Country, Profit FROM PRODUCTS.DBO.PRODUCTS_TABLE
WHERE CAST(REPLACE(Profit, ',','') AS DECIMAL(10,2)) > (
SELECT AVG(CAST(REPLACE(Profit,',','') AS DECIMAL(10,2)))
FROM PRODUCTS.DBO.PRODUCTS_TABLE)

SELECT AVG(CAST(REPLACE(Profit,',','') AS DECIMAL(10,2))) AS AverageProfit 
FROM PRODUCTS.DBO.PRODUCTS_TABLE

-- 7. Write a query to join the ITEMS_TABLE and product_sales tables on a common field (e.g., vendor_nos) and select relevant fields from both tables. 
SELECT * FROM BRANDS.DBO.ITEMS_TABLE
SELECT * FROM PRODUCTS.DBO.PRODUCTS_TABLE


SELECT P.Product_ID, P.Product, B.Item_Description, B.Vendor_Name, B.Bottle_Price, 
P.UnitSold, P.Sales, P.Profit,P.Country, P.Dates  
FROM BRANDS.DBO.ITEMS_TABLE B
INNER JOIN
PRODUCTS.DBO.PRODUCTS_TABLE P
ON 
B.Item_ID = P.Product_ID

-- 8. Write a query to combine item_description and vendor_name into a single string for each record in the ITEMS_TABLE table, separated by a hyphen. 
SELECT * FROM BRANDS.DBO.ITEMS_TABLE

SELECT *, CAST(CONCAT(Item_Description,' - ', Vendor_Name) AS VARCHAR(200)) AS ProductWithVendor 
FROM BRANDS.DBO.ITEMS_TABLE
-- ISSUE with Size, not showing complete String

SELECT *, LEFT(CONCAT(Item_Description, ' - ', Vendor_Name), 50) AS ProductWithVendor
FROM Brands.dbo.Items_Table;


---9. Write a query to display the bottle_price rounded to one decimal place for each record in the ITEMS_TABLE table. 

SELECT *, ROUND(Bottle_Price,1) as RoundBottlePrice FROM BRANDS.DBO.ITEMS_TABLE

SELECT * FROM PRODUCTS.DBO.PRODUCTS_TABLE


---10. Write a query to calculate the number of days between the current date and the Date field for each record in the product_sales table.

SELECT Dates, DATEDIFF(DAY,Dates, GETDATE()) AS TotalDays FROM PRODUCTS.DBO.PRODUCTS_TABLE
SELECT Dates, DATEDIFF(MONTH,Dates, GETDATE()) AS TotalDays FROM PRODUCTS.DBO.PRODUCTS_TABLE
SELECT Dates, DATEDIFF(YEAR,Dates, GETDATE()) AS TotalDays FROM PRODUCTS.DBO.PRODUCTS_TABLE

