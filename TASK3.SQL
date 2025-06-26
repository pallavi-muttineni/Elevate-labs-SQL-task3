-- SQL Script  Writing Basic SELECT Queries

-- Create a DATABASE
CREATE DATABASE TASK3;

-- USE Task3;
USE TASK3;
-- --- Create Tables ---

-- Create the Employees Table
CREATE TABLE Employees (
    EmployeeID INTEGER PRIMARY KEY,
    FirstName TEXT NOT NULL,
    LastName TEXT NOT NULL,
    Department TEXT,
    Salary INTEGER,
    HireDate TEXT -- Storing as TEXT in YYYY-MM-DD format for simplicity
);

-- Create the Products Table
CREATE TABLE Products (
    ProductID INTEGER PRIMARY KEY,
    ProductName TEXT NOT NULL,
    Category TEXT,
    Price REAL,
    StockQuantity INTEGER
);

-- --- Insert Data into Tables ---

-- Insert data into Employees Table
INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Salary, HireDate) VALUES
(101, 'Alice', 'Smith', 'HR', 60000, '2020-01-15'),
(102, 'Bob', 'Johnson', 'IT', 75000, '2019-03-20'),
(103, 'Carol', 'Davis', 'HR', 62000, '2021-07-01'),
(104, 'David', 'Brown', 'Sales', 80000, '2018-05-10'),
(105, 'Eve', 'Miller', 'IT', 78000, '2020-11-25'),
(106, 'Frank', 'Green', 'Sales', 85000, '2017-09-01');

-- Insert data into Products Table
INSERT INTO Products (ProductID, ProductName, Category, Price, StockQuantity) VALUES
(1, 'Laptop', 'Electronics', 1200.0, 50),
(2, 'Mouse', 'Electronics', 25.0, 200),
(3, 'Keyboard', 'Electronics', 75.0, 150),
(4, 'Desk Chair', 'Furniture', 150.0, 80),
(5, 'Bookshelf', 'Furniture', 200.0, 30),
(6, 'Monitor', 'Electronics', 300.0, 100),
(7, 'Coffee Maker', 'Appliances', 80.0, 120);

-- --- SQL Query Examples ---

-- 1. Use SELECT * and specific columns

-- SELECT * : Retrieve all columns from the Employees table
SELECT *
FROM Employees;

-- SELECT specific columns: Retrieve only FirstName, LastName, and Salary from Employees
SELECT FirstName, LastName, Salary
FROM Employees;

-- 2. Apply WHERE, AND, OR, LIKE, BETWEEN

-- WHERE: Filter rows based on a condition (Employees with Salary > 70000)
SELECT FirstName, LastName, Salary
FROM Employees
WHERE Salary > 70000;

-- WHERE with AND: Filter employees from 'IT' department AND with Salary > 75000
SELECT FirstName, LastName, Department, Salary
FROM Employees
WHERE Department = 'IT' AND Salary > 75000;

-- WHERE with OR: Filter employees from 'HR' OR 'Sales' department
SELECT FirstName, LastName, Department
FROM Employees
WHERE Department = 'HR' OR Department = 'Sales';

-- LIKE: Find products where ProductName starts with 'Key'
SELECT ProductName, Price
FROM Products
WHERE ProductName LIKE 'Key%'; -- % is a wildcard for any sequence of characters

-- LIKE (anywhere): Find employees whose LastNames contain 's'
SELECT FirstName, LastName
FROM Employees
WHERE LastName LIKE '%s%';

-- BETWEEN: Find products with Price between 50 and 150 (inclusive)
SELECT ProductName, Category, Price
FROM Products
WHERE Price BETWEEN 50.0 AND 150.0;

-- 3. Sort with ORDER BY

-- ORDER BY (default ASC): Sort employees by Salary in ascending order
SELECT FirstName, LastName, Salary
FROM Employees
ORDER BY Salary;

-- ORDER BY DESC: Sort employees by Salary in descending order
SELECT FirstName, LastName, Salary
FROM Employees
ORDER BY Salary DESC;

-- ORDER BY multiple columns: Sort products by Category (ASC) then by Price (DESC) within each category
SELECT ProductName, Category, Price
FROM Products
ORDER BY Category ASC, Price DESC;

-- 4. Limit output rows

-- LIMIT: Retrieve only the top 3 most expensive products
SELECT ProductName, Price
FROM Products
ORDER BY Price DESC
LIMIT 3;

-- LIMIT with OFFSET (e.g., for pagination - retrieve rows 4 to 6)
-- (Note: OFFSET syntax might vary slightly between databases, e.g., MySQL uses LIMIT 3 OFFSET 3)
SELECT ProductName, Price
FROM Products
ORDER BY Price DESC
LIMIT 3 OFFSET 3; -- Get 3 rows, starting from the 4th row (skipping the first 3)
