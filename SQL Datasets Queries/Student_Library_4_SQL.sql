CREATE DATABASE Library4_SQL

USE Library4_SQL

CREATE TABLE students (
    studentId INT PRIMARY KEY,
    name VARCHAR(50),
    surname VARCHAR(50),
    birthdate DATE,
    gender CHAR(1),
    class VARCHAR(10),
    point INT
);

INSERT INTO students (studentId, name, surname, 
birthdate, gender, class, point) VALUES 
(1, 'John', 'Doe', '2005-01-15', 'M', '10A', 85), 
(2, 'Jane', 'Smith', '2006-03-22', 'F', '10B', 90), 
(3, 'Alice', 'Johnson', '2005-07-12', 'F', '10A', 88), 
(4, 'Bob', 'Brown', '2006-11-30', 'M', '10C', 76), 
(5, 'Charlie', 'Davis', '2005-05-05', 'M', '10B', 92), 
(6, 'Diana', 'Miller', '2006-06-25', 'F', '10C', 81), 
(7, 'Eve', 'Wilson', '2005-09-18', 'F', '10A', 87), 
(8, 'Frank', 'Moore', '2006-12-02', 'M', '10B', 80), 
(9, 'Grace', 'Taylor', '2005-04-17', 'F', '10C', 83), 
(10, 'Hank', 'Anderson', '2006-10-20', 'M', '10A', 78); 

CREATE TABLE authors (
    authorId INT PRIMARY KEY NOT NULL,
    name VARCHAR(50),
    surname VARCHAR(50)
);

INSERT INTO authors (authorId, name, surname) VALUES 
(1, 'F. Scott', 'Fitzgerald'), 
(2, 'Harper', 'Lee'), 
(3, 'George', 'Orwell'), 
(4, 'Jane', 'Austen'), 
(5, 'J.D.', 'Salinger'), 
(6, 'J.R.R.', 'Tolkien'), 
(7, 'Herman', 'Melville'), 
(8, 'Leo', 'Tolstoy'), 
(9, 'James', 'Joyce'), 
(10, 'Homer', ''); 


CREATE TABLE types (
    typeId INT PRIMARY KEY NOT NULL,
    name VARCHAR(50)
);

INSERT INTO types (typeId, name) VALUES 
(1, 'Fiction'), 
(2, 'Classic'), 
(3, 'Dystopian'), 
(4, 'Literature'), 
(5, 'Fantasy'), 
(6, 'Adventure'), 
(7, 'Historical Fiction'), 
(8, 'Science Fiction'), 
(9, 'Mythology'), 
(10, 'Philosophy'); 


CREATE TABLE books (
    bookId INT PRIMARY KEY NOT NULL,
    name VARCHAR(100),
    pagecount INT,
    point INT,
    authorId INT,
    typeId INT,
    FOREIGN KEY (authorId) REFERENCES authors(authorId),
    FOREIGN KEY (typeId) REFERENCES types(typeId)
);


INSERT INTO books (bookId, name, pagecount, point, 
authorId, typeId) VALUES 
(1, 'The Great Gatsby', 180, 95, 1, 1), 
(2, 'To Kill a Mockingbird', 281, 90, 2, 2), 
(3, '1984', 328, 88, 3, 3), 
(4, 'Pride and Prejudice', 279, 93, 4, 4), 
(5, 'The Catcher in the Rye', 214, 85, 5, 1), 
(6, 'The Hobbit', 310, 91, 6, 2), 
(7, 'Moby-Dick', 635, 80, 7, 3), 
(8, 'War and Peace', 1225, 92, 8, 4), 
(9, 'Ulysses', 730, 89, 9, 1), 
(10, 'The Odyssey', 541, 87, 10, 2); 


CREATE TABLE borrows (
    borrowId INT PRIMARY KEY NOT NULL,
    studentId INT,
    bookId INT,
    takenDate DATE,
    broughtDate DATE,
    FOREIGN KEY (studentId) REFERENCES students(studentId),
    FOREIGN KEY (bookId) REFERENCES books(bookId)
);

INSERT INTO borrows (borrowId, studentId, bookId, 
takenDate, broughtDate) VALUES 
(1, 1, 3, '2024-01-10', '2024-01-20'), 
(2, 2, 5, '2024-01-12', '2024-01-22'), 
(3, 3, 7, '2024-01-15', '2024-01-25'), 
(4, 4, 2, '2024-01-18', '2024-01-28'), 
(5, 5, 1, '2024-01-20', '2024-01-30'), 
(6, 6, 4, '2024-01-22', '2024-02-01'), 
(7, 7, 6, '2024-01-24', '2024-02-03'), 
(8, 8, 8, '2024-01-26', '2024-02-05'), 
(9, 9, 10, '2024-01-28', '2024-02-07'), 
(10, 10, 9, '2024-01-30', '2024-02-09');


SELECT * FROM students
SELECT * FROM authors
SELECT * FROM types
SELECT * FROM borrows


--- 1: List all the records in the student table

SELECT * FROM students


 --- 2: List the name surname and class of the student in the student table 

 SELECT surname, class FROM students

--- 3: List the gender Female (F) records in the student table 

SELECT * FROM students
WHERE gender = 'F'

--- 4 : List the names of each class in the way of being seen once in the student table 

SELECT DISTINCT CLASS FROM students

--- 5: List the students with Female gender and the class 10Math in the student table 

SELECT name, class FROM students
WHERE gender = 'F'

ALTER TABLE Students
DROP COLUMN Subjects 

DELETE Subjects from students
INSERT 

--- 6: List the names, surnames and classes of the students in the class 10Math or 10Sci in the student table

 --- 7: List the students name surname and school number in the student table

SELECT name, surname, class FROM students


 --- 8: List the students name and surname by combining them as name surname in the student table

SELECT name +' ' +surname As FullName FROM students

 --- 9: List the students with the names starting with “A” letter in the student table 

 SELECT name FROM students
 WHERE name LIKE 'A%';



--- 10: List the book names and pages count with number of pages between 50 and 200 in the book table 

SELECT * FROM books
WHERE pagecount BETWEEN 50 and 200

--- 11: List the students with names Emma Sophia and Robert in the student table 

SELECT NAME FROM students
WHERE name IN ('Emma', 'Sophia', 'Robert')

--- 12: List the students with names starting with A D and K in the student table

SELECT * FROM students
WHERE name LIKE 'A%' 
   OR name LIKE 'D%' 
   OR name LIKE 'K%';



 --- 13: List the names surnames classes and genders of males in 9Math or females in 9His in the student table 
--- 14: List the males whose classes are 10Math or 10Bio 
--- 15: List the students with birth year 1989 in the student table 

SELECT name, birthdate FROM students
WHERE YEAR(BIRTHDATE) = 1989

--- 16: List the female students with student numbers between 30 and 50 

SELECT * FROM students
WHERE gender = 'F'
 AND 
 studentId BETWEEN 30 AND 50;



--- 17: List the students according to their names

SELECT *FROM students
ORDER BY name ;

 --- 18: List the students by names for those with same names. List them by their surnames

 SELECT * FROM STUDENTS
 WHERE NAME IN (
 SELECT name FROM students 
 GROUP BY name
 HAVING COUNT(*) > 1
 )
 ORDER BY name, surname

 --- 19: List the students in 10Math by decreasing school numbers

 --- 20: List the first 10 records in the student chart 

 SELECT TOP 10 * FROM students

--- 21: List the first 10 records name surname and date of birth information in the student table

 SELECT TOP 10 name, surname, birthdate FROM students

 --- 22: List the book with the most page number 

 SELECT MAX(pagecount) AS MaxPageCount FROM books

--- 23: List the youngest student in the student table

SELECT TOP 1 * FROM students
ORDER BY birthdate DESC

 --- 24: List the oldest student in the 10Math class 
--- 25: List the books with the second letter N 

SELECT * FROM books
WHERE name LIKE 'N%';

--- 26: List the students by grouping according to their classes 

SELECT * FROM students
ORDER BY class

SELECT *, ROW_NUMBER()
OVER(PARTITION BY CLASS ORDER BY CLASS) AS Classes
FROM students


--- 27: List the students to be different in each questioning randomly 

SELECT * FROM students
ORDER BY RAND()

--- 28: Pick a random student from student table 

SELECT * FROM students
WHERE studentId = 5

--- 29: Bring some random student’s name , surname and number from class 10Math 
--- 30: Add the writer named Smith Allen to the authors table 

INSERT INTO authors VALUES
(11, 'Smith', 'Allen');

SELECT * FROM authors



--- 31: Add the genre of biography to the genre table 

INSERT INTO types(TypeID, name)
VALUES ((SELECT MAX(TypeId)+1 FROM types), 'biography');

Select * from types

--- 32: Add 10Math Class male named Thomas Nelson , 9Bio class female named Sally Allen and 11His Class female named Linda Sandra in one question
 --- 33: Add a random student in the students chart to the writers chart as an authors 

 INSERT INTO authors(authorId, NAME, surname)
 SELECT TOP 1 (
 SELECT MAX(AUTHORID)+1 FROM authors ),
 NAME, SURNAME FROM students
 ORDER BY NEWID()
 
 SELECT * FROM authors


--- 34: Add students with student numbers between 10 and 30 as authors

INSERT INTO authors(authorId, NAME, surname)
 SELECT (
 SELECT MAX(AUTHORID)+1 FROM authors ),
 NAME, SURNAME FROM students
WHERE point BETWEEN 10 AND 30

 SELECT * FROM authors


 --- 35: Add the writer named Cindy Brown and make him write his writer number (Note: The last increased rate in automatic enhancing is hold in @@IDENTITY factor)

SELECT @@IDENTITY AS Author_ID

 INSERT INTO authors(authorId, name, surname)
 VALUES (Author_ID, 'Cindy', 'Brown')


 --- 36: Change the class of the student whose school number is 3 from 10Bio to 10His
 --- 37: Transfer all the students in 9Math Class to 10Math Class update students set class='10Math' where class='9Math' 

--- 38: Increase all of the students’ score by 5 points 
---NOTE 1: The most important thing in delete interrrogation is the part of condition.If the condition isn’t written, all records are included to the cleaning process..
---NOTE 2: TRUNCATE TABLE instruction will be given at the end of interrogation. (It is used for empting the table TRUNCATE TABLE TABLE NAME) 

ALTER TABLE Students
ADD AddedPoints INT

UPDATE students
SET addedPoints = POINT + 5 

SELECT * FROM students

--- 39: Delete the author #25 When searching for the records whose rate are null in the select questıons, you can’t search for field area=null to research the area whose fieald area are null , İt is used null statement.

DELETE FROM authors
WHERE authorId = 25;

SELECT * FROM authors

 --- 40: List the students birth dates are null 

 SELECT * FROM students
 WHERE birthdate IS NULL

--- 41: List the name ,surname and the dates of received books of the student


SELECT S.StudentID, S.Name, S.Surname,B.takenDate, B.broughtDate FROM students S
INNER  JOIN
borrows B
ON 
S.studentId = B.studentId