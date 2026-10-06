INSERT INTO Customers (customer_id, customer_name, city) VALUES
(1, 'Emma Wilson', 'Sydney'),
(2, 'Liam Chen', 'Melbourne'),
(3, 'Olivia Brown', 'Brisbane'),
(4, 'Noah Singh', 'Sydney'),
(5, 'Mia Taylor', 'Perth');

INSERT INTO Products (product_id, product_name, category, price) VALUES
(101, 'Wireless Mouse', 'Accessories', 35.00),
(102, 'Mechanical Keyboard', 'Accessories', 95.00),
(103, 'Laptop Stand', 'Accessories', 55.00),
(104, 'USB-C Monitor', 'Monitors', 320.00),
(105, 'Webcam', 'Accessories', 80.00);

INSERT INTO Orders (order_id, customer_id, order_date) VALUES
(1001, 1, '2026-01-12'),
(1002, 2, '2026-01-18'),
(1003, 1, '2026-02-03'),
(1004, 3, '2026-02-15'),
(1005, 4, '2026-03-02'),
(1006, 5, '2026-03-10');

INSERT INTO Order_Items (order_item_id, order_id, product_id, quantity) VALUES
(1, 1001, 101, 2),
(2, 1001, 103, 1),
(3, 1002, 104, 1),
(4, 1003, 102, 1),
(5, 1004, 105, 2),
(6, 1005, 104, 1),
(7, 1005, 101, 1),
(8, 1006, 103, 2);
