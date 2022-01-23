USE BUDT703_DB_Student_207

BEGIN TRANSACTION;
-- What are the id, description and prize of product, that is higher than the average price, and how much higher?
SELECT p.productID, p.productDescription, p.productStandardPrice,
       p.productStandardPrice-a.average AS 'Price Difference'
FROM Product_T p, (SELECT AVG(productStandardPrice) AS average FROM Product_T) a
WHERE p.productStandardPrice> a.average
ORDER BY p.productDescription

-- Which city has either an employee or a customer
SELECT e.employeeCity FROM Employee_T e
UNION
SELECT c.CustomerCity FROM Customer_T c

-- Which city has either an employee and a customer
SELECT e.employeeCity FROM Employee_T e
INTERSECT
SELECT c.CustomerCity FROM Customer_T c

-- Which city has an employee but no customer
SELECT e.employeeCity FROM Employee_T e
EXCEPT
SELECT c.CustomerCity FROM Customer_T c