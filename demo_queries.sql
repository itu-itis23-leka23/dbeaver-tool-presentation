-- =========================================
-- 1. View all data (basic exploration)
-- =========================================
SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM orders;


-- =========================================
-- 2. Join query (your demo query)
-- Shows customer name, product, quantity
-- =========================================
SELECT 
    c.name AS customer_name,
    p.name AS product_name,
    o.quantity
FROM orders o
JOIN customers c ON o.customer_id = c.id
JOIN products p ON o.product_id = p.id;


-- =========================================
-- 3. Add price → calculate total per row
-- =========================================
SELECT 
    c.name AS customer_name,
    p.name AS product_name,
    o.quantity,
    p.price,
    (o.quantity * p.price) AS total_price
FROM orders o
JOIN customers c ON o.customer_id = c.id
JOIN products p ON o.product_id = p.id;


-- =========================================
-- 4. Total spending per customer
-- =========================================
SELECT 
    c.name AS customer_name,
    SUM(o.quantity * p.price) AS total_spent
FROM orders o
JOIN customers c ON o.customer_id = c.id
JOIN products p ON o.product_id = p.id
GROUP BY c.name
ORDER BY total_spent DESC;


-- =========================================
-- 5. Most popular products (by quantity sold)
-- =========================================
SELECT 
    p.name AS product_name,
    SUM(o.quantity) AS total_sold
FROM orders o
JOIN products p ON o.product_id = p.id
GROUP BY p.name
ORDER BY total_sold DESC;


-- =========================================
-- 6. Orders by country
-- =========================================
SELECT 
    c.country,
    COUNT(o.id) AS total_orders
FROM orders o
JOIN customers c ON o.customer_id = c.id
GROUP BY c.country
ORDER BY total_orders DESC;


-- =========================================
-- 7. Customers who bought more than 1 item
-- =========================================
SELECT 
    c.name,
    SUM(o.quantity) AS total_items
FROM orders o
JOIN customers c ON o.customer_id = c.id
GROUP BY c.name
HAVING SUM(o.quantity) > 1;


-- =========================================
-- 8. Latest orders
-- =========================================
SELECT 
    c.name,
    p.name AS product,
    o.quantity,
    o.order_date
FROM orders o
JOIN customers c ON o.customer_id = c.id
JOIN products p ON o.product_id = p.id
ORDER BY o.order_date DESC;
