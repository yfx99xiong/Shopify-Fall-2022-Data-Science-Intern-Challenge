# Shopify Fall 2022 Data Science Intern Challenge
## Question 1:

Given some sample data, write a program to answer the following: [click here to access the required data set](https://docs.google.com/spreadsheets/d/16i38oonuX1y1g7C_UAmiK9GkY7cS-64DfiDMNiR41LM/edit#gid=0)

  On Shopify, we have exactly 100 sneaker shops, and each of these shops sells only one model of shoe. We want to do some analysis of the average order value (AOV). When we look at orders data over a 30 day window, we naively calculate an AOV of $3145.13. Given that we know these shops are selling sneakers, a relatively affordable item, something seems wrong with our analysis. 

##### 1. Think about what could be going wrong with our calculation. Think about a better way to evaluate this data. 

Answer: 
The wrong calculation is caused by taking average vaule of 'order_amount' column. The 'total_items' column also is needed to consider when calculating the overall average of order value.  

##### 2. What metric would you report for this dataset?

Answer: 
The sum value of 'order_amount' column and the sum of 'total_items' column since the AOV = (Sum of total order amout)/(Sum of total order value).

##### 3. What is its value?

Answer: 
The AOV vaule is 357.92.
(The total number of order amount: 15725640; The total number of item: 43936)

## Question 2: 

For this question you’ll need to use SQL. [Follow this link](https://www.w3schools.com/SQL/TRYSQL.ASP?FILENAME=TRYSQL_SELECT_ALL) to access the data set required for the challenge. Please use queries to answer the following questions. Paste your queries along with your final numerical answers below.

##### 1. How many orders were shipped by Speedy Express in total?

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


##### 2. What is the last name of the employee with the most orders?

Answer: Peacock

##### 3. What product was ordered the most by customers in Germany?

Answer: Boston Crab Meat

