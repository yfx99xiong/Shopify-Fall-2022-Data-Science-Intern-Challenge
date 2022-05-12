# Shopify Fall 2022 Data Science Intern Challenge
## Question 1:

Given some sample data, write a program to answer the following: [click here to access the required data set](https://docs.google.com/spreadsheets/d/16i38oonuX1y1g7C_UAmiK9GkY7cS-64DfiDMNiR41LM/edit#gid=0)

  On Shopify, we have exactly 100 sneaker shops, and each of these shops sells only one model of shoe. We want to do some analysis of the average order value (AOV). When we look at orders data over a 30 day window, we naively calculate an AOV of $3145.13. Given that we know these shops are selling sneakers, a relatively affordable item, something seems wrong with our analysis. 

##### 1. Think about what could be going wrong with our calculation. Think about a better way to evaluate this data. 

Answer: 
The wrong calculation is caused by taking average vaule of 'order_amount' column. The 'total_items' column also is needed to consider when calculating the overall average of order value.  

```
wrong_AOV = df['order_amount'].mean()
print('The wrong average order value (AOV):', round(wrong_AOV, 2))
The wrong average order value (AOV): 3145.13
```

##### 2. What metric would you report for this dataset?

Answer: 
The sum value of 'order_amount' column and the sum of 'total_items' column since the AOV = (Sum of total order amout)/(Sum of total order value).

```
total_order = df['order_amount'].sum()
total_items = df['total_items'].sum()
```

##### 3. What is its value?

Answer: 
The AOV vaule is 357.92.
(The total number of order amount: 15725640; The total number of item: 43936)

```
AOV = total_order/total_items
```

## Question 2: 

For this question you’ll need to use SQL. [Follow this link](https://www.w3schools.com/SQL/TRYSQL.ASP?FILENAME=TRYSQL_SELECT_ALL) to access the data set required for the challenge. Please use queries to answer the following questions. Paste your queries along with your final numerical answers below.

##### 1. How many orders were shipped by Speedy Express in total?
```
-- Using ShipperName = 'Speedy Express' in Shippers table 
-- to select OrderID in Orders table 
-- then count the OrderID 
	
SELECT COUNT(DISTINCT OrderID) AS CNT FROM Orders AS o
JOIN Shippers AS s 
ON o.ShipperID = s.ShipperID 
WHERE ShipperName = 'Speedy Express';
```
Answer:\
CNT\
54


##### 2. What is the last name of the employee with the most orders?
```
-- Merge Employee table and Order table using EmployeeID
-- and count OrderID for each EmployeeID to get the number of order for each employee
-- then get the largest number of order count using order by and limit 

SELECT LastName FROM Orders AS o
JOIN Employees AS e
ON o.EmployeeID = e.EmployeeID 
GROUP BY o.EmployeeID
ORDER BY COUNT(DISTINCT o.OrderID) DESC
LIMIT 1;
```
Answer:\
LastName\
Peacock

##### 3. What product was ordered the most by customers in Germany?
```
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
```
Answer:\
MostProduct\
Boston Crab Meat

