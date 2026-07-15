-- Retail Sales SQL Project - Queries

-- 1. Sales Report (JOIN)

SELECT
    c.FirstName,
    p.ProductName,
    od.Quantity,
    p.Price,
    (od.Quantity * p.Price) AS TotalPrice
FROM Customers c
JOIN Orders o
ON c.CustomerID = o.CustomerID
JOIN OrderDetails od
ON o.OrderID = od.OrderID
JOIN Products p
ON od.ProductID = p.ProductID;


-- 2. Total Sales by Product

SELECT
    p.ProductName,
    SUM(od.Quantity) AS TotalQuantitySold,
    SUM(od.Quantity * p.Price) AS TotalSales
FROM Products p
JOIN OrderDetails od
ON p.ProductID = od.ProductID
GROUP BY p.ProductName
ORDER BY TotalSales DESC;


-- 3. Top Customers

SELECT
    c.FirstName,
    c.LastName,
    SUM(od.Quantity * p.Price) AS TotalSpent
FROM Customers c
JOIN Orders o
ON c.CustomerID = o.CustomerID
JOIN OrderDetails od
ON o.OrderID = od.OrderID
JOIN Products p
ON od.ProductID = p.ProductID
GROUP BY c.CustomerID
ORDER BY TotalSpent DESC;


-- 4. Average Product Price

SELECT
AVG(Price) AS AveragePrice
FROM Products;


-- 5. Most Expensive Product

SELECT *
FROM Products
ORDER BY Price DESC
LIMIT 1;


-- 6. Low Stock Products

SELECT
ProductName,
Stock
FROM Products
WHERE Stock < 20;



-- 7. Total Orders per Customer

SELECT
c.FirstName,
COUNT(o.OrderID) AS TotalOrders
FROM Customers c
LEFT JOIN Orders o
ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID;