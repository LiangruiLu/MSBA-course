USE BUDT703_DB_Student_207

BEGIN TRANSACTION;

-- What are customer ids of all orders?
SELECT DISTINCT o.customerID
FROM Order_T o

-- What is the ids of customers, who placed order before?
SELECT DISTINCT c.customerID, c.customerName
FROM Customer_T c, Order_T o
WHERE c.customerID = o.customerID
ORDER BY c.customerID

-- What is the ids of customers, who placed order before?
SELECT DISTINCT c.customerID, c.customerName
FROM Customer_T c JOIN Order_T o
    ON c.customerID = o.customerID
ORDER BY c.customerID

-- What are the id and name of customers, include the order id if exists?
SELECT c.customerID, c.customerName, orderID
FROM Customer_T c LEFT OUTER JOIN Order_T o
    ON c.customerID = o.customerID
ORDER BY c.customerID

-- What are the id and name of the employee and supervisor?
SELECT e.employeeID, e.employeeName, s.employeeName AS 'Supervisor Name'
FROM Employee_T e, Employee_T s
WHERE e.employeeSupervisor = s.employeeID
ORDER BY e.employeeID

SELECT e.employeeID, e.employeeName, s.employeeName AS SupervisorName
FROM Employee_T e, Employee_T s
WHERE e.employeeSupervisor = s.employeeID

-- What are customer ids of all orders? (Uncorrelated sub query)
SELECT c.customerID, c.customerName
FROM Customer_T c
WHERE c.customerID IN
    (SELECT customerID FROM Order_T)

-- What are customer ids of all orders? (Correlated sub query)
SELECT c.customerID, c.customerName
FROM Customer_T c
WHERE EXISTS(
    SELECT *
    FROM Order_T o
    WHERE c.customerID = o.customerID)

-- What are the id and name of product, which price is higher than the average among all customer?
SELECT p.productID, p.productDescription, p.productStandardPrice
FROM Product_T p
WHERE p.productStandardPrice >
      (SELECT AVG(productStandardPrice) FROM Product_T)
ORDER BY p.productStandardPrice DESC

COMMIT;