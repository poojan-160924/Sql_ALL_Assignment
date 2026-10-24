
/* 1.
Write an SQL query to display all products from a 'products' table and sort them by price in ascending order, 
similar to how Flipkart lists items from lowest to highest price. */


CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    ratings DECIMAL(2,1),
    price DECIMAL(10,2)
);


INSERT INTO products (product_id, product_name, ratings, price)
VALUES
(1, 'Wireless Headphones', 4.5, 2499.00),
(2, 'Smartphone', 4.3, 15999.00),
(3, 'Laptop', 4.7, 55999.00),
(4, 'Bluetooth Speaker', 4.1, 1799.00),
(5, 'Smartwatch', 3.9, 3499.00),
(6, 'Mechanical Keyboard', 4.6, 2999.00),
(7, 'Gaming Mouse', 4.2, 1299.00),
(8, 'Power Bank', 4.0, 999.00),
(9, 'USB-C Cable', 3.8, 399.00),
(10, 'Monitor', 4.4, 12499.00);

select * from products;
select * from products order by price asc;

/* Modify your previous query to show the top 5 most expensive products using ORDER BY with DESC and LIMIT. */


select * from products order by  price desc limit 5;


/* 3.
Given a 'movies' table with columns 'title', 'release_year', and 'rating',
 write an SQL query to list all movies sorted first by release_year in descending order
 (latest first), then by rating in descending order (highest rated first).
*/



CREATE TABLE movies (
    title VARCHAR(100),
    release_year INT,
    rating DECIMAL(2,1)
);

INSERT INTO movies (title, release_year, rating)
VALUES
('The Shawshank Redemption', 1994, 9.3),
('The Dark Knight', 2008, 9.0),
('Inception', 2010, 8.8),
('Interstellar', 2014, 8.7),
('The Matrix', 1999, 8.7),
('Forrest Gump', 1994, 8.8),
('Titanic', 1997, 7.9),
('Avatar', 2009, 7.9),
('Joker', 2019, 8.3),
('Dangal', 2016, 8.3);


select * from movies;
select * from movies order by release_year desc;
select * from movies order by rating desc;




/* 4.
Write an SQL query to display the first 10 restaurants from a 'restaurants' table,
 sorted alphabetically by name, just like Zomato's A-Z listing.
 Use ORDER BY with LIMIT.</em>
*/

select * from restaurents;
select * from restaurents order by name asc limit 10 ;

/* Suppose you want to display the top 3 trending songs from a 'songs' table based on play_count,
 but if two songs have the same play_count, the more recently added song should come first.
 Write the SQL query to achieve this.<br><br><em><strong>Hint:</strong> Use ORDER BY with multiple columns.
*/

CREATE TABLE songs (
    song_id INT PRIMARY KEY,
    song_name VARCHAR(100),
    play_count INT,
    duration INT,
    release_year INT
);

INSERT INTO songs
    (song_id, song_name, play_count, duration, release_year)
VALUES
    (1, 'Blinding Lights', 3500000, 200, 2019),
    (2, 'Shape of You', 4200000, 234, 2017),
    (3, 'Perfect', 2800000, 263, 2017),
    (4, 'Believer', 3100000, 204, 2017),
    (5, 'Levitating', 1900000, 203, 2020),
    (6, 'Flowers', 2500000, 200, 2023),
    (7, 'As It Was', 2200000, 167, 2022),
    (8, 'Stay', 2900000, 141, 2021),
    (9, 'Anti-Hero', 1800000, 200, 2022),
    (10, 'Espresso', 1600000, 175, 2024);

select * from songs;

select * from songs order by release_year desc , play_count desc;





