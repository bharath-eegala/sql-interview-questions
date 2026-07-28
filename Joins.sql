-- ==========================================================
-- SQL JOINS - DAY 2
-- Author: Bharath Eegala
-- Topic: SQL Joins & Aggregations
-- ==========================================================


-- ==========================================================
-- Question 1
-- Display employee name along with department name.
-- ==========================================================

SELECT a.employee_name,
       b.department_name
FROM employees a
INNER JOIN departments b
ON a.department_id = b.department_id;



-- ==========================================================
-- Question 2
-- Display all employees including those without departments.
-- ==========================================================

SELECT a.employee_name,
       b.department_name
FROM employees a
LEFT JOIN departments b
ON a.department_id = b.department_id;



-- ==========================================================
-- Question 3
-- Display every department with employee names.
-- Departments without employees should also appear.
-- ==========================================================

SELECT b.department_name,
       a.employee_name
FROM employees a
RIGHT JOIN departments b
ON a.department_id = b.department_id;



-- ==========================================================
-- Question 4
-- Find customers who never placed an order.
-- ==========================================================

SELECT a.customer_name
FROM customers a
LEFT JOIN orders b
ON a.customer_id = b.customer_id
WHERE b.order_id IS NULL;



-- ==========================================================
-- Question 5
-- Display employee name and manager name using self join.
-- ==========================================================

SELECT a.employee_name,
       b.employee_name AS manager_name
FROM employees a
LEFT JOIN employees b
ON a.manager_id = b.employee_id;



-- ==========================================================
-- Question 6
-- Display customer name, order id and product name.
-- ==========================================================

SELECT a.customer_name,
       b.order_id,
       c.product_name
FROM customers a
INNER JOIN orders b
ON a.customer_id = b.customer_id
INNER JOIN order_items c
ON b.order_id = c.order_id;



-- ==========================================================
-- Question 7
-- Display every customer including customers with no orders.
-- ==========================================================

SELECT a.customer_name,
       b.order_id,
       c.product_name
FROM customers a
LEFT JOIN orders b
ON a.customer_id = b.customer_id
LEFT JOIN order_items c
ON b.order_id = c.order_id;



-- ==========================================================
-- Question 8
-- Display total number of orders for every customer.
-- Customers without orders should show 0.
-- ==========================================================

SELECT a.customer_name,
       COUNT(b.order_id) AS total_orders
FROM customers a
LEFT JOIN orders b
ON a.customer_id = b.customer_id
GROUP BY a.customer_name;



-- ==========================================================
-- Question 9
-- Display total spending of every customer.
-- Customers without orders should show 0.
-- ==========================================================

SELECT a.customer_name,
       COALESCE(SUM(b.amount), 0) AS total_spent
FROM customers a
LEFT JOIN orders b
ON a.customer_id = b.customer_id
GROUP BY a.customer_name;



-- ==========================================================
-- Question 10
-- Display customers whose total spending is greater than 1000.
-- ==========================================================

SELECT a.customer_name,
       COALESCE(SUM(b.amount), 0) AS total_spent
FROM customers a
LEFT JOIN orders b
ON a.customer_id = b.customer_id
GROUP BY a.customer_name
HAVING SUM(b.amount) > 1000;



-- ==========================================================
-- Question 11
-- Display the highest spending customer.
-- ==========================================================

SELECT a.customer_name,
       COALESCE(SUM(b.amount), 0) AS total_spent
FROM customers a
LEFT JOIN orders b
ON a.customer_id = b.customer_id
GROUP BY a.customer_name
ORDER BY SUM(b.amount) DESC
LIMIT 1;
