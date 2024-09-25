USE ADV;

-- 4.1. Apskaičiuoti mėnesio pajamų augimą. Naudoti lentelę Sales_SalesOrderHeader.
WITH MonthlyRevenue AS (
SELECT YEAR(OrderDate) AS OrderYear, MONTH(OrderDate) AS OrderMonth, SUM(TotalDue) AS TotalRevenue
FROM Sales_SalesOrderHeader
GROUP BY YEAR(OrderDate),
MONTH(OrderDate)
)
SELECT Current_Period.OrderYear, Current_Period.OrderMonth, Current_Period.TotalRevenue,
ROUND(((Current_Period.TotalRevenue - Previous_Period.TotalRevenue) / Previous_Period.TotalRevenue) * 100, 2) AS "RevenueGrowth %"
FROM MonthlyRevenue AS Current_Period
INNER JOIN MonthlyRevenue AS Previous_Period ON Current_Period.OrderYear = Previous_Period.OrderYear
AND Current_Period.OrderMonth = Previous_Period.OrderMonth + 1;

-- 4.2. Apskaičiuoti Grynojo pelno maržą, angl. Net Profit Margin, kad sužinotume, kiek pelno įmonė uždirba po visų išlaidų. 
-- Naudoti lenteles Sales_SalesOrderHeader, Sales_SalesOrderDetail, Production_ProductCostHistory.

WITH RevenueAndExpenses AS
(SELECT 
	Sales_SalesOrderHeader.SalesOrderID, 
	SUM(Sales_SalesOrderHeader.TotalDue) AS TotalRevenue, 
	SUM(Sales_SalesOrderDetail.OrderQty * Production_ProductCostHistory.StandardCost) AS TotalExpenses
FROM Sales_SalesOrderHeader
LEFT JOIN Sales_SalesOrderDetail USING(SalesOrderID)
LEFT JOIN Production_ProductCostHistory USING(ProductID)
GROUP BY Sales_SalesOrderHeader.SalesOrderID
)
SELECT 
	YEAR(Sales_SalesOrderHeader.OrderDate) AS OrderYear,
	MONTH(Sales_SalesOrderHeader.OrderDate) AS OrderMonth, 
    SUM(RevenueAndExpenses.TotalRevenue) AS MonthlyRevenue,
	SUM(RevenueAndExpenses.TotalExpenses) AS MonthlyExpenses,
    SUM(RevenueAndExpenses.TotalRevenue) - SUM(RevenueAndExpenses.TotalExpenses) AS NetProfit,
    (SUM(RevenueAndExpenses.TotalRevenue - RevenueAndExpenses.TotalExpenses)) /
    SUM(RevenueAndExpenses.TotalRevenue) * 100 AS NetProfitMargin
    FROM RevenueAndExpenses
    LEFT JOIN Sales_SalesOrderHeader USING(SalesOrderID)
GROUP BY OrderYear, OrderMonth;

-- 4.3. Apskaičiuoti mėnesio pasikartojančias pajamas, angl. Monthly recurring revenue (MRR). 
-- Tai parodo visas numatomas pajamas, kurias įmonė tikisi gauti iš pasikartojančių mokėjimų per vieną mėnesį
WITH ActiveCustomers AS(
SELECT COUNT(DISTINCT CustomerID) AS CustomerNumber
FROM Sales_SalesOrderHeader
HAVING COUNT(SalesOrderID) > 1 
),
ARPU AS(
SELECT SUM(TotalDue) / COUNT(DISTINCT CustomerID) AS ARPU
FROM Sales_SalesOrderHeader
)
SELECT ActiveCustomers.CustomerNumber * ARPU.ARPU AS MRR
FROM ActiveCustomers, ARPU;