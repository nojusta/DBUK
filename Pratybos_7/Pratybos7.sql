-- 7.1 Pratybos

-- 1
SELECT * FROM person_person;

CREATE TABLE adv.Asmenys as (
SELECT * FROM person_person
);

CREATE TABLE adv.Asmenys_indeksavimas as (
SELECT * FROM person_person
);

-- 1.2
SHOW INDEX FROM asmenys;
SHOW INDEX FROM asmenys_indeksavimas;
SHOW INDEX FROM person_person;

-- 1.3 idx_person_lastname ir idx_person_firstname
CREATE INDEX idx_person_lastname ON asmenys_indeksavimas(LastName);
CREATE INDEX idx_person_lastname ON asmenys_indeksavimas(FirstName);

-- 1.4 
SHOW INDEX FROM asmenys_indeksavimas;

-- 2
CREATE INDEX idx_person_fullname ON asmenys_indeksavimas(LastName, FirstName);

-- 3 
SELECT * FROM person_emailaddress;
CREATE TABLE adv.pastas as(SELECT * FROM person_emailaddress);

SELECT * FROM pastas;
CREATE UNIQUE INDEX idx_email_adress ON pastas(EmailAddress);
SHOW INDEX FROM pastas;

-- 4
CREATE TABLE adv.Produktu_aprasymas as(
SELECT * FROM production_productdescription);

CREATE TABLE adv.Produktai as(
SELECT * FROM production_productdescription);

CREATE FULLTEXT INDEX idx_fulltext_Description ON Produktai(Description);

-- 5 
-- 5.1
DESCRIBE asmenys_indeksavimas;
DESCRIBE person_person;
SHOW INDEX FROM adv.Asmenys_indeksavimas WHERE Key_name = 'PRIMARY';
-- 5.2
ALTER TABLE asmenys_indeksavimas DROP PRIMARY KEY;

-- 5.3

ALTER TABLE asmenys_indeksavimas
ADD CONSTRAINT pk_business_entity_id PRIMARY KEY (BusinessEntityID);

-- 6
SELECT * FROM asmenys
WHERE LastName ='walters' AND FirstName = 'Rob';

SELECT * FROM asmenys_indeksavimas
WHERE LastName ='walters' AND FirstName = 'Rob';

-- 7
SELECT * FROM Produktai;

SELECT ProductDescriptionID, Description, modifiedDate
FROM Produktai
WHERE Description LIKE '%cross-train%';


-- 7.2 Pratybos

-- 1. Apskaičiuoti kiekvieno kliento išleidžiamą pinigų sumą pamėnesiui, rezultatą pateikiant duomenų
-- persukimo lentelės formatu, kaip kad pateikta žemiau. Naudoti lentelę Sales_SalesOrderHeader.

SELECT CustomerID,
    SUM(CASE WHEN MONTH(OrderDate) = 1 THEN TotalDue ELSE 0 END) AS January,
    SUM(CASE WHEN MONTH(OrderDate) = 2 THEN TotalDue ELSE 0 END) AS February,
    SUM(CASE WHEN MONTH(OrderDate) = 3 THEN TotalDue ELSE 0 END) AS March,
    SUM(CASE WHEN MONTH(OrderDate) = 4 THEN TotalDue ELSE 0 END) AS April,
    SUM(CASE WHEN MONTH(OrderDate) = 5 THEN TotalDue ELSE 0 END) AS May,
    SUM(CASE WHEN MONTH(OrderDate) = 6 THEN TotalDue ELSE 0 END) AS June,
    SUM(CASE WHEN MONTH(OrderDate) = 7 THEN TotalDue ELSE 0 END) AS July,
    SUM(CASE WHEN MONTH(OrderDate) = 8 THEN TotalDue ELSE 0 END) AS August,
    SUM(CASE WHEN MONTH(OrderDate) = 9 THEN TotalDue ELSE 0 END) AS September,
    SUM(CASE WHEN MONTH(OrderDate) = 10 THEN TotalDue ELSE 0 END) AS October,
    SUM(CASE WHEN MONTH(OrderDate) = 11 THEN TotalDue ELSE 0 END) AS November,
    SUM(CASE WHEN MONTH(OrderDate) = 12 THEN TotalDue ELSE 0 END) AS December
FROM Sales_SalesOrderHeader
GROUP BY CustomerID
ORDER BY CustomerID;

-- 2. Apskaičiuoti bendrą kiekvienos teritorijos pardavimų sumą ir pateikti kiekvienos teritorijos 
-- tarpinę sumą bei bendrą pardavimų sumą. Naudoti lentelę Sales_SalesOrderHeader.

SELECT TerritoryID, YEAR(OrderDate) AS Sales_Year, SUM(TotalDue) AS Total_Sales
FROM Sales_SalesOrderHeader
GROUP BY TerritoryID, YEAR(OrderDate)
ORDER BY TerritoryID, Sales_Year;

-- 3. Suskaičiuoti kiekvieno skyriaus vis dar tebedirbančių darbuotojų, suskirstytų pagal lytį, skaičių ir pateikti
-- tarpines sumas pagal skyrių ir bendrą visų skyrių darbuotojų sumą. Naudoti lenteles
-- HumanResources_Employee, humanresources_employeedepartmenthistory ,
-- humanresources_department.

SELECT d.Name, e.Gender, COUNT(*) AS Employee_Count
FROM HumanResources_Employee e
INNER JOIN HumanResources_EmployeeDepartmentHistory edh ON e.BusinessEntityID = edh.BusinessEntityID
INNER JOIN HumanResources_Department d ON edh.DepartmentID = d.DepartmentID
WHERE edh.EndDate IS NULL
GROUP BY d.Name, e.Gender
WITH ROLLUP
ORDER BY d.Name, Employee_Count;

-- 4. Paskaičiuoti kiekvieno vis dar pardavinėjamo produkto gamybos sąnaudas pagal metus, pateikiant tik
-- tarpines sumas pagal produktą ir metus, bendrą sumą tik pagal metus, ir apskritai bendrą sąnaudų sumą.
-- Naudoti lenteles Production_ProductCostHistory, Production_Product.

SELECT p.ProductID, YEAR(pch.StartDate) AS CostYear, SUM(pch.StandardCost) AS TotalCost
FROM Production_ProductCostHistory pch
INNER JOIN Production_Product p ON pch.ProductID = p.ProductID
WHERE p.DiscontinuedDate IS NULL
GROUP BY p.ProductID, p.Name, YEAR(pch.StartDate)
WITH ROLLUP
ORDER BY p.ProductID, Year;