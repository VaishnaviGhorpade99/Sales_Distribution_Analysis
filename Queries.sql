1. Customer Table
  
 CREATE TABLE Customer(CustomerID INT PRIMARY KEY,
CustomerName VARCHAR(90), 
Region VARCHAR(40),
segment VARCHAR(50));

2. Products Table
  
 CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    SubCategory VARCHAR(50),
    Price INT);

3. Dates Table
  
 CREATE TABLE Dates (
    Date DATE PRIMARY KEY,
    Year INT,
    Month INT,
    Quarter INT,
    DayOfWeek VARCHAR(50)
);

4. Sales Table
  
 CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    OrderDate DATE,
    Quantity INT,
    UnitPrice INT,
    Discount INT,
    TotalAmount INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (OrderDate) REFERENCES Date(OrderDate));

 SQL QUERY TASK
   
1. Total Sales by Region
   
SELECT
c.Region,
SUM(s.TotalAmount) AS TotalSales
FROM sales s
JOIN customers c ON s.CustomerID = c.CustomerID
GROUP BY c.Region;

2. Monthly Sales Trend
  
SELECT
d.Year,
d.Month,
SUM(s.TotalAmount) AS MonthlySales
FROM sales s
JOIN date_dim d ON s.OrderDate = d.Date
GROUP BY d.Year, d.Month
ORDER BY d.Year, d.Month;

3. Top 10 Products by Sales
  
SELECT
p.ProductName,
SUM(s.TotalAmount) AS TotalSales
FROM sales s
JOIN products p ON s.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY TotalSales DESC
LIMIT 10;

4. Profit by Product
  
SELECT
p.ProductName,
SUM(s.Quantity * (s.UnitPrice - p.CostPrice)) AS TotalProfit
FROM sales s
JOIN products p ON s.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY TotalProfit DESC;

5. Sales by Customer Segment
  
SELECT
c.Segment,
SUM(s.TotalAmount) AS TotalSales
FROM sales s
JOIN customers c ON s.CustomerID = c.CustomerID
GROUP BY c.Segment;

6. Average Order Value (AOV)
  
SELECT
AVG(s.TotalAmount) AS AverageOrderValue
FROM sales s;

7. Discount Impact Analysis
  
SELECT
ROUND(AVG(s.Discount) * 100, 2) AS Avg_Discount_Percentage,
SUM(s.TotalAmount) AS TotalSales
FROM sales s;

8. Sales by Category and Subcategory
  
SELECT
p.Category,
p.SubCategory,
SUM(s.TotalAmount) AS TotalSales
FROM sales s
JOIN products p ON s.ProductID = p.ProductID
GROUP BY p.Category, p.SubCategory;

9. Customers with Highest Revenue
  
SELECT
c.CustomerName,
SUM(s.TotalAmount) AS TotalRevenue
FROM sales s
JOIN customers c ON s.CustomerID = c.CustomerID
GROUP BY c.CustomerName
ORDER BY TotalRevenue DESC
LIMIT 5;











