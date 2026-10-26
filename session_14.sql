-- Session 14: Window Functions - Part 2

-- Task 1: Create the Orders table and add sample records.

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2)
);

INSERT INTO Orders (order_id, user_id, order_date, total_amount) VALUES
(1, 101, '2026-10-01', 250.00),
(2, 101, '2026-10-03', 180.00),
(3, 102, '2026-10-04', 320.00),
(4, 101, '2026-10-06', 450.00),
(5, 102, '2026-10-07', 210.00),
(6, 103, '2026-10-08', 150.00),
(7, 102, '2026-10-10', 400.00),
(8, 103, '2026-10-12', 275.00);


-- Task 2: Show each order and the previous order amount for the same user.

SELECT
    order_id,
    user_id,
    order_date,
    total_amount,
    LAG(total_amount) OVER (
        PARTITION BY user_id
        ORDER BY order_date
    ) AS previous_amount
FROM Orders
ORDER BY user_id, order_date;


-- Task 3: Show each order and the next order amount for the same user.

SELECT
    order_id,
    user_id,
    order_date,
    total_amount,
    LEAD(total_amount) OVER (
        PARTITION BY user_id
        ORDER BY order_date
    ) AS next_amount
FROM Orders
ORDER BY user_id, order_date;


-- Task 4: Calculate the running total for each user.

SELECT
    order_id,
    user_id,
    order_date,
    total_amount,
    SUM(total_amount) OVER (
        PARTITION BY user_id
        ORDER BY order_date
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_total
FROM Orders
ORDER BY user_id, order_date;


-- Task 5: Calculate a 3-order moving average for each user.
-- The average includes the current order and the two previous orders, when available.

SELECT
    order_id,
    user_id,
    order_date,
    total_amount,
    AVG(total_amount) OVER (
        PARTITION BY user_id
        ORDER BY order_date
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS moving_avg
FROM Orders
ORDER BY user_id, order_date;
