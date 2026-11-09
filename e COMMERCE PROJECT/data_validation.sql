USE ecommerce_analytics;

-- 1. Customers
CREATE TABLE IF NOT EXISTS Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(80),
    city VARCHAR(50),
    state VARCHAR(50),
    signup_date DATE,
    customer_segment VARCHAR(20)
);

-- 2. Products
CREATE TABLE IF NOT EXISTS Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(120),
    category VARCHAR(50),
    unit_cost DECIMAL(10,2),
    unit_price DECIMAL(10,2)
);

-- 3. Orders
CREATE TABLE IF NOT EXISTS Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATETIME,
    order_status VARCHAR(20),
    sales_channel VARCHAR(30),
    payment_method VARCHAR(30),
    FOREIGN KEY (customer_id)
        REFERENCES Customers(customer_id)
);

-- 4. OrderItems
CREATE TABLE IF NOT EXISTS OrderItems (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10,2),
    discount_pct DECIMAL(5,2),
    discount_amount DECIMAL(10,2),
    line_sales DECIMAL(12,2),
    line_cost DECIMAL(12,2),
    line_profit DECIMAL(12,2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- 5. Payments
CREATE TABLE IF NOT EXISTS Payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_method VARCHAR(30),
    payment_amount DECIMAL(12,2),
    payment_status VARCHAR(20),
    FOREIGN KEY (order_id)
        REFERENCES Orders(order_id)
);

-- Verify tables
SHOW TABLES;
USE ecommerce_analytics;

SELECT * FROM Products;

SELECT COUNT(*) FROM Products;
USE ecommerce_analytics;

SELECT * FROM products LIMIT 5;

DESCRIBE products;
SELECT COUNT(*) FROM ecommerce_analytics.Payments;
USE ecommerce_analytics;

SELECT 'customers' AS table_name, COUNT(*) AS total_rows FROM customers
UNION ALL
SELECT 'products', COUNT(*) FROM products
UNION ALL
SELECT 'orders', COUNT(*) FROM orders
UNION ALL
SELECT 'orderitems', COUNT(*) FROM orderitems
UNION ALL
SELECT 'payments', COUNT(*) FROM payments;