
mysql> CREATE DATABASE Task3;
Query OK, 1 row affected (0.02 sec)

mysql> use Task3;
Database changed
mysql> -- --- Create Tables ---
mysql>
mysql> -- Create the Employees Table
mysql> CREATE TABLE Employees (
    ->     EmployeeID INTEGER PRIMARY KEY,
    ->     FirstName TEXT NOT NULL,
    ->     LastName TEXT NOT NULL,
    ->     Department TEXT,
    ->     Salary INTEGER,
    ->     HireDate TEXT -- Storing as TEXT in YYYY-MM-DD format for simplicity
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql>
mysql> -- Create the Products Table
mysql> CREATE TABLE Products (
    ->     ProductID INTEGER PRIMARY KEY,
    ->     ProductName TEXT NOT NULL,
    ->     Category TEXT,
    ->     Price REAL,
    ->     StockQuantity INTEGER
    -> );
Query OK, 0 rows affected (0.02 sec)

mysql>
mysql> -- --- Insert Data into Tables ---
mysql>
mysql> -- Insert data into Employees Table
mysql> INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Salary, HireDate) VALUES
    -> (101, 'Alice', 'Smith', 'HR', 60000, '2020-01-15'),
    -> (102, 'Bob', 'Johnson', 'IT', 75000, '2019-03-20'),
    -> (103, 'Carol', 'Davis', 'HR', 62000, '2021-07-01'),
    -> (104, 'David', 'Brown', 'Sales', 80000, '2018-05-10'),
    -> (105, 'Eve', 'Miller', 'IT', 78000, '2020-11-25'),
    -> (106, 'Frank', 'Green', 'Sales', 85000, '2017-09-01');
Query OK, 6 rows affected (0.01 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql>
mysql> -- Insert data into Products Table
mysql> INSERT INTO Products (ProductID, ProductName, Category, Price, StockQuantity) VALUES
    -> (1, 'Laptop', 'Electronics', 1200.0, 50),
    -> (2, 'Mouse', 'Electronics', 25.0, 200),
    -> (3, 'Keyboard', 'Electronics', 75.0, 150),
    -> (4, 'Desk Chair', 'Furniture', 150.0, 80),
    -> (5, 'Bookshelf', 'Furniture', 200.0, 30),
    -> (6, 'Monitor', 'Electronics', 300.0, 100),
    -> (7, 'Coffee Maker', 'Appliances', 80.0, 120);
Query OK, 7 rows affected (0.00 sec)
Records: 7  Duplicates: 0  Warnings: 0

mysql> -- Assume the following data for demonstration:
mysql>
mysql> -- Employees Table:
mysql> -- EmployeeID | FirstName | LastName | Department | Salary | HireDate
mysql> -- -----------|-----------|----------|------------|--------|-----------
mysql> -- 101        | Alice     | Smith    | HR         | 60000  | 2020-01-15
mysql> -- 102        | Bob       | Johnson  | IT         | 75000  | 2019-03-20
mysql> -- 103        | Carol     | Davis    | HR         | 62000  | 2021-07-01
mysql> -- 104        | David     | Brown    | Sales      | 80000  | 2018-05-10
mysql> -- 105        | Eve       | Miller   | IT         | 78000  | 2020-11-25
mysql> -- 106        | Frank     | Green    | Sales      | 85000  | 2017-09-01
mysql>
mysql> -- Products Table:
mysql> -- ProductID | ProductName   | Category  | Price | StockQuantity
mysql> -- -----------|---------------|-----------|-------|---------------
mysql> -- 1         | Laptop        | Electronics| 1200.0| 50
mysql> -- 2         | Mouse         | Electronics| 25.0  | 200
mysql> -- 3         | Keyboard      | Electronics| 75.0  | 150
mysql> -- 4         | Desk Chair    | Furniture | 150.0 | 80
mysql> -- 5         | Bookshelf     | Furniture | 200.0 | 30
mysql> -- 6         | Monitor       | Electronics| 300.0 | 100
mysql> -- 7         | Coffee Maker  | Appliances| 80.0  | 120
mysql>
mysql> -- --- SQL Query Examples ---
mysql>
mysql> -- 1. Use SELECT * and specific columns
mysql>
mysql> -- SELECT * : Retrieve all columns from the Employees table
mysql> SELECT *
    -> FROM Employees;
+------------+-----------+----------+------------+--------+------------+
| EmployeeID | FirstName | LastName | Department | Salary | HireDate   |
+------------+-----------+----------+------------+--------+------------+
|        101 | Alice     | Smith    | HR         |  60000 | 2020-01-15 |
|        102 | Bob       | Johnson  | IT         |  75000 | 2019-03-20 |
|        103 | Carol     | Davis    | HR         |  62000 | 2021-07-01 |
|        104 | David     | Brown    | Sales      |  80000 | 2018-05-10 |
|        105 | Eve       | Miller   | IT         |  78000 | 2020-11-25 |
|        106 | Frank     | Green    | Sales      |  85000 | 2017-09-01 |
+------------+-----------+----------+------------+--------+------------+
6 rows in set (0.00 sec)

mysql>
mysql> -- SELECT specific columns: Retrieve only FirstName, LastName, and Salary from Employees
mysql> SELECT FirstName, LastName, Salary
    -> FROM Employees;
+-----------+----------+--------+
| FirstName | LastName | Salary |
+-----------+----------+--------+
| Alice     | Smith    |  60000 |
| Bob       | Johnson  |  75000 |
| Carol     | Davis    |  62000 |
| David     | Brown    |  80000 |
| Eve       | Miller   |  78000 |
| Frank     | Green    |  85000 |
+-----------+----------+--------+
6 rows in set (0.00 sec)

mysql>
mysql> -- 2. Apply WHERE, AND, OR, LIKE, BETWEEN
mysql>
mysql> -- WHERE: Filter rows based on a condition (Employees with Salary > 70000)
mysql> SELECT FirstName, LastName, Salary
    -> FROM Employees
    -> WHERE Salary > 70000;
+-----------+----------+--------+
| FirstName | LastName | Salary |
+-----------+----------+--------+
| Bob       | Johnson  |  75000 |
| David     | Brown    |  80000 |
| Eve       | Miller   |  78000 |
| Frank     | Green    |  85000 |
+-----------+----------+--------+
4 rows in set (0.00 sec)

mysql>
mysql> -- WHERE with AND: Filter employees from 'IT' department AND with Salary > 75000
mysql> SELECT FirstName, LastName, Department, Salary
    -> FROM Employees
    -> WHERE Department = 'IT' AND Salary > 75000;
+-----------+----------+------------+--------+
| FirstName | LastName | Department | Salary |
+-----------+----------+------------+--------+
| Eve       | Miller   | IT         |  78000 |
+-----------+----------+------------+--------+
1 row in set (0.00 sec)

mysql>
mysql> -- WHERE with OR: Filter employees from 'HR' OR 'Sales' department
mysql> SELECT FirstName, LastName, Department
    -> FROM Employees
    -> WHERE Department = 'HR' OR Department = 'Sales';
+-----------+----------+------------+
| FirstName | LastName | Department |
+-----------+----------+------------+
| Alice     | Smith    | HR         |
| Carol     | Davis    | HR         |
| David     | Brown    | Sales      |
| Frank     | Green    | Sales      |
+-----------+----------+------------+
4 rows in set (0.00 sec)

mysql>
mysql> -- LIKE: Find products where ProductName starts with 'Key'
mysql> SELECT ProductName, Price
    -> FROM Products
    -> WHERE ProductName LIKE 'Key%'; -- % is a wildcard for any sequence of characters
+-------------+-------+
| ProductName | Price |
+-------------+-------+
| Keyboard    |    75 |
+-------------+-------+
1 row in set (0.00 sec)

mysql>
mysql> -- LIKE (anywhere): Find employees whose LastNames contain 's'
mysql> SELECT FirstName, LastName
    -> FROM Employees
    -> WHERE LastName LIKE '%s%';
+-----------+----------+
| FirstName | LastName |
+-----------+----------+
| Alice     | Smith    |
| Bob       | Johnson  |
| Carol     | Davis    |
+-----------+----------+
3 rows in set (0.00 sec)

mysql>
mysql> -- BETWEEN: Find products with Price between 50 and 150 (inclusive)
mysql> SELECT ProductName, Category, Price
    -> FROM Products
    -> WHERE Price BETWEEN 50.0 AND 150.0;
+--------------+-------------+-------+
| ProductName  | Category    | Price |
+--------------+-------------+-------+
| Keyboard     | Electronics |    75 |
| Desk Chair   | Furniture   |   150 |
| Coffee Maker | Appliances  |    80 |
+--------------+-------------+-------+
3 rows in set (0.00 sec)

mysql>
mysql> -- 3. Sort with ORDER BY
mysql>
mysql> -- ORDER BY (default ASC): Sort employees by Salary in ascending order
mysql> SELECT FirstName, LastName, Salary
    -> FROM Employees
    -> ORDER BY Salary;
+-----------+----------+--------+
| FirstName | LastName | Salary |
+-----------+----------+--------+
| Alice     | Smith    |  60000 |
| Carol     | Davis    |  62000 |
| Bob       | Johnson  |  75000 |
| Eve       | Miller   |  78000 |
| David     | Brown    |  80000 |
| Frank     | Green    |  85000 |
+-----------+----------+--------+
6 rows in set (0.00 sec)

mysql>
mysql> -- ORDER BY DESC: Sort employees by Salary in descending order
mysql> SELECT FirstName, LastName, Salary
    -> FROM Employees
    -> ORDER BY Salary DESC;
+-----------+----------+--------+
| FirstName | LastName | Salary |
+-----------+----------+--------+
| Frank     | Green    |  85000 |
| David     | Brown    |  80000 |
| Eve       | Miller   |  78000 |
| Bob       | Johnson  |  75000 |
| Carol     | Davis    |  62000 |
| Alice     | Smith    |  60000 |
+-----------+----------+--------+
6 rows in set (0.00 sec)

mysql>
mysql> -- ORDER BY multiple columns: Sort products by Category (ASC) then by Price (DESC) within each category
mysql> SELECT ProductName, Category, Price
    -> FROM Products
    -> ORDER BY Category ASC, Price DESC;
+--------------+-------------+-------+
| ProductName  | Category    | Price |
+--------------+-------------+-------+
| Coffee Maker | Appliances  |    80 |
| Laptop       | Electronics |  1200 |
| Monitor      | Electronics |   300 |
| Keyboard     | Electronics |    75 |
| Mouse        | Electronics |    25 |
| Bookshelf    | Furniture   |   200 |
| Desk Chair   | Furniture   |   150 |
+--------------+-------------+-------+
7 rows in set (0.00 sec)

mysql>
mysql> -- 4. Limit output rows
mysql>
mysql> -- LIMIT: Retrieve only the top 3 most expensive products
mysql> SELECT ProductName, Price
    -> FROM Products
    -> ORDER BY Price DESC
    -> LIMIT 3;
+-------------+-------+
| ProductName | Price |
+-------------+-------+
| Laptop      |  1200 |
| Monitor     |   300 |
| Bookshelf   |   200 |
+-------------+-------+
3 rows in set (0.00 sec)

mysql>
mysql> -- LIMIT with OFFSET (e.g., for pagination - retrieve rows 4 to 6)
mysql> -- (Note: OFFSET syntax might vary slightly between databases, e.g., MySQL uses LIMIT 3 OFFSET 3)
mysql> SELECT ProductName, Price
    -> FROM Products
    -> ORDER BY Price DESC
    -> LIMIT 3 OFFSET 3; -- Get 3 rows, starting from the 4th row (skipping the first 3)
+--------------+-------+
| ProductName  | Price |
+--------------+-------+
| Desk Chair   |   150 |
| Coffee Maker |    80 |
| Keyboard     |    75 |
+--------------+-------+
3 rows in set (0.00 sec)