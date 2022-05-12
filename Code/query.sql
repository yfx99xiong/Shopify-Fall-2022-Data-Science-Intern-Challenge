
-- 	Question: How many orders were shipped by Speedy Express in total?

-- Using ShipperName = 'Speedy Express' in Shippers table 
-- to select OrderID in Orders table 
-- then count the OrderID 
	
SELECT COUNT(DISTINCT OrderID) AS CNT FROM Orders AS o
JOIN Shippers AS s 
ON o.ShipperID = s.ShipperID 
WHERE ShipperName = 'Speedy Express';

-- Answer:
-- CNT
-- 54

-- Question: What is the last name of the employee with the most orders?

-- Merge Employee table and Order table using EmployeeID
-- and count OrderID for each EmployeeID to get the number of order for each employee
-- then get the largest number of order count using order by and limit 

SELECT LastName FROM Orders AS o
JOIN Employees AS e
ON o.EmployeeID = e.EmployeeID 
GROUP BY o.EmployeeID
ORDER BY COUNT(DISTINCT o.OrderID) DESC
LIMIT 1;

-- Answer:
-- LastName
-- Peacock

-- Question: What product was ordered the most by customers in Germany? 

-- select Germany from Customer table and get CustomerID
-- join Order table using CustomerID,
-- then select OrderID
-- join OrderID on OrderDetails table 
-- then select ProductID group by and sum up each group quality
-- using ProductID with the largest sum 
-- join on Products table to get ProductName

SELECT ProductName AS MostProduct FROM Products AS pt
JOIN OrderDetails AS od 
ON pt.ProductID = od.ProductID
WHERE OrderID IN (
                    SELECT OrderID FROM Orders AS o
                    JOIN Customers AS c
                    ON o.CustomerID  = c.CustomerID
                    WHERE Country = 'Germany')
GROUP BY pt.ProductID 
ORDER BY SUM(Quantity) DESC
LIMIT 1;

-- Answer:
-- MostProduct
-- Boston Crab Meat






