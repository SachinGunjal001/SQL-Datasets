CREATE Database Adventure_Works

Select * from customer_lookup

ALTER TABLE Customer_lookup
ALTER COLUMN BirthDate DATE;

ALTER TABLE Customer_lookup
ALTER COLUMN TotalChildren INT;

ALTER TABLE Customer_lookup
ALTER COLUMN AnnualIncome DECIMAL(8,2);

UPDATE Customer_lookup
SET BirthDate =  FORMAT(CAST(BirthDate AS DATE), 'DD-MM-YYYY');

EXEC SP_help 'Customer_lookup' 

Select * from Calendar_Lookup

ALTER TABLE Calender_Lookup
ALTER COLUMN Date DATE;

Select * from product_categories
Select * from product_category_sales


ALTER TABLE product_category_sales
ALTER COLUMN Date DATE;

Select * from Product_Subcategories
Select * from Return_Data

ALTER TABLE Return_Data
ALTER COLUMN ReturnDate DATE;

Select * from Sales_Data

ALTER TABLE Sales_data
ALTER COLUMN Stockdate DATE

Select * from Territory_Lookup