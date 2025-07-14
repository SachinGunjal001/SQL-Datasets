USE COACHX_TRAINING

SELECT * FROM Orders


-- Update Shipping mode for  specific order		
----Q.1 Change the SM to ''First Class' for Order ID = 'CA-2018-115812'


UPDATE Orders
SET [Ship Mode] = 'First Class'
WHERE [Order ID] = 'CA-2020-152156'

--How to check affected columns

SELECT [Ship Mode], [Order Id] FROM Orders
WHERE [Order ID] = 'CA-2020-152156'


---Q.2 Increase discount for all orders in region
-- increase the discount  to 0.2  for all orders in west region

UPDATE ORDERS
SET Discount = 0.2
WHERE REGION = 'WEST'

SELECT DISCOUNT, REGION FROM Orders;

---Q.3 Update multiple columns  for a customer
---Change the city to 'San Francisco' and state to 'CA' for all order by customer 'John Smith'

UPDATE Orders
SET City =  'San Francisco', State = 'CA'
WHERE [Customer Name] = 'Darrin Van Huff';

SELECT [Customer Name], State, City from Orders
WHERE [Customer Name] = 'Darrin Van Huff'

SELECT * FROM Orders

/* Bulk update sales values
 Increase the Sales by 10% for all orders in Technology Category
 */

 UPDATE Orders
 SET Sales = 1.10 * Sales
 WHERE Category = 'Technology';

SELECT CATEGORY, SALES FROM Orders
WHERE Category = 'Technology'


UPDATE Orders
SET Segment = 'Consumer', [Ship Mode] = 'First Class',Region = 'West'
WHERE [Customer Name] = 'Harold Pawlan';

SELECT [Customer Name], Segment, [Ship Mode], Region from Orders
WHERE [Customer Name] = 'Harold Pawlan';


-- ORDER BY

SELECT * FROM Orders


--- List all the Orders sorted by sales - DESC

SELECT [Order ID], [Customer Name], sales, [Order Date] FROM Orders
ORDER BY Sales DESC


---2. List of Customer Alphabetically

SELECT [Order ID], [Customer Name], sales FROM Orders
ORDER BY [Customer Name] 


---3. Top Profitable Orders by Region

SELECT [Order ID], Region,	Profit FROM Orders
ORDER BY Region ASC, Profit DESC;


-- 4. Order by Category and SubCategory

SELECT [Order ID], Category, [Sub-Category], Sales FROM Orders
ORDER BY Category, [Sub-Category], Sales DESC;

--- Order sorted by Discount  then by sales

SELECT [Order ID], Quantity, Sales FROM Orders
ORDER BY Quantity DESC, Sales ASC;

SELECT [Order ID], Quantity, Sales FROM Orders
ORDER BY Quantity DESC, Sales DESC;





