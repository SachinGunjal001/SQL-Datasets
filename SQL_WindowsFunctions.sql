USE CLASSPRACTICE

CREATE TABLE HotelBooking (
    BookingID INT PRIMARY KEY,
    GuestName VARCHAR(50),
    RoomNumber INT,
    RoomType VARCHAR(20),
    CheckInDate DATE,
    CheckOutDate DATE,
    TotalAmount DECIMAL(10,2)
);


INSERT INTO HotelBooking VALUES
(1, 'Alice Smith', 101, 'Deluxe', '2024-07-01', '2024-07-05', 1200),
(2, 'Bob Johnson', 102, 'Standard', '2024-07-02', '2024-07-04', 600),
(3, 'Carol Lee', 201, 'Suite', '2024-07-03', '2024-07-08', 2500),
(4, 'David Kim', 103, 'Standard', '2024-07-04', '2024-07-06', 650),
(5, 'Eva Brown', 202, 'Deluxe', '2024-07-05', '2024-07-09', 1600),
(6, 'Frank Green', 104, 'Standard', '2024-07-06', '2024-07-07', 300),
(7, 'Grace Hall', 203, 'Suite', '2024-07-07', '2024-07-12', 2800),
(8, 'Henry Young', 105, 'Standard', '2024-07-08', '2024-07-10', 500),
(9, 'Irene King', 204, 'Deluxe', '2024-07-09', '2024-07-13', 1400),
(10, 'Jack Wright', 205, 'Suite', '2024-07-10', '2024-07-14', 2200),
(11, 'Kate Scott', 106, 'Standard', '2024-07-11', '2024-07-12', 250),
(12, 'Leo Adams', 206, 'Deluxe', '2024-07-12', '2024-07-15', 900),
(13, 'Mia Baker', 207, 'Suite', '2024-07-13', '2024-07-18', 3000),
(14, 'Noah Carter', 107, 'Standard', '2024-07-14', '2024-07-16', 400),
(15, 'Olivia Evans', 208, 'Deluxe', '2024-07-15', '2024-07-18', 1100),
(16, 'Paul Foster', 209, 'Suite', '2024-07-16', '2024-07-20', 2600),
(17, 'Quinn Garcia', 108, 'Standard', '2024-07-17', '2024-07-19', 350),
(18, 'Rachel Harris', 210, 'Deluxe', '2024-07-18', '2024-07-21', 950),
(19, 'Sam Ingram', 211, 'Suite', '2024-07-19', '2024-07-23', 2700),
(20, 'Tina Jones', 109, 'Standard', '2024-07-20', '2024-07-22', 420);

SELECT * FROM HotelBooking


-------------------------------------------------------------------
--Windows Function
To perform calculations across a set of rows (a 'Window') that are related

Partition by - Divides the result set into groups(Like group by, but ROWS are not collapsed.)
ORDER by ------- Define the orders of rows within each partition
Aggregate - MIN, MAX, AVG                  -----PERFORM AGGR
Ranking - RANK, DENSE_RANK                --ASSIGN THE RANKS OR SEQUENSE NUMBERS WITH PARTITION
VALUE FUNCTIONS - FIRST VALUE, LAST VALUE, LEAD, LAG -- ACCESS DATA FROM OTHER ROWS IN THE WINDOWS

---1. Running total of Revenue by RoomType

SELECT RoomType, CheckinDate, TotalAmount, 
SUM(TotalAmount) OVER(PARTITION BY RoomType ORDER BY CheckinDate) 
AS RunningTotal
FROM HotelBooking


--- ROW_NUMBER()

SELECT RoomType, CheckinDate, TotalAmount, 
ROW_NUMBER()
OVER(PARTITION BY RoomType ORDER BY CheckinDate) 
AS RunningTotal
FROM HotelBooking



SELECT RoomType, CheckinDate, TotalAmount, 
SUM(TotalAmount) OVER(PARTITION BY RoomType ORDER BY CheckinDate) 
AS RunningTotal,
ROW_NUMBER()
OVER(PARTITION BY RoomType ORDER BY CheckinDate) 
AS RowNumber
FROM HotelBooking


---3. Average booking amount by GUEST

SELECT GuestName, TotalAmount,
AVG(TotalAmount)
OVER(PARTITION BY GuestName order by GUESTNAME DESC, TotalAmount DESC)
AS AverageBookingAmt
FROM HotelBooking

----RANK()
---4. Rank Guest by total spent

SELECT GuestName,
SUM(TOTALAMOUNT) AS TOTALSPENT,
RANK() OVER(PARTITION BY SUM(TOTALAMOUNT) DESC )
AS SPENDINGRANK
FROM HotelBooking
GROUP BY GUESTNAME

SELECT GuestName,
       SUM(TotalAmount) AS TOTAL_SPENT,
       RANK() OVER(ORDER BY SUM(TotalAmount) DESC) 
	   AS Spending_Rank,
FROM HotelBooking
GROUP BY GuestName;

SELECT GuestName,
       SUM(TotalAmount) AS TOTAL_SPENT,
       DENSE_RANK() OVER(ORDER BY SUM(TotalAmount) DESC) 
	   AS Spending_Rank
FROM HotelBooking
GROUP BY GuestName;


-----------
SELECT RoomType, CheckinDate, TotalAmount, 
RANK()
OVER(PARTITION BY RoomType ORDER BY CheckinDate) 
AS RunningTotal,
DENSE_RANK()
OVER(PARTITION BY RoomType ) 
AS RunningTotal
FROM HotelBooking
