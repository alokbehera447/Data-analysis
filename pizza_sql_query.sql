
USE Pizza_db;
GO

select * from pizza_sales;

select pizza_category,count(pizza_category) as count from pizza_sales
group by pizza_category
ORDER BY count DESC;

select pizza_name_id,count(pizza_name_id) as num from pizza_sales
group by pizza_name_id 
ORDER BY num DESC;

KPI:
Q1:
SELECT SUM(total_price) as Total_Revenue FROM pizza_sales; 

Q2:
SELECT SUM(total_price)/COUNT(DISTINCT order_id) as Avg_Order_Value FROM pizza_sales;

Q3:
SELECT SUM(quantity) AS total_pizza from pizza_sales;

Q4:
SELECT COUNT(DISTINCT order_id) AS Total_Order from pizza_sales;

Q5:
SELECT CAST(CAST(SUM(quantity) AS DECIMAL)/
CAST (COUNT(DISTINCT order_id) AS DECIMAL) AS DECIMAL(10,2)) AS Avg_Pizzas_Per_order from pizza_sales;


SELECT DATENAME(DW, order_date),
COUNT(DISTINCT(order_id)) from pizza_sales
GROUP BY DATENAME(DW, order_date) 
ORDER BY CASE DATENAME(DW, order_date)
	WHEN 'Monday' THEN 1
	WHEN 'Tuesday' THEN 2
	WHEN 'Wednesday' THEN 3
	WHEN 'Thursday' THEN 4
	WHEN 'Friday' THEN 5
	WHEN 'Saturday' THEN 6
	WHEN 'Sunday' THEN 7
	END;

SELECT DATENAME(MONTH, order_date) AS Month,
COUNT(DISTINCT(order_id)) AS Orders from pizza_sales
GROUP BY DATENAME(MONTH, order_date)
ORDER BY CASE DATENAME(MONTH, order_date)
	WHEN 'January' THEN 1
	WHEN 'February' THEN 2
	WHEN 'March' THEN 3
	WHEN 'April' THEN 4
	WHEN 'May' THEN 5
	WHEN 'June' THEN 6
	WHEN 'July' THEN 7
	WHEN 'August' THEN 8
	WHEN 'September' THEN 9
	WHEN 'October' THEN 10
	WHEN 'November' THEN 11
	WHEN 'December' THEN 12
	END;

select pizza_category, SUM(total_price) As Total_sale_price, SUM(total_price)*100/ (SELECT SUM(total_price) FROM pizza_sales WHERE DAY(order_date)=1) AS Ratio from pizza_sales
WHERE DAY(order_date)=1
group by pizza_category;


select pizza_size, CAST(SUM(total_price) AS DECIMAL(10,0)) AS Total_price, CAST(SUM(total_price)*100/ (SELECT SUM(total_price) FROM pizza_sales) AS DECIMAL(10,2)) AS Ratio from pizza_sales
group by pizza_size
ORDER BY Ratio DESC;

select pizza_category,count(pizza_category) as count from pizza_sales
group by pizza_category
ORDER BY count DESC;

SELECT TOP 5 pizza_name,sum(total_price) AS total_price from pizza_sales
group by pizza_name
order by total_price desc ;





