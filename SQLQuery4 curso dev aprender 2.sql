SELECT	COUNT (title)
FROM person.person; 

SELECT	COUNT (DISTINCT title)
FROM person.person; 

SELECT	COUNT (*)
FROM Production.Product; 

SELECT COUNT (Size)
FROM Production.Product; 

SELECT COUNT (DISTINCT Size)
FROM Production.Product;

SELECT TOP 10 *
FROM Production.Product;

SELECT *
FROM person.person
ORDER BY FirstName desc

SELECT TOP 10 ProductID, ListPrice
FROM Production.Product
ORDER BY ListPrice desc

SELECT TOP 4 Name, ProductNumber
FROM Production.Product
ORDER BY ProductID asc


SELECT *
FROM HumanResources.Employee
WHERE HireDate BETWEEN '2009/01/01' AND '2010/01/01'
ORDER BY HireDate

SELECT *
FROM Person.Person
WHERE businessEntityID IN (2,7,13)

SELECT *
FROM Person.Person
WHERE FirstName LIKE 'ovi%'

SELECT COUNT (ListPrice)
FROM Production.Product
WHERE ListPrice > '1500' 

SELECT COUNT (LastName)
FROM Person.Person
WHERE LastName LIKE 'P%'

SELECT DISTINCT City 
FROM Person.Address

SELECT DISTINCT COUNT(City) 
FROM Person.Address

SELECT COUNT (*)
FROM Production.Product
WHERE Color = 'red' AND ListPrice BETWEEN 500 AND 10000

SELECT COUNT (*)
FROM Production.Product
WHERE Name like '%road%'

SELECT top 10 SUM (linetotal) AS 'SOMA'
FROM Sales.SalesOrderDetail

SELECT top 10 MIN (linetotal) 
FROM Sales.SalesOrderDetail

SELECT SpecialOfferID, SUM (UnitPrice) AS 'soma' 
FROM Sales.SalesOrderDetail
GROUP BY SpecialOfferID

SELECT ProductID, COUNT(ProductID) AS 'CONTAGEM'
FROM Sales.SalesOrderDetail
GROUP BY ProductID

SELECT FirstName, COUNT(FirstName)
FROM Person.Person
GROUP BY FirstName

SELECT color, AVG(ListPrice) as 'média de preço'
FROM Production.Product
where Color = 'silver'
GROUP BY Color

SELECT MiddleName, COUNT(MiddleName) as 'quantidade de pessoas'
FROM Person.Person
GROUP BY MiddleName


SELECT ProductID, avg(OrderQty) AS 'média'
FROM Sales.SalesOrderDetail
GROUP BY ProductID

SELECT TOP 10 ProductID, SUm (LineTotal)
FROM Sales.SalesOrderDetail
GROUP BY ProductID 
ORDER BY SUm (LineTotal) DESC


SELECT ProductID, COUNT (ProductID) as 'contagem', AVG (orderqty) as 'média'
FROM Production.WorkOrder
GROUP BY ProductID

SELECT FirstName, count (FirstName) as "quantidade"
FROM person.Person
GROUP BY FirstName
HAVING count (firstname) > 10

SELECT ProductID, SUm (LineTotal) as "TOTAL" 
FROM Sales.SalesOrderDetail
GROUP BY ProductID 
HAVING sum (linetotal) between 162000 and 500000

SELECT FirstName, count (FirstName) as "quantidade"
FROM person.Person
WHERE Title = 'MR.'
GROUP BY FirstName
HAVING count (firstname) > 10

SELECT StateProvinceID, COUNT (stateprovinceID) as 'quantidade' 
FROM Person.Address
GROUP BY StateProvinceID
HAVING StateProvinceID > 1000

select top 10 AVG (ListPrice) AS 'preço médio' 
from Production.Product

-- Renomear
SELECT FirstName as "Nome", LastName AS "Sobrenome"
FROM person.Person

SELECT top 10 ProductNumber AS 'Número do produto' 
from Production.Product

SELECT UnitPrice AS "Preço unitário" 
FROM Sales.SalesOrderDetail

SELECT p.BusinessEntityID, p.FirstName, p.LastName, pe.EmailAddress
FROM Person.Person AS P
INNER JOIN Person.EmailAddress AS PE ON p.BusinessEntityID = pe.BusinessEntityID

SELECT pr.ListPrice, pr.Name, pc.Name
FROM Production.Product AS Pr
INNER JOIN Production.ProductSubcategory AS PC ON pc.ProductSubcategoryID = pr.ProductSubcategoryID

SELECT PPP.BusinessEntityID, PPT.Name, PPT.PhoneNumberTypeID, PPP.PhoneNumber
FROM Person.PhoneNumberType AS PPT
INNER JOIN Person.PersonPhone AS PPP ON PPT.PhoneNumberTypeID = PPP.PhoneNumberTypeID

SELECT pa.AddressID, pa.City, sp.StateProvinceID, sp.Name
FROM Person.StateProvince AS SP
INNER JOIN Person.Address AS PA ON sp.StateProvinceID = pa.StateProvinceID

-- Quantas pessoas tem um cartão de crédito registrado 
SELECT *
FROM Person.person AS PP
INNER JOIN Sales.PersonCreditCard AS PC
ON PP.BusinessEntityID = PC.BusinessEntityID

-- Pessoas que não tem um crtão de crédito registrado 
SELECT *
FROM Person.person AS PP
LEFT JOIN Sales.PersonCreditCard AS PC
ON PP.BusinessEntityID = PC.BusinessEntityID
WHERE pc.BusinessEntityID IS NULL

SELECT SalesOrderID, DATEPART (month, OrderDate) AS Mês
FROM Sales.SalesOrderHeader

SELECT SalesOrderID, DATEPART (DAY, OrderDate) AS Dia
FROM Sales.SalesOrderHeader

-- média do valor devido por mês
SELECT AVG(TotalDue) AS média, DATEPART (month, OrderDate) AS Mês
FROM Sales.SalesOrderHeader
GROUP BY datepart (month, Orderdate)
ORDER BY Mês

-- média do valor devido por ano
SELECT AVG(TotalDue) AS média, DATEPART (year, OrderDate) AS ano
FROM Sales.SalesOrderHeader
GROUP BY datepart (YEAR, Orderdate)
ORDER BY ano

-- média do valor devido por dia
SELECT AVG(TotalDue) AS média, DATEPART (DAY, OrderDate) AS dia
FROM Sales.SalesOrderHeader
GROUP BY datepart (DAY, Orderdate)
ORDER BY dia

-- Gênero das Pessoas demitidas ordenado por ano
SELECT ed.BusinessEntityID, DATEPART(year,ed.EndDate) AS ano, E.Gender
FROM HumanResources.EmployeeDepartmentHistory AS ED
INNER JOIN HumanResources.Employee as E
ON E.BusinessEntityID = ed.BusinessEntityID
WHERE ED.EndDate LIKE '20%'
order by ano

-- concatenar dados de nome e sobrenome
SELECT CONCAT (firstName, ' ', LastName) AS 'Nome completo'
FROM Person.Person

-- PRIMEIRO NOME EM MAIUSCULO
SELECT UPPER (firstName)
FROM Person.Person

SELECT UnitPrice + LineTotal
FROM Sales.SalesOrderDetail

-- todos produtos cadastrados que têm preço de venda acima da média
SELECT *
FROM Production.Product
WHERE ListPrice > (select AVG (ListPrice) FROM Production.Product)

-- nome dos funcionários que têm o cargo de 'Dsigner Engineer'
SELECT FirstName
FROM Person.Person
WHERE BusinessEntityID IN 
(SELECT BusinessEntityID FROM HumanResources.Employee WHERE JobTitle = 'design engineer')

-- Todos os endereços que estão no estado de Alberta
SELECT * 
FROM Person.Address
where StateProvinceID
IN (select StateProvinceID FROM Person.StateProvince where Name = 'ALBERTA') 



