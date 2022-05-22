SELECT *
FROM person.PERSON;

SELECT title
FROM person.person; 


SELECT Name
FROM production.Product
WHERE Weight > 500 AND Weight <= 700

SELECT *
FROM HumanResources.Employee
WHERE MaritalStatus = 'M' AND SalariedFlag = 1

SELECT *
FROM person.Person 
WHERE FirstName = 'Peter' AND LastName = 'krebs'

SELECT *
FROM person.EmailAddress 
WHERE BusinessEntityID = '26'
