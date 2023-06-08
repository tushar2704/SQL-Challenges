/*8WeekChallengeDB by Tushar-Aggarwal.com
#1Dannys_Diner */


/* --------------------
   Case Study Questions
   --------------------*/
-- 1. What is the total amount each customer spent at the restaurant?
SELECT 
	sales.customer_id,
	SUM(menu.price) AS Total_Sales
FROM dannys_diner.sales
JOIN dannys_diner.menu
	ON sales.product_id=menu.product_id
GROUP BY sales.customer_id
ORDER BY sales.customer_id


-- 2. How many days has each customer visited the restaurant?
SELECT
	customer_id,
	COUNT(DISTINCT order_date) AS vist_count
FROM dannys_diner.sales
GROUP BY customer_id;

-- 3. What was the first item from the menu purchased by each customer?
WITH ordered_sale AS (
	SELECT
		sales.customer_id,
		sales.order_date,
		menu.product_name,
		DENSE_RANK() OVER(
			PARTITION BY sales.customer_id
			ORDER BY sales.order_date) AS rank
	FROM dannys_diner.sales
    JOIN dannys_diner.menu
		ON sales.product_id=menu.product_id)

SELECT 
	customer_id,
	product_name
FROM ordered_sale
WHERE rank=1
GROUP BY customer_id, product_name;


-- 4. What is the most purchased item on the menu and how many times was it purchased by all customers?
SELECT
	menu.product_name,
	COUNT(sales.product_id) AS most_purchased_item
FROM dannys_diner.sales
JOIN dannys_diner.menu
	ON sales.product_id=menu.product_id
GROUP BY menu.product_name
ORDER BY most_purchased_item DESC
LIMIT 1;
