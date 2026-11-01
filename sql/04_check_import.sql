USE tasnia_bakery_portfolio;
SELECT 'customers' AS table_name,COUNT(*) AS row_count FROM customers
UNION ALL SELECT 'products',COUNT(*) FROM products
UNION ALL SELECT 'orders',COUNT(*) FROM orders;
SELECT MIN(order_date) AS first_order,MAX(order_date) AS last_order FROM orders;
-- Expected zero outside the historical period:
SELECT COUNT(*) AS out_of_period FROM orders
WHERE order_date<'2020-12-01' OR order_date>'2021-08-31';
