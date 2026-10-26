-- Session 16: SQL Project - Sales Analysis
-- Run this script in MySQL Workbench.
-- Task 1 uses a CSV file named food_orders.csv in the same folder as this script.
-- CSV columns should be: order_id, restaurant_name, customer_name, order_amount, order_date.


-- Task 1: Create FoodOrders table and import the CSV data.
-- Create the table first. Then use MySQL Workbench's Table Data Import Wizard
-- to import food_orders.csv into this table.

CREATE TABLE FoodOrders (
    order_id INT PRIMARY KEY,
    restaurant_name VARCHAR(100),
    customer_name VARCHAR(100),
    order_amount DECIMAL(10, 2),
    order_date DATE
);

-- After creating the table:
-- In MySQL Workbench, right-click the FoodOrders table,
-- choose Table Data Import Wizard, select food_orders.csv,
-- match the columns, and finish the import.

SELECT * FROM FoodOrders;


-- Task 2: Create TopSongs and insert at least 5 popular tracks.

DROP TABLE IF EXISTS TopSongs;

CREATE TABLE TopSongs (
    song_id INT PRIMARY KEY,
    song_title VARCHAR(150),
    artist VARCHAR(100),
    streams BIGINT,
    release_date DATE
);

INSERT INTO TopSongs (song_id, song_title, artist, streams, release_date) VALUES
(1, 'Blinding Lights', 'The Weeknd', 4200000000, '2019-11-29'),
(2, 'Shape of You', 'Ed Sheeran', 3800000000, '2017-01-06'),
(3, 'Someone You Loved', 'Lewis Capaldi', 3000000000, '2018-11-08'),
(4, 'Starboy', 'The Weeknd', 2900000000, '2016-09-22'),
(5, 'As It Was', 'Harry Styles', 2800000000, '2022-03-31');

SELECT * FROM TopSongs;


-- Task 3: Find the top 3 customers by total amount spent.

SELECT
    customer_name,
    SUM(order_amount) AS total_spent
FROM FoodOrders
GROUP BY customer_name
ORDER BY total_spent DESC
LIMIT 3;


-- Task 4: Show each restaurant's order count and total sales, highest sales first.

SELECT
    restaurant_name,
    COUNT(*) AS number_of_orders,
    SUM(order_amount) AS total_order_amount
FROM FoodOrders
GROUP BY restaurant_name
ORDER BY total_order_amount DESC;


-- Task 5: Show two KPIs in dashboard-friendly name/value format.

SELECT 'Average Order Amount' AS kpi_name,
       AVG(order_amount) AS kpi_value
FROM FoodOrders

UNION ALL

SELECT 'Unique Customers' AS kpi_name,
       COUNT(DISTINCT customer_name) AS kpi_value
FROM FoodOrders;
