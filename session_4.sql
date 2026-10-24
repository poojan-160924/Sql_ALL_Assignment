
-- 1. Create a table named MusicPlaylist with columns: id, song_name, artist, genre, and duration.
 -- Insert at least 5 records representing songs from your favorite Spotify playlist, 
 -- then write a SELECT statement to retrieve all columns for all songs.
 
use music_streaming_app;
 create table musicplaylist(
 id int primary key ,
 song_name varchar(100) not null,
 artist_name varchar(100) not null,
 genre varchar(100) not null,
 duration int
 );
 
 INSERT INTO musicplaylist (id, song_name, artist_name, genre, duration) VALUES
(1, 'Blinding Lights', 'The Weeknd', 'Synthwave', 200),
(2, 'Bohemian Rhapsody', 'Queen', 'Rock', 354),
(3, 'Shape of You', 'Ed Sheeran', 'Pop', 233),
(4, 'Hotel California', 'Eagles', 'Classic Rock', 391),
(5, 'Bad Guy', 'Billie Eilish', 'Electropop', 194),
(6, 'Stay', 'The Kid LAROI & Justin Bieber', 'Pop', 141),
(7, 'Lose Yourself', 'Eminem', 'Hip-Hop', 326),
(8, 'Levitating', 'Dua Lipa', 'Disco-Pop', 203),
(9, 'Smells Like Teen Spirit', 'Nirvana', 'Grunge', 301),
(10, 'Starboy', 'The Weeknd', 'R&B', 230);
 
 select * from musicplaylist;
-- 2. Write a SQL query to display only the song_name and artist columns from the MusicPlaylist table,
-- showing just the first 3 records using the LIMIT keyword.

select song_name, artist_name from musicplaylist
limit 3;

-- 3. Suppose you have a table named FoodOrders with columns: id, restaurant, food_item,
 -- and order_date.  Write a SQL query to list all unique restaurant names where you have placed orders, using the DISTINCT keyword.

create table food_orderes(
id int primary key ,
restaurant varchar(100),
food_item varchar(100),
order_date date
);
select * from food_orderes;

INSERT INTO food_orderes (id, restaurant, food_item, order_date)
VALUES
(1, 'Dominos', 'Margherita Pizza', '2026-09-25'),
(2, 'Burger King', 'Whopper', '2026-09-26'),
(3, 'Subway', 'Veggie Sandwich', '2026-09-27'),
(4, 'KFC', 'Chicken Burger', '2026-09-28'),
(5, 'Pizza Hut', 'Farmhouse Pizza', '2026-09-29'
);

select * from food_orderes;

-- 4. Write a SQL query on the FoodOrders table to select food_item as 'Dish' and order_date as 'Date Ordered', 
-- displaying only these two columns with the column aliases in the output.

Select 
    food_item as Dish,
    order_date as `Date Ordered`
from food_orderes;


-- You tried running this query: SELECT DISTINCT food_item, restaurant FROM FoodOrders LIMIT 2,
--  but it returns an error or doesn't work as expected. Identify and fix the mistake in the query.<br><br><em><strong>Hint:</strong> 
-- Check the correct placement and usage of the LIMIT keyword in SQL syntax.</em>

SELECT DISTINCT food_item, restaurant FROM FoodOrders LIMIT 2; -- there s spelling mistake in the foodorderes


 SELECT DISTINCT food_item,
 restaurant FROM Food_orderes LIMIT 2;
 
 
 
 select * from food_orderes;