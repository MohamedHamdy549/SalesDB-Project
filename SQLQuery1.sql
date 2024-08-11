create database SalesDB

use SalesDB

Create table Customers(
	CustomerID int primary key,
	Fname Varchar(50),
	Lname Varchar(50),
	Email varchar(100),
	phone varchar(11),
	Adress varchar(255)
)

Create table Employee(
	EmployeeID int primary key,
	Fname Varchar(50),
	Lname Varchar(50),
	Email varchar(100),
	phone varchar(11),
	HireDate Date DEFAULT GetDate()
)

create table products (
	ProductID int primary key,
	ProductName varchar(100),
	Price Decimal(10, 2),
	StockQuantity int
)

create table Orders (
	OrderID int primary key,
	CustomerID int,
	EmployeeID int,
	OrderDate Date,
	TotalAmount Decimal(10, 2),
	Foreign key (CustomerID) References Customers(CustomerID),
	Foreign key (EmployeeID) References Employee(EmployeeID),
)

Create Table OrderDetails (
	OrderID int,
	ProductID int,
	Quantity int,
	Price Decimal (10, 2),
	PRIMARY KEY (OrderID, ProductID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
)

--------------------------

Insert Into Customers (CustomerID, FName, LName, Email, Phone, Adress)
VALUES 
(1, 'John', 'Doe', 'john.doe@example.com', '01234567891', '123 Elm Street'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '01123964587', '456 Oak Avenue')

Insert Into Employee (EmployeeID, FName, LName, Email, Phone, HireDate)
VALUES 
(1, 'Alice', 'Johnson', 'alice.johnson@example.com', '555-555-555', '2023-01-15'),
(2, 'Bob', 'Williams', 'bob.williams@example.com', '555-555-556', '2023-02-20')

Insert Into Products (ProductID, ProductName, Price, StockQuantity)
VALUES 
(1, 'Laptop', 999.99, 50),
(2, 'Smartphone', 499.99, 100)

Insert Into Orders (OrderID, CustomerID, EmployeeID, OrderDate, TotalAmount)
VALUES 
(1, 1, 1, '2024-08-01', 1499.98),
(2, 2, 2, '2024-08-02', 499.99)

Insert Into OrderDetails (OrderID, ProductID, Quantity, Price)
VALUES 
(1, 1, 1, 999.99),
(1, 2, 1, 499.99),
(2, 2, 1, 499.99)

------------------------------------------

SELECT o.OrderID, c.FName AS CustomerFirstName, c.LName AS CustomerLastName,
       e.FName AS EmployeeFirstName, e.LName AS EmployeeLastName,
       o.OrderDate, o.TotalAmount
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN Employee e ON o.EmployeeID = e.EmployeeID

 -----

SELECT p.ProductName, SUM(od.Quantity * od.Price) AS TotalSales
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.ProductName

 ----

SELECT *
FROM (
    SELECT c.FName, c.LName, SUM(o.TotalAmount) AS TotalSpent
    FROM Customers c
    JOIN Orders o ON c.CustomerID = o.CustomerID
    GROUP BY c.CustomerID, c.FName, c.LName
) AS SubQuery
WHERE TotalSpent > 500;
