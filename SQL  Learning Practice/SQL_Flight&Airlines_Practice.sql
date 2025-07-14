CREATE DATABASE COACHX_Assignments

USE COACHX_Assignments

CREATE TABLE Airlines (
    AirlineID INT PRIMARY KEY,
    AirlineName VARCHAR(50),
    Country VARCHAR(30),
    Alliance VARCHAR(30)
);


INSERT INTO Airlines (AirlineID, AirlineName, Country, Alliance) VALUES
(101, 'SkyJet',      'USA',       'SkyTeam'),
(102, 'AirNova',     'Canada',    'Star Alliance'),
(103, 'BlueWings',   'UK',        'Oneworld'),
(104, 'EastAir',     'Japan',     'Star Alliance'),
(105, 'AeroFly',     'Germany',   'Star Alliance'),
(106, 'PacificAir',  'Australia', 'Oneworld'),
(107, 'EuroJet',     'France',    'SkyTeam'),
(108, 'AirVista',    'Italy',     'SkyTeam'),
(109, 'FlyAsia',     'Singapore', 'Oneworld'),
(110, 'SkyWorld',    'Brazil',    'Star Alliance'),
(111, 'NorthStar',   'USA',       'Oneworld'),
(112, 'JetStream',   'Canada',    'SkyTeam'),
(113, 'SunAir',      'Spain',     'Oneworld'),
(114, 'AirConnect',  'India',     'Star Alliance'),
(115, 'PolarWings',  'Russia',    'SkyTeam');




CREATE TABLE Flights (
    FlightID INT PRIMARY KEY,
    AirlineID INT,
    DepartureAirport VARCHAR(10),
    ArrivalAirport VARCHAR(10),
    DepartureDate DATE,
    TicketPrice INT,
    SeatsBooked INT,
    FlightStatus VARCHAR(20),
    FOREIGN KEY (AirlineID) REFERENCES Airlines(AirlineID)
);

INSERT INTO Flights (FlightID, AirlineID, DepartureAirport, ArrivalAirport, DepartureDate, TicketPrice, SeatsBooked, FlightStatus) VALUES
(1, 101, 'JFK', 'LAX', '2025-06-01', 350, 178, 'On Time'),
(2, 102, 'ORD', 'SFO', '2025-06-02', 420, 150, 'Delayed'),
(3, 101, 'LAX', 'JFK', '2025-06-03', 375, 165, 'Cancelled'),
(4, 103, 'ATL', 'SEA', '2025-06-01', 295, 200, 'On Time'),
(5, 104, 'SEA', 'ATL', '2025-06-04', 310, 190, 'On Time'),
(6, 102, 'SFO', 'ORD', '2025-06-05', 410, 120, 'On Time'),
(7, 101, 'JFK', 'ORD', '2025-06-06', 360, 180, 'Delayed'),
(8, 103, 'SEA', 'JFK', '2025-06-07', 390, 170, 'On Time'),
(9, 104, 'ATL', 'SFO', '2025-06-08', 405, 155, 'Cancelled'),
(10, 102, 'ORD', 'SEA', '2025-06-09', 370, 160, 'On Time'),
(11, 101, 'LAX', 'ATL', '2025-06-10', 330, 175, 'On Time'),
(12, 103, 'SEA', 'ORD', '2025-06-11', 420, 130, 'Delayed'),
(13, 104, 'JFK', 'SFO', '2025-06-12', 415, 140, 'On Time'),
(14, 102, 'SFO', 'ATL', '2025-06-13', 400, 125, 'Cancelled'),
(15, 101, 'ORD', 'SEA', '2025-06-14', 385, 160, 'On Time');



SELECT * FROM Airlines
SELECT * FROM Flights


-----SCENARIOS------------

--- 1. Show all flights with their airline name and country.

SELECT Fl.AirlineID, Ar.AirlineName, Ar.Country, Fl.* FROM Airlines Ar
INNER JOIN
Flights Fl
ON Ar.AirlineID = Fl.AirlineID

--- 2.	List all airlines that do not have any flights scheduled.

SELECT AR.AirlineID, AR.AirlineName, AR.Country, AR.Alliance
FROM Airlines AR
LEFT JOIN Flights FL 
ON AR.AirlineID = FL.AirlineID
WHERE FL.FlightID IS NULL;


--- 3.	Display each flight’s ID, airline name, and alliance for flights departing from 'JFK'.

SELECT FL.FlightID, AR.AirlineName, AR.Alliance, FL.DepartureAirport, AR.Country
FROM Airlines AR
INNER JOIN Flights FL 
ON AR.AirlineID = FL.AirlineID
WHERE FL.DepartureAirport = 'JFK';

SELECT * FROM Airlines
SELECT * FROM Flights

--- 4.	Count the number of flights for each airline.

SELECT AR.AirlineID, AR.AirlineName, COUNT(FL.FlightID) AS NumberOfFlights FROM Airlines AR
LEFT JOIN
Flights FL
ON AR.AirlineID = FL.AirlineID
GROUP BY AR.AirlineID, AR.AirlineName


--- 5.	Find the average ticket price for each flight status (e.g., On Time, Delayed, Cancelled).

SELECT FL.FlightStatus, AVG(FL.TicketPrice) AS AveragePrice FROM Airlines AR
INNER JOIN
Flights FL
ON AR.AirlineID = FL.AirlineID
GROUP BY FL.FlightStatus


--- 6.	List airlines with more than 2 flights.

SELECT AR.AirlineName,COUNT(FL.AirlineID) as TotalFlights FROM Airlines AR
INNER JOIN
Flights FL
ON AR.AirlineID = FL.AirlineID
GROUP BY FL.AirlineID, AR.AirlineName
HAVING COUNT(FL.AirlineID) > 2


--- 7.	Show departure airports where the average ticket price is above $400.

SELECT FL.DepartureAirport, SUM(FL.TicketPrice) as TotalPrice  FROM Airlines AR
INNER JOIN
Flights FL
ON AR.AirlineID = FL.AirlineID
GROUP BY FL.DepartureAirport
HAVING SUM(FL.TicketPrice) > 400




--- 8.	Add a new column to the Flights table to store the aircraft type.
--- Hint: Use ALTER TABLE to add a VARCHAR column.

ALTER TABLE Flights
ADD AircraftType VARCHAR(50)


--- 9.	Find all flights that are delayed and have more than 150 seats booked.

SELECT *  FROM Flights
WHERE FlightStatus = 'Delayed' AND SeatsBooked > 150;



10.	Show all flights operated by 'AirNova'.

SELECT AR.AirlineID,Fl.*, AR.AirlineName FROM Airlines AR
INNER JOIN 
Flights FL
ON AR.AirlineID = FL.AirlineID
WHERE AR.AirlineName = 'AirNova'


--- 11.	List all flights departing from 'ORD' with a ticket price less than $400.

SELECT * FROM Flights
WHERE DepartureAirport = 'ORD' AND TicketPrice < 400;


--- 12.	Display all flights that are either cancelled or have a ticket price above $410.

SELECT * FROM Flights
WHERE FlightStatus = 'Cancelled' OR TicketPrice > 410;
