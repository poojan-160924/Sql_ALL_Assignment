-- SESSION 7 - Aggregate Functions

/* 1.
Create a table called Orders with columns: order_id, user_name, total_amount,
and order_date. Insert 5 sample rows with different users and order amounts,
including at least one NULL value for total_amount.
*/

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    user_name VARCHAR(100),
    total_amount DECIMAL(10, 2),
    order_date DATE
);

INSERT INTO Orders (order_id, user_name, total_amount, order_date)
VALUES
(1, 'Pooja', 450.00, '2026-10-01'),
(2, 'Rahul', 700.00, '2026-10-02'),
(3, 'Pooja', 250.00, '2026-10-03'),
(4, 'Amit', NULL, '2026-10-04'),
(5, 'Neha', 900.00, '2026-10-05');

SELECT * FROM Orders;


/* 2.
Write a SQL query to count how many orders were placed by each user in the
Orders table. Display user_name and the number of orders as order_count.
*/

SELECT user_name, COUNT(*) AS order_count
FROM Orders
GROUP BY user_name;


/* 3.
Write a SQL query to calculate the average total_amount of all orders in the
Orders table, ignoring NULL values.
*/

SELECT AVG(total_amount) AS average_order_amount
FROM Orders;


/* 4.
Find the highest and lowest order amounts using MAX and MIN, and display
both values in a single result row.
*/

SELECT MAX(total_amount) AS highest_order_amount,
       MIN(total_amount) AS lowest_order_amount
FROM Orders;


/* 5.
Calculate the total sales for all orders, including only rows where
total_amount is not NULL.
*/

SELECT SUM(total_amount) AS total_sales
FROM Orders
WHERE total_amount IS NOT NULL;
