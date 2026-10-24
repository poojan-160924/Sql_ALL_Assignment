-- SESSION 8 - GROUP BY + HAVING

/* 1.
Create a table called Orders with columns: order_id, user_id, payment_method,
and amount. Insert at least 8 sample records for different users and payment
methods such as UPI, Card, Wallet, and COD.
*/

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    payment_method VARCHAR(50),
    amount DECIMAL(10, 2)
);

INSERT INTO Orders (order_id, user_id, payment_method, amount)
VALUES
(1, 101, 'UPI', 450.00),
(2, 102, 'Card', 700.00),
(3, 101, 'Wallet', 250.00),
(4, 103, 'COD', 500.00),
(5, 102, 'UPI', 350.00),
(6, 104, 'Card', 900.00),
(7, 103, 'Wallet', 400.00),
(8, 101, 'COD', 650.00);

SELECT * FROM Orders;


/* 2.
Count how many orders were placed using each payment_method.
*/

SELECT payment_method, COUNT(*) AS order_count
FROM Orders
GROUP BY payment_method;


/* 3.
Find the total amount spent by each user_id. Display user_id and total spend.
*/

SELECT user_id, SUM(amount) AS total_spend
FROM Orders
GROUP BY user_id;


/* 4.
Show only those payment methods where the average order amount is greater
than 300, using GROUP BY and HAVING.
*/

SELECT payment_method, AVG(amount) AS average_order_amount
FROM Orders
GROUP BY payment_method
HAVING AVG(amount) > 300;


/* 5.
Explain the difference between WHERE and HAVING with one example query for
each. WHERE filters individual rows before grouping; HAVING filters groups
after GROUP BY.

Example of WHERE: show orders whose amount is greater than 400.
*/

SELECT *
FROM Orders
WHERE amount > 400;

/* Example of HAVING: show users whose total spending is greater than 700. */

SELECT user_id, SUM(amount) AS total_spend
FROM Orders
GROUP BY user_id
HAVING SUM(amount) > 700;
