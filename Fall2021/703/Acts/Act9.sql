use BUDT703_DB_Student_207
--How many employees in each city?
SELECT e.employeeCity, count(e.employeeID) AS 'Number Of Employees'
FROM Employee_T e
GROUP BY e.employeeCity

--What is the name AND age at hiring for each employee?
SELECT e.employeeName, DATEDIFF (year,e.employeeBirthDate,e.employeeDateHired) AS 'Age Hired'
FROM Employee_T e
WHERE DATEDIFF (year,e.employeeBirthDate,e.employeeDateHired) IS NOT NULL

--What are the employee skill at each center?
SELECT c.workCenterLocation, s.skillDescription , count(distinct e.employeeID) AS 'Number of Employees'
FROM Skill_T s, EmployeeSkills_T k, Employee_T e, WorksIn_T w, WorkCenter_T c
WHERE k.skillID = s.skillID
  AND k.employeeID=e.employeeID
  AND e.employeeID = w.employeeID
  AND w.workCenterID = c.workCenterID
GROUP BY w.workCenterID, c.workCenterLocation, s.skillID,s.skillDescription

--How many employees work on each product produced in each work center?
SELECT c.workCenterLocation, p.productDescription, count(distinct e.employeeId) AS 'Number Of Employee'
FROM Product_T p, ProducedIn_T i, WorkCenter_T c, WorksIn_T w, Employee_T e
WHERE p.productID = i.productID
  AND c.workCenterID = i.workCenterID
  AND c.workCenterID = w.workCenterID
  AND w.employeeID = e.employeeID
GROUP BY c.workCenterID, c.workCenterLocation, p.productID, p.productDescription