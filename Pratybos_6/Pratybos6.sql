-- 1. Sureitinguoti pardavimus kiekvienoje produktų kategorijoje pagal metus. Naudoti lenteles sales_salesorderheader,
--  sales_salesorderdetail, production_product, production_productSubCategory, production_productCategory.

SELECT production_productCategory.Name, SUM(TotalDue) AS TotalAmount,
YEAR(sales_salesorderheader.OrderDate) AS Year,
RANK() OVER(ORDER BY SUM(TotalDue) DESC) AS 'Rank'
FROM sales_salesorderheader
INNER JOIN sales_salesorderdetail USING(SalesOrderID)
INNER JOIN production_product USING(ProductID)
INNER JOIN production_productSubCategory USING(ProductSubCategoryID)
INNER JOIN production_productCategory USING(ProductCategoryID)
GROUP BY YEAR(sales_salesorderheader.OrderDate), production_productCategory.Name;

-- 2. Išvesti Top 3 kiekvienos produktų kategorijos produktus pagal pardavimus. Naudoti lenteles sales_salesorderheader, 
-- sales_salesorderdetail, production_product, production_productsubcategory, production_productcategory.
SELECT * FROM
(SELECT production_productCategory.Name AS Kategorija, production_product.Name AS Produktas, 
SUM(TotalDue) AS TotalSales,
RANK() OVER(PARTITION BY production_productCategory.Name ORDER BY SUM(TotalDue) DESC) AS Reitingas
FROM sales_salesorderheader
INNER JOIN sales_salesorderdetail USING(SalesOrderID)
INNER JOIN production_product USING(ProductID)
INNER JOIN production_productSubCategory USING(ProductSubCategoryID)
INNER JOIN production_productCategory USING(ProductCategoryID)
GROUP BY production_product.Name, production_productCategory.Name) lentele
WHERE Reitingas <= 3;

-- 3. Išvesti kiekvieno produkto pirmo ir paskutinio pirkimų datas. Naudoti lenteles
-- sales_salesorderheader, sales_salesorderdetail, production_product.
SELECT pp.ProductID, DATE(MIN(soh.DueDate)) AS first_sale, DATE(MAX(soh.DueDate)) AS last_sale
FROM sales_salesorderheader soh
INNER JOIN sales_salesorderdetail sod ON soh.SalesOrderID = sod.SalesOrderID
INNER JOIN production_product pp ON sod.ProductID = pp.ProductID
GROUP BY pp.ProductID, pp.Name
ORDER BY pp.ProductID;

-- 4. Sunumeruoti kiekvieną darbuotoją pagal įdarbinimo datą. Naudoti lentelę HumanResources_Employee.

SELECT BusinessEntityID, JobTitle, HireDate, ROW_NUMBER() OVER(ORDER BY HireDate) AS RowNum
FROM HumanResources_Employee
ORDER BY HireDate;    

-- 5. Sureitinguoti kiekvienos pareigybės darbuotojus pagal atlyginimą dviem būdais: vienu atveju taikant RANK(), o kitu – DENSE_RANK() funkcijas. 
-- Kokį skirtumą pastebite? Naudoti lenteles HumanResources_EmployeePayHistory, HumanResources_Employee.

-- Naudojant RANK()
SELECT e.BusinessEntityID, e.JobTitle, eph.Rate AS Salary, RANK() OVER(PARTITION BY e.JobTitle ORDER BY eph.Rate DESC) AS 'Rank'
FROM HumanResources_Employee e
INNER JOIN HumanResources_EmployeePayHistory eph ON e.BusinessEntityID = eph.BusinessEntityID
ORDER BY e.JobTitle, 'Rank';

-- Naudojant DENSE_RANK()
SELECT e.JobTitle, e.BusinessEntityID, eph.Rate, DENSE_RANK() OVER(PARTITION BY e.JobTitle ORDER BY eph.Rate DESC) AS DenseRank
FROM HumanResources_Employee e
INNER JOIN HumanResources_EmployeePayHistory eph ON e.BusinessEntityID = eph.BusinessEntityID
ORDER BY e.JobTitle, DenseRank;

-- 6. Padalinti darbuotojus į 4 kvartilius pagal jų atlyginimą. Naudoti lentelę HumanResources_EmployeePayHistory.

SELECT BusinessEntityID, Rate, NTILE(4) OVER(ORDER BY Rate DESC) AS SalaryQuartile
FROM HumanResources_EmployeePayHistory
ORDER BY SalaryQuartile, Rate DESC;

-- 7. Palyginti kiekvieno darbuotojo dabartinį atlyginimą su kitu didesniu atlyginimu. Naudoti lentelę HumanResources_EmployeePayHistory.

SELECT eph.BusinessEntityID, eph.Rate AS CurrentRate, LEAD(eph.Rate) OVER (ORDER BY eph.Rate DESC) AS NextHigherRate
FROM HumanResources_EmployeePayHistory eph
ORDER BY eph.Rate DESC;	
    
-- 8. Rasti didžiausią kiekvienos pareigybės atlyginimą. Naudoti lenteles HumanResources_EmployeePayHistory, humanresources_employee.

SELECT e.BusinessEntityID, e.JobTitle, eph.Rate, 
	MAX(eph.Rate) OVER (PARTITION BY e.JobTitle ORDER BY eph.Rate DESC) AS MaxSalaryByJobTitle
FROM HumanResources_Employee e
INNER JOIN HumanResources_EmployeePayHistory eph ON e.BusinessEntityID = eph.BusinessEntityID
ORDER BY e.JobTitle, eph.Rate DESC;
    
-- 9. Rasti pirmą ir paskutinę įdarbinimo datas kiekviename departamente pagal pareigybes. Naudoti lenteles HumanResources_EmployeeDepartmentHistory, humanresources_employee.

SELECT edh.DepartmentID,e.BusinessEntityID,e.JobTitle, 
    (SELECT MIN(StartDate) 
     FROM HumanResources_EmployeeDepartmentHistory 
     WHERE DepartmentID = edh.DepartmentID) AS FirstHireDate,
    (SELECT MAX(StartDate) 
     FROM HumanResources_EmployeeDepartmentHistory 
     WHERE DepartmentID = edh.DepartmentID) AS LastHireDate
FROM HumanResources_EmployeeDepartmentHistory edh
INNER JOIN HumanResources_Employee e ON edh.BusinessEntityID = e.BusinessEntityID
GROUP BY edh.DepartmentID, e.BusinessEntityID, e.JobTitle
ORDER BY edh.DepartmentID, FirstHireDate;
