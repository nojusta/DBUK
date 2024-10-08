-- Scenarijus 3: Produktu analize 
use ADV;

-- 3.1. Nustatyti, kurios produktų kategorijos yra populiariausios tarp klientų. 
-- Naudoti lenteles Sales_SalesOrderDetail, Production_Product, Production_ProductSubcategory. (dar ir Production_ProductCategory panaudosim)

SELECT Production_ProductCategory.Name, COUNT(SalesOrderID) AS TotalOrders, SUM(Sales_SalesOrderDetail.OrderQty) AS TotalQuantity
FROM Sales_SalesOrderDetail
INNER JOIN Production_Product USING(ProductID)
INNER JOIN Production_ProductSubcategory USING(ProductSubCategoryID)
INNER JOIN Production_ProductCategory USING(ProductCategoryID)
GROUP BY Production_ProductCategory.Name
ORDER BY TotalQuantity DESC;

-- 3.2. Nustatyti, kurie produktai yra populiariausi tarp klientų.
-- Naudoti lenteles Sales_SalesOrderDetail, Sales_SalesOrderHeader, Production_Product.

SELECT p.Name AS ProductName, COUNT(sod.SalesOrderID) AS TotalOrders, SUM(sod.OrderQty) AS TotalQuantity
FROM Sales_SalesOrderDetail sod
INNER JOIN Production_Product p USING(ProductID)
INNER JOIN Sales_SalesOrderHeader soh ON sod.SalesOrderID = soh.SalesOrderID
GROUP BY p.Name
ORDER BY TotalQuantity DESC;

-- 3.3 Išvesti 10 brangiausių (pagal ListPrice) produktų. Naudoti lentelę Production_Product.

SELECT ProductID, Name, ListPrice
FROM Production_Product
ORDER BY ListPrice DESC
LIMIT 13; -- kadangi 10,11,12,13 produktu kainos sutampa

-- 3.4. Išvesti 5 populiariausius praeito mėnesio (nuo paskutinio užsakymo) produktus.
-- Naudoti lenteles Sales_SalesOrderDetail, Sales_SalesOrderHeader.

WITH Latest_Sales AS(
SELECT Sales_SalesOrderDetail.ProductID, SUM(Sales_SalesOrderDetail.OrderQty) As TotalQty
FROM Sales_SalesOrderDetail
INNER JOIN Sales_SalesOrderHeader USING(SalesOrderID)
WHERE Sales_SalesOrderHeader.OrderDate BETWEEN(SELECT DATE_ADD(MAX(OrderDate), INTERVAL -2 MONTH) FROM Sales_SalesOrderHeader)
AND (SELECT DATE_ADD(MAX(OrderDate), INTERVAL -1 MONTH) FROM Sales_SalesOrderHeader)
GROUP BY Sales_SalesOrderDetail.ProductID)
SELECT Latest_Sales.*, Production_Product.Name
FROM Latest_Sales
INNER JOIN Production_Product USING(ProductID)
ORDER BY Latest_Sales.TotalQty DESC
LIMIT 5;

-- 3.5. Išvardyti visus produktus, kurių šiuo metu nėra sandėlyje. 
-- Naudoti lenteles Production_Product, Production_ProductInventory.

SELECT Production_Product.Name, Production_ProductInventory.Quantity
FROM Production_ProductInventory
INNER JOIN Production_Product Using(ProductID)
WHERE Quantity = 0;