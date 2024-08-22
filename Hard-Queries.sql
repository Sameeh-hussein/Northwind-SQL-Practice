-- 1
-- Create a report shoes the Capitalized FirstName and 
-- Capitalized LastName renamed as FirstName, and LastName
-- respectively and HireDate from the employee table sorted 
-- from the newest to the oldest employee

SELECT UPPER(FirstName) AS FirstName, UPPER(LastName) AS LastName, HireDate
FROM Employees
ORDER BY HireDate DESC;

-- 2
-- Create a report that shows the average UnitPrice rounded to the next whole number,
-- total of UnitInStoke, and maximum number of pending orders from the products table.
-- All saved as AveragePrice, TotalStock, and MaxPendingOrders respectively.

SELECT ROUND(AVG(UnitPrice), 0) AS 'AveragePrice',
       SUM(UnitsInStock) AS 'TotalStock',
	   MAX(UnitsOnOrder) AS 'MaxPendingOrders'
FROM Products;

-- 3
-- Create a report that shows the SupplierID, CompanyName, CategoryName, 
-- ProductName, and UnitPrice.

SELECT S.SupplierID, CompanyName, CategoryName, ProductName, UnitPrice
FROM Suppliers AS S INNER JOIN Products AS P
ON S.SupplierID = P.SupplierID 
INNER JOIN Categories AS C 
ON C.CategoryID = P.CategoryID;

-- 4
-- Create a report that shows the OrderID, ContactName, UnitPrice, Quantity
-- with discount given on every purchase

SELECT O.OrderID, C.ContactName, OD.UnitPrice, OD.Quantity, OD.Discount
FROM Orders AS O INNER JOIN Customers AS C 
ON O.CustomerID = C.CustomerID
INNER JOIN [Order Details] AS OD
ON O.OrderID = OD.OrderID
WHERE OD.Discount != 0;

-- 5
-- Create a report that shows the EmployeeID, the LastName and FirstName a employee
-- and the LastName and FirstName of who they report to as manager sorted by EmployeeID

SELECT E.EmployeeID, 
	   CONCAT(E.LastName, ' ', E.FirstName) AS Employee,
       CONCAT(M.LastName, ' ', M.FirstName) AS Manager
FROM Employees AS E LEFT JOIN Employees AS M
ON M.EmployeeID = E.ReportsTo
ORDER BY EmployeeID;

-- 6
-- Create a view named CustomerInfo that shows the 
-- CustomerID, CompanyName, ContactName, ContactTitle, Address,
-- City, Country, Phone, OrderDate, RequiredDate, ShippedDate

CREATE VIEW CustomerInfo AS
SELECT C.CustomerID, C.CompanyName, C.ContactName, C.ContactTitle, C.Address,
       C.City, C.Country, C.Phone, O.OrderDate, O.RequiredDate, O.ShippedDate
FROM Orders AS O INNER JOIN Customers AS C
ON O.CustomerID = C.CustomerID

-- YOU CAN TEST RESULT OF VIEW LIKE THIS :

SELECT * FROM CustomerInfo;

-- 7
-- Change the name of the view you created from CustomerInfo to CustomerDetails.

sp_rename @objname = 'dbo.CustomerInfo',
@newname = 'CustomerDetails';

-- 8
-- Drop the CustomerDetails view.

DROP VIEW dbo.CustomerDetails;

-- 9
-- Create a view named ProductDetails that shows the 
-- ProductID, CompanyName, ProductName, CategoryName, Description,
-- QuantityPerUnit, UnitPrice, UnitInStock, UnitOnOrder, ReorderLevel, Discontinued.

CREATE VIEW ProductDetails AS 
SELECT P.ProductID, S.CompanyName, P.ProductName, C.CategoryName, C.Description, P.QuantityPerUnit, 
       P.UnitPrice, P.UnitsInStock, P.UnitsOnOrder, P.ReorderLevel, P.Discontinued
FROM Products AS P INNER JOIN Categories AS C
ON P.CategoryID = C.CategoryID 
INNER JOIN Suppliers AS S 
ON S.SupplierID = P.SupplierID;

-- 10
-- Create a copy of the shipper table as shippers_duplicate.
-- Then insert a copy of shippers into the new table.

SELECT *
INTO Shippers_Duplicate 
FROM Shippers;

-- 11
-- Add a column to shipper_duplicate table called email of type varchar(150)

ALTER TABLE Shippers_Duplicate
ADD Email VARCHAR(150); 

-- Update each shipper email with random email to each shipper 

UPDATE Shippers_Duplicate 
SET Email = 'fake@gmail.com';

-- and Display the data in the shippers_duplicate table.

SELECT *
FROM Shippers_Duplicate;

-- Drop the shippers_duplicate table.

DROP TABLE Shippers_Duplicate;