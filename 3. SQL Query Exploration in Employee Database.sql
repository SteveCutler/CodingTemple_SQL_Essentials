-- 3. SQL Query Exploration in Employee Database

-- Objective:
-- This assignment is designed to enhance your skills in SQL Data Query Language (DQL), particularly using
--  DISTINCT, COUNT, and BETWEEN clauses. You will work with an 'Employee' database that includes two tables: 
--  Employees and Departments.

-- DDL and DML SQL Codes:

--     DDL for Creating Tables:

    CREATE TABLE Departments (
        department_id INT PRIMARY KEY,
        department_name VARCHAR(100)
    );

    CREATE TABLE Employees (
        employee_id INT PRIMARY KEY,
        name VARCHAR(100),
        age INT,
        department_id INT,
        FOREIGN KEY (department_id) REFERENCES Departments(department_id)
    );

--     DML for Populating Tables:

    INSERT INTO Departments (department_id, department_name)
    VALUES (1, 'HR'), (2, 'Marketing'), (3, 'IT'), (4, 'Sales');

    INSERT INTO Employees (employee_id, name, age, department_id)
    VALUES (101, 'John Doe', 30, 1),
           (102, 'Jane Smith', 28, 2),
           (103, 'Alice Jones', 32, 3),
           (104, 'Bob Williams', 25, 1),
           (105, 'Mike Brown', 27, 3);

-- Task 1: SQL DISTINCT Usage

-- Problem Statement:
-- Identify the distinct departments in which employees work.

-- Expected Outcome:
-- A list of unique department names from the Employees table.

SELECT DISTINCT department_name FROM Departments;

-- Task 2: SQL COUNT Functionality

-- Problem Statement:
-- Count the total number of employees in each department. Investigate GROUP BY clause.

-- Expected Outcome:
-- A count of employees grouped by their department.

SELECT COUNT(employee_id), department_id
FROM Employees
GROUP BY department_id;

-- Task 3: SQL BETWEEN Usage

-- Problem Statement:
-- Retrieve the details of employees whose ages fall between 25 and 30.

-- Expected Outcome:
-- A list of employees (including their names, ages, and department IDs) who are between the ages of 25 and 30.

SELECT * FROM Employees
WHERE age >= 25 AND age <= 30;