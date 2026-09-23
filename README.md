# 🎓 Student Tracker – MySQL Database Project

## 📌 Project Overview

**Student Tracker** is a MySQL database project designed to manage and analyze student-related academic information.

The project demonstrates practical SQL concepts including database creation, table relationships, CRUD operations, filtering, grouping, aggregate functions, joins, subqueries, date and string functions, window functions, and CASE expressions.

---

## 🛠️ Technologies Used

* **MySQL**
* **SQL**
* **VS Code / MySQL Workbench**

---


### Tables

1. **Departments** – Stores department information.
2. **Students** – Stores student personal and admission details.
3. **Faculty** – Stores faculty information.
4. **Courses** – Stores course and faculty details.
5. **Enrollments** – Stores student course enrollment records.
6. **Attendance** – Stores student attendance records.
7. **Grades** – Stores student marks and grades.

The database uses **Primary Keys** and **Foreign Keys** to establish relationships between the tables.

---

## 🔗 Database Relationships

```text
Departments
     |
     ├── Students
     |
     └── Faculty
           |
           └── Courses
                  |
                  ├── Enrollments
                  ├── Attendance
                  └── Grades
```

---

## 📚 SQL Concepts Covered

### 1. Database & Table Creation

* CREATE DATABASE
* CREATE TABLE
* PRIMARY KEY
* FOREIGN KEY
* AUTO_INCREMENT

### 2. Data Manipulation

* INSERT
* UPDATE
* DELETE
* SELECT

CRUD operations are demonstrated using the Students table.

### 3. SQL Clauses

* WHERE
* ORDER BY
* GROUP BY
* HAVING
* LIMIT

### 4. Operators

* AND
* OR
* NOT

### 5. Aggregate Functions

* COUNT()
* AVG()
* MAX()
* MIN()
* SUM()

### 6. Joins

* INNER JOIN
* LEFT JOIN
* RIGHT JOIN
* FULL OUTER JOIN concept using `UNION`

The project demonstrates joins between Students, Departments, Faculty, Courses, and Grades.

### 7. Subqueries

Examples include:

* Students scoring above average marks
* Faculty having 5+ years of experience
* Students with more than 10 absent classes

### 8. Date & Time Functions

* MONTH()
* YEAR()
* CURDATE()
* DATE_FORMAT()

### 9. String Functions

* UPPER()
* TRIM()
* IFNULL()

### 10. Window Functions

* RANK()
* AVG() OVER()
* COUNT() OVER()

### 11. CASE Expressions

Used for:

* Student performance classification
* Attendance category classification

---

## 📊 Sample Analysis

The project performs different types of analysis, such as:

* Average marks by course
* Maximum and minimum marks
* Students ranked by marks
* Attendance percentage
* Attendance categories
* Students without enrollments
* Faculty without assigned courses
* Students scoring above average
* Years since admission

For example, the project calculates average marks for each course using `GROUP BY`.

---

## 🎯 Project Objectives

* Understand relational database design.
* Practice SQL queries using real-world student data.
* Understand primary and foreign key relationships.
* Perform academic performance analysis.
* Analyze student attendance.
* Practice advanced SQL concepts such as joins, subqueries, and window functions.
* Build a strong foundation in MySQL for Data Analytics.

---

## 💡 Key Learning

Through this project, I practiced designing a relational database and writing SQL queries for data management and analysis. The project helped me understand how multiple related tables can be connected and analyzed using SQL.

---

## 👩‍💻 Author

**Happy Patel**

Aspiring Data Analyst | SQL | Power BI | Data Analytics
