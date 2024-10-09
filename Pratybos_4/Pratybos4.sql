USE adv;

-- Scenarijus 5: Tendencijų analizė siekiant nustatyti duomenų pokyčius laikui bėgant.

-- 5.1. Apskaičiuokite 3 mėn. slenkantį pardavimų vidurkį. Naudoti lentelę sales_salesorderheader.
WITH MonthlySales AS (
SELECT YEAR(OrderDate) AS OrderYear, MONTH(OrderDate) AS OrderMonth, SUM(TotalDue) AS MonthlySales
FROM Sales_SalesOrderHeader
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
)
SELECT OrderYear, OrderMonth, MonthlySales,
AVG(MonthlySales) OVER (ORDER BY OrderYear, OrderMonth ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS 'Moving Avg 3 month'
FROM MonthlySales
ORDER BY OrderYear, OrderMonth;

-- 5.2. Paskaičiuoti pajamas pagal produktų kategorijas nuo metų pradžios iki einamos datos (angl. Year-to-Date). 
-- Naudoti lenteles sales_salesorderheader, sales_salesorderdetail, production_product, production_productSubCategory, production_productCategory.
SELECT name, year, month, TotalRevenue,
SUM(TotalRevenue) OVER (PARTITION BY name, year order by month) AS YTD
FROM
(SELECT SUM(sales_salesorderheader.TotalDue) AS TotalRevenue,
YEAR(sales_salesorderheader.OrderDate) AS YEAR, 
MONTH(sales_salesorderheader.OrderDate) AS Month, 
production_productCategory.name
FROM sales_salesorderheader
LEFT JOIN sales_salesorderdetail USING(SalesOrderID)
LEFT JOIN production_product USING(ProductID)
LEFT JOIN production_productSubCategory USING(ProductSubCategoryID)
LEFT JOIN production_productCategory USING(ProductCategoryID)
GROUP BY YEAR(sales_salesorderheader.OrderDate),
MONTH(sales_salesorderheader.OrderDate), production_productCategory.name
ORDER BY production_productCategory.name, YEAR(sales_salesorderheader.OrderDate),
MONTH(sales_salesorderheader.OrderDate)) Paskaiciavimas;

-- Scenarijus 6: Sezoniškumo analizė siekiant nustatyti pasikartojančius ciklus, kurie reguliariais intervalais atsiranda duomenyse.
-- 6.1. Atlikti ketvirtinę pardavimų analizę. Naudoti lenteles sales_SalesOrderHeader, sales_SalesOrderDetail.
