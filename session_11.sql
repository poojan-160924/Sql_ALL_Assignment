-- Session 11: Subqueries

-- Task 1: Find restaurants whose rating is above the average rating in their city.

CREATE TABLE Restaurants (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(100),
    rating DECIMAL(2,1)
);

INSERT INTO Restaurants VALUES
(1, 'Pizza Palace', 'Ahmedabad', 4.5),
(2, 'Spice Garden', 'Ahmedabad', 4.0),
(3, 'Burger House', 'Ahmedabad', 3.5),
(4, 'Tasty Treat', 'Surat', 4.2),
(5, 'Green Bowl', 'Surat', 3.8);

SELECT name, city, rating
FROM Restaurants r
WHERE rating > (
    SELECT AVG(rating)
    FROM Restaurants
    WHERE city = r.city
);


-- Task 2: Show each user's name and how many orders they have placed.

CREATE TABLE Users (
    id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE Orders (
    id INT PRIMARY KEY,
    user_id INT,
    order_date DATE
);

INSERT INTO Users VALUES
(1, 'Pooja'),
(2, 'Rahul'),
(3, 'Amit'),
(4, 'Neha');

INSERT INTO Orders VALUES
(101, 1, '2026-10-01'),
(102, 1, '2026-10-03'),
(103, 2, '2026-10-05'),
(104, 3, '2026-10-06');

SELECT
    name,
    (SELECT COUNT(*)
     FROM Orders
     WHERE Orders.user_id = Users.id) AS total_orders
FROM Users;


-- Task 3: Show movies that have at least one 5-star review.

CREATE TABLE Movies (
    id INT PRIMARY KEY,
    title VARCHAR(100)
);

CREATE TABLE Reviews (
    id INT PRIMARY KEY,
    movie_id INT,
    rating INT
);

INSERT INTO Movies VALUES
(1, 'Movie A'),
(2, 'Movie B'),
(3, 'Movie C'),
(4, 'Movie D');

INSERT INTO Reviews VALUES
(1, 1, 5),
(2, 1, 4),
(3, 2, 3),
(4, 3, 5),
(5, 4, 4);

SELECT title
FROM Movies
WHERE id IN (
    SELECT movie_id
    FROM Reviews
    WHERE rating = 5
);


-- Task 4: Find sellers who have sold products in every category.

CREATE TABLE Sellers (
    id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE Categories (
    id INT PRIMARY KEY,
    category_name VARCHAR(100)
);

CREATE TABLE Products (
    id INT PRIMARY KEY,
    seller_id INT,
    category_id INT,
    product_name VARCHAR(100)
);

INSERT INTO Sellers VALUES
(1, 'Seller One'),
(2, 'Seller Two'),
(3, 'Seller Three');

INSERT INTO Categories VALUES
(1, 'Electronics'),
(2, 'Clothing'),
(3, 'Books');

INSERT INTO Products VALUES
(1, 1, 1, 'Headphones'),
(2, 1, 2, 'T-Shirt'),
(3, 1, 3, 'SQL Book'),
(4, 2, 1, 'Keyboard'),
(5, 2, 2, 'Jacket'),
(6, 3, 3, 'Novel');

SELECT name
FROM Sellers s
WHERE NOT EXISTS (
    SELECT *
    FROM Categories c
    WHERE NOT EXISTS (
        SELECT *
        FROM Products p
        WHERE p.seller_id = s.id
          AND p.category_id = c.id
    )
);
