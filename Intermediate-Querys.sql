-- 1
-- Create a report that shows the top 10 OrderId, OrderDate, ShippedDate, CustomerId, Freight
-- from the Orders table stored by Freight in descending order.

SELECT TOP 10 OrderID, OrderDate, ShippedDate, CustomerID, Freight
FROM Orders
ORDER BY Freight DESC;

-- 2
-- Create a report that shows the CompanyName, Fax, Phone, Country, HomePage
-- from the Suppliers table sorted by the Country in descending order then by
-- Company in ascending order.

SELECT CompanyName, Fax, Phone, Country, HomePage
FROM Suppliers
ORDER BY Country DESC, CompanyName ASC;

-- 3
-- Create a report showing OrderDate, ShippedDate, CustomerId, Freight of
-- all orders places on 02 Feb 1997.

SELECT OrderDate, ShippedDate, CustomerID, Freight
FROM Orders
WHERE OrderDate = '04 Feb 1997';

-- 4 
-- Create a report showing all the even numbers of OrderId from Orders table

SELECT *
FROM Orders
WHERE OrderID % 2 = 0;

-- 5
-- Create a report that shows the City, CompanyName, ContactName of customers
-- from cities that has letter L is the name sorted by ContactName.

SELECT CompanyName, ContactName
FROM Customers
WHERE City LIKE '%L%'
ORDER BY ContactName;

-- 6 
-- Create a report that shows the FirstName, LastName, BirthDate of Employees
-- born in the 1950s.

SELECT FirstName, LastName, BirthDate
FROM Employees
WHERE BirthDate BETWEEN '1950-01-01' AND '1959-12-31'; 

-- 7
-- Create a report that shows the FirstName, LastName, and the year of 
-- BirthDate as 'birth year' from the Employee table.

SELECT FirstName, LastName, YEAR(BirthDate) AS 'birth year'
FROM Employees;

-- 9
-- Create a report that shows the ShipPostalCode, OrderId, OrderDate,
-- RequiredDate, ShippedDate, ShipeAddress of all orders with 
-- ShippedPostalCode ends with "00".

SELECT ShipPostalCode, OrderID, OrderDate, RequiredDate, ShippedDate, ShipAddress
FROM Orders
WHERE ShipPostalCode LIKE '%00';

-- 10
-- Create a report thatshows the ContactName, ContactTitle, CompanyName of
-- customers that has no "Sales" word in their ContactTitle.

SELECT ContactName, ContactTitle, CompanyName
FROM Customers
WHERE ContactTitle NOT LIKE '%Sales%';

-- 11
-- Create a report that shows the CompanyName, ContactTitle, City, Country
-- of all customers in any city in 'Mexico' or other cities in 'Spain' other than 'Madrid'.

SELECT CompanyName, ContactTitle, City, Country
FROM Customers
WHERE Country IN ('Mexico', 'Spain') AND CITY != 'Madrid';

-- 12
-- Create a report that shows FirstName, LastName, Extention in this format
-- "{FirstName} {LastName} can be reached at x{Extention}" as ContactInfo
-- Example: "Andrew Fuller can be reached at x3457".

SELECT CONCAT(FirstName, LastName, ' can be reached at x', Extension) AS ContactInfo 
FROM Employees;

-- 12
-- Create a select statment that output the following from the product table
-- {ProductName} / is {QuantityPerUnit} and cost ${UnitPrice}

SELECT CONCAT(ProductName, ' / is ', QuantityPerUnit, ' and cost $', UnitPrice) AS ProductInfo
FROM Products

-- 13
-- Create a report showing OrderId, total number of items in the order as
-- NumberOfItems from the Order Details table grouped by OrderId and sorted
-- by NumberOfOrders in descending order.

SELECT OrderID, COUNT(*) AS NumberOfItems
FROM [Order Details]
GROUP BY OrderID
ORDER BY NumberOfItems DESC;

-- 14
-- Create a report that shows the SupplierID, ProductName, CompanyName
-- from all product supplied by 'Exotic Liquids', 'Speciality Biscuits, Ltd.',
-- 'Escargots Nouveaux' sorted by the supplier ID.

SELECT S.SupplierID, P.ProductName, S.CompanyName
FROM Suppliers AS S INNER JOIN Products AS P 
ON S.SupplierID = P.SupplierID
WHERE S.CompanyName IN ('Exotic Liquids', 'Specialty Biscuits, Ltd.', 'Escargots Nouveaux')
ORDER BY S.SupplierID;

-- 15
-- Create a report that fetch the first 5 characters of Description from the
-- Category table renamed as ShortInfo.

SELECT SUBSTRING(Description, 1, 5) AS 'ShortInfo'
FROM Categories;

-- 16
-- Create a report that shows ProductID, ProductName, Active if discontinued 
-- is 0 otherwise InActive and name the column 'Status'.

SELECT ProductID, ProductName,
CASE
	WHEN Discontinued = 0 THEN 'Active'
	ELSE 'InActive'
END
AS 'Status'
FROM Products;

-- 17
-- Create a report that show the CompanyName and total number of orders by 
-- customer renamed as number of orders since December 31, 1994. 
-- Show number of orders greater than 10.

SELECT C.CompanyName, C.CustomerID, COUNT(O.CustomerID) AS 'Number Of Orders'
FROM Customers AS C INNER JOIN Orders AS O
ON C.CustomerID = O.CustomerID
WHERE O.OrderDate >= '1994-12-31'
GROUP BY C.CompanyName, C.CustomerID
HAVING COUNT(O.CustomerID) > 10;

-- 18
-- Create a report that shows the sum of Freight for each CusttomerID
-- when sum of Freight greater that $200

SELECT CustomerID, SUM(Freight)
FROM Orders
GROUP BY CustomerID
HAVING SUM(Freight) > 200;

-- 19
-- Create a report that shows the CompanyName, and ProductName from all 
-- product in the Seafood category.

SELECT S.CompanyName, P.ProductName
FROM Products AS P INNER JOIN Suppliers AS S
ON P.SupplierID = S.SupplierID
INNER JOIN Categories AS C
ON C.CategoryID = P.CategoryID
WHERE C.CategoryName = 'Seafood';

-- 20
-- Create a report that shows most expensive and least expensive Product 
-- list (name and unit price)

SELECT ProductName, UnitPrice
FROM Products
WHERE UnitPrice = (SELECT MAX(UnitPrice) FROM Products)
   OR UnitPrice = (SELECT MIN(UnitPrice) FROM Products);