DROP DATABASE IF EXISTS student_tracker;
CREATE DATABASE student_tracker;
USE student_tracker;

-- 1.
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY AUTO_INCREMENT,
    Department_Name VARCHAR(20)
);

INSERT INTO Departments(Department_Name) VALUES
('Computer Science'),
('Mechanical'),
('Civil'),
('Electrical');

-- 2.
CREATE TABLE Students (
    StudID INT PRIMARY KEY,
    Name VARCHAR(15),
    DOB DATE,
    Gender VARCHAR(8),
    Email VARCHAR(25),
    Phone_number VARCHAR(15),
    Address VARCHAR(100),
    Admission_Date DATE, 
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

INSERT INTO Students VALUES
(1001,'Rahul','2005-05-10','Male','rahul@gmail.com','9876543210','Surat','2023-06-01',1),
(1002,'Priya','2004-08-15','Female','priya@gmail.com','9876543211','Ahmedabad','2021-06-01',1),
(1003,'Amit','2005-01-20','Male','amit@gmail.com','9876543212','Baroda','2023-06-01',2),
(1004,'Neha','2004-11-30','Female','neha@gmail.com','9876003213','Rajkot','2021-06-01',3),
(1005,'Karan','2005-03-25','Male','karan@gmail.com','9876549914','Surat','2023-06-01',4),
(1006,'Raj', '2007-09-01','Male','raj.malhotra@email.com','6534569856','Vapi','2023-06-01',4),
(1007,'Anita', '2006-12-03','Female','anita.desai@email.com','9865321456','Junaghadh','2023-06-01',2),
(1008,'Vikram', '2005-05-15','Male','vikram.joshi@email.com','65746532214','Jaipur','2022-06-01',3),
(1009,'Sunita', '2003-07-25','Female','sunita.kapoor@email.com','9865314775','Ankleshwer','2023-06-01',2),
(1010,'Prince','2006-11-29','Male','prince909@gmail.com','7985632221','Jaipur','2023-06-01',3);

-- 3.
CREATE TABLE Faculty (
    FacultyID INT PRIMARY KEY,
    Name VARCHAR(50),
    Email VARCHAR(50),
    Phone_number VARCHAR(15),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

INSERT INTO Faculty VALUES
(101,'Dr.Sharma','sharma@gmail.com','9991110001',1),
(102,'Er.Mehta','mehta@gmail.com','9991110002',2),
(103,'Er.Patel','patel@gmail.com','9991110003',3),
(104,'Pr.Shah','shah@gmail.com','9991110004',4);

-- 4.
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50),
    FacultyID INT,
    FOREIGN KEY (FacultyID) REFERENCES Faculty(FacultyID)
);

INSERT INTO Courses VALUES
(201,'Database Management',101),
(202,'Thermodynamics',102),
(203,'Structural Design',103),
(204,'Circuit Theory',104);

-- 5.
CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudID INT,
    CourseID INT,
    EnrollmentDate DATE,
    FOREIGN KEY (StudID) REFERENCES Students(StudID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

INSERT INTO Enrollments VALUES
(11,1001,201,'2023-07-01'),
(12,1002,201,'2023-07-01'),
(13,1009,203,'2023-08-01'),
(14,1004,202,'2023-07-01'),
(15,1005,204,'2023-07-01'),
(16,1006,202,'2023-08-01'),
(17,1007,204,'2023-07-01'),
(18,1008,203,'2023-08-01'),
(19,1009,202,'2023-07-01'),
(20,1010,204,'2023-07-01');

-- 6.
CREATE TABLE Attendance (
    AttendanceID INT PRIMARY KEY,
    StudID INT,
    CourseID INT,
    AttendanceDate DATE,
    Status VARCHAR(10),
    FOREIGN KEY (StudID) REFERENCES Students(StudID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

INSERT INTO Attendance VALUES
(111,1001,201,'2023-07-10','Present'),
(112,1009,201,'2023-07-11','Absent'),
(113,1002,201,'2023-07-10','Present'),
(114,1006,202,'2023-07-10','Late'),
(115,1004,203,'2023-07-10','Present'),
(116,1005,204,'2023-07-10','Absent'),
(117,1001,204,'2023-07-10','Present'),
(118,1001,203,'2023-07-11','Late'),
(119,1002,203,'2023-07-10','Present'),
(120,1007,202,'2023-07-10','Late');

-- 7.
CREATE TABLE Grades (
    GradeID INT PRIMARY KEY,
    StudID INT,
    CourseID INT,
    Marks_obtained INT,
    Grade VARCHAR(5),
    FOREIGN KEY (StudID) REFERENCES Students(StudID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

INSERT INTO Grades VALUES
(1,1001,201,85,'A'),
(2,1002,201,90,'A+'),
(3,1005,202,70,'B'),
(4,1004,203,65,'C'),
(5,1005,204,35,'E'),
(6,1006,201,88,'A'),
(7,1007,201,95,'A+'),
(8,1008,202,76,'B'),
(9,1009,203,60,'C'),
(10,1010,204,41,'D');

SELECT * FROM Departments;

+--------------+------------------+
| DepartmentID | Department_Name  |
+--------------+------------------+
|            1 | Computer Science |
|            2 | Mechanical       |
|            3 | Civil            |
|            4 | Electrical       |
+--------------+------------------+


SELECT * FROM Students;

+--------+--------+------------+--------+-------------------------+--------------+------------+----------------+--------------+
| StudID | Name   | DOB        | Gender | Email                   | Phone_number | Address    | Admission_Date | DepartmentID |
+--------+--------+------------+--------+-------------------------+--------------+------------+----------------+--------------+
|   1001 | Rahul  | 2005-05-10 | Male   | rahul@gmail.com         | 9876543210   | Surat      | 2023-06-01     |            1 |
|   1002 | Priya  | 2004-08-15 | Female | priya@gmail.com         | 9876543211   | Ahmedabad  | 2021-06-01     |            1 |
|   1003 | Amit   | 2005-01-20 | Male   | amit@gmail.com          | 9876543212   | Baroda     | 2023-06-01     |            2 |
|   1004 | Neha   | 2004-11-30 | Female | neha@gmail.com          | 9876003213   | Rajkot     | 2021-06-01     |            3 |
|   1005 | Karan  | 2005-03-25 | Male   | karan@gmail.com         | 9876549914   | Surat      | 2023-06-01     |            4 |
|   1006 | Raj    | 2007-09-01 | Male   | raj.malhotra@email.com  | 6534569856   | Vapi       | 2023-06-01     |            4 |
|   1007 | Anita  | 2006-12-03 | Female | anita.desai@email.com   | 9865321456   | Junaghadh  | 2023-06-01     |            2 |
|   1008 | Vikram | 2005-05-15 | Male   | vikram.joshi@email.com  | 65746532214  | Jaipur     | 2022-06-01     |            3 |
|   1009 | Sunita | 2003-07-25 | Female | sunita.kapoor@email.com | 9865314775   | Ankleshwer | 2023-06-01     |            2 |
|   1010 | Prince | 2006-11-29 | Male   | prince909@gmail.com     | 7985632221   | Jaipur     | 2023-06-01     |            3 |
+--------+--------+------------+--------+-------------------------+--------------+------------+----------------+--------------+


SELECT * FROM Faculty;

+-----------+-----------+------------------+--------------+--------------+
| FacultyID | Name      | Email            | Phone_number | DepartmentID |
+-----------+-----------+------------------+--------------+--------------+
|       101 | Dr.Sharma | sharma@gmail.com | 9991110001   |            1 |
|       102 | Er.Mehta  | mehta@gmail.com  | 9991110002   |            2 |
|       103 | Er.Patel  | patel@gmail.com  | 9991110003   |            3 |
|       104 | Pr.Shah   | shah@gmail.com   | 9991110004   |            4 |
+-----------+-----------+------------------+--------------+--------------+


SELECT * FROM Courses;

+----------+---------------------+-----------+
| CourseID | CourseName          | FacultyID |
+----------+---------------------+-----------+
|      201 | Database Management |       101 |
|      202 | Thermodynamics      |       102 |
|      203 | Structural Design   |       103 |
|      204 | Circuit Theory      |       104 |
+----------+---------------------+-----------+


SELECT * FROM Enrollments;

+--------------+--------+----------+----------------+
| EnrollmentID | StudID | CourseID | EnrollmentDate |
+--------------+--------+----------+----------------+
|           11 |   1001 |      201 | 2023-07-01     |
|           12 |   1002 |      201 | 2023-07-01     |
|           13 |   1009 |      203 | 2023-08-01     |
|           14 |   1004 |      202 | 2023-07-01     |
|           15 |   1005 |      204 | 2023-07-01     |
|           16 |   1006 |      202 | 2023-08-01     |
|           17 |   1007 |      204 | 2023-07-01     |
|           18 |   1008 |      203 | 2023-08-01     |
|           19 |   1009 |      202 | 2023-07-01     |
|           20 |   1010 |      204 | 2023-07-01     |
+--------------+--------+----------+----------------+


SELECT * FROM Attendance;

+--------------+--------+----------+----------------+---------+
| AttendanceID | StudID | CourseID | AttendanceDate | Status  |
+--------------+--------+----------+----------------+---------+
|          111 |   1001 |      201 | 2023-07-10     | Present |
|          112 |   1009 |      201 | 2023-07-11     | Absent  |
|          113 |   1002 |      201 | 2023-07-10     | Present |
|          114 |   1006 |      202 | 2023-07-10     | Late    |
|          115 |   1004 |      203 | 2023-07-10     | Present |
|          116 |   1005 |      204 | 2023-07-10     | Absent  |
|          117 |   1001 |      204 | 2023-07-10     | Present |
|          118 |   1001 |      203 | 2023-07-11     | Late    |
|          119 |   1002 |      203 | 2023-07-10     | Present |
|          120 |   1007 |      202 | 2023-07-10     | Late    |
+--------------+--------+----------+----------------+---------+


SELECT * FROM Grades;

+---------+--------+----------+----------------+-------+
| GradeID | StudID | CourseID | Marks_obtained | Grade |
+---------+--------+----------+----------------+-------+
|       1 |   1001 |      201 |             85 | A     |
|       2 |   1002 |      201 |             90 | A+    |
|       3 |   1005 |      202 |             70 | B     |
|       4 |   1004 |      203 |             65 | C     |
|       5 |   1005 |      204 |             35 | E     |
|       6 |   1006 |      201 |             88 | A     |
|       7 |   1007 |      201 |             95 | A+    |
|       8 |   1008 |      202 |             76 | B     |
|       9 |   1009 |      203 |             60 | C     |
|      10 |   1010 |      204 |             41 | D     |
+---------+--------+----------+----------------+-------+


-- 1.CURD OP
INSERT INTO Students VALUES
(1011,'Riya','2005-02-10','Female','riya@gmail.com','9876543220','Surat','2023-06-01',1);

UPDATE Students
SET address = 'Ahmedabad'
WHERE StudID = 1005;

DELETE FROM Students
WHERE StudID = 1003;

SELECT * FROM Students;

+--------+--------+------------+--------+-------------------------+--------------+------------+----------------+--------------+
| StudID | Name   | DOB        | Gender | Email                   | Phone_number | Address    | Admission_Date | DepartmentID |
+--------+--------+------------+--------+-------------------------+--------------+------------+----------------+--------------+
|   1001 | Rahul  | 2005-05-10 | Male   | rahul@gmail.com         | 9876543210   | Surat      | 2023-06-01     |            1 |
|   1002 | Priya  | 2004-08-15 | Female | priya@gmail.com         | 9876543211   | Ahmedabad  | 2021-06-01     |            1 |
|   1004 | Neha   | 2004-11-30 | Female | neha@gmail.com          | 9876003213   | Rajkot     | 2021-06-01     |            3 |
|   1005 | Karan  | 2005-03-25 | Male   | karan@gmail.com         | 9876549914   | Ahmedabad  | 2023-06-01     |            4 |
|   1006 | Raj    | 2007-09-01 | Male   | raj.malhotra@email.com  | 6534569856   | Vapi       | 2023-06-01     |            4 |
|   1007 | Anita  | 2006-12-03 | Female | anita.desai@email.com   | 9865321456   | Junaghadh  | 2023-06-01     |            2 |
|   1008 | Vikram | 2005-05-15 | Male   | vikram.joshi@email.com  | 65746532214  | Jaipur     | 2022-06-01     |            3 |
|   1009 | Sunita | 2003-07-25 | Female | sunita.kapoor@email.com | 9865314775   | Ankleshwer | 2023-06-01     |            2 |
|   1010 | Prince | 2006-11-29 | Male   | prince909@gmail.com     | 7985632221   | Jaipur     | 2023-06-01     |            3 |
|   1011 | Riya   | 2005-02-10 | Female | riya@gmail.com          | 9876543220   | Surat      | 2023-06-01     |            1 |
+--------+--------+------------+--------+-------------------------+--------------+------------+----------------+--------------+



-- 2.CLAUSE

-- WHERE
SELECT * FROM Students
WHERE DepartmentID = 1;

+--------+-------+------------+--------+-----------------+--------------+-----------+----------------+--------------+
| StudID | Name  | DOB        | Gender | Email           | Phone_number | Address   | Admission_Date | DepartmentID |
+--------+-------+------------+--------+-----------------+--------------+-----------+----------------+--------------+
|   1001 | Rahul | 2005-05-10 | Male   | rahul@gmail.com | 9876543210   | Surat     | 2023-06-01     |            1 |
|   1002 | Priya | 2004-08-15 | Female | priya@gmail.com | 9876543211   | Ahmedabad | 2021-06-01     |            1 |
|   1011 | Riya  | 2005-02-10 | Female | riya@gmail.com  | 9876543220   | Surat     | 2023-06-01     |            1 |
+--------+-------+------------+--------+-----------------+--------------+-----------+----------------+--------------+


-- OREDER BY
SELECT * FROM Grades
ORDER BY Marks_obtained DESC
LIMIT 10;

+---------+--------+----------+----------------+-------+
| GradeID | StudID | CourseID | Marks_obtained | Grade |
+---------+--------+----------+----------------+-------+
|       7 |   1007 |      201 |             95 | A+    |
|       2 |   1002 |      201 |             90 | A+    |
|       6 |   1006 |      201 |             88 | A     |
|       1 |   1001 |      201 |             85 | A     |
|       8 |   1008 |      202 |             76 | B     |
|       3 |   1005 |      202 |             70 | B     |
|       4 |   1004 |      203 |             65 | C     |
|       9 |   1009 |      203 |             60 | C     |
|      10 |   1010 |      204 |             41 | D     |
|       5 |   1005 |      204 |             35 | E     |
+---------+--------+----------+----------------+-------+


-- HAVING
SELECT StudID,
(SUM(status='Present') * 100.0 / COUNT(*)) AS attendance_percentage
FROM Attendance
GROUP BY StudID
HAVING attendance_percentage < 75;

+--------+-----------------------+
| StudID | attendance_percentage |
+--------+-----------------------+
|   1001 |              66.66667 |
|   1005 |               0.00000 |
|   1006 |               0.00000 |
|   1007 |               0.00000 |
|   1009 |               0.00000 |
+--------+-----------------------+


-- 3.AND / OR / NOT

-- AND
SELECT StudID FROM Attendance  
GROUP BY StudID  
HAVING (SUM(status='Present') * 100.0 / COUNT(*)) < 50  
AND StudID IN (SELECT StudID FROM Grades  WHERE grade = 'E');
+--------+
| StudID |
+--------+
|   1005 |
+--------+


-- OR
SELECT StudID FROM Attendance
GROUP BY StudID
HAVING SUM(status='Present') = COUNT(*)
OR StudID IN (SELECT StudID FROM Grades WHERE marks_obtained > 90);
+--------+
| StudID |
+--------+
|   1002 |
|   1004 |
|   1007 |
+--------+


-- NOT 
INSERT INTO Faculty VALUES
(105,'Dr. New','new@gmail.com','9991110005',1);
SELECT * FROM Faculty
WHERE FacultyID NOT IN (SELECT FacultyID FROM Courses);

+-----------+---------+---------------+--------------+--------------+
| FacultyID | Name    | Email         | Phone_number | DepartmentID |
+-----------+---------+---------------+--------------+--------------+
|       105 | Dr. New | new@gmail.com | 9991110005   |            1 |
+-----------+---------+---------------+--------------+--------------+




-- 4.GROUP BY & ORDER BY
SELECT Name FROM Students
ORDER BY Name;
+--------+
| Name   |
+--------+
| Anita  |
| Karan  |
| Neha   |
| Prince |
| Priya  |
| Rahul  |
| Raj    |
| Riya   |
| Sunita |
| Vikram |
+--------+


SELECT DepartmentID, COUNT(*) FROM Students
GROUP BY DepartmentID;
+--------------+----------+
| DepartmentID | COUNT(*) |
+--------------+----------+
|            1 |        3 |
|            2 |        2 |
|            3 |        3 |
|            4 |        2 |
+--------------+----------+


SELECT CourseID, AVG(Marks_obtained) as Avg_Marks FROM Grades
GROUP BY CourseID;
+----------+-----------+
| CourseID | Avg_Marks |
+----------+-----------+
|      201 |   89.5000 |
|      202 |   73.0000 |
|      203 |   62.5000 |
|      204 |   38.0000 |
+----------+-----------+



-- 5.AGGREGATE FUNCTIONS

-- AVG MARKS
SELECT AVG(Marks_obtained) as avg_marks FROM Grades;
+-----------+
| avg_marks |
+-----------+
|   70.5000 |
+-----------+


-- MAX,MIN MARKS
SELECT CourseID, MAX(Marks_obtained) as Max_marks, MIN(Marks_obtained) as Min_marks
FROM Grades
GROUP BY CourseID;

+----------+-----------+-----------+
| CourseID | Max_marks | Min_marks |
+----------+-----------+-----------+
|      201 |        95 |        85 |
|      202 |        76 |        70 |
|      203 |        65 |        60 |
|      204 |        41 |        35 |
+----------+-----------+-----------+


-- COUNT
SELECT DepartmentID, COUNT(*) FROM Students
GROUP BY DepartmentID;

+--------------+----------+
| DepartmentID | COUNT(*) |
+--------------+----------+
|            1 |        3 |
|            2 |        2 |
|            3 |        3 |
|            4 |        2 |
+--------------+----------+



-- 6.Primary & Foreign Key Relationships

ALTER TABLE Enrollments
ADD CONSTRAINT unique_enrollment
UNIQUE (StudID, CourseID);

ALTER TABLE Courses
ADD FOREIGN KEY (FacultyID) REFERENCES Faculty(FacultyID);




-- 7.JIONS

-- INNER JION
SELECT s.Name, d.Department_Name
FROM Students s
INNER JOIN Departments d
ON s.DepartmentID = d.DepartmentID;

+--------+------------------+
| Name   | Department_Name  |
+--------+------------------+
| Rahul  | Computer Science |
| Priya  | Computer Science |
| Riya   | Computer Science |
| Anita  | Mechanical       |
| Sunita | Mechanical       |
| Neha   | Civil            |
| Vikram | Civil            |
| Prince | Civil            |
| Karan  | Electrical       |
| Raj    | Electrical       |
+--------+------------------+


-- LEFT JOIN
SELECT Name FROM Students s
LEFT JOIN Enrollments e
ON s.StudID = e.StudID
WHERE e.StudID IS NULL;
+------+
| Name |
+------+
| Riya |
+------+


-- RIGHT JOIN
SELECT * FROM Faculty f
RIGHT JOIN Courses c
ON f.FacultyID = c.FacultyID
WHERE f.FacultyID IS NULL;
-- The query returns empty result because all courses have assigned faculty, 
--   so no NULL matches exist after join.



-- FULL OUTER JOIN
SELECT s.StudID, g.Marks_obtained
FROM Students s
LEFT JOIN Grades g
ON s.StudID = g.StudID
WHERE g.StudID IS NULL

UNION

SELECT s.StudID, g.Marks_obtained
FROM Students s
RIGHT JOIN Grades g
ON s.StudID = g.StudID
WHERE g.StudID IS NULL;

+--------+----------------+
| StudID | Marks_obtained |
+--------+----------------+
|   1011 |           NULL |
+--------+----------------+




-- 8.Subqueries

-- Marks > average
SELECT * FROM Grades
WHERE Marks_obtained > (SELECT AVG(Marks_obtained) FROM Grades);

+---------+--------+----------+----------------+-------+
| GradeID | StudID | CourseID | Marks_obtained | Grade |
+---------+--------+----------+----------------+-------+
|       1 |   1001 |      201 |             85 | A     |
|       2 |   1002 |      201 |             90 | A+    |
|       6 |   1006 |      201 |             88 | A     |
|       7 |   1007 |      201 |             95 | A+    |
|       8 |   1008 |      202 |             76 | B     |
+---------+--------+----------+----------------+-------+


-- Faculty with 5+ years experience
ALTER TABLE Faculty
ADD experience_years INT;
UPDATE Faculty SET experience_years = 6 WHERE FacultyID = 101;
UPDATE Faculty SET experience_years = 3 WHERE FacultyID = 102;
SELECT * FROM Faculty
WHERE FacultyID IN (
    SELECT FacultyID FROM Faculty
    WHERE experience_years >= 5);

+-----------+-----------+------------------+--------------+--------------+------------------+
| FacultyID | Name      | Email            | Phone_number | DepartmentID | experience_years |
+-----------+-----------+------------------+--------------+--------------+------------------+
|       101 | Dr.Sharma | sharma@gmail.com | 9991110001   |            1 |                6 |
+-----------+-----------+------------------+--------------+--------------+------------------+


-- Students missed >10 classes
SELECT StudID FROM Attendance
WHERE status = 'Absent'
GROUP BY StudID
HAVING COUNT(*) > 10;
-- Query returns empty because no student has more than 10 absent records in the dataset.




-- 9.Date & Time Functions

-- Month extract
SELECT StudID, MONTH(AttendanceDate) AS month
FROM Attendance;
+--------+-------+
| StudID | month |
+--------+-------+
|   1001 |     7 |
|   1009 |     7 |
|   1002 |     7 |
|   1006 |     7 |
|   1004 |     7 |
|   1005 |     7 |
|   1001 |     7 |
|   1001 |     7 |
|   1002 |     7 |
|   1007 |     7 |
+--------+-------+


-- Years since admission
SELECT StudID,
YEAR(CURDATE()) - YEAR(admission_date) AS years
FROM Students;

+--------+-------+
| StudID | years |
+--------+-------+
|   1001 |     3 |
|   1002 |     5 |
|   1004 |     5 |
|   1005 |     3 |
|   1006 |     3 |
|   1007 |     3 |
|   1008 |     4 |
|   1009 |     3 |
|   1010 |     3 |
|   1011 |     3 |
+--------+-------+


-- Format date
SELECT AttendanceDate,DATE_FORMAT(AttendanceDate,'%d-%m-%Y') as FormatedDate
FROM Attendance;

+----------------+--------------+
| AttendanceDate | FormatedDate |
+----------------+--------------+
| 2023-07-10     | 10-07-2023   |
| 2023-07-11     | 11-07-2023   |
| 2023-07-10     | 10-07-2023   |
| 2023-07-10     | 10-07-2023   |
| 2023-07-10     | 10-07-2023   |
| 2023-07-10     | 10-07-2023   |
| 2023-07-10     | 10-07-2023   |
| 2023-07-11     | 11-07-2023   |
| 2023-07-10     | 10-07-2023   |
| 2023-07-10     | 10-07-2023   |
+----------------+--------------+



-- 10.String Functions

-- Uppercase faculty
SELECT Name,UPPER(Name) as Upper FROM Faculty;

+-----------+-----------+
| Name      | Upper     |
+-----------+-----------+
| Dr.Sharma | DR.SHARMA |
| Er.Mehta  | ER.MEHTA  |
| Er.Patel  | ER.PATEL  |
| Pr.Shah   | PR.SHAH   |
| Dr. New   | DR. NEW   |
+-----------+-----------+


-- Trim student names
SELECT TRIM(Name) FROM Students;
+------------+
| TRIM(Name) |
+------------+
| Rahul      |
| Priya      |
| Neha       |
| Karan      |
| Raj        |
| Anita      |
| Vikram     |
| Sunita     |
| Prince     |
| Riya       |
+------------+


-- Replace NULL emails
SELECT IFNULL(email,'Email Not Provided') as New_Email
FROM Students;
+-------------------------+
| New_Email               |
+-------------------------+
| rahul@gmail.com         |
| priya@gmail.com         |
| neha@gmail.com          |
| karan@gmail.com         |
| raj.malhotra@email.com  |
| anita.desai@email.com   |
| vikram.joshi@email.com  |
| sunita.kapoor@email.com |
| prince909@gmail.com     |
| riya@gmail.com          |
+-------------------------+



-- 11.Window Functions

-- Window Functions
SELECT StudID, Marks_obtained,
RANK() OVER (ORDER BY Marks_obtained DESC) AS stud_rank
FROM Grades;

+--------+----------------+-----------+
| StudID | Marks_obtained | stud_rank |
+--------+----------------+-----------+
|   1007 |             95 |         1 |
|   1002 |             90 |         2 |
|   1006 |             88 |         3 |
|   1001 |             85 |         4 |
|   1008 |             76 |         5 |
|   1005 |             70 |         6 |
|   1004 |             65 |         7 |
|   1009 |             60 |         8 |
|   1010 |             41 |         9 |
|   1005 |             35 |        10 |
+--------+----
------------+-----------+

-- Cumulative attendance %
SELECT StudID,CourseID,
AVG(CASE WHEN status='Present' THEN 1 ELSE 0 END)
OVER (PARTITION BY StudID, CourseID) AS attendance_percentage
FROM Attendance;

+--------+----------+-----------------------+
| StudID | CourseID | attendance_percentage |
+--------+----------+-----------------------+
|   1001 |      201 |                1.0000 |
|   1001 |      203 |                0.0000 |
|   1001 |      204 |                1.0000 |
|   1002 |      201 |                1.0000 |
|   1002 |      203 |                1.0000 |
|   1004 |      203 |                1.0000 |
|   1005 |      204 |                0.0000 |
|   1006 |      202 |                0.0000 |
|   1007 |      202 |                0.0000 |
|   1009 |      201 |                0.0000 |
+--------+----------+-----------------------+


-- Running total students
SELECT MONTH(EnrollmentDate) AS month,
COUNT(*) OVER (ORDER BY MONTH(EnrollmentDate)) AS running_total
FROM Enrollments;

+-------+---------------+
| month | running_total |
+-------+---------------+
|     7 |             7 |
|     7 |             7 |
|     7 |             7 |
|     7 |             7 |
|     7 |             7 |
|     7 |             7 |
|     7 |             7 |
|     8 |            10 |
|     8 |            10 |
|     8 |            10 |
+-------+---------------+



-- 12.CASE Expressions

-- Student performance
SELECT StudID, Marks_obtained,
CASE
    WHEN Marks_obtained > 90 THEN 'Excellent'
    WHEN Marks_obtained BETWEEN 75 AND 90 THEN 'Good'
    ELSE 'Needs Improvement'
END AS performance
FROM Grades;

+--------+----------------+-------------------+
| StudID | Marks_obtained | performance       |
+--------+----------------+-------------------+
|   1001 |             85 | Good              |
|   1002 |             90 | Good              |
|   1005 |             70 | Needs Improvement |
|   1004 |             65 | Needs Improvement |
|   1005 |             35 | Needs Improvement |
|   1006 |             88 | Good              |
|   1007 |             95 | Excellent         |
|   1008 |             76 | Good              |
|   1009 |             60 | Needs Improvement |
|   1010 |             41 | Needs Improvement |
+--------+----------------+-------------------


-- Attendance category
SELECT StudID,
CASE
    WHEN AVG(status='Present') >= 0.8 THEN 'Regular'
    WHEN AVG(status='Present') >= 0.5 THEN 'Irregular'
    ELSE 'Defaulter'
END AS attendance_category
FROM Attendance
GROUP BY StudID;
+--------+---------------------+
| StudID | attendance_category |
+--------+---------------------+
|   1001 | Irregular           |
|   1002 | Regular             |
|   1004 | Regular             |
|   1005 | Defaulter           |
|   1006 | Defaulter           |
|   1007 | Defaulter           |
|   1009 | Defaulter           |
+--------+---------------------+