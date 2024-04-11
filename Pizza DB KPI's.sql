--View Entire Data.
SELECT * FROM pizza_sales

-- Calculate Total Revenue.
SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales

-- Calculate Average Order Value.

SELECT SUM(total_price) / COUNT(distinct order_id) AS average_order_value
FROM pizza_sales

-- -- Calculate Total Pizzas Sold.
SELECT SUM(quantity) AS Total_Pizza_Sold FROM pizza_sales

-- Calculate Total Orders.
SELECT COUNT(DISTINCT order_id) AS Total_orders FROM pizza_sales

-- Calculate Average Pizza per Order.
SELECT SUM(quantity) / COUNT(DISTINCT order_id) AS average_pizza_per_Order FROM Pizza_sales

SELECT CAST(SUM(quantity) AS DECIMAL(10,2)) / CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) 
       AS average_pizza_per_Order FROM Pizza_sales

SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
       CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) 
	   AS DECIMAL(10,2)) AS average_pizza_per_Order 
	   FROM Pizza_sales

SELECT * FROM pizza_sales

-- Daily Trend Analysis
SELECT DATENAME(DW,order_date) AS Order_day, COUNT(distinct order_id) AS Total_orders
FROM pizza_sales
GROUP BY DATENAME(DW,order_date)
ORDER BY Total_orders DESC

-- Montly Trend Analysis
SELECT DATENAME(Month,order_date) AS Month_name, Count(distinct order_id) AS Total_orders
FROM pizza_sales
GROUP BY DATENAME(Month,order_date)
ORDER BY Total_orders DESC

--Percentage of Sales by Pizza Category
SELECT pizza_category,SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales) AS PCT_total_Sales
FROM pizza_sales 
GROUP BY pizza_category

SELECT pizza_category,SUM(total_price) AS Total_sales, SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales) AS PCT_total_Sales
FROM pizza_sales 
GROUP BY pizza_category

SELECT pizza_category,SUM(total_price) AS Total_sales, SUM(total_price) * 100 / 
(SELECT SUM(total_price) FROM pizza_sales WHERE MONTH(order_date) = 1) AS PCT_total_Sales
FROM pizza_sales 
WHERE MONTH(order_date) = 1
GROUP BY pizza_category

SELECT pizza_category,SUM(total_price) AS Total_sales, SUM(total_price) * 100 / 
(SELECT SUM(total_price) FROM pizza_sales WHERE DATEPART(QUARTER,order_date) = 1) AS PCT_total_Sales
FROM pizza_sales 
WHERE DATEPART(QUARTER,order_date) = 1
GROUP BY pizza_category

SELECT pizza_size,SUM(total_price) AS Total_sales, SUM(total_price) * 100 / 
(SELECT SUM(total_price) FROM pizza_sales) AS PCT_total_Sales
FROM pizza_sales 
GROUP BY pizza_size
ORDER BY PCT_total_Sales DESC

SELECT pizza_size,SUM(total_price) AS Total_sales, SUM(total_price) * 100 / 
(SELECT SUM(total_price) FROM pizza_sales WHERE DATEPART(QUARTER,order_date) = 1) AS PCT_total_Sales
FROM pizza_sales 
WHERE DATEPART(QUARTER,order_date) = 1
GROUP BY pizza_size
ORDER BY PCT_total_Sales DESC

--Top 5 Sellers by Revenue, Total Quantity and Total Orders
SELECT TOP 5 pizza_name, SUM(total_price) AS Total_revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_revenue DESC

SELECT TOP 5 pizza_name, SUM(quantity) AS Total_quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_quantity DESC

SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_orders DESC

