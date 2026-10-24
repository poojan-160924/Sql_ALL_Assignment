-- SESSION 9 - JOINS 

/* 1.
Create two tables: restaurants (id, name, city) and dishes
(id, restaurant_id, dish_name, price). Insert at least 3 restaurants
and 2-3 dishes for each restaurant.
*/

CREATE TABLE restaurants (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(100)
);

CREATE TABLE dishes (
    id INT PRIMARY KEY,
    restaurant_id INT,
    dish_name VARCHAR(100),
    price DECIMAL(10, 2)
);

INSERT INTO restaurants (id, name, city)
VALUES
(1, 'Pizza Palace', 'Ahmedabad'),
(2, 'Burger House', 'Surat'),
(3, 'Spice Garden', 'Vadodara'),
(4, 'New Cafe', 'Rajkot');

INSERT INTO dishes (id, restaurant_id, dish_name, price)
VALUES
(1, 1, 'Margherita Pizza', 250.00),
(2, 1, 'Farmhouse Pizza', 350.00),
(3, 1, 'Garlic Bread', 120.00),
(4, 2, 'Veg Burger', 150.00),
(5, 2, 'Cheese Burger', 220.00),
(6, 3, 'Paneer Tikka', 280.00),
(7, 3, 'Veg Biryani', 200.00);

SELECT * FROM restaurants;
SELECT * FROM dishes;


/* 2.
Use INNER JOIN to display each dish with its restaurant name and city.
*/

SELECT dishes.dish_name, restaurants.name AS restaurant_name,
       restaurants.city, dishes.price
FROM restaurants
INNER JOIN dishes
ON restaurants.id = dishes.restaurant_id;


/* 3.
Use LEFT JOIN to list all restaurants and their dishes, including
restaurants that currently have no dishes.
*/

SELECT restaurants.name AS restaurant_name, restaurants.city,
       dishes.dish_name, dishes.price
FROM restaurants
LEFT JOIN dishes
ON restaurants.id = dishes.restaurant_id;


/* 4.
Use RIGHT JOIN to display all dishes and their restaurant names,
including dishes that are not linked to a matching restaurant.
*/

-- Add a dish with a restaurant_id that does not exist.
INSERT INTO dishes (id, restaurant_id, dish_name, price)
VALUES (8, 99, 'Special Dessert', 180.00);

SELECT dishes.dish_name, dishes.price,
       restaurants.name AS restaurant_name
FROM restaurants
RIGHT JOIN dishes
ON restaurants.id = dishes.restaurant_id;


-- 5.


DROP TABLE IF EXISTS playlist_songs;
DROP TABLE IF EXISTS playlists;

