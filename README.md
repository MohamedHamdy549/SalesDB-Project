# Sales Database Management System

## Overview

The Sales Database Management System is a comprehensive SQL-based project designed to manage sales data for a fictional company. This system includes tables for customers, orders, products, and employees, and supports various operations such as tracking sales, analyzing customer data, and generating reports.

## Features

- **Customer Management**: Track customer information including personal details and contact information.
- **Order Management**: Manage orders with details on order dates, total amounts, and associated customers and employees.
- **Product Management**: Maintain product information, including pricing and stock quantities.
- **Employee Management**: Store details of employees handling orders.
- **Reporting**: Generate reports on sales trends, customer spending, and product performance.

## Database Schema

### Tables

- **Customers**
  - `CustomerID` (INT, Primary Key)
  - `FName` (VARCHAR)
  - `LName` (VARCHAR)
  - `Email` (VARCHAR)
  - `PhoneNumber` (VARCHAR)
  - `Adress` (VARCHAR)

- **Employees**
  - `EmployeeID` (INT, Primary Key)
  - `FName` (VARCHAR)
  - `LName` (VARCHAR)
  - `Email` (VARCHAR)
  - `Phone` (VARCHAR)
  - `HireDate` (DATE)

- **Products**
  - `ProductID` (INT, Primary Key)
  - `ProductName` (VARCHAR)
  - `Price` (DECIMAL)
  - `StockQuantity` (INT)

- **Orders**
  - `OrderID` (INT, Primary Key)
  - `CustomerID` (INT, Foreign Key)
  - `EmployeeID` (INT, Foreign Key)
  - `OrderDate` (DATE)
  - `TotalAmount` (DECIMAL)

- **OrderDetails**
  - `OrderID` (INT, Foreign Key)
  - `ProductID` (INT, Foreign Key)
  - `Quantity` (INT)
  - `Price` (DECIMAL)
  - Primary Key: (`OrderID`, `ProductID`)

## Getting Started

### Prerequisites

- MySQL or SQL Server installed on your machine.
- Basic knowledge of SQL for running queries and managing the database.

### Installation

1. **Clone the Repository**

   ```bash
   git clone https://github.com/yourusername/SalesDB-Project.git
   ```

2. **Set Up the Database**

   - Open your SQL client (e.g., MySQL Workbench, SQL Server Management Studio).
   - Run the SQL scripts found in the `schema` folder to create the database and tables.
   - Insert sample data using the scripts in the `data` folder.

3. **Running Queries**

   - You can use the SQL queries provided in the `queries` folder to generate reports and analyze the data.

## Usage

- **Add New Orders**: Use the `insert_order.sql` script to add new orders.
- **Update Product Stock**: Use the `update_stock.sql` script to update product stock quantities.
- **Generate Reports**: Use the `reports` folder scripts to generate various sales and customer reports.

## Examples

- **Retrieve all orders with customer and employee details**

​	

- ```
  SELECT o.OrderID, c.FName AS CustomerFirstName, c.LName AS CustomerLastName,
         e.FName AS EmployeeFirstName, e.LName AS EmployeeLastName,
         o.OrderDate, o.TotalAmount
  FROM Orders o
  JOIN Customers c ON o.CustomerID = c.CustomerID
  JOIN Employee e ON o.EmployeeID = e.EmployeeID
  ```

- **Get total sales amount for each product**

  ```
  SELECT p.ProductName, SUM(od.Quantity * od.Price) AS TotalSales
  FROM OrderDetails od
  JOIN Products p ON od.ProductID = p.ProductID
  GROUP BY p.ProductName
  ```

## Contributing

Feel free to submit pull requests or open issues to improve this project. Your contributions are welcome!# SalesDB-Project

# SalesDB-Project

