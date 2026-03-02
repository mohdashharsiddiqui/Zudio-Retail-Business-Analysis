create database zudio_sales;
use zudio_sales;

/* SHOW COLUMNS FROM zudio_sales_data; */

select * from zudio_sales_data limit 10;

/* 1. Revenue & Profitability Insights */
## 1. Which state generate highest revenue?
SELECT state,
SUM(price*quantity) AS revenue
FROM zudio_sales_data
GROUP BY state
ORDER BY revenue DESC
LIMIT 1;

## 2. Which state generate highest profit?
SELECT state,
SUM('Sales Profit') AS net_profit
FROM zudio_sales_data
GROUP BY state
ORDER BY net_profit DESC
LIMIT 1;

## 3. Are high-revenue also high-profit states?
SELECT state,
SUM(price*quantity) AS revenue,
SUM(`Sales Profit`) AS net_profit
FROM zudio_sales_data
GROUP BY state
ORDER BY revenue DESC;

## 4. Which cities are underperforming in profit despite good sales?
SELECT city,
SUM(price*quantity) AS revenue,
SUM(`Sales Profit`) AS net_profit
FROM zudio_sales_data
GROUP BY city
ORDER BY net_profit ASC;

## 5. Overall profit margin
SELECT ROUND((SUM('Sales Profit')/SUM(price*quantity))*100,2) AS profit_pct
FROM zudio_sales_data;

## 6 Profit margin by state
SELECT state,
ROUND((SUM('Sales Profit')/SUM(price*quantity))*100,2) AS profit_pct
FROM zudio_sales_data
GROUP BY state;

## 7 Profit margin by category
SELECT category,
ROUND((SUM('Sales Profit')/SUM(price*quantity))*100,2) AS profit_pct
FROM zudio_sales_data
GROUP BY category;

## 8 Highest profit per unit clothing
SELECT 'Clothing Type',
ROUND(SUM('Sales Profit')/SUM(quantity),2) AS profit_per_unit
FROM zudio_sales_data
GROUP BY 'Clothing Type'
ORDER BY profit_per_unit DESC;

## 9 High volume but low profit items
SELECT 'Clothing Type',
SUM(quantity) AS qty,
SUM('Sales Profit') AS net_profit
FROM zudio_sales_data
GROUP BY 'Clothing Type'
ORDER BY qty DESC;

## 10. Top 10 profitable stores
SELECT 'Store_Number',
SUM('Sales Profit') AS net_profit
FROM zudio_sales_data
GROUP BY 'Store Number'
ORDER BY net_profit DESC
LIMIT 10;

/* 2. Store Performance Analysis */

SELECT 'Store Type',
SUM(price*quantity) AS revenue,
SUM('Sales Profit') AS net_profit
FROM zudio_sales_data
GROUP BY 'Store Type';

SELECT 'Store Type',
ROUND(AVG('Sales Profit'),2) AS net_profit
FROM zudio_sales_data
GROUP BY 'Store Type';

SELECT `Store Number`,
ROUND(SUM(Price * Quantity) / 
      MAX(`Selling Area Size (sq ft)`), 2) AS revenue_per_sqft
FROM zudio_sales_data
GROUP BY `Store Number`
ORDER BY revenue_per_sqft DESC
LIMIT 1;

SELECT `Selling Area Size (sq ft)`,
SUM(Price * Quantity) AS revenue
FROM zudio_sales_data
GROUP BY `Selling Area Size (sq ft)`;

SELECT `Staff Count`,
SUM(Price * Quantity) AS revenue
FROM zudio_sales_data
GROUP BY `Staff Count`;

SELECT `Parking Availability`,
SUM(Price * Quantity) AS revenue
FROM zudio_sales_data
GROUP BY `Parking Availability`;

SELECT `Security Features`,
SUM(Price * Quantity) AS revenue
FROM zudio_sales_data
GROUP BY `Security Features`;

SELECT `Store Manager`,
SUM(`Sales Profit`) AS net_profit
FROM zudio_sales_data
GROUP BY `Store Manager`
ORDER BY net_profit DESC;

SELECT `Store Number`,
SUM(`Sales Profit`) AS net_profit
FROM zudio_sales_data
GROUP BY `Store Number`
HAVING net_profit < 0;

/* 3. Product & Category Insights */

SELECT Category,
SUM(Price * Quantity) AS revenue
FROM zudio_sales_data
GROUP BY Category
ORDER BY revenue DESC
LIMIT 1;

SELECT Category,
SUM(Quantity) AS qty
FROM zudio_sales_data
GROUP BY Category
ORDER BY qty DESC
LIMIT 1;

SELECT Category,
SUM(`Sales Profit`) AS net_profit
FROM zudio_sales_data
GROUP BY Category
ORDER BY net_profit DESC
LIMIT 1;

SELECT `Product ID`,
SUM(Quantity) AS most_sold
FROM zudio_sales_data
GROUP BY `Product ID`
ORDER BY most_sold DESC
LIMIT 10;

SELECT `Clothing Type`,
SUM(Price * Quantity) AS sales,
SUM(`Sales Profit`) AS net_profit
FROM zudio_sales_data
GROUP BY `Clothing Type`
ORDER BY sales ASC;

SELECT Category,
(SUM(Price * Quantity) /
 (SELECT SUM(Price * Quantity)
  FROM zudio_sales_data)) * 100 AS rev_share
FROM zudio_sales_data
GROUP BY Category;

/* 4. Customer Insights */

SELECT `Customer ID`,
`Customer Name`,
SUM(Price * Quantity) AS spend
FROM zudio_sales_data
GROUP BY `Customer ID`, `Customer Name`
ORDER BY spend DESC
LIMIT 10;

SELECT COUNT(*) AS repeaters
FROM (
    SELECT `Customer ID`
    FROM zudio_sales_data
    GROUP BY `Customer ID`
    HAVING COUNT(`Order ID`) > 1
) r;

SELECT AVG(cust_total) AS avg_revenue
FROM (
    SELECT `Customer ID`,
    SUM(Price * Quantity) AS cust_total
    FROM zudio_sales_data
    GROUP BY `Customer ID`
) t;

SELECT `Customer ID`,
COUNT(DISTINCT `Order ID`) AS freq
FROM zudio_sales_data
GROUP BY `Customer ID`
ORDER BY freq DESC;

/* 5. Time Based Insights */

SELECT MONTH(`Order Date`) AS month,
SUM(Price * Quantity) AS monthly_revenue
FROM zudio_sales_data
GROUP BY MONTH(`Order Date`)
ORDER BY month;

SELECT MONTH(`Order Date`) AS month,
SUM(`Sales Profit`) AS monthly_profit
FROM zudio_sales_data
GROUP BY MONTH(`Order Date`)
ORDER BY month;

SELECT MONTH(`Order Date`) AS month,
SUM(Price * Quantity) AS revenue
FROM zudio_sales_data
GROUP BY MONTH(`Order Date`)
ORDER BY revenue DESC
LIMIT 1;

/* 6. Operational Efficiency */

SELECT `Store Number`,
SUM(Price * Quantity) / MAX(`Staff Count`) AS revenue_per_staff
FROM zudio_sales_data
GROUP BY `Store Number`
ORDER BY revenue_per_staff DESC;

SELECT `Store Number`,
SUM(`Sales Profit`) / MAX(`Selling Area Size (sq ft)`) AS profit_per_sqft
FROM zudio_sales_data
GROUP BY `Store Number`
ORDER BY profit_per_sqft DESC;

SELECT 
SUM(Price * Quantity) / COUNT(DISTINCT `Order ID`) AS rev_per_order
FROM zudio_sales_data;

SELECT 
SUM(`Sales Profit`) / COUNT(DISTINCT `Order ID`) AS profit_per_order
FROM zudio_sales_data;

/* 7. Strategic Executive Insights */

WITH store_profit AS (
    SELECT `Store Number`,
           SUM(`Sales Profit`) AS profits
    FROM zudio_sales_data
    GROUP BY `Store Number`
),
ranked_stores AS (
    SELECT *,
           NTILE(10) OVER(ORDER BY profits ASC) AS profit_bucket
    FROM store_profit
)
SELECT SUM(profits) AS bottom10_pct_profit
FROM ranked_stores
WHERE profit_bucket = 1;

SELECT State,
SUM(`Sales Profit`) AS profits
FROM zudio_sales_data
GROUP BY State
ORDER BY profits DESC
LIMIT 3;

SELECT Category,
SUM(Price * Quantity) AS revenue,
(SUM(`Sales Profit`) / SUM(Price * Quantity)) * 100 AS margin
FROM zudio_sales_data
GROUP BY Category
ORDER BY margin DESC;

SELECT State,
Category,
SUM(`Sales Profit`) AS profits
FROM zudio_sales_data
GROUP BY State, Category
ORDER BY profits DESC;