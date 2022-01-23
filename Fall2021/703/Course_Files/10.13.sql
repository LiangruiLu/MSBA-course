USE BUDT703_DB_Student_207

BEGIN TRANSACTION;

-- What are the description and price for each product?

SELECT p.productID, p.productDescription,p.productStandardPrice 
FROM Product_T p 

-- What are products with  price <=200?

SELECT p.productID, p.productDescription,p.productStandardPrice 
FROM Product_T p 
WHERE p.productStandardPrice<= 200

-- What are products with price between 200 and 500?

SELECT p.productID, p.productDescription,p.productStandardPrice 
FROM Product_T p 
WHERE p.productStandardPrice >= 200 AND p.productStandardPrice<= 500

-- What are products with price less than 200 or greater than 500?

SELECT p.productID, p.productDescription,p.productStandardPrice 
FROM Product_T p 
WHERE p.productStandardPrice NOT BETWEEN 200 AND 500

-- What are all desks and tables with price more than 300?

SELECT p.productID, p.productDescription,p.productStandardPrice 
FROM Product_T p 
WHERE (p.productDescription LIKE '%Desk%' OR p.productDescription LIKE '%Table%')
	AND p.productStandardPrice > 300

-- What are the customers in Florida, TX, CA and HI?
SELECT c.customerID,c.customerName,c.customerState 
FROM Customer_T c 
WHERE c.customerState IN ('FL', 'TX', 'CA', 'HI')
ORDER BY c.customerState, c.customerName

SELECT c.customerName,c.customerCity,c.customerState
FROM Customer_T c
WHERE c.customerState IN ('FL', 'TX', 'CA', 'HI')
ORDER BY c.customerState, c.customerName

-- How many customers in each state of florida, TX, CA and HI?
SELECT c.customerState, COUNT(c.customerID) AS 'Number of Customers'
FROM Customer_T c 
WHERE c.customerState IN ('FL', 'TX', 'CA', 'HI')
GROUP BY c.customerState
ORDER BY 'Number of Customers' DESC

SELECT c.customerState, COUNT(c.customerID) AS 'Number of Customers'
FROM Customer_T c
GROUP BY c.customerState
HAVING COUNT(c.customerID) > 1
ORDER BY 'Number of Customers' DESC

-- What are expensive stuff, i.e., the product with price larger than $300?
SELECT p.ProductID, p.productDescription, p.productStandardPrice
FROM Product_T p
WHERE p.productStandardPrice > 300

GO

CREATE VIEW ExpensiveStuff AS
    SELECT p.ProductID, p.productDescription, p.productStandardPrice
    FROM Product_T p
    WHERE p.productStandardPrice > 300
WITH CHECK OPTION

GO

INSERT INTO ExpensiveStuff VALUES
    (99, 'Captain''s Desk', 599),
    --(98, 'Student''s Desk', 99),
    (97, 'Dining Set', 999)
    --(96, 'Children Table', 49)


GO

SELECT customerName, customerAddress FROM Customer_T
WHERE customerID = (
    SELECT customerID
    FROM Order_T
    WHERE orderID = 1008
    )

SELECT customerName FROM Customer_T
WHERE customerID IN (
    SELECT customerID
    FROM Order_T
    )

/*
ALTER TABLE Customer_T ADD numOfCusInState as (SELECT COUNT(c.customerID) FROM Customer_T c
GROUP BY c.customerState)
SELECT * FROM Customer_T

UPDATE Customer_T
SET numOfCusInState =
(SELECT COUNT(c.customerID) FROM Customer_T c
GROUP BY c.customerState)

ALTER TABLE Customer_T DROP COLUMN numOfCusInState
*/

COMMIT;
