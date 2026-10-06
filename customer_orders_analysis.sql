-- Customer Orders SQL Analysis
-- Demonstrates relational database design, joins,
-- aggregation, filtering and business analysis.

-- 1. CREATE TABLES

CREATE TABLE Customers (
    customer_id INTEGER PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    email TEXT
);

CREATE TABLE Products (
    product_id INTEGER PRIMARY KEY,
    product_name TEXT,
    category TEXT,
    price REAL
);

CREATE TABLE Orders (
    order_id INTEGER PRIMARY KEY,
    customer_id INTEGER,
    order_date TEXT,
    total_amount REAL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Order_Items (
    order_item_id INTEGER PRIMARY KEY,
    order_id INTEGER,
    product_id INTEGER,
    quantity INTEGER,
    unit_price REAL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);


-- 2. INSERT SAMPLE DATA

INSERT INTO Customers
(customer_id, first_name, last_name, email)
VALUES
(1, 'Emma', 'Smith', 'emma@example.com'),
(2, 'Liam', 'Brown', 'liam@example.com'),
(3, 'Olivia', 'Jones', 'olivia@example.com'),
(4, 'Noah', 'Wilson', 'noah@example.com'),
(5, 'Ava', 'Taylor', 'ava@example.com');


INSERT INTO Products
(product_id, product_name, category, price)
VALUES
(1, 'Laptop', 'Electronics', 1200),
(2, 'Keyboard', 'Electronics', 80),
(3, 'Office Chair', 'Furniture', 350),
(4, 'Monitor', 'Electronics', 450),
(5, 'Desk', 'Furniture', 500);


INSERT INTO Orders
(order_id, customer_id, order_date, total_amount)
VALUES
(101, 1, '2026-01-10', 1280),
(102, 2, '2026-01-15', 350),
(103, 3, '2026-02-02', 950),
(104, 1, '2026-02-18', 450),
(105, 5, '2026-03-05', 500);


INSERT INTO Order_Items
(order_item_id, order_id, product_id, quantity, unit_price)
VALUES
(1, 101, 1, 1, 1200),
(2, 101, 2, 1, 80),
(3, 102, 3, 1, 350),
(4, 103, 4, 1, 450),
(5, 103, 5, 1, 500),
(6, 104, 4, 1, 450),
(7, 105, 5, 1, 500);


-- 3. VIEW ORDER DETAILS

SELECT
    o.order_id,
    c.first_name,
    c.last_name,
    o.order_date,
    p.product_name,
    oi.quantity,
    oi.unit_price
FROM Orders o
JOIN Customers c
    ON o.customer_id = c.customer_id
JOIN Order_Items oi
    ON o.order_id = oi.order_id
JOIN Products p
    ON oi.product_id = p.product_id
ORDER BY o.order_id;



-- 4. CUSTOMER SPENDING ANALYSIS

SELECT
    c.first_name,
    c.last_name,
    SUM(oi.quantity * oi.unit_price) AS total_spent
FROM Customers c
JOIN Orders o
    ON c.customer_id = o.customer_id
JOIN Order_Items oi
    ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_spent DESC;


-- 5. CUSTOMERS WITH NO ORDERS

SELECT
    c.customer_id,
    c.first_name,
    c.last_name
FROM Customers c
LEFT JOIN Orders o
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;


-- 6. PRODUCT REVENUE ANALYSIS

SELECT
    p.product_name,
    SUM(oi.quantity) AS units_sold,
    SUM(oi.quantity * oi.unit_price) AS revenue
FROM Products p
JOIN Order_Items oi
    ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
ORDER BY revenue DESC;
