use ADV;

-- 1.1
SELECT
Sales_Customer.CustomerID, 
Person_Person.FirstName, Person_Person.LastName, 
Person_Address.AddressLine1, Person_Address.City
FROM Sales_Customer
LEFT JOIN Person_Person ON Sales_Customer.PersonID = Person_Person.BusinessEntityID
LEFT JOIN Person_BusinessEntityAddress USING(BusinessEntityID)
LEFT JOIN Person_Address USING(AddressID)
WHERE AddressLine1 IS NOT NULL;

-- 1.2
SELECT COUNT(CustomerID) AS TotalCustomerNumber
FROM Sales_Customer;

-- 1.3
SELECT CustomerID, COUNT(*) AS OrderCount
FROM Sales_SalesOrderHeader
GROUP BY CustomerID;

-- 1.4
SELECT p.FirstName, p.LastName, c.CustomerID, SUM(soh.TotalDue) AS TotalSpent, COUNT(soh.SalesOrderID) AS TotalOrderAmount
FROM Sales_SalesOrderHeader soh
JOIN Sales_Customer c ON soh.CustomerID = c.CustomerID
JOIN Person_Person p ON c.PersonID = p.BusinessEntityID
GROUP BY p.Firstname, p.LastName, c.CustomerID
ORDER BY TotalSpent DESC;

-- 1.5
SELECT p.FirstName, p.LastName, c.CustomerID, AVG(soh.TotalDue) AS AvgOrder, COUNT(soh.SalesOrderID) AS TotalOrderAmount
FROM Sales_SalesOrderHeader soh
JOIN Sales_Customer c ON soh.CustomerID = c.CustomerID
JOIN Person_Person p ON c.PersonID = p.BusinessEntityID
GROUP BY p.Firstname, p.LastName, c.CustomerID
ORDER BY AvgOrder DESC;

-- 1.6
SELECT p.FirstName, p.LastName, c.CustomerID, 
FROM Sales_SalesOrderHeader soh
JOIN Sales_Customer c ON soh.CustomerID = c.CustomerID
JOIN Person_Person p ON c.PersonID = p.BusinessEntityID	