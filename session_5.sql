/*1.
Create a table called Restaurants with columns: id, name, cuisine, rating, and city.
 Insert at least 5 sample records representing real or fictional restaurants you might find on Zomato */
 use tops;
 
 
 CREATE TABLE restaurents(
 id int primary key,
 name varchar(100),
 cuisine varchar(100),
 city varchar(50)
 );
 

 
INSERT INTO restaurents (id, name, cuisine, city)
VALUES
(1, 'Spice Garden', 'North Indian', 'Ahmedabad'),
(2, 'Pizza Corner', 'Italian', 'Mumbai'),
(3, 'Burger Hub', 'American Fast Food', 'Delhi'),
(4, 'Dosa Delight', 'South Indian', 'Bengaluru'),
(5, 'Dragon Wok', 'Chinese', 'Pune'),
(6, 'Royal Biryani House', 'Mughlai', 'Hyderabad'),
(7, 'The Pasta Place', 'Italian', 'Chennai'),
(8, 'Green Bowl Cafe', 'Healthy Food', 'Jaipur'),
(9, 'Tandoori Nights', 'Punjabi', 'Chandigarh'),
(10, 'Sweet Treats Bakery', 'Bakery and Desserts', 'Kolkata');

SELECT * FROM restaurents;


/* 2.
Write a SQL query to find all restaurants in the Restaurants table 
that have a rating greater than 4.0 and are located in either 'Ahmedabad' or 'Surat'.*/



select * 
from restaurents
 where ratings > 4.0 and city in ("Ahmedabad" , "jaipur") ;



/* 3.)
3.
Using the LIKE operator, write a query to select all restaurants whose names start with 'Swa'
 (for example, 'Swagat', 'Swadisht') from the Restaurants table.<br><br><em><strong>Hint:</strong> Use LIKE 'Swa%'.</em> */
 
SELECT * FROM restaurents WHERE name like "D%";

/* 4.
Write a SQL query using the BETWEEN keyword to find all 
restaurants in the Restaurants table with a rating between 3.5 and 4.5 (inclusive).*/
SELECT * FROM restaurents;


SELECT * FROM restaurents WHERE ratings between 3.5 and 4.5;





/* 5.
Write a query to find all restaurants whose cuisine is either 'Chinese', 'Italian', or 'South Indian' using the IN operator. */



select * 
from restaurents
where cuisine in ( 'Chinese', 'Italian','South Indian' );


