use ADV;

-- 1.1
SELECT 
sales_customer.CustomerID, 
person_person.FirstName, 
person_person.LastName, 
person_address.AddressLine1,
person_address.City
FROM sales_customer
LEFT JOIN person_person ON sales_customer.CustomerID = person_person.BusinessEntityID
LEFT JOIN person_businessentityaddress USING(BusinessEntityID)
LEFT JOIN person_address USING(AddressID)
WHERE AddressLine1 IS NOT NULL;

-- 1.2.
SELECT COUNT(CustomerID) AS TotalCustomerNumber
FROM sales_customer;

-- 1.3
SELECT CustomerID, COUNT(*) AS OrderCount
FROM Sales_SalesOrderHeader
GROUP BY CustomerID;

-- 1.4.
SELECT p.FirstName, p.LastName, c.CustomerID, SUM(soh.TotalDue) AS TotalSpent, COUNT(soh.SalesOrderID) AS TotalOrderAmount
FROM Sales_SalesOrderHeader soh
JOIN Sales_Customer c ON soh.CustomerID = c.CustomerID
JOIN Person_Person p ON c.PersonID = p.BusinessEntityID
GROUP BY p.Firstname, p.LastName, c.CustomerID
ORDER BY TotalSpent DESC;

-- 1.5.
SELECT p.FirstName, p.LastName, c.CustomerID, AVG(soh.TotalDue) AS AverageSpent, COUNT(soh.SalesOrderID) AS TotalOrderAmount
FROM Sales_SalesOrderHeader soh
JOIN Sales_Customer c ON soh.CustomerID = c.CustomerID
JOIN Person_Person p ON c.PersonID = p.BusinessEntityID
GROUP BY p.Firstname, p.LastName, c.CustomerID
ORDER BY AverageSpent DESC;

-- 1.6.
SELECT p.FirstName, p.LastName, c.CustomerID, ROUND((DATEDIFF(MAX(soh.ORDERDATE), MIN(soh.ORDERDATE))/ COUNT(soh.SALESORDERID)/30),0) as freq
FROM Sales_SalesOrderHeader soh
JOIN Sales_Customer c ON soh.CustomerID = c.CustomerID
JOIN Person_Person p ON c.PersonID = p.BusinessEntityID
GROUP BY p.FirstName, p.LastName, c.CustomerID
ORDER BY freq desc;

-- 1.7.
SELECT p.FirstName, p.LastName, c.CustomerID, SUM(soh.TotalDue) AS TotalSpent
FROM Sales_SalesOrderHeader soh
JOIN Sales_Customer c ON soh.CustomerID = c.CustomerID
JOIN Person_Person p ON c.PersonID = p.BusinessEntityID
GROUP BY p.Firstname, p.LastName, c.CustomerID
ORDER BY TotalSpent DESC
LIMIT 10;

-- 1.8.
SELECT p.FirstName, p.LastName, c.CustomerID, YEAR(soh.OrderDate) AS Year, MONTH(soh.OrderDate) AS Month, SUM(soh.TotalDue) AS MonthlySpent
FROM Sales_SalesOrderHeader soh
JOIN Sales_Customer c ON soh.CustomerID = c.CustomerID
JOIN Person_Person p ON c.PersonID = p.BusinessEntityID
GROUP BY p.FirstName, p.LastName, c.CustomerID, YEAR(soh.OrderDate), MONTH(soh.OrderDate)
ORDER BY c.CustomerID, Year, Month;

-- 1.9.
SELECT p.FirstName, p.LastName, c.CustomerID, MAX(soh.OrderDate) AS LastOrder
FROM Sales_SalesOrderHeader soh
JOIN Sales_Customer c ON soh.CustomerID = c.CustomerID
JOIN Person_Person p ON c.PersonID = p.BusinessEntityID
GROUP BY p.FirstName, p.LastName, c.CustomerID
ORDER BY LastOrder DESC;

-- 1.10.
SELECT p.FirstName, p.LastName, c.CustomerID, COUNT(soh.SalesOrderID) AS OrderCount, SUM(soh.TotalDue) AS TotalSpent,
CASE
    WHEN SUM(soh.TotalDue) > 15000 THEN "Daug isleidziantys"
	WHEN COUNT(soh.SalesOrderID) >= 25 THEN "Perkantys daznai" 
    WHEN COUNT(soh.SalesOrderID) <= 5 THEN "Perkantys retai"
    ELSE "Iprasti klientai"
END AS PirkimoElgsena
FROM person_person p 
JOIN sales_customer c ON c.PersonID = p.BusinessEntityID
JOIN sales_salesorderheader soh ON soh.CustomerID = c.CustomerID
GROUP BY p.FirstName, p.LastName, c.CustomerID
ORDER BY PirkimoElgsena, p.LastName, p.FirstName;

-- 2.1.
SELECT YEAR(soh.OrderDate) AS Year, MONTH(soh.OrderDate) AS Month, SUM(soh.TotalDue) AS MonthlyRevenue
FROM Sales_SalesOrderHeader soh
WHERE YEAR(soh.OrderDate) = 2011
GROUP BY YEAR(soh.OrderDate), MONTH(soh.OrderDate)
ORDER BY MonthlyRevenue DESC;	
    
-- 2.2.
SELECT p.ProductID, p.Name, SUM(sod.LineTotal) AS TotalRevenue
FROM Sales_SalesOrderDetail sod
JOIN Production_Product p ON sod.ProductID = p.ProductID
GROUP BY p.ProductID, p.Name
ORDER BY TotalRevenue DESC;

-- 2.3.
SELECT st.Name AS TerritoryName, SUM(soh.TotalDue) AS TotalRevenue
FROM Sales_SalesOrderHeader soh
JOIN Sales_SalesTerritory st USING(TerritoryID)
GROUP BY st.Name
ORDER BY TotalRevenue DESC;

-- 2.4.
SELECT 
CASE WHEN OnlineOrderFlag = 1 THEN 'Internetinė prekyba'
ELSE 'Mažmeninė prekyba'
END AS SalesChannel,
ROUND(SUM(TotalDue)) AS TotalRevenue
FROM Sales_SalesOrderHeader
GROUP BY OnlineOrderFlag
ORDER BY TotalRevenue DESC;
