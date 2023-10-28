select * from pizza_sales

select SUM(total_price) AS Total_Revunue from pizza_sales  

select SUM(total_price) /COUNT(DISTINCT order_id) AS Avg_Order_Value from pizza_sales

Select SUM(quantity) AS Total_Pizza_Sold from pizza_sales

Select COUNT(DISTINCT order_id) AS Total_orders from pizza_sales

Select CAST( CAST(SUM(quantity) AS decimal(10,2)) / CAST(COUNT(DISTINCT order_id) AS decimal(10,2)) AS decimal(10,2)) 
AS Agv_pizza_order from pizza_sales


select DATENAME(DW, order_date) AS order_day, COUNT(DISTINCT order_id) AS total_orders 
FROM pizza_sales
GROUP BY DATENAME(DW, order_date) 

select DATENAME(MONTH, order_date) as Month_Name, COUNT(DISTINCT order_id) as Total_Orders
from pizza_sales
GROUP BY DATENAME(MONTH, order_date) order by Total_Orders DESC


select pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_category

select pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
where MONTH(order_date)=1
GROUP BY pizza_category

select pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales where MONTH(order_date)=1) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
where MONTH(order_date)=1
GROUP BY pizza_category


SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales where DATEPART(QUARTER,order_date)=1) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
where DATEPART(QUARTER,order_date)=1
GROUP BY pizza_size
ORDER BY pizza_size

SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM pizza_sales
WHERE MONTH(order_date) = 2
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC

SELECT top 5 pizza_name,SUM(total_price) as total_Revenue from pizza_sales
group by pizza_name
order by total_Revenue DESC

SELECT top 5 pizza_name,SUM(total_price) as total_Revenue from pizza_sales
group by pizza_name
order by total_Revenue ASC

SELECT top 5 pizza_name,SUM(quantity) as total_Quantity from pizza_sales
group by pizza_name
order by total_Quantity DESC

SELECT top 5 pizza_name,SUM(quantity) as total_Quantity from pizza_sales
group by pizza_name
order by total_Quantity ASC

SELECT top 5 pizza_name,COUNT(DISTINCT order_id) as total_Order from pizza_sales
group by pizza_name
order by total_Order  DESC

SELECT top 5 pizza_name,COUNT(DISTINCT order_id) as total_Order from pizza_sales
group by pizza_name
order by total_Order ASC

