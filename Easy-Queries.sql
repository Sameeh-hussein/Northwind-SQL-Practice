-- 1
-- Create a report that shows the CategoryName and Description
-- from the Categories table sorted by CategoryName

SELECT CategoryName, Description
FROM Categories
ORDER BY CategoryName;

-- 2
-- Create a report that shows the ContactName, CompanyName, ContactTitle, PhoneNumber
-- from the Customers table sorted by ContactTitle DESC

SELECT ContactName, CompanyName, ContactTitle, Phone 
FROM Customers
ORDER BY ContactTitle DESC;

-- 3 
-- Create a report that shows all the CustomerId in lowercase
-- letter and renamed as ID from the customers table.

SELECT LOWER(CustomerId) AS ID
FROM Customers;

-- 4
-- Create a report that shows ComapnyName, ContactName, of all customers
-- from Customers table who is from 'Buenos Aires' City only.

SELECT CompanyName, ContactName
FROM Customers
WHERE City = 'Buenos Aires';

-- 5
-- Create a report showing all the ContactName, Address, City
-- of all customers from Germany, Mexico, Spain

SELECT ContactName, Address, City
FROM Customers
WHERE Country NOT IN ('Germany', 'Mexico', 'Spain');

-- 6
-- Create a report showing FirstName, LastName, Country from the 
-- Employees table not from the USA

SELECT FirstName, LastName, Country
FROM Employees
WHERE Country <> 'USA'; -- YOU CAN USE != INSTEAD OF <>

-- 7
-- Create a report that shows the EmployeeID, OrderID, CustomerID, RequiredDate,
-- ShippedDate from all orders that ShippedDate later than RequiredDate

SELECT EmployeeID, OrderID, CustomerID, RequiredDate, ShippedDate
FROM Orders
WHERE ShippedDate > RequiredDate;

-- 8
-- Create a report shows the City, CompanyName, ContactName from Customers
-- from cities starting with A or B

SELECT City, CompanyName, ContactName
FROM Customers
WHERE City LIKE '[AB]%'; -- OR ( City LIKE 'A%' OR City LIKE 'B%' )

-- 9
-- Create a report that shows all the Orders where the freight cost more than 500$

SELECT *
FROM Orders
WHERE Freight > 500;

-- 10 
-- Create a report that shows ProductName, UnitsInStock, UnitsOnOrder,
-- ReorderLevel when inventory items on hand quantity are below reorder level

SELECT ProductName, UnitsInStock, UnitsOnOrder, ReorderLevel
FROM Products
WHERE UnitsInStock < ReorderLevel;

-- 11
-- Create a report that shows the CompanyName, ContactName, Phone number of
-- all customers that have no fax number

SELECT CompanyName, ContactName, Phone
FROM Customers
WHERE Fax IS NULL;

--12
-- Create a report showing Products that we don't sell any more

SELECT *
FROM Products
WHERE Discontinued = 1;

--13
-- Create a report that shows the CompanyName, ContactName
-- of all Customers that do not have Fax and live in USA and sorted by ContactName.

SELECT CompanyName, ContactName
FROM Customers
WHERE Fax IS NULL AND Country = 'USA'
ORDER BY ContactName;

-- 14
-- Create a report that show the LastName, FirstName, City of 
-- employees in cities other "Seattle".

SELECT FirstName, LastName, City
FROM Employees
WHERE CITY != 'Seattle'; -- OR City NOT IN ('Seattle')

-- 15
-- Cretate a report that shows the ContactName of all customers that do not have 
-- a letter 'A' as the second position in their ContactName

SELECT ContactName
FROM Customers
WHERE ContactName NOT LIKE '_A%';