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


	