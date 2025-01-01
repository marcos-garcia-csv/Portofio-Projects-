USE portfolioproject;

#Basic Data Retrieval

#Retrieve all sales records
SELECT 
	* 
FROM 
	superstore_sales;

#Selecting specific column
SELECT 
	Order_ID,Product_Name, Sales 
FROM 
	superstore_sales;

#Filtering Data

#Filter sales by region
SELECT 
	* 
FROM 
	superstore_sales 
WHERE 
	Region = 'East';

#Filter sales by Year and Month #
SELECT 
	* 
FROM 
	superstore_sales 
WHERE 
	year(order_date) 
BETWEEN 2015 AND 2017 
	AND 
month(order_date) 
	BETWEEN 1 AND 3;

#Sorting Data

#Ordering products by Sales
SELECT 
	Product_Name,
	SUM(Sales) as Total_Sales 
FROM 
	superstore_sales 
GROUP BY 
	Product_Name 
ORDER BY 
	Total_Sales DESC;

#Aggregation

#Calculating total sales
SELECT 
	SUM(sales) as Total_Sales 
FROM 
	superstore_sales;

#Finding average, and total sales
SELECT 
	ROUND(AVG(Sales),2) as Avg_Sales,
    SUM(Sales) as Total_Sales 
FROM
	superstore_sales;

#Grouping Data

#Group by category
SELECT 
	Category,
	SUM(sales) as Total_Sales 
FROM 
	superstore_sales 
GROUP BY 
	Category 
ORDER BY 
	Total_Sales 
DESC;

#Identifying the best-performing Region
SELECT 
	Region,
	SUM(Sales) as Total_Sales
FROM 
	superstore_sales 
GROUP BY
	Region 
ORDER BY 
	Total_Sales 
DESC LIMIT 1;

#Filtering with Aggregates

#Finding high Sales
SELECT 
	* 
FROM 
	superstore_sales 
WHERE 
	Sales >= 1000;

#Identifying the top 10 customers by average Sales
SELECT 
    Customer_Name, 
    ROUND(AVG(Sales),2) AS AVG_Sales
FROM 
    superstore_sales
GROUP BY 
    Customer_Name
HAVING 
    AVG(Sales) BETWEEN 500 AND 700
ORDER BY
	AVG(Sales) DESC
LIMIT 
	10;

#Case Statements

#Categorizing State Sales
SELECT
	City,
    SUM(Sales) as Total_Sales,
	CASE
		WHEN SUM(Sales) >= 50000 THEN "High Sales"
		WHEN SUM(Sales) BETWEEN 20000 AND 49999 THEN "Medium Sales"
		ELSE "Low Sales"
	END AS Sales_Category
FROM
	superstore_sales
GROUP BY
	City;

#Showing Sales by Year, and Quarter
SELECT
    SUM(Sales) AS Total_Sales,
    CASE
        WHEN MONTH(Order_Date) >= 10 THEN CONCAT(YEAR(Order_Date), " Q4")
        WHEN MONTH(Order_Date) >= 7 THEN CONCAT(YEAR(Order_Date), " Q3")
        WHEN MONTH(Order_Date) >= 4 THEN CONCAT(YEAR(Order_Date), " Q2")
        ELSE CONCAT(YEAR(Order_Date), " Q1")
    END AS Quarter
FROM
    superstore_sales
GROUP BY 
     Quarter
ORDER BY 
    Total_Sales DESC;


	





