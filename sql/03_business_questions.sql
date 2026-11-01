-- All results below describe SIMULATED data, not actual business performance.
USE tasnia_bakery_portfolio;

-- Q1. What are total orders, units sold, revenue and estimated gross profit?
SELECT COUNT(*) AS total_orders, SUM(o.quantity) AS units_sold,
 SUM(o.quantity*p.unit_price_bdt) AS revenue_bdt,
 SUM(o.quantity*p.unit_cost_bdt) AS estimated_product_cost_bdt,
 SUM(o.quantity*(p.unit_price_bdt-p.unit_cost_bdt)) AS estimated_gross_profit_bdt
FROM orders o JOIN products p ON o.product_id=p.product_id;

-- Q2. Which month generated the most revenue?
SELECT DATE_FORMAT(o.order_date,'%Y-%m') AS month,
 COUNT(*) AS orders, SUM(o.quantity*p.unit_price_bdt) AS revenue_bdt
FROM orders o JOIN products p ON o.product_id=p.product_id
GROUP BY DATE_FORMAT(o.order_date,'%Y-%m') ORDER BY month;

-- Q3. Which products sold most units and generated most revenue?
-- One unit means one pound-cake or one box as specified in sale_unit.
SELECT p.product_name,p.sale_unit, COUNT(*) AS orders,
 SUM(o.quantity) AS units_sold, SUM(o.quantity*p.unit_price_bdt) AS revenue_bdt
FROM orders o JOIN products p ON o.product_id=p.product_id
GROUP BY p.product_id,p.product_name,p.sale_unit ORDER BY units_sold DESC,p.product_name;

-- Q4. Which products contributed the most estimated gross profit?
SELECT p.product_name,
 SUM(o.quantity*(p.unit_price_bdt-p.unit_cost_bdt)) AS estimated_gross_profit_bdt
FROM orders o JOIN products p ON o.product_id=p.product_id
GROUP BY p.product_id,p.product_name ORDER BY estimated_gross_profit_bdt DESC,p.product_name;

-- Q5. Who placed repeat orders? HAVING filters the grouped results.
SELECT c.customer_id,c.customer_name,COUNT(*) AS order_count,
 SUM(o.quantity*p.unit_price_bdt) AS spending_bdt
FROM customers c JOIN orders o ON c.customer_id=o.customer_id
JOIN products p ON o.product_id=p.product_id
GROUP BY c.customer_id,c.customer_name HAVING COUNT(*)>1
ORDER BY order_count DESC,spending_bdt DESC,c.customer_id;

-- Q6. Which areas generated the most orders and revenue?
SELECT c.area,c.upazila,COUNT(*) AS orders,
 COUNT(DISTINCT c.customer_id) AS customers,
 SUM(o.quantity*p.unit_price_bdt) AS revenue_bdt
FROM customers c JOIN orders o ON c.customer_id=o.customer_id
JOIN products p ON o.product_id=p.product_id
GROUP BY c.area,c.upazila ORDER BY revenue_bdt DESC,c.area;

-- Q7. What is the average order value?
SELECT ROUND(AVG(o.quantity*p.unit_price_bdt),2) AS average_order_value_bdt
FROM orders o JOIN products p ON o.product_id=p.product_id;

-- Q8. How do orders vary across age groups and gender?
-- Ages are fixed simulated ages in 2021, not calculated current ages.
SELECT CASE WHEN c.age_in_2021<25 THEN '18-24'
 WHEN c.age_in_2021<35 THEN '25-34'
 WHEN c.age_in_2021<45 THEN '35-44' ELSE '45-65' END AS age_group,
 c.gender,COUNT(*) AS orders,COUNT(DISTINCT c.customer_id) AS customers,
 SUM(o.quantity*p.unit_price_bdt) AS revenue_bdt
FROM customers c JOIN orders o ON c.customer_id=o.customer_id
JOIN products p ON o.product_id=p.product_id
GROUP BY age_group,c.gender ORDER BY age_group,c.gender;
