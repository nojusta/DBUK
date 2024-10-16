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

SELECT

-- 4. Sunumeruoti kiekvieną darbuotoją pagal įdarbinimo datą. Naudoti lentelę HumanResources_Employee.

SELECT

-- 5. Sureitinguoti kiekvienos pareigybės darbuotojus pagal atlyginimą dviem būdais: vienu atveju taikant RANK(), o kitu – DENSE_RANK() funkcijas. 
-- Kokį skirtumą pastebite? Naudoti lenteles HumanResources_EmployeePayHistory, humanresources_employee.

SELECT

-- 6. Padalinti darbuotojus į 4 kvartilius pagal jų atlyginimą. Naudoti lentelę HumanResources_EmployeePayHistory.

SELECT

-- 7. Palyginti kiekvieno darbuotojo dabartinį atlyginimą su kitu didesniu atlyginimu. Naudoti lentelę HumanResources_EmployeePayHistory.

SELECT

-- 8. Rasti didžiausią kiekvienos pareigybės atlyginimą. Naudoti lenteles HumanResources_EmployeePayHistory, humanresources_employee.

SELECT

-- 9. Rasti pirmą ir paskutinę įdarbinimo datas kiekviename departamente pagal pareigybes. Naudoti lenteles HumanResources_EmployeeDepartmentHistory, humanresources_employee.
