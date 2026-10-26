-- Session 18: Interview Questions + Final Revision
-- SQL answers based on the five tasks in the provided screenshot.

-- Task 1: Count songs uploaded by each artist.
-- Show only artists who have uploaded more than 3 songs.

CREATE TABLE songs (
    song_id INT PRIMARY KEY,
    artist_name VARCHAR(100),
    title VARCHAR(150)
);

INSERT INTO songs (song_id, artist_name, title) VALUES
(1, 'Arijit Singh', 'Tum Hi Ho'),
(2, 'Arijit Singh', 'Kesariya'),
(3, 'Arijit Singh', 'Channa Mereya'),
(4, 'Arijit Singh', 'Agar Tum Saath Ho'),
(5, 'Shreya Ghoshal', 'Saibo'),
(6, 'Shreya Ghoshal', 'Param Sundari'),
(7, 'Shreya Ghoshal', 'Sun Raha Hai'),
(8, 'Shreya Ghoshal', 'Teri Ore'),
(9, 'Armaan Malik', 'Bol Do Na Zara'),
(10, 'Armaan Malik', 'Control');

SELECT artist_name, COUNT(*) AS total_songs
FROM songs
GROUP BY artist_name
HAVING COUNT(*) > 3;


-- Task 2: Display each username with their total order amount.

DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
    user_id INT PRIMARY KEY,
    username VARCHAR(100)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    amount DECIMAL(10,2)
);

INSERT INTO users (user_id, username) VALUES
(1, 'Pooja'),
(2, 'Rahul'),
(3, 'Amit');

INSERT INTO orders (order_id, user_id, amount) VALUES
(101, 1, 450.00),
(102, 1, 250.00),
(103, 2, 700.00),
(104, 2, 150.00);

SELECT
    users.username,
    COALESCE(SUM(orders.amount), 0) AS total_order_amount
FROM users
LEFT JOIN orders
    ON users.user_id = orders.user_id
GROUP BY users.user_id, users.username;


-- Task 3: Find restaurants with a rating higher than the average rating.

DROP TABLE IF EXISTS restaurants;

CREATE TABLE restaurants (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    rating DECIMAL(2,1)
);

INSERT INTO restaurants (id, name, rating) VALUES
(1, 'Pizza Palace', 4.8),
(2, 'Spice Garden', 4.2),
(3, 'Burger House', 3.7),
(4, 'Green Bowl', 4.5),
(5, 'Pasta Point', 4.0);

SELECT name, rating
FROM restaurants
WHERE rating > (
    SELECT AVG(rating)
    FROM restaurants
);


-- Task 4: Show each user's transaction amount and running total by date.

DROP TABLE IF EXISTS transactions;

CREATE TABLE transactions (
    id INT PRIMARY KEY,
    user_id INT,
    amount DECIMAL(10,2),
    transaction_date DATE
);

INSERT INTO transactions (id, user_id, amount, transaction_date) VALUES
(1, 1, 200.00, '2026-10-01'),
(2, 1, 150.00, '2026-10-03'),
(3, 2, 500.00, '2026-10-02'),
(4, 1, 300.00, '2026-10-05'),
(5, 2, 100.00, '2026-10-06');

SELECT
    user_id,
    transaction_date,
    amount,
    SUM(amount) OVER (
        PARTITION BY user_id
        ORDER BY transaction_date
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_total
FROM transactions
ORDER BY user_id, transaction_date;


-- Task 5: Two ways to optimize product searches by category and price.
-- 1. Add an index on category and price so MySQL can find matching products faster.
-- 2. Select only the required columns and filter directly in WHERE to avoid
--    reading and returning unnecessary rows or columns.

-- Example index and query:
-- CREATE INDEX idx_products_category_price ON Products (category, price);
-- SELECT product_name, price
-- FROM Products
-- WHERE category = 'Electronics' AND price BETWEEN 500 AND 2000;
