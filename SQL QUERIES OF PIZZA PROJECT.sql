create database Pizza_DB;  
SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales;

# 2. Average Order Value
SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_Value FROM pizza_sales;

#3. Total Pizzas Sold
SELECT SUM(quantity) AS Total_pizza_sold FROM pizza_sales;

# 4. Total Orders
SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales;

#5. Average Pizzas Per Order
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS Avg_Pizzas_per_order
FROM pizza_sales;  

SELECT DAYNAME(order_date) AS order_day, 
       COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
WHERE order_date IS NOT NULL
  AND STR_TO_DATE(order_date, '%Y-%m-%d') IS NOT NULL
GROUP BY DAYNAME(order_date); 

select * from pizza_sales; 

SELECT DAYNAME(STR_TO_DATE(order_date, '%d-%m-%Y')) AS order_day, 
       COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
WHERE order_date IS NOT NULL
  AND STR_TO_DATE(order_date, '%d-%m-%Y') IS NOT NULL
GROUP BY DAYNAME(STR_TO_DATE(order_date, '%d-%m-%Y'));  

# C. Hourly Trend for Orders 

SELECT HOUR(order_time) AS order_hours, 
       COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY HOUR(order_time)
ORDER BY HOUR(order_time); 

SELECT * FROM PIZZA_SALES; 

# D. % of Sales by Pizza Category
SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_category; 

select * from pizza_sales;  

# E. % of Sales by Pizza Size

select pizza_size, cast(sum(total_price) as decimal(10,2)) as total_sales,
cast(sum(total_price)*100/ (select sum(total_price) from pizza_sales) as decimal(10,2)) as pct 
from pizza_sales 
group by pizza_size 
order by pct desc;   


# F. Total Pizzas Sold by Pizza Category 

SELECT * FROM pizza_sales; 

SELECT pizza_category, 
SUM(quantity) as Total_pizzas 
from pizza_sales 
group by pizza_category
order by Total_pizzas desc; 

# G. Top 5 Best Sellers by Total Pizzas Sold 

SELECT * FROM pizza_sales; 

SELECT  pizza_name, 
SUM(quantity)as Total_pizzas_sold
from pizza_sales 
group by pizza_name 
order by SUM(quantity) desc 
limit 5 ; 


# H. Bottom 5 Best Sellers by Total Pizzas Sold 

SELECT * FROM PIZZA_SALES; 

SELECT pizza_name, 
SUM(quantity) as Total_pizzas_sold
from pizza_sales 
group by pizza_name 
order by SUM(quantity) asc 
limit 5;










