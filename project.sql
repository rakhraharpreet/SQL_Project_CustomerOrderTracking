-- Use the database (create if it doesn't exist)
CREATE SCHEMA IF NOT EXISTS Customer_Order_Tracking;
USE Customer_Order_Tracking;

-- Create tables
CREATE TABLE IF NOT EXISTS customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    price DECIMAL(10,2)
);

CREATE TABLE IF NOT EXISTS orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    order_date DATE,
    quantity INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Insert sample data
INSERT INTO customers VALUES
(1, 'Alice Johnson', 'Toronto'),
(2, 'Bob Smith', 'Vancouver'),
(3, 'Carol Davis', 'Calgary');

INSERT INTO products VALUES
(1, 'Laptop', 800),
(2, 'Mouse', 25),
(3, 'Keyboard', 45);

INSERT INTO orders VALUES
(101, 1, 1, '2025-08-01', 1),
(102, 1, 2, '2025-08-02', 2),
(103, 2, 3, '2025-08-03', 1),
(104, 3, 2, '2025-08-04', 3);

-- Query 1: List all orders for customer_id = 1
SELECT * 
FROM orders
WHERE customer_id = 1;

-- Query 2: Show customer names with their orders
SELECT c.customer_name, o.order_id, o.order_date
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id;

-- Query 3: Find total spending per customer
SELECT c.customer_name, SUM(p.price * o.quantity) AS total_spent
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN products p ON o.product_id = p.product_id
GROUP BY c.customer_name;

-- Query 4: Top 2 customers by spending
SELECT c.customer_name, SUM(p.price * o.quantity) AS total_spent
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN products p ON o.product_id = p.product_id
GROUP BY c.customer_name
ORDER BY total_spent DESC
LIMIT 2;

-- Query 5: Orders made on or after 2025-08-03
SELECT *
FROM orders
WHERE order_date >= '2025-08-03';

-- Query 6: Products bought by
SELECT DISTINCT p.product_name
FROM orders o
JOIN products p ON o.product_id = p.product_id
WHERE o.customer_id = 1;

-- Query 7: Count of orders per city
SELECT c.city, COUNT(o.order_id) AS order_count
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.city;

-- Query 8: Highest quantity ordered in one purchase
SELECT o.order_id, c.customer_name, p.product_name, o.quantity
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN products p ON o.product_id = p.product_id
ORDER BY o.quantity DESC
LIMIT 1;