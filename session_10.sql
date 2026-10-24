-- SESSION 10 - JOINS 


/* TASK 1
Create Influencers and Collaborations tables.
MySQL does not directly support FULL OUTER JOIN, so use LEFT JOIN with
UNION and a reversed LEFT JOIN to get FULL JOIN-like results.
*/

CREATE TABLE Influencers (
    id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE Collaborations (
    id INT PRIMARY KEY,
    influencer1_id INT,
    influencer2_id INT,
    collab_date DATE
);

INSERT INTO Influencers (id, name)
VALUES
(1, 'Aarav'),
(2, 'Diya'),
(3, 'Rohan'),
(4, 'Meera');

INSERT INTO Collaborations (id, influencer1_id, influencer2_id, collab_date)
VALUES
(1, 1, 2, '2026-10-01'),
(2, 2, 3, '2026-10-05');

-- FULL JOIN equivalent in MySQL: includes influencers without collaborations.
SELECT
    i1.id AS influencer_id,
    i1.name AS influencer_name,
    i2.name AS collaboration_partner,
    c.collab_date
FROM Influencers AS i1
LEFT JOIN Collaborations AS c
    ON i1.id = c.influencer1_id
LEFT JOIN Influencers AS i2
    ON c.influencer2_id = i2.id

UNION

SELECT
    i1.id AS influencer_id,
    i1.name AS influencer_name,
    i2.name AS collaboration_partner,
    c.collab_date
FROM Collaborations AS c
LEFT JOIN Influencers AS i1
    ON c.influencer1_id = i1.id
LEFT JOIN Influencers AS i2
    ON c.influencer2_id = i2.id
WHERE i1.id IS NULL;


/* TASK 2
Use SELF JOIN to show each playlist with its parent playlist name.
*/

DROP TABLE IF EXISTS Playlists;

CREATE TABLE Playlists (
    id INT PRIMARY KEY,
    user_id INT,
    playlist_name VARCHAR(100),
    parent_playlist_id INT NULL
);

INSERT INTO Playlists (id, user_id, playlist_name, parent_playlist_id)
VALUES
(1, 101, 'My Music', NULL),
(2, 101, 'Workout Songs', 1),
(3, 101, 'Relaxing Music', 1),
(4, 102, 'Study Music', NULL);

SELECT
    child.playlist_name AS playlist_name,
    parent.playlist_name AS parent_playlist_name
FROM Playlists AS child
LEFT JOIN Playlists AS parent
    ON child.parent_playlist_id = parent.id;


/* TASK 3
Use multiple LEFT JOINs to show all users, their order dates, and payment
amounts, including users who have no orders or payments.
*/

DROP TABLE IF EXISTS Payments;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Users;

CREATE TABLE Users (
    id INT PRIMARY KEY,
    username VARCHAR(100)
);

CREATE TABLE Orders (
    id INT PRIMARY KEY,
    user_id INT,
    order_date DATE
);

CREATE TABLE Payments (
    id INT PRIMARY KEY,
    order_id INT,
    amount DECIMAL(10, 2)
);

INSERT INTO Users (id, username)
VALUES
(1, 'Pooja'),
(2, 'Rahul'),
(3, 'Amit'),
(4, 'Neha');

INSERT INTO Orders (id, user_id, order_date)
VALUES
(101, 1, '2026-10-10'),
(102, 2, '2026-10-11'),
(103, 1, '2026-10-12');

INSERT INTO Payments (id, order_id, amount)
VALUES
(1, 101, 500.00),
(2, 102, 750.00);

SELECT
    Users.username,
    Orders.order_date,
    Payments.amount
FROM Users
LEFT JOIN Orders
    ON Users.id = Orders.user_id
LEFT JOIN Payments
    ON Orders.id = Payments.order_id;


/* TASK 4
Use DISTINCT to eliminate duplicate restaurant rows in the JOIN result.
Duplicates happen because one restaurant can have multiple matching reviews.
*/

DROP TABLE IF EXISTS Reviews;
DROP TABLE IF EXISTS Restaurants;

CREATE TABLE Restaurants (
    id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE Reviews (
    id INT PRIMARY KEY,
    restaurant_id INT,
    review_text VARCHAR(255)
);

INSERT INTO Restaurants (id, name)
VALUES
(1, 'Pizza Palace'),
(2, 'Burger House');

INSERT INTO Reviews (id, restaurant_id, review_text)
VALUES
(1, 1, 'Great food'),
(2, 1, 'Good service'),
(3, 2, 'Nice place');

SELECT DISTINCT
    Restaurants.id,
    Restaurants.name
FROM Restaurants
INNER JOIN Reviews
    ON Restaurants.id = Reviews.restaurant_id;


/* TASK 5
Show products with their category names using two different JOIN conditions.
The direct foreign-key relationship is the appropriate condition when
Products.category_id references Categories.id.
*/

DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Categories;

CREATE TABLE Categories (
    id INT PRIMARY KEY,
    category_name VARCHAR(100)
);

CREATE TABLE Products (
    id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category_id INT,
    price DECIMAL(10, 2)
);

INSERT INTO Categories (id, category_name)
VALUES
(1, 'Electronics'),
(2, 'Clothing'),
(3, 'Books');

INSERT INTO Products (id, product_name, category_id, price)
VALUES
(1, 'Headphones', 1, 1200.00),
(2, 'T-Shirt', 2, 500.00),
(3, 'SQL Book', 3, 350.00);

-- Query 1: Join using the foreign key and primary key.
SELECT
    Products.product_name,
    Categories.category_name
FROM Products
INNER JOIN Categories
    ON Products.category_id = Categories.id;

-- Query 2: Same join condition, using table aliases.
SELECT
    p.product_name,
    c.category_name
FROM Products AS p
INNER JOIN Categories AS c
    ON p.category_id = c.id;
