-- Session 17: SQL Project - HR Analysis
-- Restaurant review analysis using MySQL 8.0+

-- Task 1: Create the Restaurant table and add sample restaurants.

CREATE TABLE Restaurant (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    cuisine VARCHAR(50),
    location VARCHAR(100),
    average_rating DECIMAL(2,1)
);

INSERT INTO Restaurant (id, name, cuisine, location, average_rating) VALUES
(1, 'Pizza Palace', 'Italian', 'Ahmedabad', 4.5),
(2, 'Pasta Point', 'Italian', 'Surat', 4.2),
(3, 'Spice Garden', 'Indian', 'Ahmedabad', 4.3),
(4, 'Green Bowl', 'Healthy', 'Vadodara', 4.1),
(5, 'Burger House', 'Fast Food', 'Surat', 3.9);


-- Task 2: Count restaurants for each cuisine, highest count first.

SELECT
    cuisine,
    COUNT(*) AS restaurant_count
FROM Restaurant
GROUP BY cuisine
ORDER BY restaurant_count DESC;


-- Task 3: Create the Review table and add at least 10 sample reviews.

CREATE TABLE Review (
    id INT PRIMARY KEY,
    restaurant_id INT,
    user_name VARCHAR(100),
    rating INT,
    review_date DATE,
    FOREIGN KEY (restaurant_id) REFERENCES Restaurant(id)
);

INSERT INTO Review (id, restaurant_id, user_name, rating, review_date) VALUES
(1, 1, 'Aarav', 5, '2026-10-01'),
(2, 1, 'Diya', 4, '2026-10-02'),
(3, 1, 'Rohan', 5, '2026-10-03'),
(4, 2, 'Meera', 4, '2026-10-04'),
(5, 2, 'Aarav', 5, '2026-10-05'),
(6, 3, 'Diya', 4, '2026-10-06'),
(7, 3, 'Rohan', 5, '2026-10-07'),
(8, 4, 'Meera', 4, '2026-10-08'),
(9, 5, 'Aarav', 3, '2026-10-09'),
(10, 5, 'Diya', 4, '2026-10-10'),
(11, 4, 'Rohan', 5, '2026-10-11');


-- Task 4: Show each restaurant's average review rating, highest average first.

SELECT
    r.name AS restaurant_name,
    r.cuisine,
    ROUND(AVG(rv.rating), 2) AS average_review_rating
FROM Restaurant AS r
JOIN Review AS rv
    ON r.id = rv.restaurant_id
GROUP BY r.id, r.name, r.cuisine
ORDER BY average_review_rating DESC;


-- Task 5: Rank restaurants by average review rating within each cuisine.

WITH RestaurantRatings AS (
    SELECT
        r.id,
        r.name AS restaurant_name,
        r.cuisine,
        ROUND(AVG(rv.rating), 2) AS average_review_rating
    FROM Restaurant AS r
    JOIN Review AS rv
        ON r.id = rv.restaurant_id
    GROUP BY r.id, r.name, r.cuisine
)
SELECT
    restaurant_name,
    cuisine,
    average_review_rating,
    RANK() OVER (
        PARTITION BY cuisine
        ORDER BY average_review_rating DESC
    ) AS cuisine_rank
FROM RestaurantRatings
ORDER BY cuisine, cuisine_rank;
