CREATE DATABASE HR_Management_System_1

use HR_Management_System_1;


CREATE TABLE Regions(
Region_Id INT PRIMARY KEY NOT NULL,
Region_Name VARCHAR(50) DEFAULT NULL
)

INSERT INTO regions(region_id,region_name)  
VALUES (1,'Europe'); 
INSERT INTO regions(region_id,region_name)  
VALUES (2,'Americas'); 
INSERT INTO regions(region_id,region_name)  
VALUES (3,'Asia'); 
INSERT INTO regions(region_id,region_name)  
VALUES (4,'Middle East and Africa'); 



CREATE TABLE Countries(
Country_Id CHAR(3) PRIMARY KEY NOT NULL,
Country_Name VARCHAR(50) DEFAULT NULL,
Region_Id INT NOT NULL,
FOREIGN KEY (Region_Id) REFERENCES Regions(Region_Id) 
ON DELETE CASCADE ON UPDATE CASCADE
)

INSERT INTO countries(country_id,country_name,region_id)  
VALUES ('AR','Argentina',2); 
INSERT INTO countries(country_id,country_name,region_id)  
VALUES ('AU','Australia',3); 
INSERT INTO countries(country_id,country_name,region_id)  
VALUES ('BE','Belgium',1); 
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('BR','Brazil',2); 
INSERT INTO countries(country_id,country_name,region_id)  
VALUES ('CA','Canada',2); 
INSERT INTO countries(country_id,country_name,region_id)  
VALUES ('CH','Switzerland',1); 
INSERT INTO countries(country_id,country_name,region_id)  
VALUES ('CN','China',3); 
INSERT INTO countries(country_id,country_name,region_id)  
VALUES ('DE','Germany',1); 
INSERT INTO countries(country_id,country_name,region_id)  
VALUES ('DK','Denmark',1); 
INSERT INTO countries(country_id,country_name,region_id)  
VALUES ('EG','Egypt',4); 
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('FR','France',1); 
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('HK','HongKong',3); 
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('IL','Israel',4); 
INSERT INTO countries(country_id,country_name,region_id)  
VALUES ('IN','India',3); 
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('IT','Italy',1); 
INSERT INTO countries(country_id,country_name,region_id)  
VALUES ('JP','Japan',3); 
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('KW','Kuwait',4); 
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('MX','Mexico',2); 
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('NG','Nigeria',4); 
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('NL','Netherlands',1); 
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('SG','Singapore',3); 
INSERT INTO countries(country_id,country_name,region_id)  
VALUES ('UK','United Kingdom',1); 
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('US','United States of America',2); 
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('ZM','Zambia',4); 
INSERT INTO countries(country_id,country_name,region_id)  
VALUES ('ZW','Zimbabwe',4); 



CREATE TABLE Locations(
Location_ID INT PRIMARY KEY NOT NULL,
Street_Address VARCHAR(100) DEFAULT NULL,
Postal_code VARCHAR(10) DEFAULT NULL,
City VARCHAR(15) NOT NULL,
State_Province VARCHAR(20) DEFAULT NULL,
Country_Id CHAR(3) NOT NULL,
FOREIGN KEY (Country_Id) REFERENCES Countries(Country_Id) 
ON DELETE CASCADE ON UPDATE CASCADE
)

ALTER TABLE Locations
ALTER Column City VARCHAR(30);

INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id) 
VALUES (1400,'2014 Jabberwocky Rd','26192','Southlake','Texas','US'); 
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id) 
VALUES (1500,'2011 Interiors Blvd','99236','South San Francisco','California','US'); 
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id) 
VALUES (1700,'2004 Charade Rd','98199','Seattle','Washington','US'); 
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id)  
VALUES (1800,'147 Spadina Ave','M5V 2L7','Toronto','Ontario','CA'); 
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id)  
VALUES (2400,'8204 Arthur St',NULL,'London',NULL,'UK'); 
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id)  
VALUES (2500,'Magdalen Centre, The Oxford Science Park','OX9 9ZB','Oxford','Oxford','UK'); 
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id) 
VALUES (2700,'Schwanthalerstr. 7031','80925','Munich','Bavaria','DE'); 

SELECT * from Locations



CREATE TABLE Departments(
Department_ID INT PRIMARY KEY NOT NULL,
Department_Name VARCHAR(50) DEFAULT NULL,
Location_ID INT NOT NULL,
FOREIGN KEY (Location_ID) REFERENCES Locations(Location_ID)
ON DELETE CASCADE ON UPDATE CASCADE
)


INSERT INTO departments(department_id,department_name,location_id) 
VALUES (1,'Administration',1700); 
INSERT INTO departments(department_id,department_name,location_id) 
VALUES (2,'Marketing',1800); 
INSERT INTO departments(department_id,department_name,location_id) 
VALUES (3,'Purchasing',1700); 
INSERT INTO departments(department_id,department_name,location_id) 
VALUES (4,'Human Resources',2400); 
INSERT INTO departments(department_id,department_name,location_id)  
VALUES (5,'Shipping',1500); 
INSERT INTO departments(department_id,department_name,location_id) 
VALUES (6,'IT',1400); 
INSERT INTO departments(department_id,department_name,location_id)  
VALUES (7,'Public Relations',2700); 
INSERT INTO departments(department_id,department_name,location_id)  
VALUES (8,'Sales',2500); 
INSERT INTO departments(department_id,department_name,location_id) 
VALUES (9,'Executive',1700); 
INSERT INTO departments(department_id,department_name,location_id)  
VALUES (10,'Finance',1700); 
INSERT INTO departments(department_id,department_name,location_id)  
VALUES (11,'Accounting',1700);

CREATE TABLE Jobs(
Job_ID INT PRIMARY KEY NOT NULL,
Job_Title VARCHAR(30) DEFAULT NULL,
Min_Salary DECIMAL(8,2) DEFAULT NULL,
Max_Salary DECIMAL(8,2) DEFAULT NULL
)

ALTER TABLE JOBS
ALTER COLUMN Job_Title VARCHAR(50)

INSERT INTO jobs(job_id,job_title,min_salary,max_salary) 
VALUES (1,'Public Accountant',4200.00,9000.00); 
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)  
VALUES (2,'Accounting Manager',8200.00,16000.00); 
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)  
VALUES (3,'Administration Assistant',3000.00,6000.00); 
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) 
VALUES (4,'President',20000.00,40000.00); 
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)  
VALUES (5,'Administration Vice President',15000.00,30000.00); 
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)  
VALUES (6,'Accountant',4200.00,9000.00); 
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)  
VALUES (7,'Finance Manager',8200.00,16000.00); 
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)  
VALUES (8,'Human Resources Representative',4000.00,9000.00); 
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)  
VALUES (9,'Programmer',4000.00,10000.00); 
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)  
VALUES (10,'Marketing Manager',9000.00,15000.00); 
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)  
VALUES (11,'Marketing Representative',4000.00,9000.00); 
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)  
VALUES (12,'Public Relations Representative',4500.00,10500.00); 
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) 
VALUES (13,'Purchasing Clerk',2500.00,5500.00); 
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)  
VALUES (14,'Purchasing Manager',8000.00,15000.00); 
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) 
VALUES (15,'Sales Manager',10000.00,20000.00); 
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) 
VALUES (16,'Sales Representative',6000.00,12000.00); 
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) 
VALUES (17,'Shipping Clerk',2500.00,5500.00); 
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) 
VALUES (18,'Stock Clerk',2000.00,5000.00); 
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)  
VALUES (19,'Stock Manager',5500.00,8500.00); 



CREATE TABLE Employees(
Employee_ID INT PRIMARY KEY NOT NULL,
First_Name VARCHAR(25) DEFAULT NULL,
Last_Name VARCHAR(25) NOT NULL,
Email VARCHAR(25) NOT NULL,
Phone_Number VARCHAR(20) DEFAULT NULL,
Hire_Date DATE NOT NULL,
Job_ID INT NOT NULL,
Salary DECIMAL(8,2) NOT NULL,
Manager_Id INT NOT NULL,
Department_Id INT DEFAULT NULL,
FOREIGN KEY (job_id) REFERENCES jobs (job_id) 
ON DELETE CASCADE ON UPDATE CASCADE, 
FOREIGN KEY (department_id) REFERENCES departments (department_id) 
ON DELETE CASCADE ON UPDATE CASCADE, 
FOREIGN KEY (manager_id) REFERENCES employees(employee_id) 
)

ALTER TABLE EMPLOYEEs
ALTER COLUMN Email VARCHAR(100)

ALTER TABLE Employees
ALTER COLUMN Manager_Id INT DEFAULT NULL;

INSERT INTO 
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)  
VALUES (100,'Steven','King','steven.king@sqltutorial.org','515.123.4567','1987-06-17',4,24000.00,NULL,9); 
INSERT INTO 
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) 
VALUES (101,'Neena','Kochhar','neena.kochhar@sqltutorial.org','515.123.4568','1989-09-21',5,17000.00,100,9); 
INSERT INTO 
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) 
VALUES (102,'Lex','De Haan','lex.de haan@sqltutorial.org','515.123.4569','1993-01-13',5,17000.00,100,9); 
INSERT INTO 
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) 
VALUES (103,'Alexander','Hunold','alexander.hunold@sqltutorial.org','590.423.4567','1990-01-03',9,9000.00,102,6); 
INSERT INTO 
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) 
VALUES (104,'Bruce','Ernst','bruce.ernst@sqltutorial.org','590.423.4568','1991-05-21',9,6000.00,103,6); 
INSERT INTO 
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) 
VALUES (105,'David','Austin','david.austin@sqltutorial.org','590.423.4569','1997-06-25',9,4800.00,103,6); 
INSERT INTO 
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) 
VALUES (106,'Valli','Pataballa','valli.pataballa@sqltutorial.org','590.423.4560','1998-02-05',9,4800.00,103,6); 
INSERT INTO 
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) 
VALUES (107,'Diana','Lorentz','diana.lorentz@sqltutorial.org','590.423.5567','1999-02-07',9,4200.00,103,6); 
INSERT INTO 
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) 
VALUES (108,'Nancy','Greenberg','nancy.greenberg@sqltutorial.org','515.124.4569','1994-08-17',7,12000.00,101,10); 
INSERT INTO 
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) 
VALUES (109,'Daniel','Faviet','daniel.faviet@sqltutorial.org','515.124.4169','1994-08-16',6,9000.00,108,10); 
INSERT INTO 
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) 
VALUES (110,'John','Chen','john.chen@sqltutorial.org','515.124.4269','1997-09-28',6,8200.00,108,10); 
INSERT INTO 
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) 
VALUES (111,'Ismael','Sciarra','ismael.sciarra@sqltutorial.org','515.124.4369','1997-09-30',6,7700.00,108,10); 
INSERT INTO 
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) 
VALUES (112,'Jose Manuel','Urman','jose manuel.urman@sqltutorial.org','515.124.4469','1998-03-07',6,7800.00,108,10); 
INSERT INTO 
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) 
VALUES (113,'Luis','Popp','luis.popp@sqltutorial.org','515.124.4567','1999-12-07',6,6900.00,108,10); 
INSERT INTO 
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) 
VALUES (114,'Den','Raphaely','den.raphaely@sqltutorial.org','515.127.4561','1994-12-07',14,11000.00,100,3); 
INSERT INTO 
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) 
VALUES (115,'Alexander','Khoo','alexander.khoo@sqltutorial.org','515.127.4562','1995-05-18',13,3100.00,114,3); 
INSERT INTO 
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) 
VALUES (116,'Shelli','Baida','shelli.baida@sqltutorial.org','515.127.4563','1997-12-24',13,2900.00,114,3); 
INSERT INTO 
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) 
VALUES (117,'Sigal','Tobias','sigal.tobias@sqltutorial.org','515.127.4564','1997-07-24',13,2800.00,114,3); 
INSERT INTO 
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) 
VALUES (118,'Guy','Himuro','guy.himuro@sqltutorial.org','515.127.4565','1998-11-15',13,2600.00,114,3); 
INSERT INTO 
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) 
VALUES (119,'Karen','Colmenares','karen.colmenares@sqltutorial.org','515.127.4566','1999-08-10',13,2500.00,114,3); 
INSERT INTO 
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) 
VALUES (120,'Matthew','Weiss','matthew.weiss@sqltutorial.org','650.123.1234','1996-07-18',19,8000.00,100,5); 
INSERT INTO 
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) 
VALUES (121,'Adam','Fripp','adam.fripp@sqltutorial.org','650.123.2234','1997-04-10',19,8200.00,100,5); 
INSERT INTO 
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) 
VALUES (122,'Payam','Kaufling','payam.kaufling@sqltutorial.org','650.123.3234','1995-05-01',19,7900.00,100,5); 
INSERT INTO 
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) 
VALUES (123,'Shanta','Vollman','shanta.vollman@sqltutorial.org','650.123.4234','1997-10-10',19,6500.00,100,5); 
INSERT INTO 
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) 
VALUES (126,'Irene','Mikkilineni','irene.mikkilineni@sqltutorial.org','650.124.1224','1998-09-28',18,2700.00,120,5); 
INSERT INTO 
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) 
VALUES (145,'John','Russell','john.russell@sqltutorial.org',NULL,'1996-10-01',15,14000.00,100,8); 
INSERT INTO 
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) 
VALUES (146,'Karen','Partners','karen.partners@sqltutorial.org',NULL,'1997-01-05',15,13500.00,100,8); 
INSERT INTO 
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) 
VALUES (176,'Jonathon','Taylor','jonathon.taylor@sqltutorial.org',NULL,'1998-03-24',16,8600.00,100,8); 
INSERT INTO 
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) 
VALUES (177,'Jack','Livingston','jack.livingston@sqltutorial.org',NULL,'1998-04-23',16,8400.00,100,8); 
INSERT INTO 
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) 
VALUES (178,'Kimberely','Grant','kimberely.grant@sqltutorial.org',NULL,'1999-05-24',16,7000.00,100,8); 
INSERT INTO 
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) 
VALUES (179,'Charles','Johnson','charles.johnson@sqltutorial.org',NULL,'2000-01-04',16,6200.00,100,8); 
INSERT INTO 
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) 
VALUES (192,'Sarah','Bell','sarah.bell@sqltutorial.org','650.501.1876','1996-02-04',17,4000.00,123,5); 
INSERT INTO 
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) 
VALUES (193,'Britney','Everett','britney.everett@sqltutorial.org','650.501.2876','1997-03-03',17,3900.00,123,5); 
INSERT INTO 
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) 
VALUES (200,'Jennifer','Whalen','jennifer.whalen@sqltutorial.org','515.123.4444','1987-09-17',3,4400.00,101,1); 
INSERT INTO 
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) 
VALUES (201,'Michael','Hartstein','michael.hartstein@sqltutorial.org','515.123.5555','1996-02-17',10,13000.00,100,2); 
INSERT INTO 
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) 
VALUES (202,'Pat','Fay','pat.fay@sqltutorial.org','603.123.6666','1997-08-17',11,6000.00,201,2); 
INSERT INTO 
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) 
VALUES (203,'Susan','Mavris','susan.mavris@sqltutorial.org','515.123.7777','1994-06-07',8,6500.00,101,4); 
INSERT INTO 
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) 
VALUES (204,'Hermann','Baer','hermann.baer@sqltutorial.org','515.123.8888','1994-06-07',12,10000.00,101,7); 
INSERT INTO 
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) 
VALUES (205,'Shelley','Higgins','shelley.higgins@sqltutorial.org','515.123.8080','1994-06-07',2,12000.00,101,11); 



CREATE TABLE Dependents(
Dependent_Id INT PRIMARY KEY NOT NULL,
First_Name VARCHAR(25) DEFAULT NULL,
Last_Name VARCHAR(25) DEFAULT NULL,
Relationship VARCHAR(25) DEFAULT NULL,
Employee_id INT NOT NULL,
FOREIGN KEY (employee_id) REFERENCES employees (employee_id) 
ON DELETE CASCADE ON UPDATE CASCADE
)


INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)  
VALUES (1,'Penelope','Gietz','Child',120); 
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)  
VALUES (2,'Nick','Higgins','Child',205); 
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)  
VALUES (3,'Ed','Whalen','Child',200); 
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)  
VALUES (4,'Jennifer','King','Child',100); 
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)  
VALUES (5,'Johnny','Kochhar','Child',101); 
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)  
VALUES (6,'Bette','De Haan','Child',102); 
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)  
VALUES (7,'Grace','Faviet','Child',109); 
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)  
VALUES (8,'Matthew','Chen','Child',110); 
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)  
VALUES (9,'Joe','Sciarra','Child',111); 
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)  
VALUES (10,'Christian','Urman','Child',112); 
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)  
VALUES (11,'Zero','Popp','Child',113); 
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)  
VALUES (12,'Karl','Greenberg','Child',108); 
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)  
VALUES (13,'Uma','Mavris','Child',203); 
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)  
VALUES (14,'Vivien','Hunold','Child',103); 
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)  
VALUES (15,'Cuba','Ernst','Child',104); 
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (16,'Fred','Austin','Child',105); 
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)  
VALUES (17,'Helen','Pataballa','Child',106); 
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (18,'Dan','Lorentz','Child',107); 
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)  
VALUES (19,'Bob','Hartstein','Child',201); 
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)  
VALUES (20,'Lucille','Fay','Child',202); 
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (21,'Kirsten','Baer','Child',204); 
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)  
VALUES (22,'Elvis','Khoo','Child',115); 
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)  
VALUES (23,'Sandra','Baida','Child',116); 
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (24,'Cameron','Tobias','Child',117); 
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)  
VALUES (25,'Kevin','Himuro','Child',118); 
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)  
VALUES (26,'Rip','Colmenares','Child',119); 
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)  
VALUES (27,'Julia','Raphaely','Child',114); 
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)  
VALUES (28,'Woody','Russell','Child',145); 
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)  
VALUES (29,'Alec','Partners','Child',146); 
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)  
VALUES (30,'Sandra','Taylor','Child',176); 

SELECT * FROM Employees
SELECT * FROM Dependents
SELECT * FROM  Departments
SELECT * FROM Locations
SELECT * FROM Regions
SELECT * FROM Countries
SELECT * FROM Jobs


/*
TASK 1


1)WRITE A QUERY FOR SELECT STATEMENTS :- 
Syntax of SELECT STATEMENT:- 
SELECT 
select_list 
FROM 
table_name; 
*/
A. To get data from all the rows and columns in the employees table: 

SELECT * FROM Employees

B. select data from the employee id, first name, last name, and hire date of all rows in the employees table: 

SELECT Employee_ID, First_Name, Last_Name, Hire_Date FROM Employees

C. to get the first name, last name, salary, and new salary: 
D. Increase the salary two times and named as New_SALARY from employees table 

SELECT First_Name, Last_Name, Salary, Salary*2 as New_SALARY FROM Employees


/*
2)WRITE A QUERY FOR ORDER BY STATEMENTS :- 
Syntax of ORDER BY Statements:- 
SELECT 
select_list 
FROM 
table_name 
ORDER BY 
sort_expression1 [ASC | DESC], 
_expression 2[ASC | DESC];

*/
 A. returns the data from the employee id, first name, last name, hire date, and salary column of the employees table: 

 SELECT Employee_ID, First_Name, Last_Name, Hire_Date, Salary FROM Employees


B. to sort employees by first names in alphabetical order: 

 SELECT Employee_ID, First_Name, Last_Name, Hire_Date, Salary 
 FROM Employees
 ORDER BY First_Name

C. to sort the employees by the first name in ascending order and the last name in descending order: 

 SELECT Employee_ID, First_Name, Last_Name, Hire_Date, Salary 
 FROM Employees
 ORDER BY First_Name ASC, Last_Name DESC

D. to sort employees by salary from high to low: 

SELECT Employee_ID, First_Name, Last_Name, Hire_Date, Salary 
 FROM Employees
 ORDER BY Salary DESC


E. to sort the employees by values in the hire_date column from: 

SELECT Employee_ID, First_Name, Last_Name, Hire_Date, Salary 
 FROM Employees
 ORDER BY Hire_Date ASC

F. sort the employees by the hire dates in descending order: 

SELECT Employee_ID, First_Name, Last_Name, Hire_Date, Salary 
 FROM Employees
 ORDER BY Hire_Date DESC


 /*
 3)WRITE A QUERY FOR DISTINCT STATEMENTS :- 
Syntax of DISTINCT Statements:- 
SELECT DISTINCT 
column1, column2, ... 
FROM 
table1; 
*/

A. selects the salary data from the salary column of the employees table and sorts them from high to low:

SELECT Salary 
 FROM Employees
 ORDER BY Salary DESC

B. select unique values from the salary column of the employees table: 

SELECT DISTINCT Salary 
 FROM Employees
 ORDER BY Salary DESC

C. selects the job id and salary from the employees table: 

SELECT Job_ID, Salary 
 FROM Employees

D. to remove the duplicate values in job id and salary: 

SELECT  DISTINCT Job_ID, Salary 
 FROM Employees

E. returns the distinct phone numbers of employees:

SELECT  DISTINCT Phone_Number FROM Employees


/*
 4)WRITE A QUERY FOR TOP N STATEMENTS :- 
Syntax of TOP N Statements(N=Will be any nos) 
SELECT TOP N 
column_list 
FROM 
table1 
ORDER BY column_list 
*/

A. returns all rows in the employees table sorted by the first_name column.

SELECT First_Name FROM Employees
ORDER BY First_Name 

B. to return the first 5 rows in the result set returned by the SELECT clause:

SELECT TOP 5 First_Name FROM Employees
ORDER BY First_Name 


C. to return five rows starting from the 4th row: 

SELECT FIRST_NAME  FROM Employees
ORDER BY First_Name 
OFFSET 3 ROWS FETCH NEXT 5 ROWS ONLY;

D. gets the top five employees with the highest salaries. 

SELECT TOP 5 First_Name, Salary  FROM Employees
ORDER BY Salary DESC 

E. to get employees who have the 2nd highest salary in the company 

SELECT FIRST_NAME, SALARY FROM Employees
ORDER BY Salary DESC
OFFSET 1 ROW FETCH NEXT 1 ROW ONLY


/*

5)WRITE A QUERY FOR WHERE CLAUSE and COMPARISON OPERATORS :- 
Syntax of WHERE CLAUSE and COMPARISON OPERATORS:-- 
SELECT 
column1, column2, ... 
FROM 
table_name 
WHERE 
condition; 
*/

A. query finds employees who have salaries greater than 14,000 and sorts the results sets based on the salary in descending order. 

SELECT Employee_ID, Salary FROM EMPLOYEES
WHERE SALARY > 14000
ORDER BY SALARY DESC

B. query finds all employees who work in the department id 5.

SELECT * FROM EMPLOYEES
WHERE DEPARTMENT_ID = 5

 C. query finds the employee whose last name is Chen 

 SELECT * FROM EMPLOYEES
 WHERE LAST_NAME LIKE 'Chen%'

D. To get all employees who joined the company after January 1st, 1999 

SELECT * FROM EMPLOYEES
WHERE hire_date > '1999-01-01'

E. to find the employees who joined the company in 1999, 
SELECT Employee_Id, Hire_date FROM EMPLOYEES
WHERE YEAR(hire_date) = 1999

F. statement finds the employee whose last name is Himuro 

 SELECT * FROM EMPLOYEES
 WHERE LAST_NAME LIKE 'Himuro'

G. the query searches for the string Himuro in the last_name column of the employees table. 

 SELECT * FROM EMPLOYEES
 WHERE LAST_NAME LIKE '%Himuro%'

H. to find all employees who do not have phone numbers: 
 
 SELECT * FROM EMPLOYEES
 WHERE Phone_Number IS NULL


I. returns all employees whose department id is not 8. 

 SELECT * FROM EMPLOYEES
 WHERE Department_Id <> 8
 ORDER BY Department_Id DESC

J. finds all employees whose department id is not eight and ten. 

SELECT * FROM EMPLOYEES
 WHERE Department_Id <> 8 
 AND 
 Department_Id <> 10
 ORDER BY Department_Id DESC

K. to find the employees whose salary is greater than 10,000, 

SELECT * FROM EMPLOYEES
WHERE Salary > 10000

L. finds employees in department 8 and have the salary greater than 10,000: 

SELECT * FROM EMPLOYEES
WHERE DEPARTMENT_ID = 8
AND 
Salary > 10000

M. the statement below returns all employees whose salaries are less than 10,000:

SELECT * FROM EMPLOYEES
WHERE Salary < 10000

N. finds employees whose salaries are greater than or equal 9,000:

SELECT * FROM EMPLOYEES
WHERE Salary <= 9000


O. finds employees whose salaries are less than or equal to 9,000: 

SELECT * FROM EMPLOYEES
WHERE Salary >= 9000


/*
6)WRITE A QUERY FOR:- 
Courses
*Course_ID
Course_Name
*/

CREATE TABLE Courses(
Course_Id INT PRIMARY KEY NOT NULL,
Course_Name VARCHAR(100) NOT NULL
)

SELECT * FROM Courses
A. adds a new column named credit_hours to the courses table. 

ALTER TABLE Courses
ADD Credit_Hours INT

SELECT * FROM Courses


B. adds the fee and max_limit columns to the courses table and places these columns after the course_name column. 

ALTER TABLE Courses
ADD fee DECIMAL(10,2) ,
max_limit INT ;

SELECT * FROM Courses


WE cannot control column order in SQL Server.
Columns will be added at the end of the table.

C. changes the attribute of the fee column to NOT NULL. 

ALTER TABLE COURSES
ALTER COLUMN FEE DECIMAL(10,2) NOT NULL

-- Checking datatypes to each column
EXEC SP_HELP 'COURSES'

D. to remove the fee column of the courses table 

ALTER TABLE COURSES
DROP COLUMN FEE

SELECT * FROM Courses


E. removes the max_limit and credit_hours of the courses table. 

ALTER TABLE COURSES
DROP COLUMN Max_Limit, Credit_hours

SELECT * FROM Courses


/*
6)WRITE A QUERY FOR:-

 SQL foreign key constraint 
*/

-- Added Columns for these questions
CREATE TABLE projects ( 
project_id INT PRIMARY KEY, 
project_name VARCHAR(255), 
start_date DATE NOT NULL, 
end_date DATE NOT NULL ); 


CREATE TABLE project_milestones( 
milestone_id INT PRIMARY KEY, 
project_id INT, 
milestone_name VARCHAR(100) ); 

A. to add an SQL FOREIGN KEY constraint to the project_milestones table to enforce the relationship between the projects and project_milestones tables. 

ALTER TABLE PROJECT_MILESTONES
ADD FOREIGN KEY (PROJECT_ID) REFERENCES projects (project_id)

B. Suppose the project_milestones already exists without any predefined foreign key and 
you want to define a FOREIGN KEY constraint for the project_id column so write a Query to add a FOREIGN KEY constraint to existing table

ALTER TABLE project_milestones
ADD CONSTRAINT fk_project
FOREIGN KEY (project_id) REFERENCES projects(project_id);


TASK 2

1)WRITE A QUERY FOR  LOGICAL OPERATORS and OTHER ADVANCED OPERATORS:- 

Part 1:- 
SELECT * FROM EMPLOYEES

A. finds all employees whose salaries are greater than 5,000 and less than 7,000: 
SELECT * FROM EMPLOYEES
WHERE SALARY BETWEEN 5000 AND 7000

B. finds employees whose salary is either 7,000 or 8,000: 
SELECT * FROM Employees
WHERE Salary IN (7000, 8000);

C. finds all employees who do not have a phone number: 
SELECT * FROM Employees
WHERE PHONE_NUMBER IS NULL

D. finds all employees whose salaries are between 9,000 and 12,000. 
SELECT * FROM EMPLOYEES
WHERE SALARY BETWEEN 9000 AND 12000


E. finds all employees who work in the department id 8 or 9. 

SELECT * FROM Employees
WHERE DEPARTMENT_ID IN (8, 9);

F. finds all employees whose first name starts with the string jo 
SELECT * FROM Employees
WHERE FIRST_NAME LIKE 'JO%'

G. finds all employees with the first names whose the second character is  h 
SELECT * FROM Employees
WHERE FIRST_NAME LIKE 'H%'

H. finds all employees whose salaries are greater than all salaries of employees in the department 8: 
SELECT * FROM Employees
WHERE DEPARTMENT_ID = 8
ORDER BY SALARY DESC

Part 2:-  
A. finds all employees whose salaries are greater than the average salary of every department: 

SELECT DEPARTMENT_ID,SALARY FROM EMPLOYEES
WHERE SALARY > ( 
SELECT AVG(SALARY) FROM EMPLOYEES)
ORDER BY SALARY DESC

	
B. finds all employees who have dependents:

SELECT DISTINCT e.*
FROM employees e
INNER JOIN 
dependents d
ON 
e.employee_id = d.employee_id;


C. to find all employees whose salaries are between 2,500 and 2,900: 
SELECT * FROM EMPLOYEES
WHERE SALARY BETWEEN 2500 AND 2900

D. to find all employees whose salaries are not in the range of 2,500 and 2,900: 

SELECT * FROM EMPLOYEES
WHERE SALARY NOT BETWEEN 2500 AND 2900

E. to find all employees who joined the company between January 1, 1999, and December 31, 2000: 
SELECT * FROM EMPLOYEES
WHERE HIRE_DATE BETWEEN '1999-01-01' AND '2000-12-31'

F. to find employees who have not joined the company from January 1, 1989 to December 31, 1999: 
SELECT * FROM EMPLOYEES
WHERE HIRE_DATE NOT BETWEEN '1989-01-01' AND '1999-12-31'

G. to find employees who joined the company between 1990 and 1993: 
SELECT * FROM EMPLOYEES
WHERE YEAR(HIRE_DATE) BETWEEN 1990 AND 1993


Part 3:- 

A. to find all employees whose first names start with Da 
SELECT * FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'DA%'

B. to find all employees whose first names end with er 
SELECT * FROM EMPLOYEES
WHERE FIRST_NAME LIKE '%ER'

C. to find employees whose last names contain the word an: 
SELECT * FROM EMPLOYEES
WHERE FIRST_NAME LIKE '%DA%'

D. retrieves employees whose first names start with Jo and are followed by at most 2 characters: 
SELECT * FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'Jo__'

E. to find employees whose first names start with any number of characters and are followed by at most one character:

SELECT * FROM employees
WHERE LEN(first_name) <= 2;

F. to find all employees whose first names start with the letter S but not start with Sh: 

SELECT * FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'S%'
AND 
first_name NOT LIKE 'Sh%'

Part 4:- 

A. retrieves all employees who work in the department id 5. 

SELECT * FROM EMPLOYEES
WHERE department_id = 5

B. To get the employees who work in the department id 5 and with a salary not greater than 5000. 

SELECT * FROM EMPLOYEES
WHERE department_id = 5
AND
SALARY !> 5000

C. statement gets all the employees who are not working in the departments 1, 2, or 3. 

SELECT * FROM EMPLOYEES
WHERE department_id NOT IN (1,2,3)
ORDER BY DEPARTMENT_ID

D. retrieves all the employees whose first names do not start with the letter D. 

SELECT * FROM EMPLOYEES
WHERE FIRST_NAME NOT LIKE 'D%'
ORDER BY FIRST_NAME ASC

E. to get employees whose salaries are not between 5,000 and 1,000. 


SELECT * FROM EMPLOYEES
WHERE SALARY NOT BETWEEN 5000 AND 1000
ORDER BY SALARY ASC

Part 5:-  

A. Write a query to get the employees who do not have any dependents by above image 

SELECT E.* FROM Employees E
LEFT JOIN
Dependents D
ON
E.Employee_ID = D.Employee_id
WHERE d.employee_id IS NULL;


B. To find all employees who do not have the phone numbers 
SELECT * FROM EMPLOYEES
WHERE Phone_Number IS NULL


C. To find all employees who have phone numbers 

SELECT * FROM EMPLOYEES
WHERE Phone_Number IS NOT NULL


/*
TASK 3: 
JOINS:- 
SQL INNER JOIN clause 
*/
 Write a Query to  
A. To get the information of the department id 1,2, and 3 

SELECT *
FROM departments
WHERE department_id IN (1, 2, 3);


B. To get the information of employees who work in the department id 1, 2 and 3 

SELECT E.*, D.Department_Name, D.Location_ID FROM Employees E
INNER JOIN
Departments D
ON 
E.Department_Id = D.Department_ID
WHERE D.Department_ID IN (1,2,3)


Write a Query to get the first name, last name, job title, and department name of employees who work 
in department id 1, 2, and 3.
SELECT * FROM Employees
SELECT * FROM Departments
SELECT * FROM Jobs

SELECT D.Department_ID,E.First_Name, E.Last_Name, J.Job_Title, D.Department_Name 
FROM Departments D
INNER JOIN Employees E
ON D.Department_ID = E.Department_Id
INNER JOIN Jobs J
ON E.Job_ID = J.Job_ID
WHERE D.Department_ID IN (1,2,3) 
ORDER BY D.Department_ID



--- SQL LEFT JOIN
SELECT * FROM Countries
SELECT * FROM Locations
	
A. To query the country names of US, UK, and China 

SELECT Country_Id, Country_Name FROM Countries
WHERE Country_ID IN ('US', 'UK','CN')

B. query retrieves the locations located in the US, UK and China: 
	
SELECT l.location_id, l.street_address, l.city, l.state_province, c.country_name
FROM locations l
JOIN countries c ON l.country_id = c.country_id
WHERE c.country_id IN ('US', 'UK', 'CN');


C. To join the countries table with the locations table 

SELECT c.country_id, c.country_name, l.location_id, l.street_address, l.city, l.state_province
FROM countries c
INNER JOIN locations l ON c.country_id = l.country_id;


D. to find the country that does not have any locations in the locations table 

SELECT c.country_id, c.country_name, l.location_id, l.street_address, l.city, l.state_province
FROM countries c
LEFT JOIN locations l ON c.country_id = l.country_id
WHERE l.location_id IS NULL


Write a query to join 3 tables: regions, countries, and locations

SELECT R.region_id, R.region_name, C.country_id, C.country_name, L.location_id, L.city
FROM regions R
INNER JOIN countries C
    ON R.region_id = C.region_id
INNER JOIN locations L
    ON C.country_id = L.country_id;

	SELECT * FROM Employees
	--- SELF JOIN CLAUSE
	The manager_id column specifies the manager of an employee. 
	Write a query statement to joins the employees table to itself to query the information of who reports to whom. 

	SELECT CONCAT(E.First_Name,' ', E.Last_Name) AS Employee,
	CONCAT(M.First_Name,' ', M.Last_Name) AS Manager
	FROM Employees E
	INNER JOIN
	EMPLOYEES M
	ON E.EMPLOYEE_ID = M.MANAGER_ID



---SQL FULL OUTER JOIN clause 

CREATE  TABLE  fruits ( 
fruit_id  INT PRIMARY KEY, 
fruit_name  VARCHAR (255) NOT NULL, 
basket_id  INTEGER 
); 

CREATE TABLE baskets ( 
basket_id  INT PRIMARY KEY, 
basket_name  VARCHAR (255) NOT NULL 
); 

INSERT  INTO  baskets  (basket_id, basket_name) 
VALUES 
(1, 'A'), 
(2, 'B'), 
(3, 'C'); 
INSERT  INTO  fruits ( 
fruit_id, 
fruit_name, 
basket_id 
) 
VALUES 
(1, 'Apple', 1), 
(2, 'Orange', 1), 
(3, 'Banana', 2), 
(4, 'Strawberry', NULL); 

SELECT * FROM FRUITS
SELECT * FROM BASKETS

Question:- 
A. Write a query to  returns each fruit that is in a basket and each basket that has a fruit, 
but also returns each fruit that is not in any basket and each basket that does not have any fruit. 

SELECT * FROM FRUITS F
FULL OUTER JOIN
BASKETS B
ON 
F.BASKET_ID = B.BASKET_ID

B. Write a query to find the empty basket, which does not store any fruit 

SELECT F.*, B.* FROM FRUITS F
FULL OUTER JOIN
BASKETS B
ON 
F.BASKET_ID = B.BASKET_ID
WHERE F.BASKET_ID IS NULL

C. Write a query  which fruit is not in any basket

SELECT F.*, B.* FROM FRUITS F
FULL OUTER JOIN
BASKETS B
ON 
F.BASKET_ID = B.BASKET_ID
WHERE B.BASKET_Id IS NULL



-- SQL CROSS JOIN clause 

CREATE TABLE sales_organization (
 sales_org_id INT PRIMARY KEY, 
sales_org VARCHAR (255) ); 

CREATE TABLE sales_channel ( 
channel_id INT PRIMARY KEY, 
channel VARCHAR (255) ); 

INSERT INTO sales_organization (
sales_org_id, sales_org) 
VALUES (1, 'Domestic'), (2, 'Export');

INSERT INTO sales_channel(channel_id, channel) 
VALUES (1, 'Wholesale'), 
(2, 'Retail'), 
(3, 'eCommerce'),
(4, 'TV Shopping'); 


SELECT * FROM Sales_Channel
SELECT * FROM sales_organization


-- Write a Query To find the all possible sales channels that a sales organization
SELECT * FROM sales_organization 
CROSS JOIN  Sales_Channel


TASK 4: 
SQL GROUP BY clause

SELECT * FROM DEPARTMENTS
SELECT * FROM EMPLOYEES

Questions:- 
Write a  Query  
A. to group the values in department_id column of the employees table: 

SELECT Department_id 
FROM EMPLOYEES
GROUP BY Department_ID

B. to count the number of employees by department: 
SELECT Department_id, COUNT(*) AS Total_Employee 
FROM EMPLOYEES
GROUP BY Department_ID

C. returns the number of employees by department 
SELECT Department_id, COUNT(*) AS No_Of_Employee 
FROM EMPLOYEES
GROUP BY Department_ID

D. to sort the departments by headcount: 

SELECT D.Department_id, D.Department_Name,
COUNT(e.employee_ID) AS HeadCount
FROM EMPLOYEES E
RIGHT JOIN
Departments D
ON
E.Department_ID = D.Department_ID
GROUP BY D.Department_ID, D.Department_Name
ORDER BY HeadCount DESC


E. to find departments with headcounts are greater than 5: 
SELECT D.Department_id, D.Department_Name,
COUNT(e.employee_ID) AS HeadCount
FROM EMPLOYEES E
RIGHT JOIN
Departments D
ON
E.Department_ID = D.Department_ID
GROUP BY D.Department_ID, D.Department_Name
HAVING COUNT(e.employee_ID) > 5

F. returns the minimum, maximum and average salary of employees in each department. 

SELECT D.Department_ID, D.Department_Name, MIN(E.Salary) AS MinSalary, 
MAX(E.Salary) AS MaxSalary, AVG(E.Salary) AS AvgSalary
FROM EMPLOYEES E
RIGHT JOIN
Departments D
ON
E.Department_ID = D.Department_ID
GROUP BY D.Department_ID, D.Department_Name

G. To get the total salary per department, 
SELECT D.Department_ID, D.Department_Name, SUM(E.Salary) AS TotalSalary 
FROM EMPLOYEES E
RIGHT JOIN
Departments D
ON
E.Department_ID = D.Department_ID
GROUP BY D.Department_ID, D.Department_Name


H. groups rows with the same values both department_id and job_id columns in the same group then return the rows for each of these groups

SELECT Department_ID, Job_ID
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID, JOB_ID;


--- SQL HAVING clause 

Questions:- 
SELECT * FROM Dependents
SELECT * FROM EMPLOYEES

A. To get the managers and their direct reports, and  to group employees by the managers and to count the direct reports. 

SELECT Manager_Id, Count(*) Direct_Reports
FROM Employees
where manager_id  IS NOT NULL
GROUP BY Manager_iD

B. To find the managers who have at least five direct reports 

SELECT Manager_Id, Count(*) Direct_Reports
FROM Employees
where manager_id  IS NOT NULL
GROUP BY Manager_iD
HAVING COUNT(*) >= 5

C. calculates the sum of salary that the company pays for each department and selects only the departments with the sum of salary between 20000 and 30000.

SELECT D.Department_ID, D.Department_Name, SUM(E.Salary) AS TotalSalary 
FROM EMPLOYEES E
RIGHT JOIN
Departments D
ON
E.Department_ID = D.Department_ID
GROUP BY D.Department_ID, D.Department_Name
HAVING SUM(E.Salary) BETWEEN 20000 AND 30000

D. To find the department that has employees with the lowest salary greater than 10000 

SELECT D.Department_ID, D.Department_Name, SUM(E.Salary) AS TotalSalary 
FROM EMPLOYEES E
RIGHT JOIN
Departments D
ON
E.Department_ID = D.Department_ID
GROUP BY D.Department_ID, D.Department_Name
HAVING SUM(E.Salary) > 10000 

E. To find the departments that have the average salaries of employees between 5000 and 7000

SELECT D.Department_ID, D.Department_Name, AVG(E.Salary) AS AvgSalary 
FROM EMPLOYEES E
RIGHT JOIN
Departments D
ON
E.Department_ID = D.Department_ID
GROUP BY D.Department_ID, D.Department_Name
HAVING AVG(E.Salary) BETWEEN 5000 AND 7000




--TASK 5 
--1)SQL UNION operator 

Quetsion:- Write a Query to combine the first name and last name of employees and dependents

SELECT 
 first_name + ' ' + last_name AS full_name
FROM employees
UNION ALL
SELECT 
 first_name + ' ' + last_name AS full_name
FROM dependents;


/*
2)SQL INTERSECT operator 

Suppose, we have two tables: A(1,2) and B(2,3). 
The following picture illustrates the intersection of A & B tables. 
 */

-- Write a Query to Applies the INTERSECT operator to the A and B tables and sorts the combined result set by the id column in descending order.

SELECT First_Name, Last_Name FROM Employees
INTERSECT
SELECT First_Name, Last_Name FROM Dependents


3)SQL EXISTS operator 
We will use the  employees and dependents tables in the sample database for the demonstration. 
Write a Query  
A. finds all employees who have at least one dependent. 
SELECT *
FROM employees e
WHERE EXISTS (
  SELECT 1
  FROM dependents d
  WHERE d.employee_id = e.employee_id
);


B . finds employees who do not have any dependents:

SELECT *
FROM employees e
WHERE NOT EXISTS (
  SELECT 1
  FROM dependents d
  WHERE d.employee_id = e.employee_id
);


4) SQL CASE expression

A. Suppose the current year is 2000. How to use the simple CASE expression to get the work anniversaries of employees by 

SELECT CONCAT(First_Name, ' ', Last_Name) AS Full_Name, Hire_Date,
	CASE DATEPART(YEAR, 2020-01-01) - DATEPART(YEAR, HIRE_DATE)
		WHEN 1 THEN '1 Year Anniversary'
		WHEN 5 THEN '5 Year Anniversary'
		WHEN 10 THEN '10 Year Anniversary'	
		ELSE 'No Major Milestones'
	END AS Work_Anniversary
FROM EMPLOYEES

B. Write a Query If the salary is less than 3000, the CASE expression returns Low. If the salary is between 3000 and 5000, 
it returns average. When the salary is greater than 5000, the CASE expression returns High.

SELECT Employee_ID, Salary,
	CASE 
		WHEN Salary<3000 THEN 'Low'
		WHEN Salary BETWEEN 3000 and 5000 THEN 'Average'
		WHEN Salary>5000 THEN 'High'	
		ELSE 'Other'
	END AS Salary_category
FROM EMPLOYEES


5) SQL UPDATE statement 

Write a Query to update Sarahs last name from  Bell to Lopez 
How to  make sure that the last names of children are always matched with the last name of parents in 
the  employees table, 

UPDATE  Employees
SET last_name = 'Lopez'
WHERE Employee_ID = 192

SELECT * FROM Employees
WHERE Employee_ID = 192


Final Task
Subqueries

Question:- 
Write a Query :- 

A. Combine Above two queries using subquery inorder find all departments located at the location whose id is 1700 and 
find all employees that belong to the location 1700 by using the department id list of the previous query 


SELECT  employee_id, first_name, last_name
FROM  employees 
WHERE Department_ID IN ( SELECT  Department_ID 
FROM 
departments 
WHERE location_id = 1700 )

B. to find all employees who do not locate at the location 1700: 

SELECT  employee_id, first_name, last_name
FROM  employees 
WHERE Department_ID IN ( SELECT  Department_ID 
FROM 
departments 
WHERE location_id != 1700 )


C. finds the employees who have the highest salary: 

SELECT * FROM Employees
WHERE SALARY = (SELECT MAX(SALARY) as MaxSalary FROM Employees)

D. finds all employees who salaries are greater than the average salary of all employees: 
SELECT * FROM Employees
WHERE SALARY > 
(SELECT AVG(SALARY) FROM Employees)

E. finds all departments which have at least one employee with the salary is greater than 10,000:

SELECT Department_ID, Department_Name FROM Departments
WHERE  Department_ID IN (
SELECT Department_ID FROM Employees
WHERE SALARY > 10000)

SELECT DISTINCT department_id, Salary
FROM employees
WHERE salary > 10000;


F. finds all departments that do not have any employee with the salary greater than 10,000: 

SELECT Department_ID, Department_Name FROM Departments
WHERE  Department_ID IN (
SELECT Department_ID FROM Employees
WHERE SALARY !> 10000)


G. to find the lowest salary by department: 

SELECT DISTINCT department_id, MIN(Salary) as lowSalary
FROM employees
GROUP BY Department_ID


H. finds all employees whose salaries are greater than the lowest salary of every department: 

SELECT * FROM employees
WHERE salary > ALL (
  SELECT MIN(salary)
  FROM employees
  GROUP BY department_id )



I. finds all employees whose salaries are greater than or equal to the highest salary of every department 

SELECT * FROM employees
WHERE salary >= ALL (
  SELECT MAX(salary)
  FROM employees
  GROUP BY department_id );

J. returns the average salary of every department 

SELECT department_id, AVG(salary) AS avg_salary
FROM employees
GROUP BY department_id;


K. to calculate the average of average salary of departments : 

SELECT AVG(dept_avg) AS overall_avg_salary
FROM (
  SELECT AVG(salary) AS dept_avg
  FROM employees
  GROUP BY department_id
) AS avg_per_dept;



L. finds the salaries of all employees, their average salary, and the difference between the 
salary of each employee and the average salary.

SELECT employee_id, first_name, last_name, salary,
  (SELECT AVG(salary) FROM employees) AS avg_salary,
  salary - (SELECT AVG(salary) FROM employees) AS diff_from_avg
FROM employees;
