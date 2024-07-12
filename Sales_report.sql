1)What are the monthly sales, profit, and quantity?

SELECT 
	strftime('%y-%m',order_date) AS order_month,
	sum(sales) as total_monthly_sales,
	sum(quantity) as total_monthly_quantity,
	sum(profit) as total_monthly_profit
From
	orders
group by
	strftime('%y-%m',order_date)
order by
	order_month;

2) what are the total sales and profit by different ship mode?

SELECT 
	ship_mode,
	sum(sales) As total_sales,
	sum(profit) As total_profit
FROM
	orders
GROUP BY
	ship_mode;

3) What are the total sales and profit by different segments?

SELECT 
	segment,
	SUM(sales) AS total_sales,
	sum(profit) AS total_profit
From
	orders
Group BY
	segment;

4) What are the total sales and profit by different categories and subcategories?

SELECT 
	category,
	sub_category, 
	sum(sales) AS total_sales,
	sum(profit) AS total_profit
From
	orders
Group BY
	category,
	sub_category;

5) What is the quantity for each region?

SELECT 
	region,
	sum(quantity) AS total_quantity
From
	orders
Group By
	region;

6) What is the average discount for each product category

SELECT 
	category,
	AVG(discount) AS average_discount
From
	orders 
Group By
	category;

7)What are the average sales and profit per order?

SELECT 
	AVG(sales) AS average_sales, 
	AVG(profit)AS average_profit
From
	orders;
8) What is the most profitable product?

SELECT
    product_id,
    profit 
FROM
	orders  
ORDER BY 
	profit;
	
9)Who are the top 5 customers based on their total spending
	
SELECT
	customer_name,
	customer_id,
	quantity,
	profit 
FROM 
	orders
ORDER BY profit DESC
LIMIT 5;

10) How many orders were placed in each year?

	SELECT
	    order_id,
	    order_date,
	    sales,
	    quantity, 
	    ship_date,
	    count(order_id) 
	from
		orders
	GROUP BY ship_date;

11)	How many orders were returned?

   SELECT 
         returned,
         SUM(quantity) AS total_quantity 
   FROM returns 
   INNER JOIN orders
   ON returns.order_id = orders.order_id;
 
  
12)	Which product category has the most orders?

	SELECT 
	      order_id,
	      product_id,
	      product_name,
	      category,
	      quantity
	FROM orders
    GROUP BY category
    ORDER BY category DESC;
